--==============================
-- Targeting functions
--==============================

--- Targets the unit targeted by another unit
--- Flags: protected
---@param unit string A unit to assist
---@param name string The name of a unit to assist
function AssistUnit(unit, name) end

--- Clears the player's focus unit
--- Flags: protected
function ClearFocus() end

--- Clears the player's current target
--- Flags: protected
function ClearTarget() end

--- Changes the focus unitID to refer to a new unit
--- Flags: protected
---@param unit string A unit to focus
---@param name string The name of a unit to focus; only valid for player , pet , and party/raid members
function FocusUnit(unit, name) end

--- Targets the most recently targeted enemy unit
--- Flags: protected
function TargetLastEnemy() end

--- Targets the most recently targeted friendly unit
--- Flags: protected
function TargetLastFriend() end

--- Targets the most recently targeted unit
--- Flags: protected
function TargetLastTarget() end

--- Cycles targets through nearest units regardless of reaction/affiliation
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearest(backward) end

--- Cycles your target through the nearest enemy units.
--- Flags: protected
---@param backward boolean Reverses the direction of the cycling if true (e.g. TAB vs. SHIFT-TAB)
function TargetNearestEnemy(backward) end

--- Cycles targets through nearby enemy player units
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearestEnemyPlayer(backward) end

--- Cycles targets through nearby friendly units
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearestFriend(backward) end

--- Cycles targets through nearby friendly player units
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearestFriendPlayer(backward) end

--- Cycles targets through nearby party members
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearestPartyMember(backward) end

--- Cycles targets through nearby raid members
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearestRaidMember(backward) end

--- Targets a unit. Passing nil is equivalent to calling ClearTarget() ).
--- Flags: protected
---@param unit string A unit to target
---@param name string Name of a unit to target
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function TargetUnit(unit, name, exactMatch) end
