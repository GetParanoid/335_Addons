--==============================
-- Guild functions
--==============================

--- Accepts an invitation to join a guild. Usable in response to the GUILD_INVITE_REQUEST event, which fires when the player is invited to join a guild.
function AcceptGuild() end

--- Purchases a guild charter. Usable if the player is interacting with a guild registrar (i.e. between the GUILD_REGISTRAR_SHOW and GUILD_REGISTRAR_CLOSED events).
---@param guildName string Name of the guild to be created
function BuyGuildCharter(guildName) end

--- Returns whether the player is allowed to edit the guild information text. This text appears when clicking the "Guild Information" button in the default UI's Guild window.
---@return any canEdit 1 if the player can edit the guild information; otherwise nil
function CanEditGuildInfo() end

--- Returns whether the player is allowed to edit the guild Message of the Day
---@return any canEdit 1 if the player can edit the guild MOTD, otherwise nil
function CanEditMOTD() end

--- Returns whether the player is allowed to edit guild officer notes
---@return any canEdit 1 if the player can edit officer notes; otherwise nil
function CanEditOfficerNote() end

--- Returns whether the player is allowed to edit guild public notes
---@return any canEdit 1 if the player can edit public notes, otherwise nil
function CanEditPublicNote() end

--- Returns whether the player is allowed to demote lower ranked guild members
---@return any canDemote 1 if the player can demote lower ranked guild members; otherwise nil
function CanGuildDemote() end

--- Returns whether the player is allowed to invite new members to his or her guild
---@return any canInvite 1 if the player can invite members to their guild, otherwise nil
function CanGuildInvite() end

--- Returns whether the player is allowed to promote other guild members. The player may promote other members only up to the rank below his or her own.
---@return any canPromote 1 if the player can promote other guild members; otherwise nil
function CanGuildPromote() end

--- Returns whether the player is allowed to remove members from his or her guild. The player may only remove lower ranked members from the guild.
---@return any canRemove 1 if the player can remove a member from their guild, otherwise nil
function CanGuildRemove() end

--- Returns whether the player is allowed to view guild officer notes
---@return any canView 1 if the player can view officer notes, otherwise nil
function CanViewOfficerNote() end

--- Ends interaction with a guild registrar. Fires the GUILD_REGISTRAR_CLOSED event, indicating that guild registrar APIs may no longer have effects or return valid data.
function CloseGuildRegistrar() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function CloseGuildRoster() end

--- Ends interaction with the guild tabard creator. Fires the CLOSE_TABARD_FRAME event, indicating that tabard creation APIs may no longer have effects or return valid data.
function CloseTabardCreation() end

--- Declines an offered guild invitation. Usable in response to the GUILD_INVITE_REQUEST event which fires when the player is invited to join a guild.
function DeclineGuild() end

--- Returns the cost to purchase a guild charter. Usable if the player is interacting with a guild registrar (i.e. between the GUILD_REGISTRAR_SHOW and GUILD_REGISTRAR_CLOSED events).
---@return number cost Cost to purchase a guild charter (in copper)
function GetGuildCharterCost() end

--- Returns information about an entry in the guild event log. Only returns valid data after calling QueryGuildEventLog() and the following GUILD_EVENT_LOG_UPDATE event has fired.
---@param index number Index of an entry in the guild event log (between 1 and GetNumGuildEvents() )
---@return any type Type of event (example descriptions from the default UI below) ( string ) demote - player1 demotes player2 to rank. invite - player1 invites player2 to the guild. join - player1 joins the guild. promote - player1 promotes player2 to rank. quit - player1 has quit the guild. remove - player1 removes player2 from the guild.
---@return string player1 First actor in the event
---@return string player2 Second actor in the event, if applicable
---@return string rank Name of the rank related to promote/demote events
---@return number year Number of years since the event occurred
---@return number month Number of months since the event occurred
---@return number day Number of days since the event occurred
---@return number hour Number of hours since the event occurred
function GetGuildEventInfo(index) end

--- Returns a unit's guild affiliation
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return string guildName Name of the character's guild
---@return string guildRankName Name of the character's guild rank
---@return number guildRankIndex Numeric guild rank of the character (0 = guild leader; higher numbers for lower ranks)
function GetGuildInfo(unit, name) end

--- Returns guild information text. Only returns valid data after calling GuildRoster() and the following GUILD_ROSTER_UPDATE event has fired.
---@return string guildInfoText The guild information text (including newline characters)
function GetGuildInfoText() end

