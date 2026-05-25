--[[
LuaBugViewer :: modules/SlashCommand.lua
Registers /lbv (and /bug as an alias) for the viewer.

Subcommands:
    /lbv             toggle the viewer window
    /lbv clear       wipe the current session log
    /lbv count       print the number of captured errors
    /lbv chat        toggle the chat-message notification
    /lbv testerror   fire an intentional Lua error to verify capture
--]]

local LBV = LuaBugViewer

local M = {}
LBV.modules.SlashCommand = M


local function Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cffffff00[LBV]|r " .. msg)
end


function M:Init()
    SLASH_LUABUGVIEWER1 = "/lbv"
    SLASH_LUABUGVIEWER2 = "/bug"
    SlashCmdList.LUABUGVIEWER = function(msg)
        msg = string.lower(string.match(msg or "", "^%s*(.-)%s*$") or "")

        if msg == "clear" then
            LBV.modules.SessionLog:Clear()
            Print("Session log cleared.")

        elseif msg == "count" then
            Print(#LBV.modules.SessionLog:GetAll() .. " error(s) captured this session.")

        elseif msg == "chat" then
            LBV.db.notifyInChat = not LBV.db.notifyInChat
            Print("Chat notifications " .. (LBV.db.notifyInChat and "enabled." or "disabled."))

        elseif msg == "testerror" or msg == "test" then
            Print("Firing test error \194\183 it should appear in /lbv shortly.")
            -- level 0 keeps the message verbatim (no file:line prefix) so the
            -- ErrorHandler's "LuaBugViewer" recursion guard doesn't suppress it.
            error("LBV test error: intentional failure triggered by /lbv testerror", 0)

        elseif msg == "help" or msg == "?" then
            Print("Commands: /lbv (toggle), /lbv clear, /lbv count, /lbv chat, /lbv testerror")

        else
            LBV.modules.Viewer:Toggle()
        end
    end
end
