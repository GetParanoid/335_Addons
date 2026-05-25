--[[
LuaBugViewer :: modules/EscMenuEntry.lua
Adds a "Lua Errors" button to the ESC (Game) menu. The label gets an unread
counter badge whenever new errors arrive while the viewer is closed.
--]]

local LBV = LuaBugViewer

local M = {}
LBV.modules.EscMenuEntry = M


local BASE_LABEL = "Lua Errors"


function M:Init()
    self._lastSeenId = 0
    self._button = GP_Lib:HookGameMenuButton(BASE_LABEL, function()
        LBV.modules.Viewer:Show()
        -- Mark everything currently in the log as seen.
        local list = LBV.modules.SessionLog:GetAll()
        if #list > 0 then
            self._lastSeenId = list[#list].id
        end
        self:RefreshLabel()
    end)

    LBV:On("OnNewError", function() M:RefreshLabel() end)
    LBV:On("OnLogCleared", function()
        M._lastSeenId = 0
        M:RefreshLabel()
    end)
end


function M:UnreadCount()
    local list = LBV.modules.SessionLog:GetAll()
    local n = 0
    for i = #list, 1, -1 do
        if list[i].id > self._lastSeenId then
            n = n + 1
        else
            break  -- list is append-only by id, so we can stop early
        end
    end
    return n
end


function M:RefreshLabel()
    if not self._button then return end
    local n = self:UnreadCount()
    if n > 0 then
        self._button:SetText(string.format("%s |cffff5555(%d)|r", BASE_LABEL, n))
    else
        self._button:SetText(BASE_LABEL)
    end
end
