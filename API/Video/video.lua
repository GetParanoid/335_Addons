--==============================
-- Video functions
--==============================

--- Returns the level of texture resolution rendered by the client deprecated
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetBaseMip
function GetBaseMip() end

--- Returns the index of the currently selected multi-sample format
---@return number index The index of the currently selected multi-sample format.
function GetCurrentMultisampleFormat() end

--- Returns the index of the current resolution setting. For the dimensions of a resolution setting, use GetScreenResolutions() .
---@return number index Index of the current resolution setting
function GetCurrentResolution() end

--- Returns the maximum distance at which terrain is drawn. Corresponds to the "View Distance" slider in the default UI's Video Options pane, which allows settings between 177 and 1277 yards.
--- Flags: deprecated
---@return number distance Maximum distance at which terrain is drawn (in yards)
function GetFarclip() end

--- Returns the current display gamma setting. Gamma value determines the contrast between lighter and darker portions of the game display; for a detailed explanation see the Wikipedia entry on Gamma correction entry .
---@return number gamma Current gamma setting
function GetGamma() end

--- Returns a list of available multisample settings. Used in the default UI to provide descriptions of multisample settings (e.g. "24-bit color 24-bit depth 6x multisample").
---@return number color Color depth (in bits)
---@return number depth Video depth (in bits)
---@return number multisample Number of samples per pixel
function GetMultisampleFormats() end

--- Returns a list of available screen refresh rates. The current refresh rate can be found in the gxRefresh CVar.
function GetRefreshRates() end

--- Returns the height of the screen for UI layout purposes. Measurements for layout are affected by the UI Scale setting (i.e. the uiscale CVar) and may not match actual screen pixels.
---@return number height Height of the screen in layout pixels
function GetScreenHeight() end

--- Returns a list of available screen resolutions
function GetScreenResolutions() end

--- Returns the width of the screen for UI layout purposes. Measurements for layout are affected by the UI Scale setting (i.e. the uiscale CVar) and may not match actual screen pixels.
---@return number screenWidth Width of the screen in layout pixels
function GetScreenWidth() end

--- Returns the level of terrain detail displayed. Corresponds to the "Terrain Blending" slider in the default UI's Video Options pane.
---@return any terrainDetail Level of terrain detail displayed ( number ) 0 - Low detail 1 - High detail
function GetTerrainMip() end

--- Returns information about graphics capabilities of the current system
---@return number hasAnisotropic 1 if anisotropic filtering is available; otherwise 0
---@return number hasPixelShaders 1 if pixel shaders are available; otherwise 0
---@return number hasVertexShaders 1 if vertex shaders are available; otherwise 0
---@return number hasTrilinear 1 if trilinear filtering is available; otherwise 0
---@return number hasTripleBufering 1 if triple buffering is available; otherwise 0
---@return number maxAnisotropy Number of available settings for anisotropic filtering (corresponds to the "Texture Filtering" slider in the default UI)
---@return number hasHardwareCursor 1 if hardware cursor support is available; otherwise 0
function GetVideoCaps() end

--- Returns the current value of the water detail option deprecated
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetWaterDetail
function GetWaterDetail() end

--- Returns whether the current hardware supports desaturated textures
---@return any isSupported 1 if texture desaturation is supported; otherwise nil
function IsDesaturateSupported() end

--- Returns whether the current hardware supports high resolution player textures
---@return any isAvailable 1 if high-resolution player textures can be enabled; otherwise nil
function IsPlayerResolutionAvailable() end

--- Returns whether the current system supports stereoscopic 3D display
---@return any isAvailable 1 if video options for stereoscopic 3D display should be shown; otherwise nil
function IsStereoVideoAvailable() end

--- Restart the client's graphic subsystem. Does not reload the UI.
function RestartGx() end

--- Resets video effects options to default values
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/RestoreVideoEffectsDefaults
function RestoreVideoEffectsDefaults() end

--- Resets video resolution options to default values
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/RestoreVideoResolutionDefaults
function RestoreVideoResolutionDefaults() end

--- This function or event no longer exists in version 5.4.2.17688 of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
function RestoreVideoStereoDefaults() end

--- Sets the level of texture resolution rendered by the client deprecated
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/SetBaseMip
function SetBaseMip() end

--- Changes the maximum distance at which terrain is drawn deprecated
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/SetFarclip
function SetFarclip() end

--- Changes the display gamma setting. Gamma value determines the contrast between lighter and darker portions of the game display; for a detailed explanation see the Wikipedia article on Gamma corection .
---@param value number New gamma value
function SetGamma(value) end

--- Changes the multisample setting. The index argument corresponds to the individual settings described by GetMultisampleFormats() (each a set of three values).
---@param index number Index of a multisample setting
function SetMultisampleFormat(index) end

--- Changes the screen resolution
---@param index number Index of a resolution setting (between 1 and select("#", GetScreenResolutions() ) )
function SetScreenResolution(index) end

--- Changes the level of terrain detail displayed
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/SetTerrainMip
function SetTerrainMip() end

--- This is a Blizzard internal function internal
--- Flags: internal
function SetTexLodBias() end

--- Sets the value for the water details display
--- Flags: deprecated
---@param value number The new value for the water detail
function SetWaterDetail(value) end
