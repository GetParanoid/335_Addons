--[[
LuaBugViewer :: modules/Notifier.lua
Prints a one-line yellow note to the default chat frame whenever a new error
is captured. Suppressed for duplicates so a runaway loop doesn't spam chat.
--]]

local LBV = LuaBugViewer

local M = {}
LBV.modules.Notifier = M


function M:Init()
    LBV:On("OnNewError", function(entry)
        if not (LBV.db and LBV.db.notifyInChat) then return end
        local count = #LBV.modules.SessionLog:GetAll()
        DEFAULT_CHAT_FRAME:AddMessage(string.format(
            "|cffffff00[LBV]|r New error #%d \194\183 type /lbv to view.", count))
    end)
end
