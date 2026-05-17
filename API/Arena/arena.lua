--==============================
-- Arena functions
--==============================

--- Accepts an invitation to join an arena team
function AcceptArenaTeam() end

--- Disbands an arena team. Only has effect if the player is captain of the given team.
---@param team number Index of one of the player's arena teams
function ArenaTeamDisband(team) end

--- Invites a character to one of the player's arena teams
---@param team number Index of one of the player's arena teams
---@param name string Name of a character to invite
function ArenaTeamInviteByName(team, name) end

--- Leaves an arena team
--- Flags: confirmation
---@param team number Index of one of the player's arena teams
function ArenaTeamLeave(team) end

--- Requests arena team roster information from the server. Does not return information directly: the ARENA_TEAM_ROSTER_UPDATE event fires when information from the server becomes available, which can then be retrieved using GetNumArenaTeamMembers() and GetArenaTeamRosterInfo() .
--- Flags: server
---@param team number Index of one of the player's arena teams
function ArenaTeamRoster(team) end

--- Promotes an arena team member to team captain. Only has effect if the player is captain of the given team.
--- Flags: confirmation
---@param team number Index of one of the player's arena teams
---@param name string Name of a team member to promote
function ArenaTeamSetLeaderByName(team, name) end

--- Removes a member from an arena team
--- Flags: confirmation
---@param team number Index of one of the player's arena teams
---@param name string Name of a team member to remove
function ArenaTeamUninviteByName(team, name) end

--- Converts an arena team size to the appropriate numeric arena team identifier
---@param teamSize number The size of the arena team (i.e. 2 for 2v2, 3 for 3v3, etc.)
---@return number teamID The numeric identifier for the arena team of the given size
function ArenaTeam_GetTeamSizeID(teamSize) end

--- Ends interaction with the Arena Team Roster. Called in the default UI when closing the Arena Team Roster frame. After this function is called, roster information functions may no longer return valid data.
function CloseArenaTeamRoster() end

--- Declines an arena team invitation
function DeclineArenaTeam() end

--- Returns the player's amount of arena points
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetArenaCurrency
function GetArenaCurrency() end

--- Returns information about one of the player's arena teams
---@param team number Index of one of the player's arena teams
---@return string teamName Name of the arena team
---@return number teamSize Size of the team (2 for 2v2, 3 for 3v3, or 5 for 5v5)
---@return number teamRating The team's current rating
---@return number teamPlayed Number of games played by the team in the current week
---@return number teamWins Number of games won by the team in the current week
---@return number seasonTeamPlayed Number of games played by the team in the current arena season
---@return number seasonTeamWins Number of games won by the team in the current arena season
---@return number playerPlayed Number of games in which the player has participated in the current week
---@return number seasonPlayerPlayed Number of games in which the player has participated in the current arena season
---@return number teamRank The team's current rank among same-size teams in its battlegroup
---@return number playerRating The player's personal rating with this team
---@return number bg_red Red component of the color value for the team banner's background
---@return number bg_green Green component of the color value for the team banner's background
---@return number bg_blue Blue component of the color value for the team banner's background
---@return number emblem Index of the team's emblem graphic; full path to the emblem texture can be found using the format "Interface\PVPFrame\Icons\PVP-Banner-Emblem-"..emblem
---@return number emblem_red Red component of the color value for the team banner's emblem
---@return number emblem_green Green component of the color value for the team banner's emblem
---@return number emblem_blue Blue component of the color value for the team banner's emblem
---@return number border Index of the team's border graphic; full path to the border texture can be found by using the format "Interface\PVPFrame\PVP-Banner-"..teamSize.."-Border-"..border
---@return number border_red Red component of the color value for the team banner's border
---@return number border_green Green component of the color value for the team banner's border
---@return number border_blue Blue component of the color value for the team banner's border
function GetArenaTeam(team) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GetArenaTeamGdfInfo() end

