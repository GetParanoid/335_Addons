--==============================
-- Battlefield functions
--==============================

--- Accepts the next upcoming periodic resurrection from a battleground spirit healer. Automatically called in the default UI in response to the AREA_SPIRIT_HEALER_IN_RANGE event which fires when the player's ghost is near a battleground spirit healer.
function AcceptAreaSpiritHeal() end

--- Accepts the offered teleport to a battleground/arena or leaves the battleground/arena or queue. This function requires a hardware event when used to accept a teleport; it can be called without a hardware event for leaving a battleground/arena or its queue.
---@param index number Index of a battleground or arena type for which the player is queued
---@param accept any 1 to accept the offered teleport; nil to exit the queue or leave the battleground/arena match in progress
function AcceptBattlefieldPort(index, accept) end

--- Returns whether the battleground for which the player is queueing supports joining as a group
---@return any canGroupJoin 1 if the currently displayed battlefield supports joining as a group
function CanJoinBattlefieldAsGroup() end

--- Declines the next upcoming periodic resurrection from a battleground spirit healer. Usable in response to the AREA_SPIRIT_HEALER_IN_RANGE event which fires when the player's ghost is near a battleground spirit healer.
function CancelAreaSpiritHeal() end

--- This function or event no longer exists in version 6.0.2 (19034) of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
function CloseBattlefield() end

--- Returns the time remaining until a nearby battleground spirit healer resurrects all players in its area
---@return number timeleft Seconds remaining before the next area resurrection
function GetAreaSpiritHealerTime() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetBattlefieldArenaFaction() end

--- Returns the estimated wait time on a battleground or arena queue
---@param index number Index of a battleground/arena queue the player has joined (between 1 and MAX_BATTLEFIELD_QUEUES )
---@return number waitTime Estimated wait time to join the battleground/arena (in milliseconds)
function GetBattlefieldEstimatedWaitTime(index) end

--- Returns the position of a flag in a battleground
---@param index number Index of a flag (between 1 and GetNumBattlefieldFlagPositions() )
---@return number flagX Horizontal (X) coordinate of the flag's position relative to the zone map (0 = left edge, 1 = right edge)
---@return number flagY Vertical (Y) coordinate of the flag's position relative to the zone map (0 = bottom edge, 1 = top edge)
---@return string flagToken Unique portion of the path to a texure for the flag; preface with "Interface\\WorldStateFrame\" for the full path
function GetBattlefieldFlagPosition(index) end

--- Returns information about a battleground for which the player can queue
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetBattlefieldInfo
function GetBattlefieldInfo() end

--- Returns the amount of time remaining before all players are removed from the instance, if in a battleground instance where the match has completed
---@return number timeLeft Amount of time remaining (in milliseconds) before all players are removed from the instance, if in a battleground instance where the match has completed; otherwise 0.
function GetBattlefieldInstanceExpiration() end

--- Returns a numeric ID for a battleground instance in the battleground queueing list. This number is seen in the instance names in said listings and elsewhere in the Battlegrounds UI (e.g. the 13 in "You are eligible to enter Warsong Gulch 13").
---@param index number Index in the battleground queue listing (1 for the first available instance, or between 2 and GetNumBattlefields() for other instances)
---@return number instanceID Numeric ID of the battleground instance
function GetBattlefieldInstanceInfo(index) end

--- Returns the amount of time since the current battleground instance opened
---@return number time Amount of time since the current battleground instance opened (in milliseconds)
function GetBattlefieldInstanceRunTime() end

--- Returns the scale to be used for displaying battleground map icons. Used in the default UI to determine the size of the point of interest icons (towers, graveyards, etc.) on the zone map (the small battle minimap). The default size of the icons is set by DEFAULT_POI_ICON_SIZE and the scale is used to grow or shrink them depending on the size of the map.
---@return number scale Scale factor for map icons (between 0 and 1)
function GetBattlefieldMapIconScale() end

--- Returns the time left on a battleground or arena invitation
---@param index number Index of a battleground/arena queue the player has joined (between 1 and MAX_BATTLEFIELD_QUEUES )
---@return number expiration Time remaining before the player's invitation to enter the battleground/arena expires (in seconds); 0 if the player has not yet been invited to enter or is already in the battleground/arena instance
function GetBattlefieldPortExpiration(index) end

--- Returns the position of a battleground team member not in the player's group. Still used in the default UI but no longer useful; as all team members in a battleground match are automatically joined into a raid group. See GetPlayerMapPosition() instead.
---@param index number Index of a team member (between 1 and GetNumBattlefieldPositions() )
---@return number unitX Horizontal (X) coordinate of the unit's position relative to the zone map (0 = left edge, 1 = right edge)
---@return number unitY Vertical (Y) coordinate of the unit's position relative to the zone map (0 = bottom edge, 1 = top edge)
---@return string name Name of the unit for display on the map
function GetBattlefieldPosition(index) end

