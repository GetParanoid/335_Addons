--==============================
-- CombatLog functions
--==============================

--- Adds a filter to the combat log system. Each time this function is called a new filter is added to the combat log system.  Any combat log entry that passes the filter will be fired as a COMBAT_LOG_EVENT event in order from oldest to newest.
---@param events string Name of a combat log event type to include in the filtered list, or a comma-separated list of multiple names
---@param srcGUID string GUID of the source unit
---@param srcMask number Bit mask of the source unit
---@param destGUID string GUID of the destination unit
---@param destMask number Bit mask of the destination unit
function CombatLogAddFilter(events, srcGUID, srcMask, destGUID, destMask) end

--- Advances the "cursor" position used by other CombatLog functions. Information about the entry at the "cursor" position can be retrieved with CombatLogGetCurrentEntry() . That function then advances the cursor to the next entry, so calling it repeatedly returns all information in the combat log -- this function can be used to "rewind" the combat log to retrieve information about earlier events or skip entries without retrieving their information.
---@param count number Number of entries by which to advance the "cursor"; can be negative to move to a previous entry
---@param ignoreFilter boolean True to use the entire saved combat log history; false or omitted to use only events matching the current filter
---@return any hasEntry 1 if an entry exists at the new cursor position; otherwise nil
function CombatLogAdvanceEntry(count, ignoreFilter) end

--- Removes all entries from the combat log
function CombatLogClearEntries() end

--- Returns the combat log event information for the current entry and advances to the next entry. See COMBAT_LOG_EVENT for details of the event information.
---@param ignoreFilter boolean True to use the entire saved combat log history; false or omitted to use only events matching the current filter
---@return number timestamp Time at which the event occurred (same format as time() and date() , but with millisecond precision)
---@return string event Type of combat log event
---@return string srcGUID GUID of the unit that initiated the event
---@return string srcName Name of the unit that initiated the event
---@return number srcFlags Flags indicating the nature of the source unit
---@return string destGUID GUID of the unit that was the target of the event
---@return string destName Name of the unit that was the target of the event
---@return number destFlags Flags indicating the nature of the target unit
function CombatLogGetCurrentEntry(ignoreFilter) end

--- Returns the number of available combat log events
---@param ignoreFilter boolean True to use the entire saved combat log history; false or omitted to use only events matching the current filter
function CombatLogGetNumEntries(ignoreFilter) end

--- Returns the amount of time combat log entries are stored
---@return number seconds Amount of time entries remain available
function CombatLogGetRetentionTime() end

--- Removes any filters applied to the combat log
function CombatLogResetFilter() end

--- Sets the "cursor" position used by other CombatLog functions. Information about the entry at the "cursor" position can be retrieved with CombatLogGetCurrentEntry() . That function then advances the cursor to the next entry, so calling it repeatedly returns all information in the combat log -- this function can be used to "rewind" the combat log to retrieve information about earlier events.
---@param index number Index of a combat log event (between 1 and CombatLogGetNumEntries(ignoreFilter) , or between -1 and - CombatLogGetNumEntries(ignoreFilter) )
---@param ignoreFilter boolean True to use the entire saved combat log history; false or omitted to use only events matching the current filter
function CombatLogSetCurrentEntry(index, ignoreFilter) end

--- Sets the amount of time combat log entries will be stored
---@param seconds number The desired time
function CombatLogSetRetentionTime(seconds) end

--- Returns whether an entity from the combat log matches a given filter
---@param unitFlags number Source or destination unit flags from a combat log entry
---@param mask any One of the following global constants: ( number , bitfield ) COMBATLOG_FILTER_EVERYTHING - Any entity COMBATLOG_FILTER_FRIENDLY_UNITS - Entity is a friendly unit COMBATLOG_FILTER_HOSTILE_PLAYERS - Entity is a hostile player unit COMBATLOG_FILTER_HOSTILE_UNITS - Entity is a hostile non-player unit COMBATLOG_FILTER_ME - Entity is the player COMBATLOG_FILTER_MINE - Entity is a non-unit object belonging to the player; e.g. a totem COMBATLOG_FILTER_MY_PET - Entity is the player's pet COMBATLOG_FILTER_NEUTRAL_UNITS - Entity is a neutral unit COMBATLOG_FILTER_UNKNOWN_UNITS - Entity is a unit currently unknown to the WoW client
---@return any isMatch 1 if the entity flags match the given mask
function CombatLog_Object_IsA(unitFlags, mask) end

--- Returns a unit's globally unique identifier
---@param unit string A unit to query
---@return string guid The unit's GUID
function UnitGUID(unit) end