--- Returns information about an arena team member
---@param team number Index of one of the player's arena teams
---@param index number Index of a team member (between 1 and GetNumArenaTeamMembers(team) )
---@return string name Name of the team member
---@return any rank Rank of the member in the team ( number ) 0 - Team captain 1 - Member
---@return number level Character level of the team member
---@return string class Localized name of the team member's class
---@return any online 1 if the team member is currently online; otherwise nil
---@return number played Number of games played by the team member in the current week
---@return number win Number of winning games played by the team member in the current week
---@return number seasonPlayed Number of games played by the team member in the current arena season
---@return number seasonWin Number of winning games played by the team member in the current arena season
---@return number rating The team member's personal rating with this team
function GetArenaTeamRosterInfo(team, index) end

--- Returns the currently selected member in an arena team roster. Selection in the arena team roster currently has no effect beyond highlighting list entry in the default UI.
---@param team number Index of one of the player's arena teams
---@return number index Index of the selected member in the roster listing
function GetArenaTeamRosterSelection(team) end

--- Returns whether arena team roster listings should include offline members. The "Show Offline" filter is not used in the default UI; if disabled, offline members are still shown.
--- Flags: deprecated
---@return any showOffline 1 if the show offline filter for arena teams is enabled, otherwise nil
function GetArenaTeamRosterShowOffline() end

--- Returns a number identifying the current arena season. New arena seasons begin every few months, resetting team rankings and providing new rewards.
---@return number season Number identifying the current arena season
function GetCurrentArenaSeason() end

--- Returns the maximum amount of arena points the player can accrue
---@return number amount The maximum amount of arena points the player can accrue
function GetMaxArenaCurrency() end

--- Returns the number of enemy players in an arena match
---@return number numOpponents Number of enemy players in an arena match
function GetNumArenaOpponents() end

--- Returns the number of members in an arena team
---@param teamindex number The index of the arena team, based on the order they are displayed in the PvP tab.
---@param showOffline boolean True to include currently offline members in the count; otherwise false
---@return number numMembers Number of characters on the team
function GetNumArenaTeamMembers(teamindex, showOffline) end

--- Returns a number identifying the previous arena season. New arena seasons begin every few months, resetting team rankings and providing new rewards.
---@return number season Number identifying the previous arena season
function GetPreviousArenaSeason() end

--- Returns whether the player is currently in an arena match
---@return any isArena 1 if player is in an Arena match; otherwise nil
---@return any isRegistered 1 if the current arena match is a ranked match; otherwise nil
function IsActiveBattlefieldArena() end

--- Returns whether the player is the captain of an arena team. Also returns 1 if the player is not on a team of the given arenaTeamID .
---@param team number Index of one of the player's arena teams
---@return any isCaptain 1 if the player is the captain of the given team; otherwise nil.
function IsArenaTeamCaptain(team) end

--- Returns whether the player is interacting with an entity that allows queueing for arena matches
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/IsBattlefieldArena
function IsBattlefieldArena() end

--- Returns whether the player is on an arena team
---@return boolean isInTeam True if the player is on any arena teams; false otherwise
function IsInArenaTeam() end

--- Selects a member in an arena team roster. Selection in the arena team roster currently has no effect beyond highlighting list entry in the default UI.
---@param team number Index of one of the player's arena teams
---@param index number Index of a team member to select (between 1 and GetNumArenaTeamMembers(team) )
function SetArenaTeamRosterSelection(team, index) end

--- Enables or disables the inclusion of offline members in arena team roster listings. The "Show Offline" filter is not used in the default UI; if disabled, offline members are still shown.
--- Flags: deprecated
---@param enable boolean True to enable display of offline members; false to disable
function SetArenaTeamRosterShowOffline(enable) end

--- Sorts the selected arena team's roster. Affects the ordering of member information returned by GetArenaTeamRosterInfo . Sorting by the same criterion repeatedly reverses the sort order.
---@param sortType any Criterion for sorting the roster ( string ) class - Sort by class name - Sort by name played - Sort by number of games played in the current week rating - Sort by personal rating seasonplayed - Sort by number of games played in the current arena season seasonwon - Sort by number of games won in the current arena season won - Sort by number of games won in the current week
function SortArenaTeamRoster(sortType) end

--- Turns in a petition creating an arena team
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/TurnInArenaPetition
function TurnInArenaPetition() end
