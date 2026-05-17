--==============================
-- Chat functions
--==============================

--- Adds a message type to the saved list of those displayed in a chat window. Used by the default UI's function ChatFrame_AddMessageGroup() , which manages the set of message types shown in a displayed ChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param messageGroup string Token identifying a message type
function AddChatWindowMessages(index, messageGroup) end

--- Returns whether a chat message can be reported as spam
---@param lineID number Unique identifier of a chat message (11th argument received with the corresponding CHAT_MSG event)
---@return any canComplain 1 if the player can report the given chat message as spam; otherwise nil
function CanComplainChat(lineID) end

--- Changes the color associated with a chat message type
---@param messageType string The message type, as listed in chat-cache.txt.  Example values are "SAY" and "CHANNEL1".
---@param red number The value of the red component color (0.0 - 1.0)
---@param green number The value of the green component color (0.0 - 1.0)
---@param blue number The value of the blue component color (0.0 - 1.0)
function ChangeChatColor(messageType, red, green, blue) end

--- Adds a function to filter or alter messages to the chat display system. The filter function will be called each time a message is sent to one of the default chat frames (ChatFrame1, ChatFrame2, ..., ChatFrame7).  The function will be passed the chat frame object that the message is being added to, along with the event that caused the messages to be added, and the arguments to that event.
--- Flags: blizzardui
---@param event string A CHAT_MSG_ Event for which the filter should be used
---@param filter function A function to filter incoming messages
function ChatFrame_AddMessageEventFilter(event, filter) end

--- Returns the list of filters registered for a chat event. See ChatFrame_AddMessageEventFilter() for details about chat message filters.
--- Flags: blizzardui
---@param event string A CHAT_MSG_ Event
---@return table filterTable A table containing any filters set for the given event, with numeric keys corresponding to the order in which filters were registered
function ChatFrame_GetMessageEventFilters(event) end

--- Removes a previously set chat message filter. See ChatFrame_AddMessageEventFilter() for details about chat message filters.
--- Flags: blizzardui
---@param event string CHAT_MSG_ Event from which to remove a filter
---@param filter function A filter function registered for the event
function ChatFrame_RemoveMessageEventFilter(event, filter) end

--- Reports a chat message as spam. Used in the default UI when right-clicking the name of a player in a chat message and choosing "Report Spam" from the menu.
---@param lineID number Unique identifier of a chat message (11th argument received with the corresponding CHAT_MSG event)
---@param name string Name of a player to complain about
---@param text string Specific text to complain about
function ComplainChat(lineID, name, text) end

--- Performs a preset emote (with optional target). The list of built-in emote tokens can be found in global variables whose names follow the format "EMOTE"..num.."_TOKEN" , where num is a number between 1 and MAXEMOTEINDEX (a variable local to ChatFrame.lua.)
---@param emote string Non-localized token identifying an emote to perform
---@param target string Name of a unit at whom to direct the emote
---@param hold boolean Hold the emote animation until cancelled
function DoEmote(emote, target, hold) end

--- Returns the numeric index corresponding to a chat message type. These indices are used in the default UI to identify lines printed in a chat window, allowing (for example) their color to be changed to match changes in the player's color preferences.
---@param messageGroup string Token identifying a message type
---@return number index Numeric index of the chat type
function GetChatTypeIndex(messageGroup) end

--- Returns the saved settings for a chat window. These values reflect the settings saved between sessions, which are used by the default UI to set up the chat frames it displays.
---@param index number Index of the window you wish you get information on (starts at 1)
---@return string name Name of the chat window
---@return number fontSize Font size for text displayed in the chat window
---@return number r Red component of the window's background color (0.0 - 1.0)
---@return number g Green component of the window's background color (0.0 - 1.0)
---@return number b Blue component of the window's background color (0.0 - 1.0)
---@return number alpha Alpha value (opacity) of the window's background (0 = fully transparent, 1 = fully opaque)
---@return number shown 1 if the window should be shown; 0 if it should be hidden
---@return number locked 1 if the window should be locked; 0 if it should be movable/resizable
---@return number docked 1 if the window should be docked to the main chat window; otherwise 0
---@return number uninteractable 1 if the window should ignore all mouse events; otherwise 0
function GetChatWindowInfo(index) end

--- Returns the saved list of messages to which a chat window is subscribed
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
function GetChatWindowMessages(index) end

--- Returns the name of the player character's default language. This is the language used in the chat system (Common or Orcish, as opposed to Taurahe, Darnassian, etc), not the real-world language of the client or server.
---@return string language Localized name of the player character's default language
function GetDefaultLanguage() end

