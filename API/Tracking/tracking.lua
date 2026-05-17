--==============================
-- Tracking functions
--==============================

--- Returns the number of available minimap object/unit tracking abilities
---@return number count Number of available tracking types
function GetNumTrackingTypes() end

--- Returns information about a given tracking option
---@param index number Index of a tracking ability to query (between 1 and GetNumTrackingTypes() )
---@return string name Localized name of the tracking ability
---@return string texture Path to an icon texture for the tracking ability
---@return any active 1 if the tracking abilty is active; otherwise nil
---@return any category Category of the tracking ability; used in the default UI to determine whether to strip the border from the ability's icon texture, and also indicates when the ability can be used: ( string ) other - Ability is available to all players and can be used at any time spell - Ability is a spell from the player's spellbook; using it may be subject to spell casting restrictions
function GetTrackingInfo(index) end

--- Returns the texture of the active tracking ability
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetTrackingTexture
function GetTrackingTexture() end

--- Enables a given minimap object/unit tracking ability
---@param index number Index of a tracking ability (between 1 and GetNumTrackingTypes() )
---@param enabled boolean pass true to enable, false to disable
function SetTracking(index, enabled) end
