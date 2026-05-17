--==============================
-- Faction functions
--==============================

--- Collapses all headers and sub-headers in the Reputation UI. This function works for both major groups (Classic, Burning Crusade, Wrath of the Lich King, Inactive, etc.) and the sub-groups within them (Alliance Forces, Steamwheedle Cartel, Horde Expedition, Shattrath City, etc.).
function CollapseAllFactionHeaders() end

--- Collapses a given faction header or sub-header in the Reputation UI.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function CollapseFactionHeader(index) end

--- Expands all headers and sub-headers in the Reputation UI. Expands headers for both major groups (Classic, Burning Crusade, Wrath of the Lich King, Inactive, etc.) and the sub-groups within them (Alliance Forces, Steamwheedle Cartel, Horde Expedition, Shattrath City, etc.).
function ExpandAllFactionHeaders() end

--- Expands a given faction header or sub-header in the Reputation UI.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function ExpandFactionHeader(index) end

--- Toggles "at war" status for a faction.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function FactionToggleAtWar(index) end

--- Returns information about a faction or header listing
---@param index number The index of the faction in the Reputation window
---@return string name Name of the faction
---@return string description Brief description of the faction, as displayed in the default UI's detail window for a selected faction
---@return any standingID Current standing with the given faction ( number , standingID ) 1 - Hated 2 - Hostile 3 - Unfriendly 4 - Neutral 5 - Friendly 6 - Honored 7 - Revered 8 - Exalted
---@return number barMin The minimum value of the reputation bar at the given standing
---@return number barMax The maximum value of the reputation bar at the given standing
---@return number barValue The player's current reputation with the faction
---@return any atWarWith 1 if the player is at war with the given faction, otherwise nil
---@return any canToggleAtWar 1 if the player can declare war with the given faction, otherwise nil
---@return any isHeader 1 if the index refers to a faction group header
---@return any isCollapsed 1 if the index refers to a faction group header and currently collapsed
---@return any hasRep 1 if the index refers to a faction group header whose reputation value should be displayed
---@return any isWatched 1 if the faction is currently being watched (i.e. displayed above the experience bar)
---@return any isChild 1 if the index refers to a faction sub-group header within another group, or to an individual faction within a sub-group
function GetFactionInfo(index) end

--- Returns the number of entries in the reputation UI.
---@return number numFactions The number of visible factions and headers
function GetNumFactions() end

--- Returns which faction entry is selected in the reputation UI.
---@return number index Index of an entry in the faction list; between 1 and GetNumFactions()
function GetSelectedFaction() end

--- Returns information about the "watched" faction (displayed on the XP bar in the default UI)
---@return string name Name of the faction being watched
---@return any standingID The player's current standing with the faction ( number , standingID ) 1 - Hated 2 - Hostile 3 - Unfriendly 4 - Neutral 5 - Friendly 6 - Honored 7 - Revered 8 - Exalted
---@return number barMin The minimum value for the faction status bar
---@return number barMax The maximum value for the faction status bar
---@return number barValue The current value for the faction status bar
function GetWatchedFactionInfo() end

--- Returns whether a faction is flagged as "inactive". "Inactive" factions behave no differently; the distinction only exists to allow players to hide factions they don't care about from the main display. Factions thus marked are automatically moved to an "Inactive" group at the end of the faction list.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
---@return any isInactive 1 if the faction is currently flagged as "inactive"; otherwise nil
function IsFactionInactive(index) end

--- Removes the "inactive" status from a faction. "Inactive" factions behave no differently; the distinction only exists to allow players to hide factions they don't care about from the main display. Factions thus marked are automatically moved to an "Inactive" group at the end of the faction list.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function SetFactionActive(index) end

--- Flags a faction as inactive. "Inactive" factions behave no differently; the distinction only exists to allow players to hide factions they don't care about from the main display. Factions thus marked are automatically moved to an "Inactive" group at the end of the faction list.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function SetFactionInactive(index) end

--- Selects a faction in the reputation UI.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function SetSelectedFaction(index) end

--- Makes a faction the "watched" faction (displayed on the XP bar in the default UI)
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function SetWatchedFactionIndex(index) end