--- Returns information about the selected player in your guild roster.
---@param index number The player index in the guild roster.
---@return string name The name of the player
---@return string rank The rank of the player
---@return number rankIndex The rankIndex of the player
---@return number level The level of the player
---@return string class The (localized) class of the player
---@return string zone The last zone in which the player was seen
---@return string note The public note of the player
---@return string officernote The officer note of the player, if the player has permission to view it
---@return any online 1 if the player is online, nil otherwise
---@return any status The status of the player ( string ) - The player is currently away from keyboard. - The player does not want to be disturbed.
---@return string classFileName The class filename of the player - unlocalized
function GetGuildRosterInfo(index) end

--- Returns the amount of time since a guild member was last online. Only returns valid data after calling GuildRoster() and the following GUILD_ROSTER_UPDATE event has fired.
---@param index number Index of a member in the guild roster (between 1 and GetNumGuildMembers() ), or 0 for no selection
---@return number years Number of years since the member was last online
---@return number months Number of months since the member was last online
---@return number days Number of days since the member was last online
---@return number hours Number of hours since the member was last online
function GetGuildRosterLastOnline(index) end

--- Returns the Message of the Day for the player's guild
---@return string guildMOTD The guild Message of the Day
function GetGuildRosterMOTD() end

--- Returns the index of the selected member in the guild roster. Selection in the guild roster is used only for display in the default UI and has no effect on other Guild APIs.
---@return number index Index of the selected member in the guild roster (between 1 and GetNumGuildMembers() ), or 0 for no selection
function GetGuildRosterSelection() end

--- Returns whether the guild roster lists offline members
---@return any showOffline 1 if offline members are included in the guild roster listing; otherwise nil
function GetGuildRosterShowOffline() end

--- Returns the textures that comprise the player's guild tabard. Returns nil if the player is not in a guild.
---@return string tabardBackgroundUpper Path to the texture for the upper portion of the tabard's background
---@return string tabardBackgroundLower Path to the texture for the lower portion of the tabard's background
---@return string tabardEmblemUpper Path to the texture for the upper portion of the tabard's emblem
---@return string tabardEmblemLower Path to the texture for the lower portion of the tabard's emblem
---@return string tabardBorderUpper Path to the texture for the upper portion of the tabard's border
---@return string tabardBorderLower Path to the texture for the lower portion of the tabard's border
function GetGuildTabardFileNames() end

--- Returns the number of entries in the guild event log. Only returns valid data after calling QueryGuildEventLog() and the following GUILD_EVENT_LOG_UPDATE event has fired.
---@return number numEvents Number of entries in the guild event log
function GetNumGuildEvents() end

--- Returns the number of members in the guild roster
---@param includeOffline boolean True to count all members in the guild; false or omitted to count only those members currently online
---@return number numGuildMembers Number of members in the guild roster
function GetNumGuildMembers(includeOffline) end

--- Returns the cost to create a guild tabard. Only returns valid data if the player is interacting with a tabard designer (i.e. between the OPEN_TABARD_FRAME and CLOSE_TABARD_FRAME events).
---@return number cost The cost of creating a guild tabard, in copper
function GetTabardCreationCost() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function GetTabardInfo() end

--- Adds a new rank to the player's guild. The newly added rank becomes the lowest rank in the guild.
---@param name string Name of the new rank
function GuildControlAddRank(name) end

--- Deletes a guild rank
---@param name string Name of the rank to delete
function GuildControlDelRank(name) end

--- Returns the number of ranks in the guild
---@return number numRanks Number of guild ranks (including Guild Leader)
function GuildControlGetNumRanks() end

--- Returns the list of privileges for the guild rank being edited. The name of a privilege for an index in this list can be found in the global variable "GUILDCONTROL_OPTION"..index .
function GuildControlGetRankFlags() end

--- Returns the name of a guild rank
---@param rank number Index of a rank to edit (between 1 and GuildControlGetNumRanks() )
---@return string rankName Name of the guild rank
function GuildControlGetRankName(rank) end

--- Saves changes to the guild rank being edited
---@param name string New name for the guild rank
function GuildControlSaveRank(name) end

--- Chooses a guild rank to edit
---@param rank number Index of a rank to edit (between 1 and GuildControlGetNumRanks() )
function GuildControlSetRank(rank) end

--- Enables or disables a privilege for the guild rank being edited. Changes are not saved until a call is made to GuildControlSaveRank() .
---@param index any Index of a privilege to change ( number ) 1 - Guildchat listen 2 - Guildchat speak 3 - Officerchat listen 4 - Officerchat speak 5 - Promote 6 - Demote 7 - Invite Member 8 - Remove Member 9 - Set MOTD 10 - Edit Public Notes 11 - View Officer Note 12 - Edit Officer Note 13 - Modify Guild Info 15 - Use guild funds for repairs 16 - Withdraw gold from the guild bank 17 - Create Guild Event
---@param enabled boolean True to allow the privilege; false to deny
function GuildControlSetRankFlag(index, enabled) end

