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


-- Tidies a raw debugstack() string for display:
--   1. Drops our own capture-wrapper frames sitting at the top of the trace
--      (the seterrorhandler / OnEvent closures), so the trace starts at the
--      real error origin instead of inside LuaBugViewer.
--   2. Strips the "...Interface\AddOns\" prefix from each frame so the addon
--      name leads every line and WoW's "..." truncation stops mattering.
local function CleanStack(stack)
    if not stack or stack == "" then return "" end
    local lines, skipping = {}, true
    for line in string.gmatch(stack, "[^\n]+") do
        if skipping and string.find(line, "LuaBugViewer", 1, true) then
            -- skip: one of our own wrapper frames at the top
        else
            skipping = false
            line = string.gsub(line, "[^%s<`]*AddOns\\", "")
            table.insert(lines, line)
        end
    end
    return table.concat(lines, "\n")
end


function M:Init()
    self._windowStart = NowSeconds()
    self._windowCount = 0
    self._pausedUntil = 0
    self._inGrab      = false

    local previous = geterrorhandler()
    seterrorhandler(function(err)
        M:Grab(err, "lua")
        if previous then return previous(err) end
    end)

    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("ADDON_ACTION_BLOCKED")
    eventFrame:RegisterEvent("ADDON_ACTION_FORBIDDEN")
    eventFrame:SetScript("OnEvent", function(self, event, addon, func)
        local message = string.format("[%s] AddOn '%s' tried to call protected function '%s'.",
                                      event, tostring(addon), tostring(func))
        local kind = (event == "ADDON_ACTION_FORBIDDEN") and "forbidden" or "blocked"
        M:Grab(message, kind)
    end)
end


function M:Grab(err, kind)
    err  = tostring(err or "")
    kind = kind or "lua"

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
    -- error origin. CleanStack then trims our own wrapper frames off the top
    -- and tidies the AddOns paths. debuglocals at the same depth gives us
    -- locals near the failure site.
    local stack  = CleanStack(debugstack(2))
    local locals = debuglocals and debuglocals(2) or ""
    LBV.modules.SessionLog:Add(err, stack, locals, kind)
    self._inGrab = false
end
