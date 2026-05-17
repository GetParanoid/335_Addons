--==============================
-- Zone information functions
--==============================

--- Returns the name of the current area (as displayed in the Minimap). Matches GetSubZoneText() , GetRealZoneText() or GetZoneText() .
---@return string zoneText Name of the area containing the player's current location
function GetMinimapZoneText() end

--- Returns the "official" name of the zone or instance in which the player is located. This name matches that seen in the Who, Guild, and Friends UIs when reporting character locations. It may differ from those the default UI displays in other locations ( GetZoneText() and GetMinimapZoneText() ), especially if the player is in an instance: e.g. this function returns "The Stockade" when the others return "Stormwind Stockade".
---@return string zoneName Name of the zone or instance
function GetRealZoneText() end

--- Returns the name of the minor area in which the player is located. Subzones are named regions within a larger zone or instance: e.g. the Valley of Trials in Durotar, the Terrace of Light in Shattrath City, or the Njorn Stair in Utgarde Keep.
---@return string subzoneText Name of the current subzone
function GetSubZoneText() end

--- Returns the name of the zone in which the player is located
---@return string zone Name of the current zone
function GetZoneText() end
