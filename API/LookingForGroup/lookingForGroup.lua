--==============================
-- Looking for group functions
--==============================

--- Provides information about the LFG status of the player.
---@return any mode Current LFG status ( string ) abandonedInDungeon - The party disbanded and player is still in the dungeon. lfgparty - LFG dungeon is in-progress. nil - Player is not in LFG proposal - LFG party formed, notifying matched players dungeon is ready. queued - Player is in LFG queue. rolecheck - Querying groupmates to select their LFG roles before queuing.
---@return any submode Your LFG sub-status. Used to indicate priority for filling party slots. ( string ) empowered - Indicates that your party has lost a player and is set to higher priority for finding a replacement nil - Not looking for more party members unempowered - Default priority in the LFG system.
function GetLFGMode() end

--- Returns the group roles for which the player has signed up in the LFG system
---@return boolean leader True if the player is willing to lead a group; otherwise false
---@return boolean tank True if the player is willing to take on the role of protecting allies by drawing enemy attacks; otherwise false
---@return boolean healer True if the player is willing to take on the role of healing allies who take damage; otherwise false
---@return boolean damage True if the player is willing to take on the role of damaging enemies; otherwise false
function GetLFGRoles() end

--- Returns a list of LFG query types
function GetLFGTypes() end

--- Associates a brief text comment with the player's listing in the LFG system. In the default UI, other players see this comment when mousing over the player's name in the Looking for More listing.
---@param comment string A comment to be associated with the player's listing in the LFG system (max 63 characters); or the empty string ( "" ) to clear an existing comment
function SetLFGComment(comment) end

--- Sets group roles for which to advertise the player in the LFG system. Passing true for a role the player's class does not support (e.g. healing on a warrior or tanking on a priest) has no effect: see example.
---@param leader boolean True if the player is willing to lead a group; otherwise false
---@param tank boolean True if the player is willing to take on the role of protecting allies by drawing enemy attacks; otherwise false
---@param healer boolean True if the player is willing to take on the role of healing allies who take damage; otherwise false
---@param damage boolean True if the player is willing to take on the role of damaging enemies; otherwise false
function SetLFGRoles(leader, tank, healer, damage) end
