--==============================
-- Companion functions
--==============================

--- Summons a non-combat pet or mount.
---@param type any Type of companion ( string ) CRITTER - A non-combat pet MOUNT - A mount
---@param index number Index of a companion (between 1 and GetNumCompanions(type) )
function CallCompanion(type, index) end

--- Unsummons the current non-combat pet or mount
---@param type any The type of companion ( string ) CRITTER - Non-combat pet MOUNT - Mount
function DismissCompanion(type) end

--- Returns cooldown information for a non-combat pet or mount
---@param type any Type of companion ( string ) CRITTER - A non-combat pet MOUNT - A mount
---@param index number Index of a companion (between 1 and GetNumCompanions(type) )
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the companion is ready
---@return number duration The length of the cooldown, or 0 if the companion is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the companion is ready.)
function GetCompanionCooldown(type, index) end

--- Returns information about a non-combat pet or mount
---@param type any Type of companion ( string ) CRITTER - A non-combat pet MOUNT - A mount
---@param index number Index of a companion (between 1 and GetNumCompanions(type) )
---@return number creatureID Unique ID of the companion (usable with PlayerModel:SetCreature )
---@return string creatureName Localized name of the companion
---@return number spellID The "spell" for summoning the companion (usable with GetSpellLink et al)
---@return string icon Path to an icon texture for the companion
---@return any active 1 if the companion queried is currently summoned; otherwise nil
function GetCompanionInfo(type, index) end

--- Returns the number of mounts or non-combat pets the player can summon
---@param type any The type of companion ( string ) CRITTER - Non-combat pets MOUNT - Mounts
---@return number count The number of available companions
function GetNumCompanions(type) end

--- Puts a non-combat pet or mount onto the cursor
---@param type any Type of companion ( string ) CRITTER - A non-combat pet MOUNT - A mount
---@param index number Index of a companion (between 1 and GetNumCompanions(type) )
function PickupCompanion(type, index) end

--- Summons a random critter companion
function SummonRandomCritter() end
