--==============================
-- Experience (XP) functions
--==============================

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetRewardXP() end

--- Returns the amount of rested bonus experience available. This value increments as the player spends time resting and depletes as the player earns experience from kills while rested.
---@return number exhaustionXP The amount of rested bonus experience available
function GetXPExhaustion() end

--- Returns whether experience gain has been disabled for the player
---@return boolean isDisabled True if experience gain has been disabled for the player; false otherwise
function IsXPUserDisabled() end

--- Returns the player's current amount of experience points
---@param unit string A unit to query; only valid for player
---@return number currXP Current amount of experience points
function UnitXP(unit) end

--- Return the total amount of experience points required for the player to gain a level
---@param unit string A unit to query; only valid for player
---@return number playerMaxXP Total amount of experience points required for the player to gain a level
function UnitXPMax(unit) end
