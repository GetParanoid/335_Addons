--==============================
-- Utility functions
--==============================

--- Creates a new Font object
---@param name string Name to assign to the newly created object; used both as the name of the object (retrievable with Font:GetName() ) and as a global variable referencing the object (unless another global by that name already exists)
---@return table fontObject The newly created Font object
function CreateFont(name) end

--- Creates a new Frame object
---@param frameType string Type of frame to create; see the widget documentation for details
---@param name string Name to assign to the newly created object; used both as the name of the object (retrievable via the GetName method) and as a global variable referencing the object, unless another global by that name already exists
---@param parent table Reference to another frame to be the new frame's parent
---@param template string Name of a template to be used in creating the frame; if creating a frame from multiple templates, a comma-separated list of names
---@return table frame A reference to the newly created Frame
function CreateFrame(frameType, name, parent, template) end

--- Returns the next frame following the frame passed, or nil if no more frames exist
---@param currentFrame table The current frame to get the next frame, or nil to get the first frame
---@return table nextFrame The frame following currentFrame or nil if no more frames exist, or the first frame if nil was passed
function EnumerateFrames(currentFrame) end

--- Returns a list of character names which complete a given partial name prefix
---@param inputString string Partial name for which to return completions
---@param includeBitfield any One or more of the following flags (combined via bit.bor() ), indicating which characters should be included in the result list: ( number , bitfield ) 0x00000000 - AUTOCOMPLETE_FLAG_NONE : No characters 0x00000001 - AUTOCOMPLETE_FLAG_IN_GROUP : Characters in the player's party or raid 0x00000002 - AUTOCOMPLETE_FLAG_IN_GUILD : Characters in the player's guild 0x00000004 - AUTOCOMPLETE_FLAG_FRIEND : Characters from the player's friends list 0x00000010 - AUTOCOMPLETE_FLAG_INTERACTED_WITH : Characters with whom the player has recently interacted 0x00000020 - AUTOCOMPLETE_FLAG_ONLINE : Currently online friends and guildmates 0xffffffff - AUTOCOMPLETE_FLAG_ALL : All characters
---@param excludeBitfield any One or more of the following flags (combined via bit.bor() ), indicating which characters should be excluded from the result list: ( number , bitfield ) 0x00000000 - AUTOCOMPLETE_FLAG_NONE : No characters 0x00000001 - AUTOCOMPLETE_FLAG_IN_GROUP : Characters in the player's party or raid 0x00000002 - AUTOCOMPLETE_FLAG_IN_GUILD : Characters in the player's guild 0x00000004 - AUTOCOMPLETE_FLAG_FRIEND : Characters from the player's friends list 0x00000010 - AUTOCOMPLETE_FLAG_INTERACTED_WITH : Characters with whom the player has recently interacted 0x00000020 - AUTOCOMPLETE_FLAG_ONLINE : Currently online friends and guildmates 0xffffffff - AUTOCOMPLETE_FLAG_ALL : All characters
---@param maxResults number Maximum number of results to be returned
---@param cursorPosition number Cursor position in the inputString ; currently unused
function GetAutoCompleteResults(inputString, includeBitfield, excludeBitfield, maxResults, cursorPosition) end

--- Returns the Frame object associated with the given name.
---@param name string Name of a Frame or other UI object
---@return table frame A reference to the named frame
function GetClickFrame(name) end

--- Returns all frames registered for a given event
---@param event string An event name
function GetFramesRegisteredForEvent(event) end

--- Returns information about special countdown timers
---@param index number Index of an available timer (between 1 and MIRRORTIMER_NUMTIMERS )
---@return any timer Non-localized token identifying the type of timer ( string ) BREATH - Used for the Breath timer when swimming underwater DEATH - Currently unused EXHAUSTION - Used for the Fatigue timer when swimming far from shore FEIGNDEATH - Used for the Hunter Feign Death ability
---@return number value Number of seconds remaining before the timer expires
---@return number maxvalue Maximum value of the timer
---@return number scale Rate at which the timer bar should move (e.g. -1 for a slowly "emptying" bar, 10 for a quickly "filling" bar); unused in the default UI
---@return number paused 1 if the timer is currently paused; otherwise 0
---@return string label Localized text to be displayed for the timer
function GetMirrorTimerInfo(index) end