--- Returns basic scoreboard information for a battleground/arena participant. Does not include battleground-specific score data (e.g. flags captured in Warsong Gulch, towers assaulted in Alterac Valley, etc); see GetBattlefieldStatData() for such information.
---@param index number Index of a participant in the battleground/arena scoreboard (between 1 and GetNumBattlefieldScores() )
---@return string name Name of the participant
---@return number killingBlows Number of killing blows scored by the participant during the match
---@return number honorableKills Number of honorable kills scored by the participant during the match
---@return number deaths Number of times the participant died during the match
---@return number honorGained Amount of honor points gained by the participant during the match
---@return any faction Faction or team to which the participant belongs ( number ) 0 - Horde (Battleground) / Green Team (Arena) 1 - Alliance (Battleground) / Gold Team
---@return string race Localized name of the participant's race
---@return string class Localized token representing the participant's class
---@return string classToken Non-localized token representing the participant's class
---@return number damageDone Total amount of damage done by the participant during the match
---@return number healingDone Total amount of healing done by the participant during the match
---@return number bgRating Personal battleground rating at the start of the match
---@return number ratingChange Amount of rating gained/lost during the match
---@return number preMatchMMR After 4.2 update is always zero
---@return number mmrChange After 4.2 update is always zero
---@return string talentSpec Localized name of player build
function GetBattlefieldScore(index) end

--- Returns battleground-specific scoreboard information for a battleground participant. Battleground-specific statistics include flags captured in Warsong Gulch, towers assaulted in Alterac Valley, etc. For the name and icon associated with each statistic, see GetBattlefieldStatInfo() . For basic battleground score information, see GetBattlefieldScore() .
---@param index number Index of a participant in the battleground/arena scoreboard (between 1 and GetNumBattlefieldScores() )
---@param statIndex number Index of a battleground-specific statistic (between 1 and GetNumBattlefieldStats() )
---@return number columnData The participant's score for the statistic
function GetBattlefieldStatData(index, statIndex) end

--- Returns information about a battleground-specific scoreboard column. Battleground-specific statistics include flags captured in Warsong Gulch, towers assaulted in Alterac Valley, etc.
---@param statIndex number Index of a battleground-specific statistic (between 1 and GetNumBattlefieldStats() )
---@return string text Name to display for the statistic's scoreboard column header
---@return string icon Path to an icon texture for the statistic
---@return string tooltip Text to be displayed as a tooltip when mousing over the scoreboard column
function GetBattlefieldStatInfo(statIndex) end

--- Returns information about an active or queued battleground/arena instance
---@param index number Index of a battleground/arena queue the player has joined (between 1 and GetMaxBattlefieldID() )
---@return any status Status of the player with respect to the battleground ( string ) active - The player is currently playing in this battleground confirm - The player has been invited to enter this battleground but has not done so yet none - No battleground or queue at this index queued - The player is queued for this battleground
---@return string mapName Name of the battleground (e.g. "Alterac Valley") or arena ("All Arenas" while queued ; "Eastern Kingdoms" regardless of destination while status is confirm , e.g. "Dalaran Sewers" while active )
---@return number instanceID If in a battleground or queued for a specific instance, the number identifying that instance (e.g. 13 in "Warsong Gulch 13"); otherwise 0
---@return number bracketMin Lowest level of characters in the player's level bracket for the battleground
---@return number bracketMax Highest level of characters in the player's level bracket for the battleground
---@return any teamSize Number of players per team for an arena match ( number ) 0 - Not an arena match 2 - 2v2 Arena 3 - 3v3 Arena 5 - 5v5 Arena
---@return any registeredMatch 1 if a rated arena match; otherwise nil
function GetBattlefieldStatus(index) end

--- Returns info about teams and their ratings in a rated arena match.. Usable following the UPDATE_BATTLEFIELD_SCORE event.
---@param index any Index of a team in the arena match ( number ) 0 - Green Team 1 - Gold Team
---@return string teamName Name of the team
---@return number teamRating The team's rating at the start of the match
---@return number newTeamRating New rating for the team when the match is complete
function GetBattlefieldTeamInfo(index) end

--- Returns the amount of time elapsed since the player joined the queue for a battleground/arena
---@param index number Index of a battleground/arena queue the player has joined (between 1 and MAX_BATTLEFIELD_QUEUES )
---@return number timeInQueue Time elapsed since the player joined the queue (in milliseconds)
function GetBattlefieldTimeWaited(index) end

