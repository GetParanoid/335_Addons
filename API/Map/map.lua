--==============================
-- Map functions
--==============================

--- Processes a hyperlink associated with a map landmark. Possible landmarks include PvP objectives (both in battlegrounds and in world PvP areas), town and city markers on continent maps, and special markers such as those used during the Scourge Invasion world event. Some landmarks (such as those for towns on a zone map) exist but are not visible in the default UI.
---@param mapLinkID number Hyperlink ID associated with a map landmark, as retrieved from GetMapLandmarkInfo()
function ClickLandmark(mapLinkID) end

--- Returns the position of the player's corpse on the world map. Returns 0,0 if the location of the player's corpse is not visible on the current world map.
---@return number corpseX Horizontal position of the player's corpse relative to the zone map (0 = left edge, 1 = right edge)
---@return number corpseY Vertical position of the player's corpse relative to the zone map (0 = top, 1 = bottom)
function GetCorpseMapPosition() end

--- Returns an ID number for the current map zone.
---@return number areaID A number identifying the current map zone
function GetCurrentMapAreaID() end

--- Returns the current world map continent
---@return any continent Index of the world map's current continent (in the list returned by GetMapContinents() , or one of the following values) ( number ) -1 - Cosmic map 0 - Azeroth 1 - Kalimdor 2 - Eastern Kingdoms 3 - Outland 4 - Northrend 5 - The Maelstrom
function GetCurrentMapContinent() end

--- Returns which map image is currently selected on the world map (for zones which use more than one map image). Used in zones with more than one "floor" or area, such as Dalaran and several Wrath of the Lich King dungeons and raids. More than one map image may contain the player's current location; if the world map has not been explicitly set to show a particular area, this returns whichever is the "best" match.
---@return number level Index of the current map image
function GetCurrentMapDungeonLevel() end

--- Returns the current world map zone
---@return number zone Index of a zone within the continent (in the list returned by GetMapZones ( GetCurrentMapContinent() ) ), or 0 for the continent map
function GetCurrentMapZone() end

--- Returns the location of the graveyard where the player's spirit will appear upon release. Returns 0,0 if the player is not dead or the graveyard's location is not visible on the current world map.
---@return number graveyardX Horizontal position of the graveyard relative to the zone map (0 = left edge, 1 = right edge)
---@return number graveyardY Vertical position of the graveyard relative to the zone map (0 = top, 1 = bottom)
function GetDeathReleasePosition() end

--- Returns a list of map continents names
function GetMapContinents() end

--- Returns information about the current world map texture. World map images are broken into several tiles; the full texture paths follow the format "Interface\\WorldMap\\"..mapFileName.."\\"..mapFileName..i , where i is a number between 1 and NUM_WORLDMAP_DETAIL_TILES (or in a zone with multiple area images, "Interface\\WorldMap\\"..mapFileName.."\\"..mapFileName..dungeonLevel.."_"..i , where dungeonLevel is a number between 1 and GetNumDungeonMapLevels() ).
---@return string mapFileName Unique part of the path to the world map textures
---@return number textureHeight Height of the combined map texture tiles
---@return string textureWidth Width of the combined map texture tiles
function GetMapInfo() end

--- Returns information about a map landmark. Possible landmarks include PvP objectives (both in battlegrounds and in world PvP areas), town and city markers on continent maps, and special markers such as those used during the Scourge Invasion world event. Some landmarks (such as those for towns on a zone map) exist but are not visible in the default UI.
---@param index number The index of a map landmark, from 1 to GetNumMapLandmarks()
---@return string name Name of the landmark
---@return string description Secondary text associated with the landmark; often used to denote current status of PvP objectives (e.g. "Alliance Controlled")
---@return number textureIndex The index of the texture to be used for the landmark.  These indices map to segments of the Interface/MinimapPOI/Icons.blp graphic; the function WorldMap_GetPOITextureCoords(), defined in FrameXML/WorldMap.lua, can be used to resolve this index to a set of texture coordinates for displaying that segment.
---@return number x Horizontal position of the landmark relative to the current world map (0 = left edge, 1 = right edge)
---@return number y Vertical position of the landmark relative to the current world map (0 = top, 1 = bottom)
---@return number mapLinkID A hyperlink ID allowing the game engine to take an action when the landmark is clicked (currently unused)
---@return boolean showInBattleMap True if the landmark should be shown in the Battle Map (aka Zone Map) UI; false for landmarks which should only be shown on the World Map
function GetMapLandmarkInfo(index) end