--- Returns a high-resolution value for a special countdown timer
---@param timer any Non-localized token identifying the type of timer ( string ) BREATH - Used for the Breath timer when swimming underwater DEATH - Currently unused EXHAUSTION - Used for the Fatigue timer when swimming far from shore FEIGNDEATH - Used for the Hunter Feign Death ability
---@return number progress Number of milliseconds remaining before the timer expires
function GetMirrorTimerProgress(timer) end

--- Returns which mouse button triggered the current script. If called in a line of execution that started with a click handler (OnMouseDown, OnMouseUp, OnClick, OnDoubleClick, PreClick, or PostClick), returns a string identifying which mouse button triggered the handler. Otherwise, returns nil.
---@return string button Name of the mouse button that triggered the current script
function GetMouseButtonClicked() end

--- Returns the name for a mouse button specified by number
---@param buttonNumber number A mouse button number (1-5)
---@return any buttonName The name of the given mouse button ( string ) Button4 Button5 LeftButton MiddleButton RightButton
function GetMouseButtonName(buttonNumber) end

--- Returns the name of a character on the mute list
---@param index number Index of an entry in the mute listing (between 1 and GetNumMutes() )
---@return string name Name of the muted character
function GetMuteName(index) end

--- Returns the number of existing Frame objects (and derivatives). Only counts Frame objects and derivatives thereof (e.g. Button, Minimap, and StatusBar; but not FontString, AnimationGroup, and Texture).
---@return number numFrames Number of existing Frame objects (and derivatives)
function GetNumFrames() end

--- Returns a localized string according to given parameters. Applies to any global variable whose name fits a standard format: for example, GetText("foo") returns the value of the global variable foo (if it exists), and GetText("foo", 3) returns the value of foo_FEMALE (or if it does not exist, the value of foo ). Causes a Lua error if the given variable does not exists (or is nil).
---@param token string Base name of a localized string token
---@param gender number Gender of the string's subject (as returned by UnitSex() )
---@param ordinal number Currently unused
---@return string text The localized string according to the given parameters
function GetText(token, gender, ordinal) end

--- Returns a number representing the current time (with millisecond precision). Unlike with time() , the number returned by this function has no meaning of its own and may not be comparable across clients; however, since it also provides higher resolution it can be compared against itself for high-precision time measurements.
---@return number time A number that represents the current time in seconds (with millisecond precision)
function GetTime() end

--- Returns whether the login process has completed. The PLAYER_LOGIN event provides similar information; this function presents an alternative that can be used across UI reloads.
---@return any loggedIn 1 if the login process has completed; otherwise nil
function IsLoggedIn() end

--- Returns whether a given mouse button is held down. If no button is specified, returns 1 if any mouse button is held down.
---@param button any Number or name of a mouse button ( number,string ) 1 or LeftButton - Primary mouse button 2 or RightButton - Secondary mouse button 3 or MiddleButton - Third mouse button (or clickable scroll control) 4 or Button4 - Fourth mouse button 5 or Button5 - Fifth mouse button
---@return any isDown 1 if the mouse button is down; otherwise nil
function IsMouseButtonDown(button) end

--- Enables a global variable for automatic saving upon logout & UI reload. Used for some data saved on the local client by the default UI.
--- Flags: internal, protected
function RegisterForSave() end

--- Enables a global variable for automatic saving (on a per-character basis) upon logout & UI reload. Used for some data saved on the local client by the default UI.
--- Flags: internal, protected
function RegisterForSavePerCharacter() end

--- Requests information from the server about the player character's total time spent online. Information is not returned immediately; the TIME_PLAYED_MSG event fires when the requested data is available.
--- Flags: server
function RequestTimePlayed() end

