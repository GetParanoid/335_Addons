--==============================
-- Social functions
--==============================

--- Adds a character to the friends list
---@param name string Name of a character to add to the friends list
function AddFriend(name) end

--- Adds a character to the ignore list
---@param name string Name of a character to add to the ignore list
function AddIgnore(name) end

--- Adds the named character to the ignore list, or removes the character if already in the ignore list
---@param fullname string Name of a character to add to or remove from the ignore list
function AddOrDelIgnore(fullname) end

--- Adds the named character to the friends list, or removes the character if already in the friends list
---@param name string Name of a character to add to or remove from the friends list
---@param note string Note text to be associated with the friends list entry created
function AddOrRemoveFriend(name, note) end

--- Removes a player from the ignore list
---@param name string Name of a character to remove from the ignore list
function DelIgnore(name) end

--- Returns information about a character on the player's friends list
---@param index number Index of a character in the Friends list (between 1 and GetNumFriends() )
---@return string name Name of the friend
---@return number level Character level of the friend, if online; otherwise 0
---@return string class Localized name of the friend's class, if online; otherwise UNKNOWN
---@return string area Name of the zone in which the friend is located, if online; otherwise UNKNOWN
---@return any connected 1 if the friend is online; otherwise nil
---@return string status A label indicating the friend's status ( "<AFK>" or "<DND>" ), or the empty string ( "" ) if not applicable
---@return string note Note text associated with the friend
---@return any RAF 1 if the friend's account is linked to the player's via the Recruit-A-Friend program; otherwise nil
function GetFriendInfo(index) end

--- Returns the name of a character on the ignore list
---@param index string Index of an entry in the ignore list (between 1 and GetNumIgnores() )
---@return string name Name of the ignored character
function GetIgnoreName(index) end

--- Returns the number of characters on the player's friends list
---@return number numFriends Number of characters currently on the friends list
function GetNumFriends() end

--- Returns the number of characters on the player's ignore list
---@return number numIgnores Number of characters currently on the ignore list
function GetNumIgnores() end

--- Returns the number of results from a Who system query
---@return number numResults Number of results returned
---@return number totalCount Number of results to display
function GetNumWhoResults() end

--- Returns the index of the selected character in the player's friends list. Selection in the Friends list is used only for display in the default UI and has no effect on other Friends list APIs.
---@return number index Index of the selected character in the Friends list (between 1 and GetNumFriends() )
function GetSelectedFriend() end

--- Returns the index of the selected character in the player's ignore list. Selection in the Ignore list is used only for display in the default UI and has no effect on other Ignore list APIs.
---@return number index Index of the selected character in the Ignore list (between 1 and GetNumIgnores() )
function GetSelectedIgnore() end

--- Returns information about a character in the Who system query results
---@param index number Index of an entry in the Who system query results (between 1 and GetNumWhoResults() )
---@return string name Name of the character
---@return string guild Name of the character's guild
---@return number level Level of the character
---@return string race Localized name of the character's race
---@return string class Localized name of the character's class
---@return string zone Name of the zone in which the character was located when the query was performed
---@return string filename A non-localized token representing the character's class
function GetWhoInfo(index) end

--- Returns whether a unit is on the player's ignore list
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any isIgnored 1 if the unit is on the player's ignore list; otherwise nil
function IsIgnored(unit, name) end

--- Removes a character from the friends list
---@param name string Name of a character to remove from the friends list
function RemoveFriend(name) end

--- Requests a list of characters meeting given search criteria from the server. Text in the query will match against any of the six searchable fields unless one of the specifiers below is used; multiple specifiers can be used in one query. Queries are case insensitive.
--- Flags: server
---@param filter string A Who system search query (cannot be nil; use the empty string "" to specify a blank query)
function SendWho(filter) end

--- Sets note text associated with a friends list entry. Setting a note to nil will result in an error; to remove a note, set it to the empty string ( "" ).
---@param index number Index of a friends list entry (between 1 and GetNumFriends() )
---@param name string Name of friend to modify
---@param note string The note to set
function SetFriendNotes(index, name, note) end

--- Selects a character in the player's friends list. Selection in the Friends list is used only for display in the default UI and has no effect on other Friends list APIs.
---@param index number Index of a character in the Friends list (between 1 and GetNumFriends() )
function SetSelectedFriend(index) end

--- Selects a character in the player's ignore list. Selection in the Ignore list is used only for display in the default UI and has no effect on other Ignore list APIs.
---@param index number Index of a character in the Ignore list (between 1 and GetNumIgnores() )
function SetSelectedIgnore(index) end

--- Changes the delivery method for results from SendWho() queries. In the default UI, results delivered in CHAT_MSG_SYSTEM are printed in the main chat window; results delivered in a WHO_LIST_UPDATE event cause the FriendsFrame to be shown, displaying the results in its "Who" tab.
---@param state any Number identifying a delivery method ( number ) 0 - Send results of three entries or fewer in CHAT_MSG_SYSTEM events and results of greater than three entries in a WHO_LIST_UPDATE event 1 - Send all results in a WHO_LIST_UPDATE event
function SetWhoToUI(state) end

--- Requests friends/ignore list information from the server. Information is not returned immediately; the FRIENDLIST_UPDATE event fires when data becomes available for use by Friends/Ignore API functions.
--- Flags: server
function ShowFriends() end

--- Sorts the Who system query results list. Sorting by the same criterion twice will reverse the sort order.
---@param sortType any Criterion for sorting the list ( string ) class - Sort by class name guild - Sort by guild name level - Sort by player level name - Sort by player name race - Sort by race name zone - Sort by current zone name
function SortWho(sortType) end
