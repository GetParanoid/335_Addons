--==============================
-- Recruit-a-friend functions
--==============================

--- Accepts a level offered by the player's Recruit-a-Friend partner
function AcceptLevelGrant() end

--- Returns whether the player can give levels to a Recruit-a-Friend partner
---@param unit string Unit to gift a level
---@return any canGrant 1 if the player can grant a level to the unit; otherwise nil
function CanGrantLevel(unit) end

--- Returns whether a unit can be summoned via Recruit-a-Friend. Indicates whether the target unit is currently summonable, not just whether that unit's account is linked to the player's via the Recruit-A-Friend program.
---@param name string Exact name of a player to summon
---@param unit string A unit to summon
---@return any canSummon 1 if the unit can be summoned, otherwise nil
function CanSummonFriend(name, unit) end

--- Refuses a level offered by the player's Recruit-a-Friend partner
function DeclineLevelGrant() end

--- Returns cooldown information about the player's Summon Friend ability
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the ability is ready
---@return number duration The length of the cooldown, or 0 if the ability is ready
function GetSummonFriendCooldown() end

--- Grants a level to the player's Recruit-a-Friend partner. Does not immediately cause the partner character to level up: that player is given a chance to accept or decline the offered level.
---@param unit string Unit to gift a level
function GrantLevel(unit) end

--- Returns whether a unit's account is linked to the player's via the Recruit-a-Friend program
---@param unit string A unit to query
---@return any isLinked 1 if the unit's account is linked to the player's
function IsReferAFriendLinked(unit) end

--- Summons a unit whose account is linked to the player's via the Recruit-a-Friend program. Does not instantly teleport the unit -- calling this function begins casting the Summon Friend "spell", and once it completes the unit is prompted to accept or decline the summon.
---@param name string Exact name of a player to summon (only applies to units in the player's party or raid)
---@param unit string A unit to summon
function SummonFriend(name, unit) end
