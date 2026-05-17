--==============================
-- Instance functions
--==============================

--- Returns whether the player can reset instances. Used to determine whether to display the "Reset Instance" option in the unit popup menu for the player.
---@return any canResetInstances 1 if the player can currently reset instances; otherwise nil
function CanShowResetInstances() end

--- Returns the 5 player selected dungeon difficulty
---@return any difficulty The current 5 player dungeon difficulty ( number ) 1 - Normal 2 - Heroic
function GetDungeonDifficulty() end

--- Returns the amount of time left until the player is removed from the current instance. Used when the player is in an instance he doesn't own; e.g. if the player enters an instance with a group and is then removed from the group.
---@return number timeleft The number of seconds until the player is booted from the current instance
function GetInstanceBootTimeRemaining() end

--- Returns difficulty setting for the current dungeon/raid instance.
---@return any difficulty The current instance's difficulty setting ( number ) 1 - Normal (5 or 10 players) 2 - Heroic (5 players) / Normal (25 players) 3 - Heroic (10 players) 4 - Heroic
function GetInstanceDifficulty() end

--- Returns instance information about the current area
---@return string name Name of the instance or world area
---@return any type Type of the instance ( string ) arena - A PvP Arena instance none - Normal world area (e.g. Northrend, Kalimdor, Deeprun Tram) party - An instance for 5-man groups pvp - A PvP battleground instance raid - An instance for raid groups
---@return any difficulty Difficulty setting of the instance ( number ) 1 - In raids, this represents 10 Player.  In instances, Normal. 2 - In raids, this represents 25 Player.  In instances, Heroic. 3 - In raids, this represents 10 Player Heroic.  In instances, Epic (unused for PvE instances but returned in some battlegrounds). 4 - In raids, this represents 25 Player Heroic.  No corollary in instances.
---@return string difficultyName String representing the difficulty of the instance. E.g. "10 Player"
---@return number maxPlayers Maximum number of players allowed in the instance
---@return number playerDifficulty Unknown
---@return boolean isDynamicInstance Unknown
function GetInstanceInfo() end

--- Returns time remaining before the player is saved to a recently entered instance.
---@return number seconds Time remaining before the player is saved to the instance
function GetInstanceLockTimeRemaining() end

--- Returns the number of instances to which the player is saved
---@return number savedInstances Number of instances to which the player is saved
function GetNumSavedInstances() end

--- Returns the number of world state UI elements. World State UI elements include PvP, instance, and quest objective information (displayed at the top center of the screen in the default UI) as well as more specific information for "control point" style PvP objectives. Examples: the Horde/Alliance score in Arathi Basin, the tower status and capture progress bars in Hellfire Peninsula, the progress text in the Black Morass and Violet Hold instances, and the event status text for quests The Light of Dawn and The Battle For The Undercity .
---@return number numUI Returns the number of world state elements
function GetNumWorldStateUI() end

--- Returns information on a specific instance to which the player is saved
---@param index number Index of a saved instance (between 1 and GetNumSavedInstances() )
---@return string instanceName Name of the instance
---@return number instanceID Unique identifier of the saved instance (commonly known as a RaidID)
---@return number instanceReset Approximate number of seconds remaining until the instance resets
---@return any instanceDifficulty Difficulty level of the saved instance ( number ) 1 - Normal ('10 Player' if instance is a raid) 2 - Heroic ('25 Player' if instance is a raid) 3 - 10 Player Heroic 4 - 25 Player Heroic
---@return boolean locked
---@return boolean extended true if the reset time has been extended past its normal time; otherwise false
---@return number instanceIDMostSig
---@return boolean isRaid
---@return number maxPlayers Number of players allowed
---@return string difficultyName A string representing the difficulty of the given instance.
function GetSavedInstanceInfo(index) end

--- Returns information about a world state UI element. World State UI elements include PvP, instance, and quest objective information (displayed at the top center of the screen in the default UI) as well as more specific information for "control point" style PvP objectives. Examples: the Horde/Alliance score in Arathi Basin, the tower status and capture progress bars in Hellfire Peninsula, the progress text in the Black Morass and Violet Hold instances, and the event status text for quests The Light of Dawn and The Battle For The Undercity .
---@param index number Index of a world state UI element (between 1 and GetNumWorldStateUI() )
---@return number uiType 1 if the element should be conditionally displayed (based on the state of the "Show World PvP Objectives" setting and the player's location); any other value if the element is always displayed
---@return number state State of the element: 0 always indicates the element should be hidden; other possible states vary by context (e.g. in Warsong Gulch, state 2 indicates the team holds the enemy flag)
---@return string text Text to be displayed for the element
---@return string icon Path to a texture for the element's main icon (usually describing the element itself: e.g. a Horde or Alliance icon for elements displaying a battleground score)
---@return string dynamicIcon Path to a texture for a secondary icon (usually describing transient status: e.g. a flag icon in Warsong Gulch)
---@return string tooltip Text to be displayed when mousing over the UI element
---@return string dynamicTooltip Text to be displayed when mousing over the element's dynamicIcon
---@return any extendedUI Identifies the type of additional UI elements to display if applicable ( string ) "" - No additional UI should be displayed "CAPTUREPOINT" - A capture progress bar should be displayed for the element
---@return number extendedUIState1 Index of the capture progress bar corresponding to the element
---@return number extendedUIState2 Position of the capture bar (0 = left/Horde edge, 100 = right/Alliance edge)
---@return number extendedUIState3 Width of the neutral section of the capture bar: e.g. if 50, the extendedUIState2 values 0-25 correspond to Horde ownership of the objective, values 76-100  to Alliance ownership, and values 26-75 to no ownership
function GetWorldStateUIInfo(index) end

--- Returns whether the player is in an instance (and its type if applicable)
---@return any isInstance 1 if the player is in an instance, otherwise nil
---@return any instanceType The type of instance the player is in ( string ) arena - Player versus player arena none - Not inside an instance party - 5-man instance pvp - Player versus player battleground raid - Raid instance
function IsInInstance() end

--- Teleports the player to or from their current LFG dungeon
---@param portOut boolean A boolean flag that indicates if the player is trying to teleport out of the dungeon, or not.
function LFGTeleport(portOut) end

--- Requests information about saved instances from the server. Data is not returned immediately; the UPDATE_INSTANCE_INFO event when the raid information is available for retrieval via GetSavedInstanceInfo() and related functions.
--- Flags: server
function RequestRaidInfo() end

--- Resets all non-saved instances associated with the player. Only instances to which the player is not saved may be reset (i.e. normal 5-man dungeons, not heroic dungeons or raids), and only by a solo player or group leader.
function ResetInstances() end

--- Allows leaving a recently entered instance to which the player would otherwise be saved.
---@param response any Whether the player wishes to remain in the instance ( boolean ) false - Exit to the nearest graveyard true - Remain in the zone, saving the player to this instance
function RespondInstanceLock(response) end

--- Sets the player's 5 player dungeon difficulty preference.
---@param difficulty any A difficulty level ( number ) 1 - 5 Player (Normal) 2 - 5 Player
function SetDungeonDifficulty(difficulty) end

--- Sets the player's raid dungeon difficulty preference. The dungeon difficulty has no effect on the instance created if the player is not the raid leader or while you are inside an instance already.
---@param difficulty any Difficulty level for raid dungeons 1 - 10 Player 2 - 25 Player 3 - 10 Player (Heroic) 4 - 25 Player
function SetRaidDifficulty(difficulty) end