--- Reduces a guild member's rank by one. The player can only demote members whose rank is below the player's own, and only if the player has permission to demote (i.e. if CanGuildDemote() returns 1).
---@param name string Name of a guild member to demote
function GuildDemote(name) end

--- Disbands the player's guild. Only has effect if the player is the guild leader
--- Flags: confirmation
function GuildDisband() end

--- Requests guild information from the server. Fires two CHAT_MSG_SYSTEM events, one containing the name of the guild, followed by one containing the date the guild was created and how many players and accounts belong to the guild.
--- Flags: server
function GuildInfo() end

--- Invites a character to join the player's guild
---@param name string Name of a character to invite
function GuildInvite(name) end

--- Leaves the player's current guild
--- Flags: confirmation
function GuildLeave() end

--- Increases a guild member's rank by one. The player can only promote members up to the rank immediately below the player's own, and only if the player has permission to promote (i.e. if CanGuildPromote() returns 1).
---@param name string Name of a guild member to promote
function GuildPromote(name) end

--- Requests guild roster information from the server. Information is not returned immediately; the GUILD_ROSTER_UPDATE event fires when data is available for retrieval via GetGuildRosterInfo() and related functions. Requests are throttled to reduce server load; the server will only respond to a new request approximately 10 seconds after a previous request.
--- Flags: server
function GuildRoster() end

--- Sets the officer note for a guild member
---@param index number Index of a member in the guild roster (between 1 and GetNumGuildMembers() ), or 0 for no selection
---@param note string Note text to set for the guild member (up to 31 characters)
function GuildRosterSetOfficerNote(index, note) end

--- Sets the public note for a guild member
---@param index number Index of a member in the guild roster (between 1 and GetNumGuildMembers() ), or 0 for no selection
---@param note string Note text to set for the guild member (up to 31 characters)
function GuildRosterSetPublicNote(index, note) end

--- Promotes a member to guild leader. Only works if the player is the guild leader and the named character is in the guild and currently online.
---@param name string Name of a guild member to promote to leader
function GuildSetLeader(name) end

--- Sets the guild Message of the Day. Guild members see the message of the day upon login and whenever it is changed (and cannot disable its display in the default UI), so keeping the message concise is recommended.
---@param message string New text for the message of the day (up to 128 characters; embedded newlines allowed)
function GuildSetMOTD(message) end

--- Removes a character from the player's guild
---@param name string Name of a guild member to remove
function GuildUninvite(name) end

--- Returns whether or player is leader of his or her guild
---@return any isLeader 1 if the player is a guild leader; otherwise nil
function IsGuildLeader() end

--- Returns whether the player is in a guild
---@return any inGuild 1 if the player is in a guild; otherwise nil
function IsInGuild() end

--- Requests guild event log information from the server. Fires the GUILD_EVENT_LOG_UPDATE event when event log information becomes available.
--- Flags: server
function QueryGuildEventLog() end

--- Sets the guild information text.. This text appears when clicking the "Guild Information" button in the default UI's Guild window.
---@param text string New guild information text
function SetGuildInfoText(text) end

--- Selects a member in the guild roster. Selection in the guild roster is used only for display in the default UI and has no effect on other Guild APIs.
---@param index number Index of a member in the guild roster (between 1 and GetNumGuildMembers() ), or 0 for no selection
function SetGuildRosterSelection(index) end

--- Enables or disables inclusion of offline members in the guild roster listing
---@param showOffline boolean True to include offline members in the guild roster listing; false to list only those members currently online
function SetGuildRosterShowOffline(showOffline) end

--- Sorts the guild roster. Sorting repeatedly by the same criterion will reverse the sort order. Previous sorts are reused when a new criterion is applied: to sort by two criteria, sort first by the secondary criterion and then by the primary criterion.
---@param type any Criterion by which to sort the roster ( string ) class - Sort by class name level - Sort by character level name - Sort by name note - Sort by guild note online - Sory by last online time rank - Sort by guild rank zone - Sort by current zone name
function SortGuildRoster(type) end

--- Turns in a completed guild charter. Usable if the player is interacting with a guild registrar (i.e. between the GUILD_REGISTRAR_SHOW and GUILD_REGISTRAR_CLOSED events).
function TurnInGuildCharter() end

--- Returns whether or not a given unit or player is in the player's guild
---@param unit any The unitId to query
---@param name string The name of the player to query
---@return any inGuild 1 if the unit is in the player's guild, otherwise nil
function UnitIsInMyGuild(unit, name) end
