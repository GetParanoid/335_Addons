--==============================
-- PvP functions
--==============================

--- Returns whether the player can queue for Wintergrasp
---@return boolean canQueue Can the player queue for Wintergrasp
function CanQueueForWintergrasp() end

--- Returns whether the player has manually enabled PvP status. Only indicates whether the player has manually and directly enabled his PvP flag (e.g. by typing "/pvp" or using the default UI's menu when right-clicking the player portrait); returns 0 if the player only became PvP flagged by attacking an enemy player, entering an enemy zone, etc.
---@return number isPVPDesired 1 if the PVP flag was toggled on by the player manually; otherwise 0
function GetPVPDesired() end

--- Returns the player's lifetime total of honorable kills and highest rank achieved. Highest rank achieved applies only to the older PvP rewards system that was abandoned with the WoW 2.0 patch, but is still accurate for players who participated in it.
---@return number hk Number of honorable kills the player has scored
---@return number highestRank Highest rank the player ever achieved in the pre-2.0 PvP rewards system
function GetPVPLifetimeStats() end

--- Returns information about a given PvP rank index. These ranks are no longer in use, as they were part of the older PvP rewards system that was abandoned with the WoW 2.0 patch.
---@param index number Index of a rank (begins at 1, corresponding to a never-used "Pariah" rank; actual ranks start at 5)
---@param unit string A unit to use as basis for the rank name (i.e. to return Horde rank names for Horde units and Alliance rank names for Alliance units); if omitted, uses the player's faction
---@return string rankName Name of the rank
---@return number rankNumber Index of the rank relative to unranked status (positive values for ranks earned through honorable kills, negative values for the unused dishonorable ranks)
function GetPVPRankInfo(index, unit) end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function GetPVPRankProgress() end

--- Returns the number of kills and honor points scored by the player since logging in
---@return number honorKills Number of honorable kills scored
---@return number honorPoints Amount of honor currency earned
function GetPVPSessionStats() end

--- Returns the amount of time until the player's PVP flag expires. Returns 300000 or higher if the player's PvP flag is manually enabled or if the player is in a  PvP or enemy zone.
---@return number timer Milliseconds remaining until the player's PvP flag expires
function GetPVPTimer() end

--- Returns the number of kills and honor points scored by the player on the previous day
---@return number honorKills Number of honorable kills scored
---@return number honorPoints Amount of honor currency earned
function GetPVPYesterdayStats() end

--- Returns information on the players queue for a world PvP zone
---@param index number Index of the queue to get data for (between 1 and MAX_WORLD_PVP_QUEUES )
---@return any status Returns the status of the players queue ( string ) confirm - The player can enter the pvp zone none - No world pvp queue at this index queued - The player is queued for this pvp zone
---@return string mapName Map name they are queued for (e.g Wintergrasp)
---@return number queueID Queue ID, used for BattlefieldMgrExitRequest() and BattlefieldMgrEntryInviteResponse()
function GetWorldPVPQueueStatus(index) end

--- Returns PVP information about the current area. Information returned may apply to the current subzone, not the entire zone.
---@return any pvpType PvP status for the area ( string ) arena - Arena or outdoor free-for-all area (e.g. Gurubashi Arena) combat - Combat zone (e.g. Wintergrasp) contested - Horde/Alliance PvP is enabled for all players friendly - Zone is controlled by the player's faction; PvP status is optional for the player but mandatory for enemy players hostile - Zone is controlled by the enemy's faction; PvP status is optional for the enemy but mandatory for the player nil - PvP status is not automatically enabled for either faction (used for "contested" zones on Normal servers) sanctuary - PvP activity is not allowed
---@return any isSubZonePVP 1 if the current area allows free-for-all PVP; otherwise nil
---@return string factionName Name of the faction that controls the zone (only applies if pvpType is friendly or hostile)
function GetZonePVPInfo() end

--- Instantly exits the current world PvP zone, returning to the player's Hearthstone location.
function HearthAndResurrectFromArea() end

--- Returns whether the player's PvP flag will expire after a period of time.
---@return any isRunning 1 if the player's PvP flag will expire; otherwise nil
function IsPVPTimerRunning() end

--- Returns whether the current area has PvP (or other) objectives to be displayed. Used in the default UI when the "Display World PVP Objectives\ setting is set to \Dynamic\, in which case objective information is only shown when the player is near an objective. Examples include the towers in Eastern Plaguelands and Hellfire Peninsula as well as non-PvP objectives such as in the Old Hillsbrad instance, the Death Knight starter quests, and the Battle for Undercity quest event.
---@return any isPVPPOI 1 if the current subzone has objectives to display
function IsSubZonePVPPOI() end

--- Returns whether accepting the offered quest will flag the player for PvP. Only valid when the questgiver UI is showing the accept/decline stage of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED events); otherwise may return nil or a value from the most recently displayed quest.
---@return any questFlag 1 if accepting the quest will flag the player for PvP for as long as it remains in the quest log; otherwise nil
function QuestFlagsPVP() end

--- Enables or disables the player's desired PvP status. Enabling PvP takes effect immediately; disabling PvP begins a five-minute countdown after which PvP status will be disabled (if the player has taken no PvP actions).
---@param state any 1 to enable PVP, nil to disable
function SetPVP(state) end

--- Switches the player's desired PvP status. If PvP is currently disabled for the player, it becomes enabled immediately. If PvP is enabled, it will become disabled after five minutes of no PvP activity.
function TogglePVP() end

--- Returns whether a unit is flagged for free-for-all PvP. Free-for-all PvP allows all players to attack each other regardless of faction; used in certain outdoor areas (such as Gurubashi Arena and "The Maul" outside Dire Maul).
---@param unit string A unit to query
---@return any isFreeForAll 1 if the unit is enabled for free-for-all PvP; otherwise nil
function UnitIsPVPFreeForAll(unit) end

--- Returns whether a unit is in a Sanctuary area preventing PvP activity
---@param unit string A unit to query
---@return any state 1 if the unit is in a PVP Sanctuary; otherwise nil
function UnitIsPVPSanctuary(unit) end

--- Returns the name of a unit including the unit's current title. Titles are no longer specific to PvP; this function returns a unit's name with whichever title he or she is currently displaying (e.g. "Gladiator Spin", "Keydar Jenkins", "Ownsusohard, Champion of the Frozen Wastes", etc).
---@param unit string A unit to query
---@return string name Name of the unit including the unit's current title
function UnitPVPName(unit) end

--- Returns a unit's PVP rank as a number. Returns 0 for all units; was only applicable in the older PvP rewards system that was abandoned with the WoW 2.0 patch.
--- Flags: deprecated
---@param unit string A unit to query
---@return number rank The numeric PvP rank of the unit, or 0 if the unit has no PvP rank
function UnitPVPRank(unit) end
