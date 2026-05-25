--[[
LuaBugViewer :: modules/SessionLog.lua
In-memory store for errors captured during the current session.

Dedups by the first line of the error message (BugGrabber's trick): if the
same error fires again we just bump :count on the existing entry instead of
creating a new row. Old entries are dropped once we exceed maxStored.

Emits on the LBV event bus:
    "OnNewError"       (entry)  -- first time we've seen this message
    "OnDuplicateError" (entry)  -- repeat occurrence
--]]

local LBV = LuaBugViewer

local M = {}
LBV.modules.SessionLog = M


local function DedupKey(message)
    -- First line of the message + a 60-char prefix is usually enough to
    -- distinguish errors without being fooled by line numbers that move
    -- around as code changes.
    local firstLine = string.match(message or "", "^([^\n]*)") or ""
    return string.sub(firstLine, 1, 200)
end


function M:Init()
    self.errors     = {}
    self.byKey      = {}
    self.sessionId  = time()
    self._nextId    = 1
end


function M:Add(message, stack, locals)
    local key = DedupKey(message)
    local existing = self.byKey[key]

    if existing then
        existing.count = existing.count + 1
        existing.lastTime = time()
        LBV:Emit("OnDuplicateError", existing)
        return existing
    end

    local entry = {
        id        = self._nextId,
        message   = message or "",
        stack     = stack or "",
        locals    = locals or "",
        time      = time(),
        lastTime  = time(),
        count     = 1,
        sessionId = self.sessionId,
    }
    self._nextId = self._nextId + 1

    table.insert(self.errors, entry)
    self.byKey[key] = entry

    -- Drop oldest entries beyond maxStored. Also drops their dedup keys so
    -- the same error can be re-added cleanly later.
    local cap = (LBV.db and LBV.db.maxStored) or 100
    while #self.errors > cap do
        local victim = table.remove(self.errors, 1)
        self.byKey[DedupKey(victim.message)] = nil
    end

    LBV:Emit("OnNewError", entry)
    return entry
end


function M:GetAll() return self.errors end


function M:Clear()
    self.errors = {}
    self.byKey  = {}
    LBV:Emit("OnLogCleared")
end