--- Returns information about special vehicles in the current zone. Used only for certain vehicles in certain zones: includes the airships in Icecrown as well as vehicles used in Ulduar, Wintergrasp, and Strand of the Ancients.
---@param index number Index of a special vehicle (between 1 and GetNumBattlefieldVehicles() )
---@return number vehicleX Horizontal position of the vehicle relative to the zone map (0 = left edge, 1 = right edge)
---@return number vehicleY Vertical position of the vehicle relative to the zone map (0 = top, 1 = bottom)
---@return string unitName Localized name of the vehicle
---@return boolean isPossessed True if the vehicle is controlled by another unit
---@return any vehicleType Token indicating type of vehicle; some types can be used as keys to the global VEHICLE_TEXTURES table to get display texture information for the vehicle ( string ) Airship Alliance - The Alliance flying quest hub in Icecrown Airship Horde - The Horde flying quest hub in Icecrown Drive - A land vehicle such as a siege engine Fly - A flying vehicle Idle - A non-moving vehicle
---@return number orientation Facing angle of the vehicle ((in radians, 0 = north, values increasing counterclockwise)
---@return boolean isPlayer True if the vehicle is controlled by the player
---@return boolean isAlive True if the vehicle has not been destroyed
function GetBattlefieldVehicleInfo(index) end

--- Returns the winner of the current battleground or arena match
---@return any winner Index of the winning team if in a completed match; otherwise nil ( number ) 0 - Horde (Battleground) / Green Team (Arena) 1 - Alliance (Battleground) / Gold Team
function GetBattlefieldWinner() end

--- Returns information about available battlegrounds
---@param index number Index of a battleground (between 1 and NUM_BATTLEGROUNDS )
---@return string name Localized name of the battleground (Alterac Valley, Warsong Gulch, etc.)
---@return any canEnter 1 if the player can enter the battleground; otherwise nil
---@return any isHoliday 1 if a "holiday" offering bonus honor is currently active for the battleground; otherwise nil
---@return number minlevel Minimum character level required to enter the battleground
function GetBattlegroundInfo(index) end

--- Returns the number of battleground flags for which map position information is available
---@return number numFlags Number of battleground flags for which map position information is available
function GetNumBattlefieldFlagPositions() end

--- Returns the number of team members in the battleground not in the player's group. Still used in the default UI but no longer useful; always returns 0, as all team members in a battleground match are automatically joined into a raid group.
---@return number numTeamMembers Number of team members in the battleground not in the player's party or raid
function GetNumBattlefieldPositions() end

--- Returns the number of participant scores available in the current battleground
---@return number numScores Number of participant scores available in the current battleground; 0 if not in a battleground
function GetNumBattlefieldScores() end

--- Returns the number of battleground-specific statistics on the current battleground's scoreboard. Battleground-specific statistics include flags captured in Warsong Gulch, towers assaulted in Alterac Valley, etc. For the name and icon associated with each statistic, see GetBattlefieldStatInfo() .
---@return number numStats Number of battleground-specific scoreboard columns
function GetNumBattlefieldStats() end

--- Returns the number of special vehicles in the current zone. Used only for certain vehicles in certain zones: includes the airships in Icecrown as well as vehicles used in Ulduar, Wintergrasp, and Strand of the Ancients.
---@return number numVehicles Number of special vehicles
function GetNumBattlefieldVehicles() end

--- This function or event no longer exists in version 4.3.0 of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param index number Index of a battleground (between 1 and NUM_BATTLEGROUNDS ), if using the queue-anywhere UI; not used when choosing an instance for a single battleground (e.g. at a battlemaster or battleground portal)
---@return number numBattlefields Number of instances currently available for the battleground
function GetNumBattlefields(index) end

--- Returns the number of different battlegrounds available. Refers to distinct battlegrounds, not battleground instances. Does not indicate the number of battlegrounds the player can enter: for that, see GetBattlegroundInfo .
---@return number numBattlegrounds Number of different battlegrounds available
function GetNumBattlegroundTypes() end

--- Returns the number of members in the player's non-battleground party. When the player is in a party/raid and joins a battleground or arena, the normal party/raid functions refer to the battleground's party/raid, but the game still keeps track of the player's place in a non-battleground party/raid.
---@return number numMembers Number of members in the player's non-battleground party
function GetRealNumPartyMembers() end

--- Returns the number of members in the player's non-battleground raid. When the player is in a party/raid and joins a battleground or arena, the normal party/raid functions refer to the battleground's party/raid, but the game still keeps track of the player's place in a non-battleground party/raid.
---@return number numMembers Number of members in the player's non-battleground raid
function GetRealNumRaidMembers() end

--- Returns the index of the selected battleground instance in the queueing list. Selection in the battleground instance list is used only for display in the default UI and has no effect on other Battlefield APIs.
---@return number index Index of the selection in the battleground queue listing (1 for the first available instance, or between 2 and GetNumBattlefields() for other instances)
function GetSelectedBattlefield() end

--- Returns whether the player is the leader of a non-battleground party. When the player is in a party/raid and joins a battleground or arena, the normal party/raid functions refer to the battleground's party/raid, but the game still keeps track of the player's place in a non-battleground party/raid.
---@return any isLeader 1 if the player is the leader of a non-battleground party; otherwise nil
function IsRealPartyLeader() end

--- Returns whether the player is the leader of a non-battleground raid. When the player is in a party/raid and joins a battleground or arena, the normal party/raid functions refer to the battleground's party/raid, but the game still keeps track of the player's place in a non-battleground party/raid.
---@return any isLeader 1 if the player is the leader of a non-battleground raid; otherwise nil
function IsRealRaidLeader() end

--- Joins the queue for a battleground instance
---@param index number Index in the battleground queue listing (1 for the first available instance, or between 2 and GetNumBattlefields() for other instances)
---@param asGroup boolean True to enter the player's entire party/raid in the queue; false to enter the player only
function JoinBattlefield(index, asGroup) end

--- Immediately exits the current battleground instance. Returns the player to the location from which he or she joined the battleground and applies the Deserter debuff.
function LeaveBattlefield() end

--- Returns whether a battleground participant is inactive (and eligible for reporting as AFK)
---@param name string Name of a friendly player unit in the current battleground
---@param unit string A friendly player unit in the current battleground
---@return boolean isInactive True if the unit can be reported as AFK; otherwise false
function PlayerIsPVPInactive(name, unit) end

--- Reports a battleground participant as AFK
---@param name string Name of a friendly player unit in the current battleground
---@param unit string A friendly player unit in the current battleground
function ReportPlayerIsPVPAFK(name, unit) end

--- Requests information from the server about team member positions in the current battleground. Automatically called in the default UI by UIParent's and WorldMapFrame's OnUpdate handlers.
--- Flags: server
function RequestBattlefieldPositions() end

--- Requests battlefield score data from the server. Score data is not returned immediately; the UPDATE_BATTLEFIELD_SCORE event fires once information is available and can be retrieved by calling GetBattlefieldScore() and related functions.
--- Flags: server
function RequestBattlefieldScoreData() end

--- Requests information about available instances of a battleground from the server. The PVPQUEUE_ANYWHERE_SHOW event fires once information is available; data can then be retrieved by calling GetNumBattlefields() and GetBattlefieldInstanceInfo() .
--- Flags: server
---@param index number Index of a battleground (between 1 and NUM_BATTLEGROUNDS )
function RequestBattlegroundInstanceInfo(index) end

--- Filters the battleground scoreboard by faction/team
---@param faction any Faction for which to show battleground participant scores ( number ) 0 - Horde 1 - Alliance nil - All
function SetBattlefieldScoreFaction(faction) end

--- Selects a battleground instance in the queueing list. Selection in the battleground instance list is used only for display in the default UI and has no effect on other Battlefield APIs.
---@param index number Index in the battleground queue listing (1 for the first available instance, or between 2 and GetNumBattlefields() for other instances)
function SetSelectedBattlefield(index) end

--- Shows or hides the battlefield minimap's player arrow
---@param show boolean If the battlefield minimap's player arrow should be shown
function ShowMiniWorldMapArrowFrame(show) end

--- Sorts the battleground scoreboard. Battleground-specific statistics include flags captured in Warsong Gulch, towers assaulted in Alterac Valley, etc. For the name and icon associated with each statistic, see GetBattlefieldStatInfo() .
---@param sortType any Criterion for sorting the scoreboard data ( string ) class - Sort by character class cp - Sorts by honor points gained damage - Sorts by damage done deaths - Sort by number of deaths healing - Sorts by healing done hk - Sorts by number of honor kills kills - Sort by number of kills name - Sort by participant name stat1 - Battlefield-specific statistic 1 stat2 - Battlefield-specific statistic 2 stat3 - Battlefield-specific statistic 3 stat4 - Battlefield-specific statistic 4 stat5 - Battlefield-specific statistic 5 stat6 - Battlefield-specific statistic 6 stat7 - Battlefield-specific statistic 7 team -  Sort by team name
function SortBattlefieldScoreData(sortType) end

--- Returns whether a unit is in same battleground instance as the player
---@param unit string A unit to query
---@return number raidNum Numeric portion of the unit's raid unitID (e.g. 13 for raid13 )
function UnitInBattleground(unit) end
