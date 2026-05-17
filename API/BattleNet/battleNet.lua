--==============================
-- Battle.net functions
--==============================

--- Returns information about a RealID friend by index
---@param friendIndex number Index (between 1 and BNGetNumFriends() )
---@return number presenceID auto incrementing ID, reset at each login. Persists across reload of UI, but not change of character
---@return string givenName First name of the friend, as a new form of chatlink. Visually looks like a string, but only when rendered
---@return string surname Last name (surname) of the friend, as a new form of chatlink. Visually looks like a string, but only when rendered
---@return string toonName Name of the active character tied to the BNet account
---@return number toonID
---@return string client The name of the game the friend is currently playing, if any; Returns nil if not online. Returns initialism for World of Warcraft ('WoW')
---@return boolean isOnline Online status
---@return number lastOnline
---@return boolean isAFK
---@return boolean isDND
---@return string messageText RealID broadcast message displayed below the user on your friends list
---@return string noteText The player's personal note for the friend; nil for no note
---@return boolean isFriend
---@return number unknown
function BNGetFriendInfo(friendIndex) end

--- Returns information about a RealID friend
---@param presenceID number
---@return number presenceID
---@return string givenName First name of the friend
---@return string surname Last name (surname) of the friend
---@return string toonName Name of the active character tied to the BNet account
---@return number toonID
---@return string client The name of the game the friend is currently playing, if any; Returns nil if not online. Returns initialism for World of Warcraft ('WoW')
---@return boolean isOnline Online status
---@return number lastOnline
---@return boolean isAFK
---@return boolean isDND
---@return string messageText RealID broadcast message displayed below the user on your friends list
---@return string noteText The player's personal note for the friend; nil for no note
---@return boolean isFriend
---@return number unknown
function BNGetFriendInfoByID(presenceID) end

--- Returns information about a particular online toon tied to a RealID friend
---@param friendIndex number Index (between 1 and BNGetNumFriends() )
---@param toonIndex number Index (between 1 and BNGetNumFriendToons(friendIndex) )
---@return boolean unknown
---@return string toonName The toon's name
---@return string client The name of the game the friend is currently playing, if any;  Returns initialism for World of Warcraft ('WoW')
---@return string realmName The toon's realm name
---@return number faction The toon's faction. Returns -1 for offline, 0 for Horde, 1 for Alliance
---@return string race The toon's race
---@return string class The toon's class
---@return string unknown
---@return string zoneName The toon's zone (location)
---@return string level The toon's character level
---@return string gameText The zone and server of the active toon separated by a hyphen
---@return string broadcastText The user's RealID broadcast message
---@return string broadcastTime The time the broadcast message was first set
function BNGetFriendToonInfo(friendIndex, toonIndex) end

--- Returns information about the player's RealID settings
---@return number unknown
---@return number unknown
---@return string broadcastText The player's current broadcast message (entered at the top of the friends tab)
---@return boolean bnetAFK
---@return boolean bnetDND
function BNGetInfo() end

--- Returns boolean for the Mature Language Filter option's state.
---@return boolean isEnabled Returns true if the Mature Language Filter interface option is enabled, otherwise false.
function BNGetMatureLanguageFilter() end

--- Returns the number of online toons for a friend
---@param friendIndex number The index of the friend to query
---@return number numToons The number of toons
function BNGetNumFriendToons(friendIndex) end

--- Returns total number of RealID friends and currently online number of RealID friends
---@return number totalBNet Total number of RealID friends
---@return number numBNetOnline Number of currently online RealID friends
function BNGetNumFriends() end

--- Returns the index of the selected user on your friend's list
---@return number friendIndex The index of the friend in the list
function BNGetSelectedFriend() end

--- Returns information about the active toon tied to a RealID friend
---@param presenceID number
---@return boolean unknown
---@return string toonName The toon's name
---@return string client The name of the game the friend is currently playing, if any;  Returns initialism for World of Warcraft ('WoW')
---@return string realmName The toon's realm name
---@return number realmID The toon's realm ID (not sure if unique per realm, or a weekly/session realmID identifier)
---@return number faction The toon's faction. Returns -1 for offline, 0 for Horde, 1 for Alliance
---@return string race The toon's race
---@return string class The toon's class
---@return string unknown
---@return string zoneName The toon's zone (location)
---@return string level The toon's character level
---@return string gameText The zone and server of the active toon separated by a hyphen
---@return string broadcastText The user's RealID broadcast message
---@return string broadcastTime The time the broadcast message was first set
function BNGetToonInfo(presenceID) end

--- Sets the player's current RealID broadcast message.
---@param broadcastText string Value that becomes your new broadcast message
function BNSetCustomMessage(broadcastText) end

--- Changes the private note for a RealID friend
---@param presenceID number The presenceID of the friend whose note you want to change
---@param note string The new note for the friend
function BNSetFriendNote(presenceID, note) end

--- Sets the Mature Language Filter option
---@param enabled boolean true to enable the Mature Language Filter; otherwise false
function BNSetMatureLanguageFilter(enabled) end
