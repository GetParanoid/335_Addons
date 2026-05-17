--==============================
-- Combat functions
--==============================

--- Begins auto-attack against the player's current target. (If the "Auto Attack/Auto Shot" option is turned on, also begins Auto Shot for hunters.)
--- Flags: protected
function AttackTarget() end

--- Begins auto-attack against a specified target
--- Flags: protected
---@param unit string A unit to attack
---@param name string The name of a unit to attack
function StartAttack(unit, name) end

--- Stops auto-attack if active
--- Flags: protected
function StopAttack() end

--- Returns whether a unit is currently in combat
---@param unit string A unit to query
---@return any inCombat 1 if the unit is currently involved in combat; otherwise nil
function UnitAffectingCombat(unit) end
