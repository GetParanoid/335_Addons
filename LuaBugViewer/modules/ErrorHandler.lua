--[[
LuaBugViewer :: modules/ErrorHandler.lua
The capture layer. Chains seterrorhandler so any previous handler (the
default Blizzard popup, BugSack, etc.) still runs after we record the error.

Also captures ADDON_ACTION_BLOCKED / ADDON_ACTION_FORBIDDEN events so calls
into protected functions show up alongside regular Lua errors.

Throttle: if more than throttleRate errors fire within a second, we pause
capture for throttleCooldown seconds. Prevents runaway error loops from
filling memory or hard-locking the client.
--]]

local LBV = LuaBugViewer

local M = {}
LBV.modules.ErrorHandler = M


local function NowSeconds()
    -- GetTime() is monotonic since session start. Good enough for rate limiting.
    return GetTime()
end


function M:Init()
    self._windowStart = NowSeconds()
    self._windowCount = 0
    self._pausedUntil = 0
    self._inGrab      = false

    local previous = geterrorhandler()
    seterrorhandler(function(err)
        M:Grab(err)
        if previous then return previous(err) end
    end)

    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("ADDON_ACTION_BLOCKED")
    eventFrame:RegisterEvent("ADDON_ACTION_FORBIDDEN")
    eventFrame:SetScript("OnEvent", function(self, event, addon, func)
        local message = string.format("[%s] AddOn '%s' tried to call protected function '%s'.",
                                      event, tostring(addon), tostring(func))
        M:Grab(message)
    end)
end


function M:Grab(err)
    err = tostring(err or "")

    -- Recursion guard: if we're already inside Grab (e.g. SessionLog or an
    -- emitted listener errored), bail out cleanly. The original error handler
    -- chain still runs because :Grab is called *before* we delegate.
    if self._inGrab then return end

    -- Hard skip anything that mentions ourselves. Otherwise a bug in our own
    -- UI module would loop forever (BugGrabber.lua:355 trick).
    if string.find(err, "LuaBugViewer", 1, true) then return end

    -- Throttle: count errors per second; pause capture if we exceed the rate.
    local now = NowSeconds()
    if now < self._pausedUntil then return end

    if now - self._windowStart >= 1 then
        self._windowStart = now
        self._windowCount = 0
    end
    self._windowCount = self._windowCount + 1

    local rate = (LBV.db and LBV.db.throttleRate) or 20
    if self._windowCount > rate then
        local cooldown = (LBV.db and LBV.db.throttleCooldown) or 60
        self._pausedUntil = now + cooldown
        DEFAULT_CHAT_FRAME:AddMessage(string.format(
            "|cffffff00[LBV]|r Error rate exceeded (%d/s) \194\183 capture paused for %ds.",
            rate, cooldown))
        return
    end

    self._inGrab = true
    -- debugstack(2) skips this function frame so the trace starts at the
    -- error origin. debuglocals at the same depth gives us locals near the
    -- failure site (still includes our own locals near the top — acceptable).
    local stack  = debugstack(2)
    local locals = debuglocals and debuglocals(2) or ""
    LBV.modules.SessionLog:Add(err, stack, locals)
    self._inGrab = false
end