--- Returns information about a world map overlay. Map overlays correspond to areas which are "discovered" when entered by the player, "filling in" the blank areas of the world map.
---@param index number Index of a map overlay (between 1 and GetNumMapOverlays() )
---@return string textureName Path to the overlay texture
---@return number textureWidth Width of the texture (in pixels)
---@return number textureHeight Height of the texture (in pixels)
---@return number offsetX Horizontal position of the overlay's top left corner relative to the zone map (0 = left edge, 1 = right edge)
---@return number offsetY Vertical position of the overlay's top left corner relative to the zone map (0 = top, 1 = bottom)
---@return number mapPointX Unused
---@return number mapPointY Unused
function GetMapOverlayInfo(index) end

--- Returns the map zones for a given continent
---@param continentIndex number Index of a continent (in the list returned by GetMapContinents() )
function GetMapZones(continentIndex) end

--- Returns the number of map images for the world map's current zone. Used in zones with more than one "floor" or area such as Dalaran and several Wrath of the Lich King dungeons and raids.
---@return number numLevels Number of map images
function GetNumDungeonMapLevels() end

--- Returns the number of landmarks on the world map. Possible landmarks include PvP objectives (both in battlegrounds and in world PvP areas), town and city markers on continent maps, and special markers such as those used during the Scourge Invasion world event. Some landmarks (such as those for towns on a zone map) exist but are not visible in the default UI.
---@return number numLandmarks The number of landmarks on the current world map
function GetNumMapLandmarks() end

--- Returns the number of overlays for the current world map zone. Map overlays correspond to areas which are "discovered" when entered by the player, "filling in" the blank areas of the world map.
---@return number numOverlays Number of overlays for the current world map zone
function GetNumMapOverlays() end

--- Returns the player's orientation (heading). Indicates the direction the player model is (normally) facing and in which the player will move if he begins walking forward, not the camera orientation.
---@return number facing Direction the player is facing (in radians, 0 = north, values increasing counterclockwise)
function GetPlayerFacing() end

--- Returns the position of a unit in the player's party or raid on the world map. Returns 0,0 if the unit's location is not visible on the current world map.
---@param unit string A unit in the player's party or raid
---@return number unitX Horizontal position of the unit relative to the zone map (0 = left edge, 1 = right edge)
---@return number unitY Vertical position of the unit relative to the zone map (0 = top, 1 = bottom)
function GetPlayerMapPosition(unit) end

--- Returns the amount of time remaining until the next PvP event in the Wintergrasp zone
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetWintergraspWaitTime
function GetWintergraspWaitTime() end

--- Initializes the frame used to display the character location "ping" on the World Map
--- Flags: internal
function InitWorldMapPing() end

--- Possibly changes the WorldMap based on a mouse click. May change the map zone or zoom based on the click location: e.g. if the world map shows Dragonblight and one clicks in the area labeled "Wintergrasp" on the map, the current map zone changes to show Wintergrasp.
---@param clickX number Horizontal position of the click relative to the current world map (0 = left edge, 1 = right edge)
---@param clickY number Vertical position of the click relative to the current world map (0 = top, 1 = bottom)
function ProcessMapClick(clickX, clickY) end

--- Sets the world map to display a certain map image (for zones that use multiple map images). Used in zones with more than one "floor" or area such as Dalaran and several Wrath of the Lich King dungeons and raids.
---@param level number Index of the map image to show in the world map
function SetDungeonMapLevel(level) end

--- Sets the world map to show the zone in which the player is located
function SetMapToCurrentZone() end

--- Sets the world map to show a specific zone or continent
---@param continentIndex any Index of a continent to display (in the list returned by GetMapContinents() , or one of the following values) ( number ) -1 - Cosmic map 0 - Entire Azeroth map 1 - Kalimdor 2 - Eastern Kingdoms 3 - Outland 4 - Northrend
---@param zoneIndex number Index of a zone within the continent to display (in the list returned by GetMapZones(continentIndex) ), or omitted to show the continent map
function SetMapZoom(continentIndex, zoneIndex) end

--- Returns information about the texture used for highlighting zones in a continent map on mouseover
---@param cursorX number Horizontal position of the mouse cursor relative to the current world map (0 = left edge, 1 = right edge)
---@param cursorY number Vertical position of the unit relative to the current world map (0 = top, 1 = bottom)
---@return string name The name of the zone being highlighted
---@return string fileName Unique part of the path to the highlight texture for the zone; full path follows the format "Interface\\WorldMap\\"..fileName.."\\"..fileName.."Highlight"
---@return number texCoordX Right texCoord value for the highlight texture
---@return number texCoordY Bottom texCoord value for the highlight texture
---@return number textureX Width of the texture as a proportion of the world map's width
---@return number textureY Height of the texture as a proportion of the world map's height
---@return number scrollChildX Horizontal position of the texture's top left corner relative to the current world map (0 = left edge, 1 = right edge)
---@return number scrollChildY Vertical position of the texture's top left corner relative to the current world map (0 = top, 1 = bottom)
function UpdateMapHighlight(cursorX, cursorY) end

--- Sets the world map to show the area containing its current area.
function ZoomOut() end
