--==============================
-- Addon-related functions
--==============================

--- Marks an addon as disabled. The addon will remain active until the player logs out and back in or reloads the UI (see ReloadUI() ).  Changes to the enabled/disabled state of addons while in-game are saved on a per-character basis.
---@param name string Name of an addon (name of the addon's folder and TOC file, not the Title found in the TOC)
---@param index number Index of an addon in the addon list (between 1 and GetNumAddOns() )
function DisableAddOn(name, index) end

--- Marks all addons as disabled. Addons will remain active until the player logs out and back in or reloads the UI (see ReloadUI() ).
function DisableAllAddOns() end

--- Marks an addon as enabled. The addon will remain inactive until the player logs out and back in or reloads the UI (see ReloadUI() ).
---@param index number The index of the addon to be enabled
---@param name string The name of the addon to be enabled
function EnableAddOn(index, name) end

--- Marks all addons as enabled. Addons will remain inactive until the player logs out and back in or reloads the UI (see ReloadUI() ).
function EnableAllAddOns() end

--- Returns a list of addons a given addon is dependent upon
---@param name string Name of an addon (name of the addon's folder and TOC file, not the Title found in the TOC)
---@param index number Index of an addon in the addon list (between 1 and GetNumAddOns() )
function GetAddOnDependencies(name, index) end

--- Returns information about an addon in the client's addon list
---@param index number The index of the AddOn, must be in the range of 1 to GetNumAddOns().
---@param name string The name of the AddOn, as it appears in its folder name.
---@return string name The name of the addon
---@return string title The title of the addon
---@return string notes The value of the "Notes" field from the table of contents
---@return any enabled 1 if the addon is enabled for the current character, otherwise nil
---@return any loadable If the addon is capable of being loaded
---@return string reason If the addon isn't loadable, what is the reason
---@return string security "SECURE" if the addon is secure, otherwise "INSECURE".  A "secure" addon is one that is released by Blizzard and is digitally signed
function GetAddOnInfo(index, name) end

--- Returns the value of certain fields in an addon's TOC file
---@param index number The index of the AddOn, must be in the range of 1 to GetNumAddOns().
---@param name string The name of the AddOn as it appears in its folder name.
---@param variable any The variable name that you want to query, only a limited number of values are accepted. ( string ) Author - The author of the AddOn as outlined in the TOC file Notes - Any notes the author of the AddOn placed into the TOC file Title - The title of the AddOn, this defaults to the name of the AddOn as it appears in its folder name Version - The version string that the author placed in the TOC file X- - These are the only custom tags that can be queried, can be anything you want.
---@return string data The data available in the TOC for the variable queried, or nil if the variable is not queryable or not defined.
function GetAddOnMetadata(index, name, variable) end

--- Returns the number of addons in the addon listing
---@return number numAddons The number of addons in the addon listing
function GetNumAddOns() end

--- Opens the Interface Options window and displays a given panel within it
--- Flags: blizzardui
---@param panelName string The registered name of an options panel
---@param panel table A Frame object already registered as an options panel
function InterfaceOptionsFrame_OpenToCategory(panelName, panel) end

--- Registers a panel to be displayed in the Interface Options window. The following members and methods are used by the Interface Options frame to display and organize panels:
--- Flags: blizzardui
---@param panel table A Frame object
function InterfaceOptions_AddCategory(panel) end

--- Returns whether an addon can be loaded without restarting the UI
---@param name string Name of an addon (name of the addon's folder and TOC file, not the Title found in the TOC)
---@param index number Index of an addon in the addon list (between 1 and GetNumAddOns() )
---@return any isLod 1 if the addon is LoadOnDemand-capable; otherwise nil
function IsAddOnLoadOnDemand(name, index) end

--- Returns whether an addon is currently loaded
---@param name string Name of an addon (name of the addon's folder and TOC file, not the Title found in the TOC)
---@param index number Index of an addon in the addon list (between 1 and GetNumAddOns() )
---@return any loaded 1 if the addon is loaded; otherwise nil
function IsAddOnLoaded(name, index) end

--- Loads a LoadOnDemand-capable addon. If the given addon has dependencies which are also LoadOnDemand-capable, those addons will be loaded as well. This function will not load disabled addons.
---@param name string Name of an addon (name of the addon's folder and TOC file, not the Title found in the TOC)
---@param index number Index of an addon in the addon list (between 1 and GetNumAddOns() )
---@return number loaded 1 if loading the addon was successful; otherwise nil
---@return any reason If the addon could not be loaded, an unlocalized string token indicating the reason for failure. Localized strings for display can be found by prepending "ADDON_" ; e.g. ADDON_DEP_MISSING == "Dependency missing" . ( string ) BANNED - Banned CORRUPT - Corrupt DEP_BANNED - Dependency banned DEP_CORRUPT - Dependency corrupt DEP_DISABLED - Dependency disabled DEP_INCOMPATIBLE - Dependency incompatible DEP_INSECURE - Dependency insecure DEP_INTERFACE_VERSION - Dependcy out of date DEP_MISSING - Dependency missing DEP_NOT_DEMAND_LOADED - Dependency not loadable on demand DISABLED - Disabled INCOMPATIBLE - Incompatible INSECURE - Insecure INTERFACE_VERSION - Out of Date MISSING - Missing NOT_DEMAND_LOADED - Not loadable on demand
function LoadAddOn(name, index) end

--- Reverts changes to the enabled/disabled state of addons. Any addons enabled or disabled in the current session will return to their enabled/disabled state as of the last login or UI reload.
function ResetDisabledAddOns() end

--- Sends a chat-like message receivable by other addons. Allows for client-to-client addon communication.
---@param prefix string An arbitrary label for the message. Allows receiving addons to filter incoming messages: for example, if an addon uses the same prefix for all messages it sends, an addon interested in only those messages can check for that prefix before handling the message content. Cannot contain the tab character ( \t ).
---@param message string A message to send; combined length of prefix and message is limited to 254 characters
---@param type any Scope in which to broadcast the message: ( string ) BATTLEGROUND - To all allied players in the current battleground instance GUILD - To all members of the player's guild PARTY - To all members of the player's party (used by default if no type is given) RAID - To all members of the player's raid group (automatically reverts to sending to party if the player is not in a raid group) WHISPER - To a specific player
---@param target string If type is "WHISPER" , the name of the target player (in cross-realm battlegrounds, the format "Name-Realm" can be used to target a player from another realm; e.g. "Thott-Cenarius")
function SendAddonMessage(prefix, message, type, target) end
