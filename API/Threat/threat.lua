--==============================
-- Threat functions
--==============================

--- Returns color values for a given threat status. Color component values are floating point numbers between 0 and 1, with 1 representing full intensity.
---@param status number A threat status category, as returned by UnitThreatSituation or UnitDetailedThreatSituation
---@return number red Red component of the color
---@return number green Green component of the color
---@return number blue Blue component of the color
function GetThreatStatusColor(status) end

--- Returns whether the default Aggro Warning UI should currently be shown.
---@return any enabled 1 if the Aggro Warning UI should be displayed; nil otherwise
function IsThreatWarningEnabled() end

--- Returns detailed information about the threat status of one unit against another.
---@param unit any The unit whose threat situation is being requested
---@param name string The name of a unit to query. Only valid for the player, pet, and party/raid members.
---@param mobUnit any An NPC unit the first unit may have threat against
---@return any isTanking 1 if unit is mobUnit's primary target, nil otherwise
---@return any status A threat status category ( number ) 0 - Unit has less than 100% raw threat (default UI shows no indicator) 1 - Unit has 100% or higher raw threat but isn't mobUnit's primary target (default UI shows yellow indicator) 2 - Unit is mobUnit 's primary target, and another unit has 100% or higher raw threat (default UI shows orange indicator) 3 - Unit is mobUnit 's primary target, and no other unit has 100% or higher raw threat
---@return number scaledPercent A percentage value representing unit's threat against mobUnit , scaled such that a value of 100% represents unit becoming mobUnit 's primary target
---@return number rawPercent A percentage value representing unit's threat against mobUnit relative to the the threat of mobUnit's primary target
---@return number threatValue The raw value of unit's threat against mobUnit
function UnitDetailedThreatSituation(unit, name, mobUnit) end

--- Returns the general threat status of a unit. See UnitDetailedThreatSituation for details about threat values.
---@param unit any The unit whose threat situation is being requested
---@param name string The name of a unit to query. Only valid for the player, pet, and party/raid members.
---@param mobUnit any An NPC unit the first unit may have threat against; if nil, returned values reflect whichever NPC unit the first unit has the highest threat against.
---@return any status A threat status category ( number ) 0 - Unit has less than 100% raw threat (default UI shows no indicator) 1 - Unit has 100% or higher raw threat but isn't mobUnit 's primary target (default UI shows yellow indicator) 2 - Unit is mobUnit 's primary target, and another unit has 100% or higher raw threat (default UI shows orange indicator) 3 - Unit is mobUnit 's primary target, and no other unit has 100% or higher raw threat
function UnitThreatSituation(unit, name, mobUnit) end