--- Runs a string as a Lua script
---@param script string A Lua script to be run
function RunScript(script) end

--- Returns a description of an amount of time in appropriate units. Output includes markup normally hidden when displayed in a FontString (see last example); this markup allows the client to automatically print the singular or plural form of a word depending on the value of the preceding number.
--- Flags: blizzardui
---@param seconds number An amount of time (in seconds)
---@param noSeconds boolean True to omit a seconds term in the description; false or omitted otherwise
---@param notAbbreviated boolean True to use full unit names in the description (e.g. Hours, Minutes); false or omitted to use abbreviations (e.g. Hr, Min)
---@param maxCount number Maximum number of terms to include in the description; defaults to 2 if omitted
---@return string time A description of the amount of time in appropriate units (see examples)
function SecondsToTime(seconds, noSeconds, notAbbreviated, maxCount) end

--- Sets a Texture object to display an arbitrary texture, altering it to fit a circular frame. Used in the default UI to display square textures (such as item icons) within the circular "portrait" frames used in many default UI elements.
---@param frameName string Name of a Texture object
---@param texturePath string Path to a texture to display
function SetPortraitToTexture(frameName, texturePath) end

--- Returns information about the local variables at a given stack depth
---@param stackLevel number The stack level to query
---@return string localsInfo A string detailing the local variables at the given stack depth.
function debuglocals(stackLevel) end

--- Returns the value of a global variable. Often used in the default UI in cases where several similar names are systematically constructed. Examples:
---@param name string Name of a global variable
---@return any value Value of the given variable
function getglobal(name) end

--- Replaces non-simple values in a list with nil.
function scrub() end

--- Sets a global variable to a specified value. Allows setting the value of a global variable in contexts where its name might be overridden by that of a local variable; i.e. setglobal(name, value) is equivalent to _G.name = value or _G["name"] = value .
---@param name string Name of a global variable
---@param value any New value for the variable
function setglobal(name, value) end

--- Joins a list of strings (with no separator). Equivalent to strjoin("", ...) . If no strings are provided, returns the empty string ( "" ).
---@return string result The concatenated string
function strconcat() end

--- Joins a list of strings together with a given separator. If given a list of strings not already in a table, this function can be used instead of table.concat for better performance.
---@param sep string A separator to insert between joined strings
---@return string text The list of strings joined together with the given separator string
function strjoin(sep) end

--- Returns the length of a string, taking UTF-8 multi-byte characters into account
---@param string string The string to query.
---@return number length The length of the given string, taking UTF-8 multi-byte characters into account.
function strlenutf8(string) end

--- Fast simple substring substitution. Matches the semantics of string.gsub , but only finds and replaces specific substrings rather than using more powerful and more computationally expensive regular expression matching. Thus, this function can be used in place of string.gsub in performance-critical situations where only simple matching is needed.
---@param text string Text to be altered
---@param pattern string A substring to be located within the source text
---@param replacement string Text to be inserted in place of the found pattern
---@param count string Maximum number of replacements to be made
---@return string newText The input string with matching substrings replaced
---@return number count Number of occurrences of the substring replaced
function strreplace(text, pattern, replacement, count) end

--- Splits a string based on another seperator string. Also available as string.split (though not provided by the Lua standard library).
---@param sep string The seperator string to use
---@param text string The text to split
---@param limit number The maximum number of pieces to split the string into
function strsplit(sep, text, limit) end

--- Trims leading and trailing characters (whitespace by default) from a string. Also available as string.trim (though not provided by the Lua standard library).
---@param str string A string to trim
---@param trimChars string A string listing the characters to be trimmed (e.g. "[]{}()" to trim leading and trailing brackets, braces, and parentheses); if nil or omitted, whitespace characters (space, tab, newline, etc) are trimmed
---@return string text The trimmed string
function strtrim(str, trimChars) end

--- Removes all entries from a table
---@param aTable table A table whose contents are to be erased
---@return table emptyTable The input table, with all entries removed
function wipe(aTable) end
