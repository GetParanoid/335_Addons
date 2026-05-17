--==============================
-- Inspect functions
--==============================

--- Returns whether a unit can be inspected. Returns nil if the unit is out of inspect range, if the unit is an NPC, or if the unit is flagged for PvP combat and hostile to the player.
---@param unit string A unit to inspect
---@param showError boolean True to fire a UI_ERROR_MESSAGE event (causing the default UI to display an error message) if the unit cannot be inspected; otherwise false
---@return any canInspect 1 if the unit can be inspected; otherwise nil
function CanInspect(unit, showError) end

--- Ends inspection of another character. After this function is called, data about the inspected unit may not be available or valid.
function ClearInspectPlayer() end

--- Returns arena team information about the currently inspected unit. Only available if data has been downloaded from the server; see HasInspectHonorData() and RequestInspectHonorData() .
---@param team number Index of one of the unit's arena teams
---@return string teamName Name of the arena team
---@return number teamSize Size of the team (2 for 2v2, 3 for 3v3, or 5 for 5v5)
---@return number teamRating The team's current rating
---@return number teamPlayed Number of games played by the team in the current week
---@return number teamWins Number of games won by the team in the current week
---@return number playerPlayed Number of games in which the unit has participated in the current week
---@return number playerRating The unit's personal rating with this team
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
function GetInspectArenaTeamData(team) end

--- Returns PvP honor information about the currently inspected unit. Only available if data has been downloaded from the server; see HasInspectHonorData() and RequestInspectHonorData() .
---@return number todayHK Number of honorable kills on the current day
---@return number todayHonor Amount of honor points earned on the current day
---@return number yesterdayHK Number of honorable kills on the previous day
---@return number yesterdayHonor Amount of honor points earned on the previous day
---@return number lifetimeHK Lifetime total of honorable kills scored
---@return number lifetimeRank Highest rank earned in the pre-2.0 PvP reward system; see GetPVPRankInfo() for rank display information
function GetInspectHonorData() end

--- Returns whether PvP honor and arena data for the currently inspected unit has been downloaded from the server. See RequestInspectHonorData() to request PvP data from the server.
---@return any hasData 1 if the client has PvP data for the currently inspected player; otherwise nil
function HasInspectHonorData() end

--- Marks a unit for inspection and requests talent data from the server. Information about the inspected item's equipment can be retrieved immediately using Inventory APIs (e.g. GetInventoryItemLink("target",1) ). Talent data is not available immediately; the INSPECT_TALENT_READY event fires once the inspected unit's talent information can be retrieved using Talent APIs (e.g. GetTalentInfo(1,1,true) ).
--- Flags: server
---@param unit string A unit to inspect
function NotifyInspect(unit) end

--- Requests PvP honor and arena data from the server for the currently inspected unit. Once the INSPECT_HONOR_UPDATE event fires, PvP honor and arena information can be retrieved using GetInspectHonorData(team) and GetInspectArenaTeamData() .
--- Flags: server
function RequestInspectHonorData() end
