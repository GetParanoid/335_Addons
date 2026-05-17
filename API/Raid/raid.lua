--==============================
-- Raid functions
--==============================

--- Demotes the given player from raid assistant status
---@param unit string A unit in the raid
---@param name string Name of a unit in the raid
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function DemoteAssistant(unit, name, exactMatch) end

--- Returns the number of members in the player's raid
---@return number numRaidMembers Number of members in the raid (including the player)
function GetNumRaidMembers() end

--- Returns information about a member of the player's raid
---@param index number The index of the raid member
---@return string name The name of the player
---@return any rank The player's rank in the raid ( number ) Raid Assistant Raid Leader 0 - Raid Member
---@return number subgroup The raid subgroup that the player belongs to
---@return number level The player's level
---@return string class The localized name of the player's class
---@return any fileName The uppercase english name of the player's class ( string ) DRUID HUNTER MAGE PALADIN PRIEST ROGUE SHAMAN WARLOCK WARRIOR
---@return string zone The name of the zone the player is currently in
---@return any online 1 if the player is currently online, otherwise nil
---@return any isDead 1 if the player is currently dead, otherwise nil
---@return any role The player's role, or nil ( string ) MAINASSIST MAINTANK
---@return any isML 1 if the player is the master-looter, otherwise nil
function GetRaidRosterInfo(index) end

--- Returns the index of the selected unit in the raid roster. Selection in the raid roster is used only for display in the default UI and has no effect on other Raid APIs.
---@return number raidIndex Index of the raid member (between 1 and GetNumRaidMembers() ); matches the numeric part of the unit's raid unitID , e.g. 21 for raid21
function GetRaidRosterSelection() end

--- Returns the index of the raid target marker on a unit
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any index Index of a target marker ( number ) 1 - Star 2 - Circle 3 - Diamond 4 - Triangle 5 - Moon 6 - Square 7 - Cross 8 - Skull nil - No marker
function GetRaidTargetIndex(unit, name) end

--- Returns whether the player is the raid leader
---@return any isLeader 1 if the player is the raid leader; otherwise nil
function IsRaidLeader() end

--- Returns whether the player is a raid assistant
---@return boolean isRaidOfficer 1 if the player is a raid assistant; otherwise nil
function IsRaidOfficer() end

--- Promotes a raid member to raid assistant
---@param unit string A unit in the raid
---@param name string Name of a unit in the raid
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function PromoteToAssistant(unit, name, exactMatch) end

--- Selects a unit in the raid roster. Selection in the raid roster is used only for display in the default UI and has no effect on other Raid APIs.
---@param index number Index of the raid member (between 1 and GetNumRaidMembers() ); matches the numeric part of the unit's raid unitID , e.g. 21 for raid21
function SetRaidRosterSelection(index) end

--- Moves a raid member to a non-full raid subgroup. Only has effect if the player is the raid leader or a raid assistant. To put a member into a full subgroup (switching places with a member of that group), see SwapRaidSubgroup() .
---@param index number Index of the raid member (between 1 and GetNumRaidMembers() ); matches the numeric part of the unit's raid unitID , e.g. 21 for raid21
---@param subgroup number Index of a raid subgroup (between 1 and MAX_RAID_GROUPS )
function SetRaidSubgroup(index, subgroup) end

--- Puts a raid target marker on a unit
---@param unit string A unit to mark
---@param name string Name of a unit to mark
---@param index any Index of a target marker ( number ) 0 - Clear any raid target markers 1 - Star 2 - Circle 3 - Diamond 4 - Triangle 5 - Moon 6 - Square 7 - Cross 8 - Skull
function SetRaidTarget(unit, name, index) end

--- Swaps two raid members between subgroups in the raid. Only has effect if the player is the raid leader or a raid assistant. To move a member into a non-full subgroup without switching places with another member, see SetRaidSubgroup() .
---@param index1 number Index of the first raid member (between 1 and GetNumRaidMembers() ); matches the numeric part of the unit's raid unitID , e.g. 21 for raid21
---@param index2 number Index of the other raid member
function SwapRaidSubgroup(index1, index2) end

--- Returns whether a unit is in the player's raid
---@param unit string A unit to query
---@return number inRaid Index of the unit in the raid (matches the numeric part of the unit's raid unitID minus 1; e.g. returns 0 for raid1 , 12 for raid13 , etc)
function UnitInRaid(unit) end

--- Returns whether a unit is a raid assistant in the player's raid
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any leader 1 if the unit is a raid assistant; otherwise nil
function UnitIsRaidOfficer(unit, name) end

--- Returns whether a unit is in the player's raid or belongs to a raid member
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any inParty 1 if the unit is in the player's raid or is a pet belonging to a raid member; otherwise nil
function UnitPlayerOrPetInRaid(unit, name) end

--- Returns whether attempts to target a unit should target its vehicle. The unit can still be targeted: this flag is used to provide a convenience in the default UI for certain cases (such as the Malygos encounter) such that clicking a unit in the raid UI targets its vehicle (e.g. so players can use their drakes to heal other players' drakes).
---@param unit string A unit to query
---@return boolean targetVehicle True if clicking the unit's raid UI representation should target the unit's vehicle instead of the unit itself; otherwise false
function UnitTargetsVehicleInRaidUI(unit) end
