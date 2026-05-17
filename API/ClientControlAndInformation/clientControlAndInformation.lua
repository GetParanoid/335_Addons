--==============================
-- Client control and information functions
--==============================

--- Cancels a pending logout or quit. Only has effect if logout or quit is pending (following the PLAYER_CAMPING or PLAYER_QUITING event).
--- Flags: protected
function CancelLogout() end

--- Restores game settings from a backup stored on the server. This function only works if server-synchronized settings are enabled.  This is controlled by the synchronizeSettings CVar.
function DownloadSettings() end

--- Forces the client to logout. Not usable in the current WoW client; causes an error message to be displayed.
--- Flags: internal
function ForceLogout() end

--- Immediately exits World of Warcraft. Unlike Quit() , this function exits the game application regardless of current conditions.
function ForceQuit() end

--- Returns the most recent of WoW's retail expansion packs for which the player's account is authorized.
---@return any expansionLevel Expansion level of the player's account ( number ) 0 - World of Warcraft ("Classic") 1 - World of Warcraft: The Burning Crusade 2 - World of Warcraft: Wrath of the Lich King 3 - World of Warcraft: Cataclysm
function GetAccountExpansionLevel() end

--- Returns the version information about the client
---@return string version Display version number of the client (e.g. "3.1.1" )
---@return string internalVersion Internal version number of the client (e.g. "9835" )
---@return string date Date on which the client executable was built (e.g. "Apr 24 2009" ); not necessarily the date it was released to the public
---@return number uiVersion Version compatibility number for UI purposes (e.g. 30100 ); generally, installed addons should have this number in the Interface header of their TOC files to avoid being marked as Out of Date and possibly not loaded
function GetBuildInfo() end

--- Returns a list of installed localization packs for the WoW client
function GetExistingLocales() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetExpansionLevel() end

--- Returns the current realm (server) time
---@return number hour Hour portion of the time (on a 24-hour clock)
---@return number minute Minute portion of the time
function GetGameTime() end

--- Returns a code indicating the localization currently in use by the client
---@return any locale A four character locale code indicating the localization currently in use by the client ( string ) deDE - German enGB - British English enUS - American English esES - Spanish (European) esMX - Spanish (Latin American) frFR - French koKR - Korean ruRU - Russian zhCN - Chinese (simplified; mainland China) zhTW - Chinese
function GetLocale() end

--- Returns information about current network connection performance
---@return number bandwidthIn Current incomming bandwidth (download) usage, measured in KB/s
---@return number bandwidthOut Current outgoing bandwidth (upload) usage, measured in KB/s
---@return number latencyHome Average roundtrip latency to the home realm server (only updated every 30 seconds)
---@return number latencyWorld Average roundtrip latency to the current world server (only updated every 30 seconds)
function GetNetStats() end

--- Returns whether the player is using the Linux game client. Does not indicate whether the player is running a Windows clint on Linux with virtualization software. Blizzard has not released an official WoW client for Linux, but this function is included just in case that situation changes.
---@return any isLinux 1 if running the Linux client; otherwise nil
function IsLinuxClient() end

--- Returns whether the player is using the Mac OS X game client
---@return any isMac 1 if running the Mac OS X client; otherwise nil
function IsMacClient() end

--- Returns whether the player is using the Windows game client
---@return any isWindows 1 if running the Windows client; otherwise nil
function IsWindowsClient() end

--- Attempts to log out and return to the character selection screen. Results vary based on current conditions:
function Logout() end

--- Causes the default UI to display an error message indicating that actions are disallowed while the player is dead. Fires a UI_ERROR_MESSAGE event containing a localized message identified by the global variable ERR_PLAYER_DEAD .
function NotWhileDeadError() end

--- Attempts to exit the World of Warcraft client. Results vary based on current conditions:
function Quit() end

--- Reloads the user interface. Saved variables are written to disk, the default UI is reloaded, and all enabled non-LoadOnDemand addons are loaded, including any addons previously disabled which were enabled during the session (see EnableAddOn() et al).
function ReloadUI() end

--- Saves an image of the current game display. Screenshot images are saved to the folder Screenshots within the folder where the World of Warcraft client is installed.
function Screenshot() end

--- Sets the decimal separator for displayed numbers. Affects the style not only of numbers displayed in the UI, but any string coercion of numbers with tostring() as well.
---@param enable boolean True to use comma (",") as the decimal separator; false to use period (".") as the decimal separator
function SetEuropeanNumbers(enable) end

--- Enables or disables display of UI elements in the 3-D world. Applies only to 2-D UI elements displayed in the 3-D world: nameplates and raid target icons (skull, circle, square, etc). Does not directly control nameplates and target icons -- only affects whether they are displayed (see the nameplateShowEnemies / nameplateShowFriends CVars and SetRaidTarget functions for direct control).
---@param visible boolean True to enable display of UI elements in the 3-D world; false to disable
function SetUIVisibility(visible) end

--- Stores a backup of game settings on the server.
function UploadSettings() end