--- Returns the localized name of a player character language
---@param index number Index of a player character language (between 1 and GetNumLanguages()
---@return string language Localized name of the language (e.g. "Common" or "Gnomish")
function GetLanguageByIndex(index) end

--- Returns the number of languages the player character can speak
---@return number languages Number of in-game languages known to the player character (generally 2 for most races, 1 for Orcs or Humans)
function GetNumLanguages() end

--- Enables or disables saving chat text to a file. Text received via the chat system (but not necessarily all text displayed in chat windows) will be saved to the file Logs/WoWChatLog.txt (path is relative to the folder containing the World of Warcraft client); the file is not actually updated until the player logs out.
---@param toggle boolean True to enable chat logging; false or omitted to disable
---@return any isLogging 1 if chat logging is enabled; otherwise nil
function LoggingChat(toggle) end

--- Enables or disables saving combat log data to a file. Combat log data will be saved to the file Logs/WoWCombatLog.txt (path is relative to the folder containing the World of Warcraft client); the file is not actually updated until the player logs out.
---@param toggle boolean True to enable combat logging; false or omitted to disable
---@return any isLogging 1 if combat logging is enabled; otherwise nil
function LoggingCombat(toggle) end

--- Initiates a public, server-side "dice roll". Used in the default UI to implement the /roll chat command; when called, the server generates a random integer and sends it to the player and all others nearby (or in the same party/raid) via a CHAT_MSG_SYSTEM event. (The server message is formatted according to the global RANDOM_ROLL_RESULT ; e.g. "Leeroy rolls 3 (1-100)".)
--- Flags: server
---@param min number Lowest number to be randomly chosen
---@param max number Highest number to be randomly chosen
function RandomRoll(min, max) end

--- Removes a message type from a chat window's list of saved message subscriptions. Used by the default UI's functions ChatFrame_RemoveMessageGroup() and ChatFrame_RemoveAllMessageGroups() which manage the set of message types shown in a displayed ChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param messageGroup string Token identifying a message type
function RemoveChatWindowMessages(index, messageGroup) end

--- Removes all saved color settings for chat message types, resetting them to default values
function ResetChatColors() end

--- Removes all saved chat window settings, resetting them to default values. Used by the default UI's function FCF_ ResetChatWindows() which resets the appearance and behavior of displayed FloatingChatFrames.
function ResetChatWindows() end

--- Sends a chat message
--- Flags: server
---@param text string Message to be sent (up to 255 characters)
---@param chatType any Channel on which to send the message (defaults to SAY if omitted) ( string ) BATTLEGROUND - Messages to a battleground raid group (sent with /bg in the default UI) CHANNEL - Message to a server or custom chat channel (sent with /1 , /2 , etc in the default UI); requires channel number for channel argument DND - Enables Away-From-Keyboard status for the player, with text as the custom message seen by others attempting to whisper the player EMOTE - Custom text emotes visible to nearby players (sent with /e in the default UI) GUILD - Messages to guild members (sent with /g in the default UI) OFFICER - Messages to guild officers (sent with /o in the default UI) PARTY - Messages to party members (sent with /p in the default UI) RAID - Messages to raid members (sent with /ra in the default UI) RAID_WARNING - Warning to raid members (sent with /rw in the default UI) SAY - Speech to nearby players (sent with /s in the default UI) WHISPER - Message to a specific character (sent with /w in the default UI); requires name of the character for channel argument YELL - Yell to not-so-nearby players
---@param language any Language in which to send the message; defaults to Common (for Alliance players) or Orcish (for Horde players) if omitted ( string ) COMMON - Alliance and Human language DARNASSIAN - Night Elf Language DRAENEI - Draenei Language DWARVEN - Dwarf Language GNOMISH - Gnome language GUTTERSPEAK - Undead language ORCISH - Horde and Orc Language TAURAHE - Tauren Language THALASSIAN - Night Elf Language TROLL - Troll language
---@param channel string If chatType is WHISPER , name of the target character; if chatType is CHANNEL , number identifying the target channel; ignored otherwise
function SendChatMessage(text, chatType, language, channel) end

--- Saves a chat window's background opacity setting. Used by the default UI's function FCF_SetWindowAlpha() which changes the opacity of a displayed FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param alpha number Alpha value (opacity) of the chat window background (0 = fully transparent, 1 = fully opaque)
function SetChatWindowAlpha(index, alpha) end

--- Saves a chat window's background color setting. Used by the default UI's function FCF_SetWindowColor() which changes the colors of a displayed FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param r number Red component of the background color (0.0 - 1.0)
---@param g number Green component of the background color (0.0 - 1.0)
---@param b number Blue component of the background color (0.0 - 1.0)
function SetChatWindowColor(index, r, g, b) end

--- Saves whether a chat window should be docked with the main chat window. Used by the default UI's functions FCF_DockFrame() and FCF_UnDockFrame() which manage the positioning of FloatingChatFrames.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param docked boolean True if the window should be docked with the main chat window; otherwise false
function SetChatWindowDocked(index, docked) end

--- Saves whether a chat window is locked. Used by the default UI's functions FCF_OpenNewWindow() and FCF_SetLocked() which manage the behavior of a FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param locked boolean True if the frame should be locked; otherwise false
function SetChatWindowLocked(index, locked) end

--- Saves a chat window's display name setting. Used by the default UI's function FCF_SetWindowName() which also handles setting the name displayed for a FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param name string Name to be displayed for the chat window
function SetChatWindowName(index, name) end

--- Saves whether a chat window should be shown. Used by the default UI's function FCF_OpenNewWindow() which initializes a displayed FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param shown boolean True if the window should be shown, false otherwise
function SetChatWindowShown(index, shown) end

--- Saves a chat window's font size setting. Used by the default UI's function FCF_SetChatWindowFontSize() which also handles changing the font displayed in a FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param size number Font size for the chat window (in points)
function SetChatWindowSize(index, size) end

--- Saves whether a chat window is marked as non-interactive. Used by the default UI's function FCF_SetUninteractable() which also handles enabling/disabling mouse events in the FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param setUninteractable boolean True flag the window as non-interactive; false otherwise
function SetChatWindowUninteractable(index, setUninteractable) end
