--==============================
-- GM Ticket functions
--==============================

--- Abandons the currently pending GM ticket
--- Flags: confirmation
function DeleteGMTicket() end

--- Requests further GM interaction on a ticket to which a GM has already responded
function GMResponseNeedMoreHelp() end

--- Notifies the server that the player's GM ticket issue has been resolved
--- Flags: server
function GMResponseResolve() end

--- Requests GM ticket status from the server. The UPDATE_TICKET event fires when data is ready.
--- Flags: server
function GetGMTicket() end

--- Returns a list of available GM ticket categories. No longer used in the current GM Help UI.
--- Flags: deprecated
function GetGMTicketCategories() end

--- Opens a new GM support ticket. The default UI sets the needResponse flag to true for "Talk to a GM" and "Stuck" tickets, and false for "Report an issue" tickets.
--- Flags: protected
---@param text string The text to be sent in the ticket
---@param needResponse boolean true if the issue requires personal response from a GM; otherwise false
function NewGMTicket(text, needResponse) end

--- Uses the auto-unstuck feature
--- Flags: protected
function Stuck() end

--- Updates the open GM ticket with new text
--- Flags: protected
---@param text string New text for the ticket
function UpdateGMTicket(text) end
