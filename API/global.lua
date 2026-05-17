-- GENERATED from archived wowprogramming.com docs (Wayback)
-- Index: https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api_categories



--==============================
-- Achievement functions
--==============================

--- Adds an achievement to the objectives tracker UI
---@param id number The numeric ID of an achievement
function AddTrackedAchievement(id) end

--- Returns whether the Achievements UI should be enabled.
---@return boolean canShow true if the Achievements UI should be enabled, otherwise false
function CanShowAchievementUI() end

--- Disables comparing achievements/statistics with another player
function ClearAchievementComparisonUnit() end

--- Returns the numeric ID of the category to which an achievement belongs
---@param achievementID number The numeric ID of an achievement
---@return number categoryID The numeric ID of the achievement's category
function GetAchievementCategory(achievementID) end

--- Returns information about the comparison unit's achievements. Only accurate once the INSPECT_ACHIEVEMENT_READY event has fired following a call to SetAchievementComparisonUnit() . No longer accurate once ClearAchievementComparisonUnit() is called.
---@param id number The numeric ID of an achievement
---@return boolean completed True if the comparison unit has completed the achievement; otherwise nil
---@return number month Month in which the comparison unit completed the achievement
---@return number day Day of the month on which the comparison unit completed the achievement
---@return number year Year in which the comparison unit completed the achievement. (Two digit year, assumed to be 21st century.)
function GetAchievementComparisonInfo(id) end

--- Gets information about criteria for an achievement or data for a statistic
---@param achievementID number The numeric ID of an achievement
---@param index number Index of one of the achievement's criteria (between 1 and GetAchievementNumCriteria())
---@param statisticID number The numeric ID of a statistic
---@return string description Description of the criterion (as displayed in the UI for achievements with multiple criteria) or statistic
---@return number type Type of criterion: a value of 8 indicates the criterion is another achievement; other values are not used in the default UI
---@return boolean completed True if the player has completed the criterion; otherwise false
---@return number quantity If applicable, number of steps taken towards completing the criterion (e.g. for the only criterion of "Did Somebody Order a Knuckle Sandwich?", the player's current Unarmed skill; for the first criterion of "Pest Control", 1 if the player has killed an Adder, 0 otherwise
---@return number requiredQuantity If applicable, number of steps required to complete the criterion (e.g. 400 for the only criterion of "Did Somebody Order a Knuckle Sandwich?"; 1 for any criterion of "Pest Control"
---@return string characterName Character name with which the criterion was completed. Currently always the player character's name for completed criteria
---@return any flags Test against the following masks with bit.band() to reveal additional information: ( bitfield ) 0x00000001 - Criterion should be displayed as a progress bar 0x00000002 - Criterion should be hidden in normal achievement displays
---@return number assetID Internal ID number of the quest to complete, NPC to kill, item to acquire, world object to interact with, achievement to earn, or other game entity related to completing the criterion. (Note: some but not all of these ID types are usable elsewhere in the WoW API)
---@return string quantityString Text to be shown when displaying quantity and requiredQuantity in a UI element. (Not always the same as format("%d / %d", quantity, requiredQuantity) ; e.g. "Got My Mind On My Money" shows monetary amounts with embedded textures for gold, silver, and copper)
---@return number criteriaID Unique ID number identifying the criterion; usable with GetAchievementInfoFromCriteria()
function GetAchievementCriteriaInfo(achievementID, index, statisticID) end

--- Gets information about an achievement or statistic
---@param category number Numeric ID of an achievement category
---@param index number Index of an achievement within a category (between 1 and GetCategoryNumAchievements())
---@param id number The numeric ID of an achievement or statistic
---@return number id The numeric ID of the achievement or statistic
---@return string name Name of the achievement or statistic
---@return number points Amount of achievement points awarded for completing the achievement
---@return boolean completed True if the player has completed the achievement; otherwise false
---@return number month Month in which the player completed the achievement
---@return number day Day of the month on which the player completed the achievement
---@return number year Year in which the player completed the achievement. (Two digit year, assumed to be 21st century.)
---@return string description Description of the achievement
---@return any flags Test against the following masks with bit.band() to reveal additional information: ( bitfield ) 0x00000001 - Info is for a statistic, not an achievement 0x00000002 - Achievement should be hidden in normal displays 0x00000080 - Achievement should display its criteria as a progress bar regardless of per-criterion flags
---@return string icon Path to an icon texture for the achievement
---@return string rewardText Text describing a reward for the achievement, or the empty string if no reward is offered
function GetAchievementInfo(category, index, id) end

--- Gets information about an achievement or statistic given a criterion ID
---@param id number The numeric ID of an achievement or statistic criterion (as can be retrieved from GetAchievementCriteriaInfo())
---@return number id The numeric ID of the achievement or statistic
---@return string name Name of the achievement or statistic
---@return number points Amount of achievement points awarded for completing the achievement
---@return string description Description of the achievement
---@return any flags Test against the following masks with bit.band() to reveal additional information: ( bitfield ) 0x00000001 - Info is for a statistic, not an achievement 0x00000002 - Achievement should be hidden in normal displays 0x00000080 - Achievement should display its criteria as a progress bar regardless of per-criterion flags
---@return string icon Path to an icon texture for the achievement
---@return string rewardText Text describing a reward for the achievement, or the empty string if no reward is offered
function GetAchievementInfoFromCriteria(id) end

--- Returns a hyperlink representing the player's progress on an achievement.
---@param id number The numeric ID of an achievement
---@return string link A hyperlink for the player's achievement
function GetAchievementLink(id) end

--- Returns the number of measured criteria for an achievement.
---@param id number The numeric ID of an achievement
---@return number count Number of criteria for the achievement
function GetAchievementNumCriteria(id) end

--- Returns the number of point rewards for an achievement (currently always 1).
---@param id number The numeric ID of an achievement or statistic
---@return number count Number of point rewards offered for the achievement
function GetAchievementNumRewards(id) end

--- Returns the number of achievement points awarded for earning an achievement.
---@param id number The numeric ID of an achievement or statistic
---@param index number Index of one of the achievement's rewards (between 1 and GetAchievementNumRewards(); currently always 1)
---@return number points Number of achievement points awarded for completing the achievement
function GetAchievementReward(id, index) end

--- Returns information about an achievement/statistic category
---@param id number The numeric ID of an achievement/statistic category
---@return string name Name of the category
---@return number parentID ID of the parent category of which this is a sub-category, or -1 if this is a top-level category
---@return any flags Various additional information about the category; currently unused (0 for all existing categories)
function GetCategoryInfo(id) end

--- Returns a list of all achievement categories
---@return table categories A list of achievement category IDs
function GetCategoryList() end

--- Returns the number of achievements/statistics to display in a category.
---@param id number The numeric ID of an achievement/statistic category
---@return number numItems Number of achievements or statistics to display in the category
---@return number numCompleted Number of completed achievements in the category (or 0 for statistics)
function GetCategoryNumAchievements(id) end

--- Returns the comparison unit's total achievement points earned.
---@return number points Total number of achievement points earned by the comparison unit
function GetComparisonAchievementPoints() end

--- Returns the number of achievements completed by the comparison unit within a category.
---@param id number The numeric ID of an achievement category
---@return number numCompleted Number of achievements completed by the comparison unit in the category
function GetComparisonCategoryNumAchievements(id) end

--- Returns the comparison unit's data for a statistic.
---@param id number The numeric ID of a statistic
---@return string info The comparison unit's data for the statistic, or "--" if none has yet been recorded for it
function GetComparisonStatistic(id) end

--- Returns a list of the player's most recently earned achievements
function GetLatestCompletedAchievements() end

--- Returns a list of the comparison unit's most recently earned achievements
function GetLatestCompletedComparisonAchievements() end

--- Returns a list of the comparison unit's latest updated statistics.
--- Flags: deprecated
function GetLatestUpdatedComparisonStats() end

--- Returns a list of the player's latest updated statistics.
--- Flags: deprecated
function GetLatestUpdatedStats() end

--- Returns the next achievement for an achievement which is part of a series
---@param id number The numeric ID of an achievement
---@return number nextID If the given achievement is part of a series and not the last in its series, the ID of the next achievement in the series; otherwise nil
---@return boolean completed True if the next achievement has been completed; otherwise nil
function GetNextAchievement(id) end

--- Returns the number of achievements earned by the comparison unit.
---@return number total Total number of achievements currently in the game
---@return number completed Number of achievements earned by the comparison unit
function GetNumComparisonCompletedAchievements() end

--- Returns the number of achievements earned by the player.
---@return number total Total number of achievements currently in the game
---@return number completed Number of achievements earned by the player
function GetNumCompletedAchievements() end

--- Returns the number of achievements flagged for display in the objectives tracker UI
---@return number count Number of achievements flagged for tracking
function GetNumTrackedAchievements() end

--- Returns the previous achievement for an achievement which is part of a series
---@param id number The numeric ID of an achievement
---@return number previousID If the given achievement is part of a series and not the first in its series, the ID of the previous achievement in the series; otherwise nil
function GetPreviousAchievement(id) end

--- Returns data for a statistic that can be shown on the statistics tab of the achievements window
---@param id number The numeric ID of a statistic
---@return string info The data for the statistic, or "--" if none has yet been recorded for it
function GetStatistic(id) end

--- Returns a list of all statistic categories
---@return table categories A list of statistic category IDs
function GetStatisticsCategoryList() end

--- Returns the player's total achievement points earned
---@return number points Total number of achievement points earned by the player
function GetTotalAchievementPoints() end

--- Returns numeric IDs of the achievements flagged for display in the objectives tracker UI
function GetTrackedAchievements() end

--- Returns whether an achievement is flagged for display in the objectives tracker UI
---@param id number The numeric ID of an achievement
---@return boolean isTracked True if the achievement is flagged for tracking; otherwise false
function IsTrackedAchievement(id) end

--- Removes an achievement from the objectives tracker UI
---@param id number The numeric ID of an achievement
function RemoveTrackedAchievement(id) end

--- Enables comparing achievements/statistics with another player.
---@param unit any ID of a unit to compare against
---@return any success 1 if the given unit is a valid unit. (Does not indicate whether the unit exists or can be compared against.)
function SetAchievementComparisonUnit(unit) end



--==============================
-- Action functions
--==============================

--- Returns whether an action has a range restriction
---@param slot number An action bar slot
---@return any hasRange 1 if the action has a range restriction; otherwise nil
function ActionHasRange(slot) end

--- Casts a pet action on a specific target
--- Flags: protected
---@param index number Index of a pet action button (between 1 and NUM_PET_ACTION_SLOTS )
---@param unit string A unit to be used as target for the action
function CastPetAction(index, unit) end

--- Returns information about autocast actions. No player actions have allowed automatic casting since the initial public release of World of Warcraft.
--- Flags: deprecated
---@param slot number An action bar slot
---@return any autocastAllowed 1 if automatic casting is allowed for the action; otherwise nil
---@return any autocastEnabled 1 if automatic casting is currently turned on for the action; otherwise nil
function GetActionAutocast(slot) end

--- Returns cooldown information about an action
---@param slot number An action bar slot
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the action is ready
---@return number duration The length of the cooldown, or 0 if the action is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the action is ready.)
function GetActionCooldown(slot) end

--- Returns the number of uses remaining for the given action slot. Applies to spells that require reagents, items that stack, or items with charges; used in the default UI to display the count on action buttons.
---@param slot number An action bar slot
---@return number count Number of times the action can be used
function GetActionCount(slot) end

--- Returns information about an action slot
---@param slot number An action slot
---@return any type Type of action in the slot ( string ) companion - Summons a mount or non-combat pet equipmentset - Equips a set of items item - Uses an item macro - Runs a macro spell - Casts a spell
---@return any id An identifier for the action; varies by type: ( number or string ) companion - The companion's index in the mount or minipet list equipmentset - Name of the equipment set item - The item's itemID macro - The macro's index in the macro list ( macroID ) spell - The spell's index in the player's spellboook
---@return any subType Subtype of the action (or nil if not applicable) ( string ) CRITTER - For companion actions: indicates id is as an index in the non-combat pets list MOUNT - For companion actions: indicates id is an index in the mounts list spell - For spell actions: indicates id is an index in the player's spellbook
---@return string spellID For spell and companion actions, the global ID of the spell (or the summoning "spell" for a companion)
function GetActionInfo(slot) end

--- Returns the text label associated with an action. Currently used only for macros, which in the default UI show their name as a label on an action button.
---@param slot number An action bar slot
---@return string text Label for the action
function GetActionText(slot) end

--- Returns the icon texture for an action. Can be the icon of a spell or item, the icon manually set for a macro, or an icon reflecting the current state of a macro.
---@param slot number An action bar slot
---@return string texture Path to an icon texture for the action in the slot, or nil if the slot is empty
function GetActionTexture(slot) end

--- Returns cooldown information about a given pet action slot
---@param index number Index of a pet action button (between 1 and NUM_PET_ACTION_SLOTS )
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the action is ready
---@return number duration The length of the cooldown, or 0 if the action is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the action is ready.)
function GetPetActionCooldown(index) end

--- Returns information about a pet action
---@param index number Index of a pet action button (between 1 and NUM_PET_ACTION_SLOTS )
---@return string name Localized name of the action, or a token which can be used to get the localized name of a standard action
---@return string subtext Secondary text for the action (generally a spell rank; e.g. "Rank 8")
---@return string texture Path to an icon texture for the action, or a token which can be used to get the texture path of a standard action
---@return any isToken 1 if the returned name and texture are tokens for standard actions, which should be used to look up actual values (e.g. PET_ACTION_ATTACK , PET_ATTACK_TEXTURE ); nil if name and texture can be displayed as-is
---@return any isActive 1 if the action is currently active; otherwise nil. (Indicates which state is chosen for the follow/stay and aggressive/defensive/passive switches.)
---@return any autoCastAllowed 1 if automatic casting is allowed for the action; otherwise nil
---@return any autoCastEnabled 1 if automatic casting is currently turned on for the action; otherwise nil
function GetPetActionInfo(index) end

--- Returns whether a pet action can be used. Used in the default UI to show pet actions as grayed out when the pet cannot be commanded to perform them (e.g. when the player or pet is stunned).
---@param index number Index of a pet action button (between 1 and NUM_PET_ACTION_SLOTS )
---@return any usable 1 if the pet action is currently available; otherwise nil
function GetPetActionSlotUsable(index) end

--- Returns whether the pet's actions are usable. Note: GetPetActionSlotUsable can return nil for individual actions even if GetPetActionsUsable returns 1 (though not the other way around).
---@return any petActionsUsable 1 if the pet's actions are usable; otherwise nil
function GetPetActionsUsable() end

--- Returns whether an action slot contains an action
---@param slot number An action bar slot
---@return any hasAction 1 if the slot contains an action; otherwise nil
function HasAction(slot) end

--- Returns whether the player's target is in range of an action
---@param slot number An action bar slot
---@return number inRange 1 if the player's target is in range for the action or 0 if out of range; nil if the action cannot be used on the player's target regardless of range
function IsActionInRange(slot) end

--- Returns whether an action is the standard melee Attack action. Used in the default UI to flash the action button while auto-attack is active. Does not apply to other repeating actions such as Auto Shot (for hunters) and Shoot (for wand users); for those, see IsAutoRepeatAction .
---@param slot number An action bar slot
---@return any isAttack 1 if the action enables/disables melee auto-attack; otherwise nil
function IsAttackAction(slot) end

--- Returns whether an action is an automatically repeating action. Used in the default UI to flash the action button while the action is repeating. Applies to  actions such as Auto Shot (for hunters) and Shoot (for wand and other ranged weapon users) but not to the standard melee Attack action; for it, see IsAttackAction .
---@param slot number An action bar slot
---@return any isRepeating 1 if the action is an auto-repeat action; otherwise nil
function IsAutoRepeatAction(slot) end

--- Returns whether using an action consumes an item. Applies both to consumable items (such as food and potions) and to spells which use a reagent (e.g. Prayer of Fortitude, Divine Intervention, Water Walking, Portal: Dalaran).
---@param slot number An action bar slot
---@return any isConsumable 1 if using the action consumes an item; otherwise nil
function IsConsumableAction(slot) end

--- Returns whether an action is currently being used
---@param slot number An action bar slot
---@return any isCurrent 1 if the action is currently being cast, is waiting for the user to choose a target, is a repeating action which is currently repeating, or is the open trade skill; otherwise nil
function IsCurrentAction(slot) end

--- Returns whether an action contains an equipped item. Applies to actions involving equippable items (not to consumables or other items with "Use:" effects) and indicates the effect of performing the action: if an action's item is not equipped, using the action will equip it; if the item is equipped and has a "Use:" effect, using the action will activate said effect.
---@param slot number An action bar slot
---@return any isEquipped 1 if the action contains an equipped item; otherwise nil
function IsEquippedAction(slot) end

--- Returns whether an action uses stackable items. Applies to consumable items such as potions, wizard oils, food and drink; not used for spells which consume reagents (for those, see IsConsumableAction ).
---@param slot number An action bar slot
---@return any isStackable 1 if the action uses stackable items; otherwise nil
function IsStackableAction(slot) end

--- Returns whether an action is usable
---@param slot number An action bar slot
---@return any isUsable 1 if the action is usable; otherwise nil
---@return any notEnoughMana 1 if the player lacks the resources (e.g. mana, energy, runes) to use the action; otherwise nil
function IsUsableAction(slot) end

--- Puts the contents of an action bar slot onto the cursor or the cursor contents into an action bar slot. After an action is picked up via this function, it can only be placed into other action bar slots (with PlaceAction() or by calling PickupAction() again), even if the action is an item which could otherwise be placed elsewhere. Unlike many other "pickup" cursor functions, this function removes the picked-up action from the source slot -- an action slot can be emptied by calling this function followed by ClearCursor() .
--- Flags: nocombat
---@param slot number An action bar slot
function PickupAction(slot) end

--- Puts the contents of a pet action slot onto the cursor or the cursor contents into a pet action slot. Only pet actions and spells from the "pet" portion of the spellbook can be placed into pet action slots.
---@param index number Index of a pet action (between 1 and NUM_PET_ACTION_SLOTS )
function PickupPetAction(index) end

--- Puts the contents of the cursor into an action bar slot. If the action slot is empty and the cursor already holds an action, a spell, a companion (mount or non-combat pet), a macro, an equipment set, or an item (with a "Use:" effect), it is put into the action slot. If both the cursor and the slot hold an action (or any of the above data types), the contents of the cursor and the slot are exchanged.
--- Flags: nocombat
---@param slot number Destination action bar slot
function PlaceAction(slot) end

--- Turns autocast on or off for a pet action. Turns autocast on if not autocasting and vice versa.
--- Flags: protected
---@param index number Index of a pet action button (between 1 and NUM_PET_ACTION_SLOTS )
function TogglePetAutocast(index) end

--- Uses an action protected
--- Flags: protected
---@param slot number The action to use (1-132)
---@param target any The desired target of the action
---@param button string The mouse button used to activate the action
function UseAction(slot, target, button) end



--==============================
-- ActionBar functions
--==============================

--- Changes the current action bar page
--- Flags: nocombat
---@param page number The action bar page to change to
function ChangeActionBarPage(page) end

--- Returns the current action bar page
---@return number page The current action bar page
function GetActionBarPage() end

--- Returns the current visibility settings for the four secondary action bars
---@return any showBar1 1 if the interface option is set to show the Bottom Left ActionBar, otherwise nil
---@return any showBar2 1 if the interface option is set to show the Bottom Right ActionBar, otherwise nil
---@return any showBar3 1 if the interface option is set to show the Right ActionBar, otherwise nil
---@return any showBar4 1 if the interface option is set to show the Right ActionBar 2, otherwise nil
function GetActionBarToggles() end

--- Returns the current "stance" offset for use with the bonus action bar. This value corresponds to what "stance" the player is currently in, and more specifically which set of actions correspond to that stance. Action IDs for special stances start on action bar #7 (or NUM_ACTIONBAR_PAGES + 1 ), so the offset returned by this function corresponds to the number to be added to NUM_ACTIONBAR_PAGES in calculating action IDs for these action bars.
---@return number offset Offset of the stance's action bar in relation to NUM_ACTIONBAR_PAGES
function GetBonusBarOffset() end

--- Returns information about special actions available while the player possesses another unit. Used in the default UI to show additional special actions (e.g. canceling possession) while the player possesses another unit through an ability such as Eyes of the Beast or Mind Control.
---@param index number Index of a possession bar action (between 1 and NUM_POSSESS_SLOTS )
---@return string texture Path to an icon texture for the action
---@return string name The name of the spell in the queried possess bar slot.
function GetPossessInfo(index) end

--- Returns whether a special action bar should be shown while the player possesses another unit. Used in the default UI to switch between using the ShapeshiftBarFrame or PossessBarFrame to show actions belonging to the possessed unit.
---@return any isVisible 1 if the possessed unit's actions should be shown on a special action bar
function IsPossessBarVisible() end

--- Configures display of additional ActionBars in the default UI
---@param bar1 any 1 to show the bottom left ActionBar; otherwise nil
---@param bar2 any 1 to show the bottom right ActionBar; otherwise nil
---@param bar3 any 1 to show the right-side ActionBar; otherwise nil
---@param bar4 any 1 to show the second right-side ActionBar; otherwise nil
---@param alwaysShow any 1 to always show ActionBar backgrounds even for empty slots; otherwise nil
function SetActionBarToggles(bar1, bar2, bar3, bar4, alwaysShow) end



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



--==============================
-- Auction functions
--==============================

--- Returns the deposit amount for the item currently being set up for auction. Only returns useful information once an item has been placed in the Create Auction UI's "auction item" slot (see ClickAuctionSellItemButton() ).
---@param runTime any Run time of the proposed auction ( number ) 720 - 12 hours 1440 - 24 hours 2880 - 48 hours
---@return number deposit Amount of the deposit (in copper)
function CalculateAuctionDeposit(runTime) end

--- Returns whether one of the player's auctions can be canceled. Generally, non-cancelable auctions are those which have completed but for which payment has not yet been delivered.
---@param index number Index of an auction in the "owner" listing
---@return any canCancel 1 if the auction can be canceled; otherwise nil
function CanCancelAuction(index) end

--- Returns whether the player can perform an auction house query. All auction query types are throttled, preventing abuse of the server by clients sending too many queries in short succession. Normal queries can be sent once every few seconds; mass queries return all results in the auction house instead of one "page" at a time, and can only be sent once every several minutes.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@return any canQuery 1 if the player can submit an auction query; otherwise nil
---@return any canMassQuery 1 if the player can submit a mass auction query; otherwise nil
function CanSendAuctionQuery(list) end

--- Cancels an auction created by the player. When canceling an auction, the deposit amount is not refunded.
--- Flags: confirmation
---@param index number Index of an auction in the "owner" listing
function CancelAuction(index) end

--- Picks up an item from or puts an item into the "Create Auction" slot. If the cursor is empty and the slot contains an item, that item is put onto the cursor. If the cursor contains an item and the slot is empty, the item is placed into the slot. If both the cursor and the slot contain items, the contents of the cursor and the slot are exchanged.
function ClickAuctionSellItemButton() end

--- Ends interaction with the Auction House UI. Causes the AUCTION_HOUSE_CLOSED event to fire, indicating that Auction-related APIs may be unavailable or no longer return valid data.
function CloseAuctionHouse() end

--- Returns the deposit rate for the current auction house. Obsolete (returns different values for faction and neutral auction houses, but these values do not describe the ratio of auction deposit to an item's vendor buy or sell price); use CalculateAuctionDeposit() instead.
--- Flags: deprecated
---@return number rate The current auction house deposit rate
function GetAuctionHouseDepositRate() end

--- Returns a list of the inventory subtypes for a given auction house item subclass. Inventory types are the second level of hierarchy seen when browsing item classes (categories) and subclasses at the Auction House: Head , Neck , Shirt , et al for Miscellaneous ; Head , Shoulder , Chest , Wrist , et al for Cloth ; etc.
---@param classIndex number Index of an item class (in the list returned by GetAuctionItemClasses() ); currently, inventory types are only applicable in class 2 (armor)
---@param subClassIndex any Index of an item subclass (in the list returned by GetAuctionItemSubClasses(classIndex) ); currently, inventory types are only applicable in the armor subclasses listed below: ( number ) 1 - Miscellaneous 2 - Cloth 3 - Leather 4 - Mail 5 - Plate
---@return string token Name of a global variable containing the localized name of the inventory type (e.g. INVTYPE_FINGER )
---@return any display 1 if the inventory type should be displayed; otherwise nil (used in the default auction UI to hide subclass/invType combinations that don't exist in the game; e.g. Plate/Back, Leather/Trinket, etc)
function GetAuctionInvTypes(classIndex, subClassIndex) end

--- Returns a list of localized item class (category) names. Item classes are the first level of hierarchy seen when browsing at the Auction House: Weapon , Armor , Container , Consumable , etc.
function GetAuctionItemClasses() end

--- Returns information about an auction listing
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of an auction in the listing
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number count Number of items in the stack
---@return number quality The quality (rarity) level of the item
---@return any canUse 1 if the player character can use or equip the item; otherwise nil
---@return number level Required character level to use or equip the item
---@return number minBid Minimum cost to bid on the item (in copper)
---@return number minIncrement Minimum bid increment to become the highest bidder on the item (in copper)
---@return number buyoutPrice Buyout price of the auction (in copper)
---@return number bidAmount Current highest bid on the item (in copper); 0 if no bids have been placed
---@return any highestBidder 1 if the player is currently the highest bidder; otherwise nil
---@return string owner Name of the character who placed the auction
---@return number sold 1 if the auction has sold (and payment is awaiting delivery; applies only to owner auctions); otherwise nil
function GetAuctionItemInfo(list, index) end

--- Returns a hyperlink for an item in an auction listing
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of an auction in the listing
---@return string link A hyperlink for the item
function GetAuctionItemLink(list, index) end

--- Returns a list of localized subclass names for a given item class. Item subclasses are the second level of hierarchy seen when browsing item classes (categories) at the Auction House: One-Handed Axes , Two-Handed Axes , Bows , Guns , et al for Weapon ; Cloth , Leather , Plate , Shields , et al for Armor ; Food & Drink , Potion , Elixir et al for Consumable ; Red , Blue , Yellow , et al for Gem ; etc.
---@param classIndex number Index of an item class (in the list returned by GetAuctionItemClasses() )
function GetAuctionItemSubClasses(classIndex) end

--- Returns the time remaining before an auction listing expires
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of an auction in the listing
---@return any duration General indication of the amount of time remaining on the auction ( number ) 1 - Short (less than 30 minutes) 2 - Medium (30 minutes to 2 hours) 3 - Long (2 hours to 12 hours) 4 - Very Long
function GetAuctionItemTimeLeft(list, index) end

--- Returns information about the item currently being set up for auction. Only returns useful information once an item has been placed in the Create Auction UI's "auction item" slot (see ClickAuctionSellItemButton() ).
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number count Number of items in the stack
---@return number quality Quality (rarity) level of the item
---@return any canUse 1 if the player character can use or equip the item; otherwise nil
---@return number price Price to sell the item to a vendor (in copper)
function GetAuctionSellItemInfo() end

--- Returns the current sort settings for auction data. The index argument describes priority order for sort criteria: e.g. if GetAuctionSort("list",1) returns quality and GetAuctionSort("list",2) returns level,1 , items are sorted first by itemQuality and items with the same quality are sorted by required level.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of a sorting priority
---@return string criterion Non-localized string naming the criterion (or column in the default UI) by which listings are sorted
---@return any reverse 1 if listings are sorted in reverse order; otherwise nil. "Reverse" here is relative to the default order, not to absolute value: e.g. the default order for quality is descending (Epic, Rare, Uncommon, etc), but the default order for level is ascending (1-80)
function GetAuctionSort(list, index) end

--- Requests data from the server for the list of auctions bid on by the player. The AUCTION_BIDDER_LIST_UPDATE event fires if new data is available; listing information can then be retrieved using GetAuctionItemInfo() or other Auction APIs.
--- Flags: server
function GetBidderAuctionItems() end

--- Returns auction house invoice information for a mail message
---@param index number Index of the mail message in the inbox (between 1 and GetInboxNumItems() )
---@return any invoiceType Type of invoice ( string ) buyer - An invoice for an item the player won seller - An invoice for an item the player sold seller_temp_invoice - A temporary invoice for an item sold by the player but for which payment has not yet been delivered
---@return string itemName Name of the item
---@return string playerName Name of the player who bought or sold the item
---@return number bid Amount of the winning bid or buyout
---@return number buyout Amount of buyout (if the auction was bought out)
---@return number deposit Amount of money paid in deposit
---@return number consignment Amount withheld from the deposit by the auction house as charge for running the auction
---@return number moneyDelay Delay for delivery of payment on a temporary invoice (in minutes; generally 60)
---@return number etaHour Hour portion (on a 24-hour clock) of the estimated time for delivery of payment on a temporary invoice
---@return number etaMin Minute portion of the estimated time for delivery of payment on a temporary invoice
function GetInboxInvoiceInfo(index) end

--- Returns the number of auction items in a listing
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@return number numBatchAuctions Number of auctions in the current page of the listing
---@return number totalAuctions Total number of auctions available for the listing
function GetNumAuctionItems(list) end

--- Requests data from the server for the list of auctions created by the player. The AUCTION_OWNED_LIST_UPDATE event fires if new data is available; listing information can then be retrieved using GetAuctionItemInfo() or other Auction APIs.
--- Flags: server
function GetOwnerAuctionItems() end

--- Returns the index of the currently selected item in an auction listing. Auction selection is used only for display and internal recordkeeping in the default UI; it has no direct effect on other Auction APIs.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@return number index Index of the currently selected auction item
function GetSelectedAuctionItem(list) end

--- Returns whether a sort criterion is applied in reverse order. No longer used in the default UI; see GetAuctionSort() instead.
--- Flags: deprecated
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param sort string A sort criterion
---@return any isReversed 1 if the criterion is applied in reverse order; otherwise nil
---@return any isSorted 1 if the criterion is currently used for the given listing; otherwise nil
function IsAuctionSortReversed(list, sort) end

--- Places a bid on (or buys out) an auction item. Attempting to bid an amount equal to or greater than the auction's buyout price will buy out the auction (spending only the exact buyout price) instead of placing a bid.
--- Flags: confirmation
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of an auction in the listing
---@param bid number Amount to bid (in copper)
function PlaceAuctionBid(list, index, bid) end

--- Requests data from the server for the list of auctions meeting given search criteria. If any search criterion is omitted or nil , the search will include all possible values for that criterion.
--- Flags: server
---@param name string Full or partial item name to limit search results; will match any item whose name contains this string
---@param minLevel number Maximum required character level of items to limit search results
---@param maxLevel number Maximum required character level of items to limit search results
---@param invTypeIndex number Index of an item inventory type to limit search results (note that GetAuctionInvTypes(classIndex, subClassIndex) returns a list of token, display pairs for each inventory type; thus, to convert a token index from that list for use here, divide by 2 and round up)
---@param classIndex number Index of an item class to limit search results (in the list returned by GetAuctionItemClasses() )
---@param subClassIndex number Index of an item subclass to limit search results (in the list returned by GetAuctionItemSubClasses(classIndex) )
---@param page number Which "page" of search results to list, if more than NUM_AUCTION_ITEMS_PER_PAGE (50) auctions are available; nil to query the first (or only) page
---@param isUsable boolean True to limit search results to only items which can be used or equipped by the player character; otherwise false
---@param minQuality any Minimum quality (rarity) level of items to limit search results
---@param getAll boolean True to perform a mass query (returning all listings at once); false to perform a normal query (returning a large number of listings in "pages" of NUM_AUCTION_ITEMS_PER_PAGE [50] at a time)
function QueryAuctionItems(name, minLevel, maxLevel, invTypeIndex, classIndex, subClassIndex, page, isUsable, minQuality, getAll) end

--- Selects an item in an auction listing. Auction selection is used only for display and internal recordkeeping in the default UI; it has no direct effect on other Auction APIs.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of an auction in the listing
function SetSelectedAuctionItem(list, index) end

--- Applies a set of auction listing sort criteria set via SortAuctionSetSort . Sort criteria are applied server-side, affecting not only the order of items within one "page" of listings but the order in which items are collected into pages.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
function SortAuctionApplySort(list) end

--- Clears any current sorting rules for an auction house listing
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
function SortAuctionClearSort(list) end

--- Sorts the auction house listing. No longer used in the default UI; see SortAuctionClearSort() , SortAuctionSetSort() , and SortAuctionApplySort() instead.
--- Flags: deprecated
---@param type any The type of auction listing to sort ( string ) bidder - Auctions the player has bid on list - Standard auction house listing owner - Auctions the player has placed
---@param sort any Criterion for sorting the list ( string ) bid - Amount of the current or minimum bid on the item buyout - Buyout price of the item duration - Time remaining before the auction expires level - Required character level to use or equip the item minbidbuyout - Buyout price, or minimum bid if no buyout price is available name - Name of the item quality - itemQuality of the item quantity - Number of stacked items in the auction seller - Name of the character who created of the auction (or in the owner listing, the current high bidder) status - Status of the auction
function SortAuctionItems(type, sort) end

--- Builds a list of sort criteria for auction listings. Has no effect until SortAuctionApplySort(type) is called; thus, this function can be called repeatedly to build a complex set of sort criteria. Sort criteria are applied server-side, affecting not only the order of items within one "page" of listings but the order in which items are collected into pages.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param sort any Criterion to add to the sort ( string ) bid - Amount of the current or minimum bid on the item buyout - Buyout price of the item duration - Time remaining before the auction expires level - Required character level to use or equip the item minbidbuyout - Buyout price, or minimum bid if no buyout price is available name - Name of the item quality - itemQuality of the item quantity - Number of stacked items in the auction seller - Name of the character who created of the auction (or in the owner listing, the current high bidder) status - Status of the auction
---@param reversed boolean True to sort in reverse order; otherwise false. "Reverse" here is relative to the default order, not to absolute value: e.g. the default order for quality is descending (Epic, Rare, Uncommon, etc), but the default order for level is ascending (1-80)
function SortAuctionSetSort(list, sort, reversed) end

--- Creates an auction for the item currently in the "auction item" slot. Has no effect unless an item has been placed in the Create Auction UI's "auction item" slot (see ClickAuctionSellItemButton() ). With patch 3.3.3 the runTime arg was changed from minutes to an index and the stackSize/numStacks args were added for batch posting.
---@param minBid number Minimum bid for the auction (in copper)
---@param buyoutPrice number Buyout price for the auction (in copper)
---@param runTime any Run time until the auction expires (an index indicating number of hours) ( number ) 1 - 12 hours 2 - 24 hours 3 - 48 hours
---@param stackSize number Number of items to post in each auction
---@param numStacks number Number of auctions (stacks) to post
function StartAuction(minBid, buyoutPrice, runTime, stackSize, numStacks) end



--==============================
-- Bank functions
--==============================

--- Returns the inventoryID corresponding to a bank item or bag slot
---@param buttonID number Numeric ID of an item or bag slot in the bank UI
---@param isBag any 1 if the given ID corresponds to a bank bag slot; nil if the ID corresponds to an item slot
---@return number inventoryID An inventory slot ID usable with various Inventory API functions
function BankButtonIDToInvSlotID(buttonID, isBag) end

--- Ends interaction with the bank. Causes the BANKFRAME_CLOSED event to fire, indicating that APIs querying bank contents may no longer return valid results.
function CloseBankFrame() end

--- Unpacks an inventory location bitfield into usable components
---@param location number A bit field that represents an item's location in the player's possession.  This bit field can be obtained using the GetInventoryItemsForSlot function.
---@return boolean player A flag indicating whether or not the item exists in the player's inventory (i.e. an equipped item).
---@return boolean bank A flag indicating whether or not the item exists in the payer's bank.
---@return boolean bags A flag indicating whether or not the item exists in the player's bags.
---@return number bag The bagID of the container that contains the item.
function EquipmentManager_UnpackLocation(location) end

--- Returns the cost of the next purchasable bank bag slot. Returns 999999999 if the player owns all available slots.
---@return number cost Cost of the next available bank bag slot (in copper)
function GetBankSlotCost() end

--- Returns information about purchased bank bag slots
---@return number numSlots Number of bank bag slots the player has purchased
---@return any isFull 1 if the player has purchased all available slots; otherwise nil
function GetNumBankSlots() end

--- Purchases the next available bank slot. Only available while interacting with a banker NPC (i.e. between the BANKFRAME_OPENED and BANKFRAME_CLOSED events).
--- Flags: confirmation
function PurchaseSlot() end



--==============================
-- Barbershop functions
--==============================

--- Purchases the selected barber shop style changes. Does not exit the barber shop session, so further changes are still allowed.
function ApplyBarberShopStyle() end

--- Resets barber shop options to the currently worn styles. Changes the underlying data (and thus the character's appearance) only; the default barbershop UI does not update.
function BarberShopReset() end

--- Lets you check if the player can change their skin color. Returns true if the player can change their skin color while using the barbershop.
---@return boolean canAlter Can the player change skin color
function CanAlterSkin() end

--- Exits a barber shop session. Causes the player character to stand up, returning to the normal world, and fires the BARBER_SHOP_CLOSE event. Any style changes already paid for (with ApplyBarberShopStyle() ) are kept; any changes since are discarded.
function CancelBarberShop() end

--- Returns information about the selected barber shop style option
---@param styleIndex any Index of a style option ( number ) 1 - Hair (or Horn) Style 2 - Hair (or Horn) Color 3 - Varies by race and gender: Facial Hair, Earrings, Features, Hair, Horns, Markings, Normal, Piercings, or Tusks
---@return string name Name of the style option, or nil if the style is not named
---@return string unused Currently unused
---@return number cost Price of applying the style option, not including changes to other style options (in copper)
---@return any isCurrent 1 if the style option matches the character's existing style; otherwise nil
function GetBarberShopStyleInfo(styleIndex) end

--- Returns the total price of selected barber shop style changes
---@return number cost Price of the barber shop style change (in copper)
function GetBarberShopTotalCost() end

--- Returns a token used for displaying facial feature customization options. The token referred to by this function can be used to look up a global variable containing localized names for the customization options available to the player's race at character creation time and in the Barbershop UI; see example.
---@return string token Part of a localized string token for displaying facial feature options for the player's race
function GetFacialHairCustomization() end

--- Returns a token used for displaying "hair" customization options. The token referred to by this function can be used to look up a global variable containing localized names for the customization options available to the player's race at character creation time and in the Barbershop UI; see example.
---@return string token Part of a localized string token for displaying "hair" options for the player's race
function GetHairCustomization() end

--- Selects the next style for a barber shop style option. Changes the underlying data (and thus the character's appearance) only; the default barbershop UI does not update.
---@param styleIndex any Index of a style option ( number ) 1 - Hair (or Horn) Style 2 - Hair (or Horn) Color 3 - Varies by race and gender: Facial Hair, Earrings, Features, Hair, Horns, Markings, Normal, Piercings, or Tusks
---@param reverse boolean True to select the previous style; false or omitted to select the next
function SetNextBarberShopStyle(styleIndex, reverse) end



--==============================
-- Battle.net functions
--==============================

--- Returns information about a RealID friend by index
---@param friendIndex number Index (between 1 and BNGetNumFriends() )
---@return number presenceID auto incrementing ID, reset at each login. Persists across reload of UI, but not change of character
---@return string givenName First name of the friend, as a new form of chatlink. Visually looks like a string, but only when rendered
---@return string surname Last name (surname) of the friend, as a new form of chatlink. Visually looks like a string, but only when rendered
---@return string toonName Name of the active character tied to the BNet account
---@return number toonID
---@return string client The name of the game the friend is currently playing, if any; Returns nil if not online. Returns initialism for World of Warcraft ('WoW')
---@return boolean isOnline Online status
---@return number lastOnline
---@return boolean isAFK
---@return boolean isDND
---@return string messageText RealID broadcast message displayed below the user on your friends list
---@return string noteText The player's personal note for the friend; nil for no note
---@return boolean isFriend
---@return number unknown
function BNGetFriendInfo(friendIndex) end

--- Returns information about a RealID friend
---@param presenceID number
---@return number presenceID
---@return string givenName First name of the friend
---@return string surname Last name (surname) of the friend
---@return string toonName Name of the active character tied to the BNet account
---@return number toonID
---@return string client The name of the game the friend is currently playing, if any; Returns nil if not online. Returns initialism for World of Warcraft ('WoW')
---@return boolean isOnline Online status
---@return number lastOnline
---@return boolean isAFK
---@return boolean isDND
---@return string messageText RealID broadcast message displayed below the user on your friends list
---@return string noteText The player's personal note for the friend; nil for no note
---@return boolean isFriend
---@return number unknown
function BNGetFriendInfoByID(presenceID) end

--- Returns information about a particular online toon tied to a RealID friend
---@param friendIndex number Index (between 1 and BNGetNumFriends() )
---@param toonIndex number Index (between 1 and BNGetNumFriendToons(friendIndex) )
---@return boolean unknown
---@return string toonName The toon's name
---@return string client The name of the game the friend is currently playing, if any;  Returns initialism for World of Warcraft ('WoW')
---@return string realmName The toon's realm name
---@return number faction The toon's faction. Returns -1 for offline, 0 for Horde, 1 for Alliance
---@return string race The toon's race
---@return string class The toon's class
---@return string unknown
---@return string zoneName The toon's zone (location)
---@return string level The toon's character level
---@return string gameText The zone and server of the active toon separated by a hyphen
---@return string broadcastText The user's RealID broadcast message
---@return string broadcastTime The time the broadcast message was first set
function BNGetFriendToonInfo(friendIndex, toonIndex) end

--- Returns information about the player's RealID settings
---@return number unknown
---@return number unknown
---@return string broadcastText The player's current broadcast message (entered at the top of the friends tab)
---@return boolean bnetAFK
---@return boolean bnetDND
function BNGetInfo() end

--- Returns boolean for the Mature Language Filter option's state.
---@return boolean isEnabled Returns true if the Mature Language Filter interface option is enabled, otherwise false.
function BNGetMatureLanguageFilter() end

--- Returns the number of online toons for a friend
---@param friendIndex number The index of the friend to query
---@return number numToons The number of toons
function BNGetNumFriendToons(friendIndex) end

--- Returns total number of RealID friends and currently online number of RealID friends
---@return number totalBNet Total number of RealID friends
---@return number numBNetOnline Number of currently online RealID friends
function BNGetNumFriends() end

--- Returns the index of the selected user on your friend's list
---@return number friendIndex The index of the friend in the list
function BNGetSelectedFriend() end

--- Returns information about the active toon tied to a RealID friend
---@param presenceID number
---@return boolean unknown
---@return string toonName The toon's name
---@return string client The name of the game the friend is currently playing, if any;  Returns initialism for World of Warcraft ('WoW')
---@return string realmName The toon's realm name
---@return number realmID The toon's realm ID (not sure if unique per realm, or a weekly/session realmID identifier)
---@return number faction The toon's faction. Returns -1 for offline, 0 for Horde, 1 for Alliance
---@return string race The toon's race
---@return string class The toon's class
---@return string unknown
---@return string zoneName The toon's zone (location)
---@return string level The toon's character level
---@return string gameText The zone and server of the active toon separated by a hyphen
---@return string broadcastText The user's RealID broadcast message
---@return string broadcastTime The time the broadcast message was first set
function BNGetToonInfo(presenceID) end

--- Sets the player's current RealID broadcast message.
---@param broadcastText string Value that becomes your new broadcast message
function BNSetCustomMessage(broadcastText) end

--- Changes the private note for a RealID friend
---@param presenceID number The presenceID of the friend whose note you want to change
---@param note string The new note for the friend
function BNSetFriendNote(presenceID, note) end

--- Sets the Mature Language Filter option
---@param enabled boolean true to enable the Mature Language Filter; otherwise false
function BNSetMatureLanguageFilter(enabled) end



--==============================
-- Battlefield functions
--==============================

--- Accepts the next upcoming periodic resurrection from a battleground spirit healer. Automatically called in the default UI in response to the AREA_SPIRIT_HEALER_IN_RANGE event which fires when the player's ghost is near a battleground spirit healer.
function AcceptAreaSpiritHeal() end

--- Accepts the offered teleport to a battleground/arena or leaves the battleground/arena or queue. This function requires a hardware event when used to accept a teleport; it can be called without a hardware event for leaving a battleground/arena or its queue.
---@param index number Index of a battleground or arena type for which the player is queued
---@param accept any 1 to accept the offered teleport; nil to exit the queue or leave the battleground/arena match in progress
function AcceptBattlefieldPort(index, accept) end

--- Returns whether the battleground for which the player is queueing supports joining as a group
---@return any canGroupJoin 1 if the currently displayed battlefield supports joining as a group
function CanJoinBattlefieldAsGroup() end

--- Declines the next upcoming periodic resurrection from a battleground spirit healer. Usable in response to the AREA_SPIRIT_HEALER_IN_RANGE event which fires when the player's ghost is near a battleground spirit healer.
function CancelAreaSpiritHeal() end

--- This function or event no longer exists in version 6.0.2 (19034) of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
function CloseBattlefield() end

--- Returns the time remaining until a nearby battleground spirit healer resurrects all players in its area
---@return number timeleft Seconds remaining before the next area resurrection
function GetAreaSpiritHealerTime() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetBattlefieldArenaFaction() end

--- Returns the estimated wait time on a battleground or arena queue
---@param index number Index of a battleground/arena queue the player has joined (between 1 and MAX_BATTLEFIELD_QUEUES )
---@return number waitTime Estimated wait time to join the battleground/arena (in milliseconds)
function GetBattlefieldEstimatedWaitTime(index) end

--- Returns the position of a flag in a battleground
---@param index number Index of a flag (between 1 and GetNumBattlefieldFlagPositions() )
---@return number flagX Horizontal (X) coordinate of the flag's position relative to the zone map (0 = left edge, 1 = right edge)
---@return number flagY Vertical (Y) coordinate of the flag's position relative to the zone map (0 = bottom edge, 1 = top edge)
---@return string flagToken Unique portion of the path to a texure for the flag; preface with "Interface\\WorldStateFrame\" for the full path
function GetBattlefieldFlagPosition(index) end

--- Returns information about a battleground for which the player can queue
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetBattlefieldInfo
function GetBattlefieldInfo() end

--- Returns the amount of time remaining before all players are removed from the instance, if in a battleground instance where the match has completed
---@return number timeLeft Amount of time remaining (in milliseconds) before all players are removed from the instance, if in a battleground instance where the match has completed; otherwise 0.
function GetBattlefieldInstanceExpiration() end

--- Returns a numeric ID for a battleground instance in the battleground queueing list. This number is seen in the instance names in said listings and elsewhere in the Battlegrounds UI (e.g. the 13 in "You are eligible to enter Warsong Gulch 13").
---@param index number Index in the battleground queue listing (1 for the first available instance, or between 2 and GetNumBattlefields() for other instances)
---@return number instanceID Numeric ID of the battleground instance
function GetBattlefieldInstanceInfo(index) end

--- Returns the amount of time since the current battleground instance opened
---@return number time Amount of time since the current battleground instance opened (in milliseconds)
function GetBattlefieldInstanceRunTime() end

--- Returns the scale to be used for displaying battleground map icons. Used in the default UI to determine the size of the point of interest icons (towers, graveyards, etc.) on the zone map (the small battle minimap). The default size of the icons is set by DEFAULT_POI_ICON_SIZE and the scale is used to grow or shrink them depending on the size of the map.
---@return number scale Scale factor for map icons (between 0 and 1)
function GetBattlefieldMapIconScale() end

--- Returns the time left on a battleground or arena invitation
---@param index number Index of a battleground/arena queue the player has joined (between 1 and MAX_BATTLEFIELD_QUEUES )
---@return number expiration Time remaining before the player's invitation to enter the battleground/arena expires (in seconds); 0 if the player has not yet been invited to enter or is already in the battleground/arena instance
function GetBattlefieldPortExpiration(index) end

--- Returns the position of a battleground team member not in the player's group. Still used in the default UI but no longer useful; as all team members in a battleground match are automatically joined into a raid group. See GetPlayerMapPosition() instead.
---@param index number Index of a team member (between 1 and GetNumBattlefieldPositions() )
---@return number unitX Horizontal (X) coordinate of the unit's position relative to the zone map (0 = left edge, 1 = right edge)
---@return number unitY Vertical (Y) coordinate of the unit's position relative to the zone map (0 = bottom edge, 1 = top edge)
---@return string name Name of the unit for display on the map
function GetBattlefieldPosition(index) end

--- Returns basic scoreboard information for a battleground/arena participant. Does not include battleground-specific score data (e.g. flags captured in Warsong Gulch, towers assaulted in Alterac Valley, etc); see GetBattlefieldStatData() for such information.
---@param index number Index of a participant in the battleground/arena scoreboard (between 1 and GetNumBattlefieldScores() )
---@return string name Name of the participant
---@return number killingBlows Number of killing blows scored by the participant during the match
---@return number honorableKills Number of honorable kills scored by the participant during the match
---@return number deaths Number of times the participant died during the match
---@return number honorGained Amount of honor points gained by the participant during the match
---@return any faction Faction or team to which the participant belongs ( number ) 0 - Horde (Battleground) / Green Team (Arena) 1 - Alliance (Battleground) / Gold Team
---@return string race Localized name of the participant's race
---@return string class Localized token representing the participant's class
---@return string classToken Non-localized token representing the participant's class
---@return number damageDone Total amount of damage done by the participant during the match
---@return number healingDone Total amount of healing done by the participant during the match
---@return number bgRating Personal battleground rating at the start of the match
---@return number ratingChange Amount of rating gained/lost during the match
---@return number preMatchMMR After 4.2 update is always zero
---@return number mmrChange After 4.2 update is always zero
---@return string talentSpec Localized name of player build
function GetBattlefieldScore(index) end

--- Returns battleground-specific scoreboard information for a battleground participant. Battleground-specific statistics include flags captured in Warsong Gulch, towers assaulted in Alterac Valley, etc. For the name and icon associated with each statistic, see GetBattlefieldStatInfo() . For basic battleground score information, see GetBattlefieldScore() .
---@param index number Index of a participant in the battleground/arena scoreboard (between 1 and GetNumBattlefieldScores() )
---@param statIndex number Index of a battleground-specific statistic (between 1 and GetNumBattlefieldStats() )
---@return number columnData The participant's score for the statistic
function GetBattlefieldStatData(index, statIndex) end

--- Returns information about a battleground-specific scoreboard column. Battleground-specific statistics include flags captured in Warsong Gulch, towers assaulted in Alterac Valley, etc.
---@param statIndex number Index of a battleground-specific statistic (between 1 and GetNumBattlefieldStats() )
---@return string text Name to display for the statistic's scoreboard column header
---@return string icon Path to an icon texture for the statistic
---@return string tooltip Text to be displayed as a tooltip when mousing over the scoreboard column
function GetBattlefieldStatInfo(statIndex) end

--- Returns information about an active or queued battleground/arena instance
---@param index number Index of a battleground/arena queue the player has joined (between 1 and GetMaxBattlefieldID() )
---@return any status Status of the player with respect to the battleground ( string ) active - The player is currently playing in this battleground confirm - The player has been invited to enter this battleground but has not done so yet none - No battleground or queue at this index queued - The player is queued for this battleground
---@return string mapName Name of the battleground (e.g. "Alterac Valley") or arena ("All Arenas" while queued ; "Eastern Kingdoms" regardless of destination while status is confirm , e.g. "Dalaran Sewers" while active )
---@return number instanceID If in a battleground or queued for a specific instance, the number identifying that instance (e.g. 13 in "Warsong Gulch 13"); otherwise 0
---@return number bracketMin Lowest level of characters in the player's level bracket for the battleground
---@return number bracketMax Highest level of characters in the player's level bracket for the battleground
---@return any teamSize Number of players per team for an arena match ( number ) 0 - Not an arena match 2 - 2v2 Arena 3 - 3v3 Arena 5 - 5v5 Arena
---@return any registeredMatch 1 if a rated arena match; otherwise nil
function GetBattlefieldStatus(index) end

--- Returns info about teams and their ratings in a rated arena match.. Usable following the UPDATE_BATTLEFIELD_SCORE event.
---@param index any Index of a team in the arena match ( number ) 0 - Green Team 1 - Gold Team
---@return string teamName Name of the team
---@return number teamRating The team's rating at the start of the match
---@return number newTeamRating New rating for the team when the match is complete
function GetBattlefieldTeamInfo(index) end

--- Returns the amount of time elapsed since the player joined the queue for a battleground/arena
---@param index number Index of a battleground/arena queue the player has joined (between 1 and MAX_BATTLEFIELD_QUEUES )
---@return number timeInQueue Time elapsed since the player joined the queue (in milliseconds)
function GetBattlefieldTimeWaited(index) end

--- Returns information about special vehicles in the current zone. Used only for certain vehicles in certain zones: includes the airships in Icecrown as well as vehicles used in Ulduar, Wintergrasp, and Strand of the Ancients.
---@param index number Index of a special vehicle (between 1 and GetNumBattlefieldVehicles() )
---@return number vehicleX Horizontal position of the vehicle relative to the zone map (0 = left edge, 1 = right edge)
---@return number vehicleY Vertical position of the vehicle relative to the zone map (0 = top, 1 = bottom)
---@return string unitName Localized name of the vehicle
---@return boolean isPossessed True if the vehicle is controlled by another unit
---@return any vehicleType Token indicating type of vehicle; some types can be used as keys to the global VEHICLE_TEXTURES table to get display texture information for the vehicle ( string ) Airship Alliance - The Alliance flying quest hub in Icecrown Airship Horde - The Horde flying quest hub in Icecrown Drive - A land vehicle such as a siege engine Fly - A flying vehicle Idle - A non-moving vehicle
---@return number orientation Facing angle of the vehicle ((in radians, 0 = north, values increasing counterclockwise)
---@return boolean isPlayer True if the vehicle is controlled by the player
---@return boolean isAlive True if the vehicle has not been destroyed
function GetBattlefieldVehicleInfo(index) end

--- Returns the winner of the current battleground or arena match
---@return any winner Index of the winning team if in a completed match; otherwise nil ( number ) 0 - Horde (Battleground) / Green Team (Arena) 1 - Alliance (Battleground) / Gold Team
function GetBattlefieldWinner() end

--- Returns information about available battlegrounds
---@param index number Index of a battleground (between 1 and NUM_BATTLEGROUNDS )
---@return string name Localized name of the battleground (Alterac Valley, Warsong Gulch, etc.)
---@return any canEnter 1 if the player can enter the battleground; otherwise nil
---@return any isHoliday 1 if a "holiday" offering bonus honor is currently active for the battleground; otherwise nil
---@return number minlevel Minimum character level required to enter the battleground
function GetBattlegroundInfo(index) end

--- Returns the number of battleground flags for which map position information is available
---@return number numFlags Number of battleground flags for which map position information is available
function GetNumBattlefieldFlagPositions() end

--- Returns the number of team members in the battleground not in the player's group. Still used in the default UI but no longer useful; always returns 0, as all team members in a battleground match are automatically joined into a raid group.
---@return number numTeamMembers Number of team members in the battleground not in the player's party or raid
function GetNumBattlefieldPositions() end

--- Returns the number of participant scores available in the current battleground
---@return number numScores Number of participant scores available in the current battleground; 0 if not in a battleground
function GetNumBattlefieldScores() end

--- Returns the number of battleground-specific statistics on the current battleground's scoreboard. Battleground-specific statistics include flags captured in Warsong Gulch, towers assaulted in Alterac Valley, etc. For the name and icon associated with each statistic, see GetBattlefieldStatInfo() .
---@return number numStats Number of battleground-specific scoreboard columns
function GetNumBattlefieldStats() end

--- Returns the number of special vehicles in the current zone. Used only for certain vehicles in certain zones: includes the airships in Icecrown as well as vehicles used in Ulduar, Wintergrasp, and Strand of the Ancients.
---@return number numVehicles Number of special vehicles
function GetNumBattlefieldVehicles() end

--- This function or event no longer exists in version 4.3.0 of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param index number Index of a battleground (between 1 and NUM_BATTLEGROUNDS ), if using the queue-anywhere UI; not used when choosing an instance for a single battleground (e.g. at a battlemaster or battleground portal)
---@return number numBattlefields Number of instances currently available for the battleground
function GetNumBattlefields(index) end

--- Returns the number of different battlegrounds available. Refers to distinct battlegrounds, not battleground instances. Does not indicate the number of battlegrounds the player can enter: for that, see GetBattlegroundInfo .
---@return number numBattlegrounds Number of different battlegrounds available
function GetNumBattlegroundTypes() end

--- Returns the number of members in the player's non-battleground party. When the player is in a party/raid and joins a battleground or arena, the normal party/raid functions refer to the battleground's party/raid, but the game still keeps track of the player's place in a non-battleground party/raid.
---@return number numMembers Number of members in the player's non-battleground party
function GetRealNumPartyMembers() end

--- Returns the number of members in the player's non-battleground raid. When the player is in a party/raid and joins a battleground or arena, the normal party/raid functions refer to the battleground's party/raid, but the game still keeps track of the player's place in a non-battleground party/raid.
---@return number numMembers Number of members in the player's non-battleground raid
function GetRealNumRaidMembers() end

--- Returns the index of the selected battleground instance in the queueing list. Selection in the battleground instance list is used only for display in the default UI and has no effect on other Battlefield APIs.
---@return number index Index of the selection in the battleground queue listing (1 for the first available instance, or between 2 and GetNumBattlefields() for other instances)
function GetSelectedBattlefield() end

--- Returns whether the player is the leader of a non-battleground party. When the player is in a party/raid and joins a battleground or arena, the normal party/raid functions refer to the battleground's party/raid, but the game still keeps track of the player's place in a non-battleground party/raid.
---@return any isLeader 1 if the player is the leader of a non-battleground party; otherwise nil
function IsRealPartyLeader() end

--- Returns whether the player is the leader of a non-battleground raid. When the player is in a party/raid and joins a battleground or arena, the normal party/raid functions refer to the battleground's party/raid, but the game still keeps track of the player's place in a non-battleground party/raid.
---@return any isLeader 1 if the player is the leader of a non-battleground raid; otherwise nil
function IsRealRaidLeader() end

--- Joins the queue for a battleground instance
---@param index number Index in the battleground queue listing (1 for the first available instance, or between 2 and GetNumBattlefields() for other instances)
---@param asGroup boolean True to enter the player's entire party/raid in the queue; false to enter the player only
function JoinBattlefield(index, asGroup) end

--- Immediately exits the current battleground instance. Returns the player to the location from which he or she joined the battleground and applies the Deserter debuff.
function LeaveBattlefield() end

--- Returns whether a battleground participant is inactive (and eligible for reporting as AFK)
---@param name string Name of a friendly player unit in the current battleground
---@param unit string A friendly player unit in the current battleground
---@return boolean isInactive True if the unit can be reported as AFK; otherwise false
function PlayerIsPVPInactive(name, unit) end

--- Reports a battleground participant as AFK
---@param name string Name of a friendly player unit in the current battleground
---@param unit string A friendly player unit in the current battleground
function ReportPlayerIsPVPAFK(name, unit) end

--- Requests information from the server about team member positions in the current battleground. Automatically called in the default UI by UIParent's and WorldMapFrame's OnUpdate handlers.
--- Flags: server
function RequestBattlefieldPositions() end

--- Requests battlefield score data from the server. Score data is not returned immediately; the UPDATE_BATTLEFIELD_SCORE event fires once information is available and can be retrieved by calling GetBattlefieldScore() and related functions.
--- Flags: server
function RequestBattlefieldScoreData() end

--- Requests information about available instances of a battleground from the server. The PVPQUEUE_ANYWHERE_SHOW event fires once information is available; data can then be retrieved by calling GetNumBattlefields() and GetBattlefieldInstanceInfo() .
--- Flags: server
---@param index number Index of a battleground (between 1 and NUM_BATTLEGROUNDS )
function RequestBattlegroundInstanceInfo(index) end

--- Filters the battleground scoreboard by faction/team
---@param faction any Faction for which to show battleground participant scores ( number ) 0 - Horde 1 - Alliance nil - All
function SetBattlefieldScoreFaction(faction) end

--- Selects a battleground instance in the queueing list. Selection in the battleground instance list is used only for display in the default UI and has no effect on other Battlefield APIs.
---@param index number Index in the battleground queue listing (1 for the first available instance, or between 2 and GetNumBattlefields() for other instances)
function SetSelectedBattlefield(index) end

--- Shows or hides the battlefield minimap's player arrow
---@param show boolean If the battlefield minimap's player arrow should be shown
function ShowMiniWorldMapArrowFrame(show) end

--- Sorts the battleground scoreboard. Battleground-specific statistics include flags captured in Warsong Gulch, towers assaulted in Alterac Valley, etc. For the name and icon associated with each statistic, see GetBattlefieldStatInfo() .
---@param sortType any Criterion for sorting the scoreboard data ( string ) class - Sort by character class cp - Sorts by honor points gained damage - Sorts by damage done deaths - Sort by number of deaths healing - Sorts by healing done hk - Sorts by number of honor kills kills - Sort by number of kills name - Sort by participant name stat1 - Battlefield-specific statistic 1 stat2 - Battlefield-specific statistic 2 stat3 - Battlefield-specific statistic 3 stat4 - Battlefield-specific statistic 4 stat5 - Battlefield-specific statistic 5 stat6 - Battlefield-specific statistic 6 stat7 - Battlefield-specific statistic 7 team -  Sort by team name
function SortBattlefieldScoreData(sortType) end

--- Returns whether a unit is in same battleground instance as the player
---@param unit string A unit to query
---@return number raidNum Numeric portion of the unit's raid unitID (e.g. 13 for raid13 )
function UnitInBattleground(unit) end



--==============================
-- Blizzard internal functions
--==============================

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function AppendToFile() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CreateMiniWorldMapArrowFrame() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CreateWorldMapArrowFrame() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function DeleteFile() end

--- Detects the presence of a "WoW" compatible multi-button mouse. This function is used by the default user interface to enable or disable the configuration option for a many buttoned WoW mouse.  If the mouse is not found, the WOW_MOUSE_NOT_FOUND event will fire.
function DetectWowMouse() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GMRequestPlayerInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GetDebugStats() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GetDebugZoneMap() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GetGMStatus() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GetMapDebugObjectInfo() end

--- This is a Blizzard internal function internal
--- Flags: internal
function GetNumMapDebugObjects() end

--- This is a Blizzard internal function internal
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetTexLodBias
function GetTexLodBias() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function HasDebugZoneMap() end

--- This is a Blizzard internal function internal
--- Flags: internal
function IsDebugBuild() end

--- This is a Blizzard internal function internal
--- Flags: internal
function PlayDance() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function PositionMiniWorldMapArrowFrame() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function PositionWorldMapArrowFrame() end

--- This is a Blizzard internal function internal
--- Flags: internal
function ReadFile() end

--- This is a Blizzard internal function internal
--- Flags: internal
function ResetPerformanceValues() end

--- This is a Blizzard internal function internal
--- Flags: internal
function SetChannelWatch() end

--- This is a Blizzard internal function internal
--- Flags: internal
function SetConsoleKey() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function SetLayoutMode() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function ShowWorldMapArrowFrame() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal, protected
function TargetDirectionEnemy() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal, protected
function TargetDirectionFinished() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal, protected
function TargetDirectionFriend() end

--- This is a Blizzard internal function internal
--- Flags: internal
function TeleportToDebugObject() end

--- This is a Blizzard internal function internal
--- Flags: internal
function ToggleCollision() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function ToggleCollisionDisplay() end

--- This is a Blizzard internal function internal
--- Flags: internal
function TogglePerformanceDisplay() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function TogglePerformancePause() end

--- This is a Blizzard internal function internal
--- Flags: internal
function TogglePerformanceValues() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function TogglePlayerBounds() end

--- This is a Blizzard internal function internal
--- Flags: internal
function TogglePortals() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function ToggleTris() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function UpdateWorldMapArrowFrames() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function debugbreak() end

--- This is a Blizzard internal function internal
--- Flags: internal
function debugdump() end

--- This is a Blizzard internal function internal
--- Flags: internal
function debuginfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function debugload() end

--- This is a Blizzard internal function internal
--- Flags: internal
function debugprint() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function debugtimestamp() end

--- Creates a zero-length userdata with an optional metatable.. newproxy is a experimental, undocumented and unsupported function in the Lua base library. It can be used to create a zero-length userdata, with a optional proxy.
---@param boolean boolean Controls if the returned userdata should have a metatable or not.
---@param userdata any Needs to be a proxy. The metatable will be shared between the proxies.
---@return any userdata A zero-length user-data object.
function newproxy(boolean, userdata) end



--==============================
-- Buff functions
--==============================

--- Cancels a temporary weapon enchant
---@param slot number 1 to cancel the mainhand item enchant, 2 to cancel the offhand item enchant
function CancelItemTempEnchantment(slot) end

--- Cancels the current shapeshift form. Unlike other Shapeshift APIs, this function refers specifically to shapeshifting -- therefore including some abilities not found on the default UI's ShapeshiftBar and excluding some which are. For example, cancels shaman Ghost Wolf form and druid shapeshifts but not warrior stances, paladin auras, or rogue stealth.
function CancelShapeshiftForm() end

--- Cancels a buff on the player
---@param unit string A unit to query (only valid for 'player')
---@param index number Index of an aura to query
---@param name string Name of an aura to query
---@param rank string Secondary text of an aura to query (often a rank; e.g. "Rank 7")
---@param filter any A list of filters to use separated by the pipe '|' character; e.g. "RAID|PLAYER" will query group buffs cast by the player ( string ) CANCELABLE - Query auras that can be cancelled HARMFUL - Query debuffs only HELPFUL - Query buffs only NOT_CANCELABLE - Query auras that cannot be cancelled PLAYER - Query auras the player has cast RAID - Query auras the player can cast on party/raid members
function CancelUnitBuff(unit, index, name, rank, filter) end

--- Returns information about temporary enchantments on the player's weapons. Does not return information about permanent enchantments added via Enchanting, Runeforging, etc; refers instead to temporary buffs such as wizard oils, sharpening stones, rogue poisons, and shaman weapon enhancements.
---@return any hasMainHandEnchant 1 if the main hand weapon has a temporary enchant
---@return number mainHandExpiration The time until the enchant expires, in milliseconds
---@return number mainHandCharges The number of charges left on the enchantment
---@return any hasOffHandEnchant 1 if the offhand weapon has a temporary enchant
---@return number offHandExpiration The time until the enchant expires, in milliseconds
---@return number offHandCharges The number of charges left on the enchantment
function GetWeaponEnchantInfo() end

--- Returns information about buffs/debuffs on a unit
---@param unit string A unit to query
---@param index number Index of an aura to query
---@param name string Name of an aura to query
---@param rank string Secondary text of an aura to query (often a rank; e.g. "Rank 7")
---@param filter any A list of filters to use separated by the pipe '|' character; e.g. "RAID|PLAYER" will query group buffs cast by the player ( string ) CANCELABLE - Show auras that can be cancelled HARMFUL - Show debuffs only HELPFUL - Show buffs only NOT_CANCELABLE - Show auras that cannot be cancelled PLAYER - Show auras the player has cast RAID - When used with a HELPFUL filter it will show auras the player can cast on party/raid members (as opposed to self buffs). If used with a HARMFUL filter it will return debuffs the player can cure
---@return string name Name of the aura
---@return string rank Secondary text for the aura (often a rank; e.g. "Rank 7")
---@return string icon Path to an icon texture for the aura
---@return number count The number of times the aura has been applied
---@return any dispelType Type of aura (relevant for dispelling and certain other mechanics); nil if not one of the following values: ( string ) Curse Disease Magic Poison
---@return number duration Total duration of the aura (in seconds)
---@return number expires Time at which the aura will expire; can be compared to GetTime() to determine time remaining
---@return string caster Unit which applied the aura. If the aura was applied by a unit that does not have a token but is controlled by one that does (e.g. a totem or another player's vehicle), returns the controlling unit. Returns nil if the casting unit (or its controller) has no unitID.
---@return any isStealable 1 if the aura can be transferred to a player using the Spellsteal spell; otherwise nil
---@return any shouldConsolidate 1 if the aura is eligible for the 'consolidated' aura display in the default UI.
---@return number spellID spellID of the aura
function UnitAura(unit, index, name, rank, filter) end

--- Returns information about a buff on a given unit or player. This function is an alias for UnitAura() with a built-in HELPFUL filter (which cannot be removed or negated with the HARMFUL filter).
---@param unit string A unit to query
---@param index number Index of an aura to query
---@param name string Name of an aura to query
---@param rank string Secondary text of an aura to query (often a rank; e.g. "Rank 7")
---@param filter any A list of filters to use separated by the pipe '|' character; e.g. "RAID|PLAYER" will query group buffs cast by the player ( string ) CANCELABLE - Show auras that can be cancelled NOT_CANCELABLE - Show auras that cannot be cancelled PLAYER - Show auras the player has cast RAID - Show auras the player can cast on party/raid members
---@return string name Name of the aura
---@return string rank Secondary text for the aura (often a rank; e.g. "Rank 7")
---@return string icon Path to an icon texture for the aura
---@return number count The number of times the aura has been applied
---@return any dispelType Type of aura (relevant for dispelling and certain other mechanics); nil if not one of the following values: ( string ) Curse Disease Magic Poison
---@return number duration Total duration of the aura (in seconds)
---@return number expires Time at which the aura will expire; can be compared to <a href='/docs/api/GetTime'>GetTime()</a> to determine time remaining
---@return string caster Unit which applied the aura. If the aura was applied by a unit that does not have a token but is controlled by one that does (e.g. a totem or another player's vehicle), returns the controlling unit. Returns nil if the casting unit (or its controller) has no unitID.
---@return any isStealable 1 if the aura can be transferred to a player using the Spellsteal spell; otherwise nil
function UnitBuff(unit, index, name, rank, filter) end

--- Returns information about a debuff on a unit. This function is an alias for UnitAura() with a built-in HARMFUL filter (which cannot be removed or negated with the HELPFUL filter).
---@param unit string A unit to query
---@param index number Index of an aura to query
---@param name string Name of an aura to query
---@param rank string Secondary text of an aura to query (often a rank; e.g. "Rank 7")
---@param filter any A list of filters to use separated by the pipe '|' character; e.g. "CANCELABLE|PLAYER" will query cancelable debuffs cast by the player ( string ) CANCELABLE - Show auras that can be cancelled NOT_CANCELABLE - Show auras that cannot be cancelled PLAYER - Show auras the player has cast RAID - Show auras the player can cast on party/raid members
---@return string name Name of the aura
---@return string rank Secondary text for the aura (often a rank; e.g. "Rank 7")
---@return string icon Path to an icon texture for the aura
---@return number count The number of times the aura has been applied
---@return any dispelType Type of aura (relevant for dispelling and certain other mechanics); nil if not one of the following values: ( string ) Curse Disease Magic Poison
---@return number duration Total duration of the aura (in seconds)
---@return number expires Time at which the aura will expire; can be compared to GetTime() to determine time remaining
---@return string caster Unit which applied the aura. If the aura was applied by a unit that does not have a token but is controlled by one that does (e.g. a totem or another player's vehicle), returns the controlling unit. Returns nil if the casting unit (or its controller) has no unitID.
---@return any isStealable 1 if the aura can be transferred to a player using the Spellsteal spell; otherwise nil
function UnitDebuff(unit, index, name, rank, filter) end



--==============================
-- CVar functions
--==============================

--- Returns the value of a configuration variable. Causes an error if the named CVar does not exist.
---@param cvar string Name of a CVar
---@return any string Value of the CVar
function GetCVar(cvar) end

--- Returns the absolute maximum value allowed for a configuration variable
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetCVarAbsoluteMax
function GetCVarAbsoluteMax() end

--- Returns the absolute minimum value allowed for a configuration variable
---@param cvar string Name of a CVar
---@return number min Absolute minimum value allowed for the CVar
function GetCVarAbsoluteMin(cvar) end

--- Returns the value of a configuration variable in a format compatible with Lua conditional expressions. All configuration variables are stored as strings; many CVars represent the state of a binary flag and are stored as either "1" or "0" . This function provides a convenient way to test the state of such variables without the extra syntax required to explicitly check for "1" or "0" values.
---@param cvar string Name of a CVar
---@return any value 1 if the CVar's value should be treated as true ; nil if it should be treated as false
function GetCVarBool(cvar) end

--- Returns the default value of a configuration variable. Causes an error if the named CVar does not exist.
---@param CVar string Name of a CVar
---@return string value Default value of the CVar
function GetCVarDefault(CVar) end

--- Returns information about a configuration variable
---@param cvar string Name of a CVar
---@return string value Current value of the CVar
---@return string defaultValue Default value of the CVar
---@return any serverStoredAccountWide 1 if the CVar's value is saved on the server and shared by all characters on the player's account; otherwise nil
---@return any serverStoredPerCharacter 1 if the CVar's value is saved on the server and specific to the current cahracter; otherwise nil
function GetCVarInfo(cvar) end

--- Returns the maximum recommended value for a configuration variable
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetCVarMax
function GetCVarMax() end

--- Returns the minimum recommended value for a configuration variable. Used in the default UI to set the lower bounds for options controlled by slider widgets.
---@param cvar string Name of a CVar
---@return number min Minimum value allowed for the CVar
function GetCVarMin(cvar) end

--- Registers a configuration variable to be saved
---@param cvar string Name of a CVar
---@param default string Default value of the CVar
function RegisterCVar(cvar, default) end

--- Sets the value of a configuration variable
---@param cvar string Name of the CVar to set
---@param value any New value for the CVar
---@param raiseEvent string If true, causes the CVAR_UPDATE event to fire
function SetCVar(cvar, value, raiseEvent) end



--==============================
-- Calendar functions
--==============================

--- Saves the event recently created (and selected for editing) to the calendar. Until this function is called, an event created with CalendarNewEvent() , CalendarNewGuildEvent() , or CalendarNewGuildAnnouncement() will not exist on the calendar -- that is, guild members or invitees will not see it, and it will not persist if the player closes the calendar, reloads the UI, or goes to view or edit another event.
function CalendarAddEvent() end

--- Returns whether the player can add an event to the calendar
---@return boolean canAdd True if the player can add an event to the calendar; otherwise false
function CalendarCanAddEvent() end

--- Returns whether the player can invite others to a calendar event
---@return boolean canInvite True if the player can invite others to a calendar event; otherwise false
function CalendarCanSendInvite() end

--- Deselects (ends viewing/editing on) an event. After calling this function, results of attempting to query or change event information are not guaranteed until a new event is created or another existing event is opened.
function CalendarCloseEvent() end

--- Clears the event selection used only for CalendarContext functions. The selection state cleared by this function is used only by other CalendarContext functions; other calendar event functions use the selection state set by CalendarOpenEvent , CalendarNewEvent , CalendarNewGuildEvent , or CalendarNewGuildAnnouncement (if they use a selection state at all).
function CalendarContextDeselectEvent() end

--- Returns whether the player can report an event invitation as spam. If all arguments are omitted, uses the event selected by CalendarContextSelectEvent .
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
---@return boolean canReport true if the player can report the event as spam; otherwise false
function CalendarContextEventCanComplain(monthOffset, day, index) end

--- Returns whether the player can edit an event
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
---@return boolean canEdit True if the player can edit the event
function CalendarContextEventCanEdit(monthOffset, day, index) end

--- Returns whether the player can paste an event
---@return boolean canPaste true if an event has been copied via CalendarContextEventCopy ; otherwise false
function CalendarContextEventClipboard() end

--- Reports an event invitation as spam
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
function CalendarContextEventComplain(monthOffset, day, index) end

--- Copies an event for later pasting
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
function CalendarContextEventCopy(monthOffset, day, index) end

--- Returns the type of a calendar event. If all arguments are omitted, uses the event selected by CalendarContextSelectEvent .
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
---@return any calendarType Token identifying the type of event ( string ) GUILD_ANNOUNCEMENT - Guild announcement (does not allow players to sign up) GUILD_EVENT - Guild event (allows players to sign up) HOLIDAY - World event (e.g. Lunar Festival, Darkmoon Faire, Stranglethorn Fishing Tournament, Call to Arms: Arathi Basin) PLAYER - Player-created event or invitation RAID_LOCKOUT - Indicates when one of the player's saved instances resets RAID_RESET - Indicates scheduled reset times for major raid instances SYSTEM - Other server-provided event
function CalendarContextEventGetCalendarType(monthOffset, day, index) end

--- Pastes a copied event into a given date. Does nothing if no event has been copied via CalendarContextEventCopy .
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month
---@param day number Day of the month
function CalendarContextEventPaste(monthOffset, day) end

--- Deletes an event from the calendar
--- Flags: confirmation
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
function CalendarContextEventRemove(monthOffset, day, index) end

--- Signs the player up for a guild event
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextEventSignUp(monthOffset, day, index) end

--- Returns the month, day, and index of the event selection used only for CalendarContext functions. The selection state referenced by this function is used only by other CalendarContext functions; other calendar event functions use the selection state set by CalendarOpenEvent , CalendarNewEvent , CalendarNewGuildEvent , or CalendarNewGuildAnnouncement (if they use a selection state at all).
---@return any monthOffset Month relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month
---@return number day Day of the month
---@return number index Index of the event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextGetEventIndex() end

--- Accepts an event invitation
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextInviteAvailable(monthOffset, day, index) end

--- Declines an event invitation
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextInviteDecline(monthOffset, day, index) end

--- Returns whether the player has been invited to an event and not yet responded
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return boolean pendingInvite True if the player is invited to the event and has yet to respond; otherwise false
function CalendarContextInviteIsPending(monthOffset, day, index) end

--- Returns the player's moderator status for an event
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return any modStatus The player's level of authority for the event, or "" if not applicable ( number ) CREATOR - The player is the original creator of the event MODERATOR - The player has been granted moderator status for the event
function CalendarContextInviteModeratorStatus(monthOffset, day, index) end

--- Removes an invitation from the player's calendar or removes the player from a guild event's signup list
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextInviteRemove(monthOffset, day, index) end

--- Returns the player's invite status for an event
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return any inviteStatus The player's status regarding the event ( number ) 1 - Invited (also used for non-invitation/non-signup events) 2 - Accepted 3 - Declined 4 - Confirmed 5 - Out 6 - Standby 7 - Signed up 8 - Not signed up
function CalendarContextInviteStatus(monthOffset, day, index) end

--- Returns the invite type for an event
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return any inviteType Invitation/announcement type for the event ( number ) 1 - Characters can only be explicitly invited to the event (or event is a non-invite/non-signup event) 2 - Event is visible to the player's entire guild; guild members can sign up and other characters can be explicitly invited
function CalendarContextInviteType(monthOffset, day, index) end

--- Selects an event for use only with other CalendarContext functions. The selection state set by this function is used only by other CalendarContext functions; other calendar event functions use the selection state set by CalendarOpenEvent , CalendarNewEvent , CalendarNewGuildEvent , or CalendarNewGuildAnnouncement (if they use a selection state at all).
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextSelectEvent(monthOffset, day, index) end

--- Returns default options for the guild member Mass Invite filter
---@return number minLevel Lowest level of characters to invite
---@return number maxLevel Highest level of characters to invite
---@return number rank Lowest guild rank of characters to invite
function CalendarDefaultGuildFilter() end

--- Accepts invitation to the selected calendar event. Only applies to player-created events and invitations sent by other players; has no effect if the current calendar event is of another type.
function CalendarEventAvailable() end

--- Returns whether the player can edit the selected calendar event
---@return boolean canEdit True if the player can edit the current event; otherwise false
function CalendarEventCanEdit() end

--- Returns whether an event invitee can be granted moderator authority
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites() )
---@return boolean canModerate True if the given character can be given moderator authority for the event; otherwise false
function CalendarEventCanModerate(index) end

--- Disables the auto-approve feature (currently unused) for the selected calendar event
function CalendarEventClearAutoApprove() end

--- Unlocks the selected calendar event. Locked events do not allow invitees to respond or guild members to sign up, but can still be edited.
function CalendarEventClearLocked() end

--- Removes moderator status from a character on the selected event's invite/signup list. Moderators can change the status of characters on the invite/signup list and invite more characters, but cannot otherwise edit the event.
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
function CalendarEventClearModerator(index) end

--- Declines invitation to the selected calendar event. Only applies to player-created events and invitations sent by other players; has no effect if the current calendar event is of another type.
function CalendarEventDecline() end

--- Returns the type of the selected calendar event
---@return any calendarType Token identifying the type of event ( string ) GUILD_ANNOUNCEMENT - Guild announcement (does not allow players to sign up) GUILD_EVENT - Guild event (allows players to sign up) PLAYER - Player-created event or invitation
function CalendarEventGetCalendarType() end

--- Returns information about an entry in the selected event's invite/signup list
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites() )
---@return string name Name of the character
---@return number level The character's current level
---@return string className Localized name of the character's class
---@return string classFileName Non-localized token representing the character's class
---@return any inviteStatus The character's status regarding the event ( number ) 1 - Invited 2 - Accepted 3 - Declined 4 - Confirmed 5 - Out 6 - Standby 7 - Signed up
---@return any modStatus The character's level of authority for the event, or "" if not applicable ( number ) CREATOR - The character is the original creator of the event MODERATOR - The character has been granted moderator status for the event
---@return boolean inviteIsMine True if this list entry represents the player; otherwise false
---@return any inviteType Invitation/announcement type for the event ( number ) 1 - Characters can only be explicitly invited to the event 2 - Event is visible to the player's entire guild; guild members can sign up and other characters can be explicitly invited
function CalendarEventGetInvite(index) end

--- Returns the time at which a character on the selected event's invite/signup list responded. Returns all zeros if the character has not yet responded or is the event's creator.
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
---@return number hour Hour part of the time (on a 24-hour clock)
---@return number minute Minute part of the time
function CalendarEventGetInviteResponseTime(index) end

--- Returns the current sort mode for the event invite/signup list
---@return any criterion Token identifying the attribute used for sorting the list ( string ) class - Sorted by character class (according to the global table CLASS_SORT_ORDER ) name - Sorted by character name status - Sorted by invite status
---@return boolean reverse True if the list is sorted in reverse order; otherwise false
function CalendarEventGetInviteSortCriterion() end

--- Returns the number of characters on the selected calendar event's invite/signup list
---@return number numInvites Number of characters on the event's invite/signup list
function CalendarEventGetNumInvites() end

--- Returns a list of localized event repetition option labels (currently unused)
function CalendarEventGetRepeatOptions() end

--- Returns the index of the selected entry on the selected event's invite/signup list. In the current default UI, selection behavior in the invite list is implemented but disabled; selecting an invite list entry has no effect on the behavior of other APIs.
---@return number index Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites()), or 0 if no selection has been made
function CalendarEventGetSelectedInvite() end

--- Returns a list of localized invite status labels
function CalendarEventGetStatusOptions() end

--- Returns a list of instance names and icons for dungeon or raid events
---@param eventType any Type (display style) of event to query ( number ) 1 - Raid dungeon 2 - Five-player dungeon
---@return string name Name of an instance (may include heroic designation)
---@return string icon Unique part of the path to the instance's icon texture; for the full path, prepend with "Interface\LFGFrame\LFGIcon-"
---@return number expansion Expansion to which the instance belongs; localized names can be found in the constants EXPANSION_NAME0 , EXPANSION_NAME1 , etc.
function CalendarEventGetTextures(eventType) end

--- Returns a list of event display style labels
function CalendarEventGetTypes() end

--- Returns whether the player has been invited to the selected event and not yet responded
---@return boolean pendingInvite True if the player has been invited to the event and not yet responded; otherwise false
function CalendarEventHasPendingInvite() end

--- Returns whether the selected event has unsaved changes
---@return boolean settingsChanged True if any of the event's attributes have been changed since the event was last saved; otherwise false
function CalendarEventHaveSettingsChanged() end

--- Attempts to invite a character to the selected event. If successful, the CALENDAR_UPDATE_INVITE_LIST event fires indicating the character has been added to the invite list; otherwise the CALENDAR_UPDATE_ERROR event fires containing a localized error message.
---@param name string Name of a character to invite
function CalendarEventInvite(name) end

--- Returns whether the player has moderator status for the selected calendar event. Also returns true if the player is the event's creator.
---@return boolean isModerator True if the player has moderator status for the event; otherwise false
function CalendarEventIsModerator() end

--- Removes a character from the selected event's invite/signup list. Cannot be used to remove the event's creator (fires a CALENDAR_UPDATE_ERROR event with nil error message if such is attempted).
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
function CalendarEventRemoveInvite(index) end

--- Selects an entry in the selected event's invite/signup list. In the current default UI, selection behavior in the invite list is implemented but disabled; selecting an invite list entry has no effect on the behavior of other APIs.
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
function CalendarEventSelectInvite(index) end

--- Enables the auto-approve feature (currently unused) for the selected calendar event
function CalendarEventSetAutoApprove() end

--- Changes the scheduled date of the selected calendar event
---@param month number Index of the month (starting at 1 = January)
---@param day number Day of the month
---@param year number Year (full four-digit year)
function CalendarEventSetDate(month, day, year) end

--- Changes the descriptive text for the selected event
function CalendarEventSetDescription() end

--- Locks the selected calendar event. Locked events do not allow invitees to respond or guild members to sign up, but can still be edited.
function CalendarEventSetLocked() end

--- Changes the lockout date associated with the selected event (currently unused). This feature is not enabled in the current version of World of Warcraft; saving an event in which the lockout date has been changed will revert it to its default of 1, 1, 1, 2000 (January 1, 2000).
---@param month number Index of the month (starting at 1 = January)
---@param day number Day of the month
---@param year number Year (full four-digit year)
function CalendarEventSetLockoutDate(month, day, year) end

--- Changes the lockout time associated with the selected event (currently unused). This feature is not enabled in the current version of World of Warcraft; saving an event in which the lockout time has been changed will revert it to its default of 0, 0 (midnight).
---@param hour number Hour part of the time (on a 24-hour clock)
---@param minute number Minute part of the time
function CalendarEventSetLockoutTime(hour, minute) end

--- Grants moderator status to a character on the selected event's invite/signup list. Moderators can change the status of characters on the invite/signup list and invite more characters, but cannot otherwise edit the event.
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
function CalendarEventSetModerator(index) end

--- Changes the repetition option for the selected event (currently unused). This feature is not enabled in the current version of World of Warcraft; saving an event in which the repeat option has been changed will revert it to its default of 1 (Never).
---@param title number Index of a repeating event option; see CalendarEventGetRepeatOptions()
function CalendarEventSetRepeatOption(title) end

--- Changes the maximum number of invites/signups for the selected event (currently unused). This feature is not enabled in the current version of World of Warcraft; saving an event in which the max size has been changed will revert it to its default of 100.
---@param size number Maximum number of invites/signups for the event
function CalendarEventSetSize(size) end

--- Sets the status of a character on the selected event's invite/signup list
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
---@param inviteStatus any The player's status regarding the event ( number ) 1 - Invited (also used for non-invitation/non-signup events) 2 - Accepted 3 - Declined 4 - Confirmed 5 - Out 6 - Standby 7 - Signed up 8 - Not signed up
function CalendarEventSetStatus(index, inviteStatus) end

--- Changes the raid or dungeon instance for the selected event. Only applicable if the event's eventType is set to 1 or 2 (see CalendarEventSetType ).
---@param index number Index of a dungeon or raid instance
function CalendarEventSetTextureID(index) end

--- Changes the scheduled time of the selected event
---@param hour number Hour part of the time (on a 24-hour clock)
---@param minute number Minute part of the time
function CalendarEventSetTime(hour, minute) end

--- Changes the title for the selected event
---@param title string A title to be displayed for the event
function CalendarEventSetTitle(title) end

--- Changes the display type of the selected event
---@param eventType any Display type for the event; used in the default UI to determine which icon to show ( number ) 1 - Raid dungeon 2 - Five-player dungeon 3 - PvP event 4 - Meeting 5 - Other event
function CalendarEventSetType(eventType) end

--- Signs the player up for the selected calendar event. Only applies to guild events; has no effect if called when the current calendar event is not a guild event.
function CalendarEventSignUp() end

--- Sorts the event invite/signup list. Does not cause the list to automatically remain sorted; e.g. if sorted by status and a character's status is changed, the list will not be resorted until this function is called again.
---@param criterion any Token identifying the attribute to use for sorting the list ( string ) class - Sort by character class (according to the global table CLASS_SORT_ORDER ) name - Sort by character name status - Sort by invite status
---@param reverse boolean True to sort the lis in reverse order; otherwise false
function CalendarEventSortInvites(criterion, reverse) end

--- Returns date information for a given month and year. Note: This function is broken in WoW 3.1.1, but is expected to work as described in WoW Patch 3.2.0 and later.
---@param month number Index of a month (starting at 1 = January)
---@param year number Year (full four-digit year)
---@return number month Index of the month (starting at 1 = January)
---@return number year Year (full four-digit year)
---@return number numDays Number of days in the month
---@return number firstWeekday Index of the weekday (starting at 1 = Sunday) for the first day of the month
function CalendarGetAbsMonth(month, year) end

--- Returns the current date (in the server's time zone). Only returns valid information after the PLAYER_LOGIN event has fired.
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
function CalendarGetDate() end

--- Returns information about a calendar event on a given day. Information can only be retrieved for events which might be visible in the calendar's current month -- i.e. those in the current month as well as those in (roughly) the last week of the previous month and (roughly) the first two weeks of the following month. To reliably retrieve information for events outside the calendar's current month, first change the calendar's month with CalendarSetMonth .
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return string title Title displayed for the event
---@return number hour Hour part of the event's start time (on a 24-hour clock)
---@return number minute Minute part of the event's start time
---@return any calendarType Token identifying the type of event ( string ) GUILD_ANNOUNCEMENT - Guild announcement (does not allow players to sign up) GUILD_EVENT - Guild event (allows players to sign up) HOLIDAY - World event (e.g. Lunar Festival, Darkmoon Faire, Stranglethorn Fishing Tournament, Call to Arms: Arathi Basin) PLAYER - Player-created event or invitation RAID_LOCKOUT - Indicates when one of the player's saved instances resets RAID_RESET - Indicates scheduled reset times for major raid instances SYSTEM - Other server-provided event
---@return any sequenceType Display cue for multi-day events, or "" if not applicable ( string ) END - Last day of the event INFO - An additional specially-labeled day related the event ONGOING - Continuation of the event START - First day of the event
---@return any eventType Display type for the event; used in the default UI to determine which icon to show ( number ) 0 - Holiday or other server-provided event 1 - Raid dungeon 2 - Five-player dungeon 3 - PvP event 4 - Meeting 5 - Other event
---@return string texture Unique portion of the path to a texture for the event (e.g. "Calendar ChildrensWeek"). The mechanism by which a full texture path can be generated is not public API, but can be found in Addons/Blizzard Calendar/Blizzard_Calendar.lua after extracting default UI files with the AddOn Kit.
---@return any modStatus The player's level of authority for the event, or "" if not applicable ( number ) CREATOR - The player is the original creator of the event MODERATOR - The player has been granted moderator status for the event
---@return any inviteStatus The player's status regarding the event ( number ) 1 - Invited (also used for non-invitation/non-signup events) 2 - Accepted 3 - Declined 4 - Confirmed 5 - Out 6 - Standby 7 - Signed up 8 - Not signed up
---@return string invitedBy Name of the character who created (or invited the player to) the event
---@return any difficulty Difficulty of the dungeon or raid instance associated with the event (used only for RAID_LOCKOUT and RAID_RESET events, not player-created raid/dungeon events) ( number ) 1 - Normal 2 - Heroic
---@return any inviteType Invitation/announcement type for the event ( number ) 1 - Characters can only be explicitly invited to the event (or event is a non-invite/non-signup event) 2 - Event is visible to the player's entire guild; guild members can sign up and other characters can be explicitly invited
function CalendarGetDayEvent(monthOffset, day, index) end

--- Returns the month, day, and index of the selected calendar event
---@return any monthOffset Month relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month
---@return number day Day of the month
---@return number index Index of the event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarGetEventIndex() end

--- Returns information about the selected calendar event (for player/guild events)
---@return string title Title displayed for the event
---@return string description Descriptive text about the event
---@return string creator Name of the character who created the event
---@return any eventType Display style for the event; used in the default UI to determine which icon to show ( number ) 1 - Raid dungeon 2 - Five-player dungeon 3 - PvP event 4 - Meeting 5 - Other event
---@return number repeatOption Index of an event repetition option (see CalendarEventGetRepeatOptions); currently unused (always 1)
---@return number maxSize Maximum number of invites/signups; currently unused (always 100)
---@return number textureIndex Index of the dungeon or raid instance (between 1 and select("#", CalendarEventGetTextures(eventType)) / 3
---@return number weekday Index of the day of the week on which the event starts (starting at 1 = Sunday)
---@return number month Index of the month in which the event starts (starting at 1 = January)
---@return number day Day of the month on which the event starts
---@return number year Year in which the event starts (full four-digit year)
---@return number hour Hour part of the event's start time (on a 24-hour clock)
---@return number minute Minute part of the event's start time
---@return number lockoutWeekday Currently unused
---@return number lockoutMonth Currently unused
---@return number lockoutDay Currently unused
---@return number lockoutYear Currently unused
---@return number lockoutHour Currently unused
---@return number lockoutMinute Currently unused
---@return any locked 1 if the event is locked (preventing invitees from responding); otherwise nil
---@return any autoApprove 1 if signups to the event should be automatically approved (currently unused); otherwise nil
---@return any pendingInvite 1 if the player has been invited to this event and has not yet responded; otherwise nil
---@return any inviteStatus The player's status regarding the event ( number ) 1 - Invited 2 - Accepted 3 - Declined 4 - Confirmed 5 - Out 6 - Standby 7 - Signed up 8 - Not signed up
---@return any inviteType Invitation/announcement type for the event ( number ) 1 - Player has been explicitly invited to the event and can accept or decline 2 - Event is visible to the player's entire guild; player can sign up if desired
---@return any calendarType Token identifying the type of event ( string ) GUILD_ANNOUNCEMENT - Guild announcement (does not allow players to sign up) GUILD_EVENT - Guild event (allows players to sign up) PLAYER - Player-created event or invitation SYSTEM - Other server-provided event
function CalendarGetEventInfo() end

--- Returns the index of the first invitation on a given day to which the player has not responded
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month)
---@param day number Day of the month to query
---@return number index Index of the event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarGetFirstPendingInvite(monthOffset, day) end

--- Returns additional information about a holiday event. Information can only be retrieved for events which might be visible in the calendar's current month -- i.e. those in the current month as well as those in (roughly) the last week of the previous month and (roughly) the first two weeks of the following month. To reliably retrieve information for events outside the calendar's current month, first change the calendar's month with CalendarSetMonth .
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month)
---@param day number Day of the month to query
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return string name Localized name of the event
---@return string description Localized text describing the event
---@return string texture Unique portion of the path to a texture for the event (e.g. "Calendar ChildrensWeek"). The mechanism by which a full texture path can be generated is not public API, but can be found in Addons/Blizzard Calendar/Blizzard_Calendar.lua after extracting default UI files with the AddOn Kit.
function CalendarGetHolidayInfo(monthOffset, day, index) end

--- Returns the latest date for which events may be scheduled. Currently, events can only be created up to one year from the last day of the current month (e.g. If the current date is May 19, 2009, the player is not allowed to create events scheduled for later than May 31, 2010). The default Calendar UI also does not allow viewing months beyond this date.
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
function CalendarGetMaxCreateDate() end

--- Returns the latest date usable in the calendar system. This function currently always returns December 31st, 2030 as the max date.
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
function CalendarGetMaxDate() end

--- Returns the earliest date usable in the calendar system. This function currently returns November 24th, 2004 as the minimum date.  This is the date that World of Warcraft was launched in the U.S.
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
function CalendarGetMinDate() end

--- Returns the earliest date for which information about past player events is available. Applies to events created by the player, invites the player accepted, and guild events or announcements. Currently, the default UI only shows past events from up to two weeks before the current date.
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
function CalendarGetMinHistoryDate() end

--- Returns information about a calendar month
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month). Defaults to the calendar's current month if omitted.
---@return number month Index of the month (starting at 1 = January)
---@return number year Year (full four-digit year)
---@return number numDays Number of days in the month
---@return number firstWeekday Index of the weekday (starting at 1 = Sunday) for the first day of the month
function CalendarGetMonth(monthOffset) end

--- Returns a list of localized month names
function CalendarGetMonthNames() end

--- Returns the number of calendar events on a given day
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month)
---@param day number Day of the month to query
---@return number numEvents Number of events on the given day
function CalendarGetNumDayEvents(monthOffset, day) end

--- Returns the number of calendar invitations to which the player has yet to respond
---@return number numInvites Number of pending calendar invitations
function CalendarGetNumPendingInvites() end

--- Returns information about a raid lockout or scheduled raid reset event. Information can only be retrieved for events which might be visible in the calendar's current month -- i.e. those in the current month as well as those in (roughly) the last week of the previous month and (roughly) the first two weeks of the following month. To reliably retrieve information for events outside the calendar's current month, first change the calendar's month with CalendarSetMonth .
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month)
---@param day number Day of the month to query
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return number title Title displayed for the event
---@return any calendarType Token identifying the type of event ( string ) RAID_LOCKOUT - Indicates when one of the player's saved instances resets RAID_RESET - Indicates scheduled reset times for major raid instances
---@return number raidID ID number of the instance to which the player is saved, or 0 if not applicable
---@return number hour Hour part of the time at which the instance resets (on a 24-hour clock)
---@return number minute Minute part of the time at which the instance resets
---@return any difficulty Difficulty of the dungeon or raid instance associated with the event ( number ) 1 - Normal 2 - Heroic
function CalendarGetRaidInfo(monthOffset, day, index) end

--- Returns a list of localized weekday names
function CalendarGetWeekdayNames() end

--- Returns whether an update to calendar information is in progress. Returns true while the client is synchronizing its calendar information from the server; e.g. after calling CalendarOpenEvent, CalendarAddEvent, or CalendarUpdateEvent. During such periods, using other calendar API functions to query or change event information may not have valid orexpected results.
---@return boolean isPending True if an update to calendar information is in progress; otherwise false
function CalendarIsActionPending() end

--- Repopulates the current event's invite list with members of one of the player's arena teams. Clears any invites already listed. Can only be used for events not yet created (i.e. saved to the calendar).
---@param index any Index of an arena team type ( number ) 1 - 2v2 team 2 - 3v3 team 3 - 5v5 team
function CalendarMassInviteArenaTeam(index) end

--- Repopulates the selected event's invite list with members of the player's guild. Clears any invites already listed. Can only be used for events not yet created (i.e. saved to the calendar).
---@param minLevel number Lowest level of characters to invite
---@param maxLevel number Highest level of characters to invite
---@param rank number Lowest guild rank of characters to invite
function CalendarMassInviteGuild(minLevel, maxLevel, rank) end

--- Creates a new event and selects it for viewing/editing
function CalendarNewEvent() end

--- Creates a new guild announcement and selects it for viewing/editing. Guild announcements are visible to all guild members but do not allow signups or invitations.
function CalendarNewGuildAnnouncement() end

--- Creates a new guild event and selects it for viewing/editing. Guild events are visible to all guild members and allow members to sign up (or non-members to be invited).
function CalendarNewGuildEvent() end

--- Selects a calendar event for viewing/editing
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month)
---@param day number Day of the month to query
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarOpenEvent(monthOffset, day, index) end

--- Removes the selected event invitation from the player's calendar or removes the player from the selected guild event's signup list. NOTE: May disconnect the player if called when the selected calendar event is not a received invitation or a guild event.
function CalendarRemoveEvent() end

--- Set's the calendar's month to an absolute date
---@param month number Index of the month (starting at 1 = January)
---@param year number Year (full four-digit year); uses current year if omitted
function CalendarSetAbsMonth(month, year) end

--- Sets the calendar's month relative to its current month
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month
function CalendarSetMonth(monthOffset) end

--- Saves changes made to the selected event. Until this function is called, changes made to an event will not be saved -- they will not propagate to guild members or invitees, and the event will revert to its previous state if the player closes the calendar, reloads the UI, or goes to view or edit another event.
function CalendarUpdateEvent() end

--- Returns whether the player is allowed to edit guild-wide calendar events
---@return any canEdit 1 if the player can create or edit guild calendar events, otherwise nil
function CanEditGuildEvent() end

--- Queries the server for calendar status information. May cause one or more CALENDAR_UPDATE_* events to fire depending on the contents of the player's calendar. In the default UI, called when the calendar is shown.
--- Flags: server
function OpenCalendar() end



--==============================
-- Camera functions
--==============================

--- Begins camera movement or selection (equivalent to left-clicking in the 3-D world). After calling this function (i.e. while the left mouse button is held), cursor movement rotates the camera. Final results vary by context and are determined when calling CameraOrSelectOrMoveStop() (i.e. releasing the left mouse button).
--- Flags: protected
function CameraOrSelectOrMoveStart() end

--- Ends action initiated by CameraOrSelectOrMoveStart . After calling this function (i.e. releasing the left mouse button), camera movement stops and normal cursor movement resumes. If the cursor has not moved significantly since calling CameraOrSelectOrMoveStart() (i.e. pressing the left mouse button) and is over a unit, that unit becomes the player's target; if the cursor has not moved significantly and is not over a unit, clears the player's target unless the "Sticky Targeting" option is enabled (i.e. the "deselectOnClick" CVar is 0).
--- Flags: protected
---@param isSticky any If 1, the camera will remain static until cancelled. Otherwise, the camera will pan back to be directly behind the character
function CameraOrSelectOrMoveStop(isSticky) end

--- Zooms the camera in by a specified distance.
---@param distance number The distance to zoom in
function CameraZoomIn(distance) end

--- Zooms the camera out by a specified distance.
---@param distance number The distance to zoom out
function CameraZoomOut(distance) end

--- Rotates the camera around the player
---@param degrees number The number of degrees to rotate; positive for counter-clockwise, negative for clockwise.
function FlipCameraYaw(degrees) end

--- Returns whether mouselook mode is active
---@return boolean isLooking True if mouselook mode is active; otherwise false
function IsMouselooking() end

--- Enables mouselook mode, in which cursor movement rotates the camera
function MouselookStart() end

--- Disables mouselook mode
function MouselookStop() end

--- Begins orbiting the camera downward (to look upward)
function MoveViewDownStart() end

--- Ends camera movement initiated by MoveViewDownStart
function MoveViewDownStop() end

--- Begins zooming the camera inward (towards/through the player character)
function MoveViewInStart() end

--- Ends camera movement initiated by MoveViewInStart
function MoveViewInStop() end

--- Begins orbiting the camera around the player character to the left. "Left" here is relative to the player's facing; i.e. the camera orbits clockwise if looking down. Moving the camera to the left causes it to look towards the character's right.
function MoveViewLeftStart() end

--- Ends camera movement initiated by MoveViewLeftStart
function MoveViewLeftStop() end

--- Begins zooming the camera outward (away from the player character)
function MoveViewOutStart() end

--- Ends camera movement initiated by MoveViewOutStart
function MoveViewOutStop() end

--- Begins orbiting the camera around the player character to the right. "Right" here is relative to the player's facing; i.e. the camera orbits counter--clockwise if looking down. Moving the camera to the right causes it to look towards the character's left.
function MoveViewRightStart() end

--- Ends camera movement initiated by MoveViewRightStart
function MoveViewRightStop() end

--- Begins orbiting the camera upward (to look down)
function MoveViewUpStart() end

--- Ends camera movement initiated by MoveViewUpStart
function MoveViewUpStop() end

--- Moves the camera to the next predefined setting. There are five "slots" for saved camera settings, indexed 1-5. These views can be set and accessed directly using SaveView() and SetView() , and cycled through using NextView() and PrevView() .
function NextView() end

--- Moves the camera to the previous predefined setting. There are five "slots" for saved camera settings, indexed 1-5. These views can be set and accessed directly using SaveView() and SetView() , and cycled through using NextView() and PrevView() .
function PrevView() end

--- Resets a saved camera setting to default values. There are five "slots" for saved camera settings, indexed 1-5. These views can be set and accessed directly using SaveView() and SetView() , and cycled through using NextView() and PrevView() .
---@param index number Index of a saved camera setting (between 1 and 5)
function ResetView(index) end

--- Saves the current camera settings. There are five "slots" for saved camera settings, indexed 1-5. These views can be set and accessed directly using SaveView() and SetView() , and cycled through using NextView() and PrevView() .
---@param index number Index of a saved camera setting (between 1 and 5)
function SaveView(index) end

--- Moves the camera to a saved camera setting. There are five "slots" for saved camera settings, indexed 1-5. These views can be set and accessed directly using SaveView() and SetView() , and cycled through using NextView() and PrevView() .
---@param index number Index of a saved camera setting (between 1 and 5)
function SetView(index) end



--==============================
-- Channel functions
--==============================

--- Adds a chat channel to the saved list of those displayed in a chat window. Used by the default UI's function ChatFrame_AddChannel() which manages the set of channel messages shown in a displayed ChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param channel number Name of a chat channel
---@return number zoneChannel 0 for non-zone channels, otherwise a numeric index specific to that channel
function AddChatWindowChannel(index, channel) end

--- Bans a character from a chat channel. Has no effect unless the player is a moderator of the given channel
---@param channel string Name of the channel
---@param fullname string Name of the character to be banned
function ChannelBan(channel, fullname) end

--- Invites a character to join a chat channel
---@param channel string Name of a channel
---@param name string Name of a character to invite
function ChannelInvite(channel, name) end

--- Removes a player from the channel. Has no effect unless the player is a moderator of the given channel
---@param channel string Name of the channel
---@param fullname string Name of the character to kick
function ChannelKick(channel, fullname) end

--- Grants a character moderator status in a chat channel. Has no effect unless the player is the owner of the given channel
---@param channel string Name of the channel
---@param fullname string Name of the character to promote to moderator
function ChannelModerator(channel, fullname) end

--- Grants a character ability to speak in a moderated chat channel
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param name string Name of a character to mute
function ChannelMute(channelName, channelId, name) end

--- Silences a character for chat and voice on a channel
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param unit string Unit to silence
---@param name string Name of a character to silence
function ChannelSilenceAll(channelName, channelId, unit, name) end

--- Silences the given character for voice chat on the channel. Only a raid/party/battleground leader or assistant can silence a player.
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param unit string Unit to silence
---@param name string Name of a character to silence
function ChannelSilenceVoice(channelName, channelId, unit, name) end

--- Enables or disables printing of join/leave announcements for a channel
---@param channel string Name of the channel for which to enable or disable announcements
function ChannelToggleAnnouncements(channel) end

--- Unsilences a character for chat and voice on a channel
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param unit string Unit to unsilence
---@param name string Name of a character to unsilence
function ChannelUnSilenceAll(channelName, channelId, unit, name) end

--- Unsilences a character on a chat channel
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param unit string Unit to unsilence
---@param name string Name of a character to unsilence
function ChannelUnSilenceVoice(channelName, channelId, unit, name) end

--- Lifts the ban preventing a character from joining a chat channel. Has no effect unless the player is a moderator of the given channel
---@param channel string Name of the channel
---@param fullname string Name of the character to for which to lift the ban
function ChannelUnban(channel, fullname) end

--- Revokes moderator status from a character on a chat channel. Has no effect unless the player is the owner of the given channel
---@param channel string Name of the channel
---@param fullname string Name of the character to demote from moderator
function ChannelUnmoderator(channel, fullname) end

--- Removes a character's ability to speak in a moderated chat channel
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param name string Name of a character to unmute
function ChannelUnmute(channelName, channelId, name) end

--- Disables voice chat in a channel
---@param channel string Name of a channel
---@param channelIndex number Index of a channel
function ChannelVoiceOff(channel, channelIndex) end

--- Enables voice chat in a channel
---@param channel string Name of a channel
---@param channelIndex number Index of a channel
function ChannelVoiceOn(channel, channelIndex) end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function ClearChannelWatch() end

--- Collapses a group header in the chat channel listing
---@param index number Index of a header in the display channel list (between 1 and GetNumDisplayChannels() )
function CollapseChannelHeader(index) end

--- Declines an invitation to a chat channel. Usable in response to the CHANNEL_INVITE_REQUEST event which fires when the player is invited to join a chat channel.
---@param channel string Name of a chat channel
function DeclineInvite(channel) end

--- Requests information from the server about a channel's owner. Fires the CHANNEL_OWNER event indicating the name of the channel owner.
--- Flags: server
---@param channel string Name of a channel
---@param channelIndex number Index of a channel
function DisplayChannelOwner(channel, channelIndex) end

--- Disables voice in a channel specified by its position in the channel list display
---@param index number Index of a channel in the channel list display (between 1 and GetNumDisplayChannels() )
function DisplayChannelVoiceOff(index) end

--- Enables voice in a channel specified by its position in the channel list display
---@param index number Index of a channel in the channel list display (between 1 and GetNumDisplayChannels() )
function DisplayChannelVoiceOn(index) end

--- Returns the available server channel names
function EnumerateServerChannels() end

--- Expands a group header in the chat channel listing
---@param index number Index of a header in the display channel list (between 1 and GetNumDisplayChannels() )
function ExpandChannelHeader(index) end

--- Returns the currently active voice channel
---@return number index Index of the active voice channel in the chat display window (between 1 and GetNumDisplayChannels() ), or nil if no channel is active
function GetActiveVoiceChannel() end

--- Returns information about an entry in the channel list display
---@param index number Index of an entry in the channel list display (between 1 and GetNumDisplayChannels() )
---@return string name Name of the channel or header
---@return any header 1 if the entry is a group header; otherwise nil
---@return any collapsed 1 if the entry is a collapsed group header; otherwise nil
---@return number channelNumber Number identifying the channel (as returned by GetChannelList() and used by SendChatMessage() and other channel functions)
---@return number count Number of characters in the channel
---@return any active 1 if the channel is currently active; otherwise nil. (Used for special server channels, e.g. "Trade" and "LookingForGroup", which can only be used under certain conditions)
---@return any category Category to which the chat channel belongs ( string ) CHANNEL_CATEGORY_CUSTOM - Custom channels created by players CHANNEL_CATEGORY_GROUP - Group channels (party, raid, battleground) CHANNEL_CATEGORY_WORLD - World channels
---@return any voiceEnabled 1 if voice chat is enabled for the channel; otherwise nil
---@return any voiceActive 1 if voice chat is active for the channel; otherwise nil
function GetChannelDisplayInfo(index) end

--- Returns the list of the channels the player has joined
---@return number index Index of the channel
---@return string channel Name of the channel
function GetChannelList() end

--- Returns information about a chat channel
---@param channelIndex number A channel ID
---@param channelName string A channel name
---@return number channel ID of the channel
---@return string channelName Name of the channel
---@return number instanceID The channel's instance ID, or 0 if there are not separate instances of the channel.
function GetChannelName(channelIndex, channelName) end

--- Returns information about a character in a chat channel in the channel list display
---@param index number Index of a channel in the channel list display (between 1 and GetNumDisplayChannels() )
---@param rosterIndex number Index of a participant in the channel (between 1 and count , where count = select(5, GetChannelDisplayInfo (index) )
---@return string name Name of the character
---@return any owner 1 if the character is the channel owner; otherwise nil
---@return any moderator 1 if the character is a channel moderator; otherwise nil
---@return any muted 1 if the character is muted; otherwise nil
---@return any active 1 if the character is currently speaking in the channel; otherwise nil
---@return any enabled 1 if the character has voice chat active for the channel; otherwise nil
function GetChannelRosterInfo(index, rosterIndex) end

--- Returns the saved list of channels to which a chat window is subscribed
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@return string channelName Name of the channel
---@return number channelId Numeric id for the channel
function GetChatWindowChannels(index) end

--- Returns the number of members in a chat channel
---@param id number Numeric identifier of a chat channel
---@return number numMembers Number of characters in the channel
function GetNumChannelMembers(id) end

--- Returns the number of entries in the channel list display
---@return number channelCount Number of channels and group headers to be displayed in the channel list
function GetNumDisplayChannels() end

--- Returns the selected channel in the channel list display
---@return number index Index of the selected channel in the display channel list (between 1 and GetNumDisplayChannels() )
function GetSelectedDisplayChannel() end

--- Returns whether the player is a moderator of the selected channel in the channel list display
---@return any isModerator 1 if the player is a moderator of the selected channel; otherwise nil
function IsDisplayChannelModerator() end

--- Returns whether the player is the owner of the selected channel in the channel list display
---@return any isOwner 1 if the player is the owner of the selected channel; otherwise nil
function IsDisplayChannelOwner() end

--- Returns whether a character is silenced on a chat channel
---@param name string Name of a character
---@param channel string Name of a chat channel
---@return any isSilenced 1 if the character is silenced on the given channel; otherwise nil
function IsSilenced(name, channel) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function JoinChannelByName() end

--- Joins a channel, saving associated chat window settings
---@param name string Name of the channel to join
---@param password string Password to use when joining
---@param chatFrameIndex number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS ) in which to subscribe to the channel
---@param enableVoice boolean True to enable voice in the channel; otherwise false
---@return number zoneChannel 0 for non-zone channels, otherwise a numeric index specific to that channel
---@return string channelName Display name of the channel, if the channel was a zone channel
function JoinPermanentChannel(name, password, chatFrameIndex, enableVoice) end

--- Joins a channel, but does not save associated chat window settings
---@param channel string Name of a channel to join
function JoinTemporaryChannel(channel) end

--- Leaves a chat channel
---@param name string Name of a chat channel to leave
function LeaveChannelByName(name) end

--- Requests the list of participants in a chat channel. Fires the CHAT_MSG_CHANNEL_LIST event listing the names of all characters in the channel.
--- Flags: server
---@param channel string Name of a channel
---@param channelIndex number Index of a channel
function ListChannelByName(channel, channelIndex) end

--- Requests a list of channels joined by the player. Fires the CHAT_MSG_CHANNEL_LIST event listing the names and indices of all channels joined by the player.
--- Flags: server
function ListChannels() end

--- Removes a channel from a chat window's list of saved channel subscriptions. Used by the default UI's function ChatFrame_RemoveChannel() which manages the set of channel messages shown in a displayed ChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param channel string Name of the channel to remove
function RemoveChatWindowChannel(index, channel) end

--- Sets the currently active voice channel
---@param index number Index of a channel in the chat display window (between 1 and GetNumDisplayChannels() )
function SetActiveVoiceChannel(index) end

--- Sets the currently active voice chat channel
---@param session number Index of a voice session (between 1 and GetNumVoiceSessions() )
function SetActiveVoiceChannelBySessionID(session) end

--- Gives channel ownership to another character. Has no effect unless the player is the owner of the given channel.
---@param channel string Name of the channel
---@param fullname string Name of the character to make the new owner
function SetChannelOwner(channel, fullname) end

--- Sets a password on a custom chat channel
---@param channel string Name of the channel
---@param password string Password to set for the channel
function SetChannelPassword(channel, password) end

--- Selects a channel in the channel list display
---@param index number Index of a channel in the channel list display (between 1 and GetNumDisplayChannels() )
function SetSelectedDisplayChannel(index) end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function SilenceMember() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function UnSilenceMember() end



--==============================
-- Chat functions
--==============================

--- Adds a message type to the saved list of those displayed in a chat window. Used by the default UI's function ChatFrame_AddMessageGroup() , which manages the set of message types shown in a displayed ChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param messageGroup string Token identifying a message type
function AddChatWindowMessages(index, messageGroup) end

--- Returns whether a chat message can be reported as spam
---@param lineID number Unique identifier of a chat message (11th argument received with the corresponding CHAT_MSG event)
---@return any canComplain 1 if the player can report the given chat message as spam; otherwise nil
function CanComplainChat(lineID) end

--- Changes the color associated with a chat message type
---@param messageType string The message type, as listed in chat-cache.txt.  Example values are "SAY" and "CHANNEL1".
---@param red number The value of the red component color (0.0 - 1.0)
---@param green number The value of the green component color (0.0 - 1.0)
---@param blue number The value of the blue component color (0.0 - 1.0)
function ChangeChatColor(messageType, red, green, blue) end

--- Adds a function to filter or alter messages to the chat display system. The filter function will be called each time a message is sent to one of the default chat frames (ChatFrame1, ChatFrame2, ..., ChatFrame7).  The function will be passed the chat frame object that the message is being added to, along with the event that caused the messages to be added, and the arguments to that event.
--- Flags: blizzardui
---@param event string A CHAT_MSG_ Event for which the filter should be used
---@param filter function A function to filter incoming messages
function ChatFrame_AddMessageEventFilter(event, filter) end

--- Returns the list of filters registered for a chat event. See ChatFrame_AddMessageEventFilter() for details about chat message filters.
--- Flags: blizzardui
---@param event string A CHAT_MSG_ Event
---@return table filterTable A table containing any filters set for the given event, with numeric keys corresponding to the order in which filters were registered
function ChatFrame_GetMessageEventFilters(event) end

--- Removes a previously set chat message filter. See ChatFrame_AddMessageEventFilter() for details about chat message filters.
--- Flags: blizzardui
---@param event string CHAT_MSG_ Event from which to remove a filter
---@param filter function A filter function registered for the event
function ChatFrame_RemoveMessageEventFilter(event, filter) end

--- Reports a chat message as spam. Used in the default UI when right-clicking the name of a player in a chat message and choosing "Report Spam" from the menu.
---@param lineID number Unique identifier of a chat message (11th argument received with the corresponding CHAT_MSG event)
---@param name string Name of a player to complain about
---@param text string Specific text to complain about
function ComplainChat(lineID, name, text) end

--- Performs a preset emote (with optional target). The list of built-in emote tokens can be found in global variables whose names follow the format "EMOTE"..num.."_TOKEN" , where num is a number between 1 and MAXEMOTEINDEX (a variable local to ChatFrame.lua.)
---@param emote string Non-localized token identifying an emote to perform
---@param target string Name of a unit at whom to direct the emote
---@param hold boolean Hold the emote animation until cancelled
function DoEmote(emote, target, hold) end

--- Returns the numeric index corresponding to a chat message type. These indices are used in the default UI to identify lines printed in a chat window, allowing (for example) their color to be changed to match changes in the player's color preferences.
---@param messageGroup string Token identifying a message type
---@return number index Numeric index of the chat type
function GetChatTypeIndex(messageGroup) end

--- Returns the saved settings for a chat window. These values reflect the settings saved between sessions, which are used by the default UI to set up the chat frames it displays.
---@param index number Index of the window you wish you get information on (starts at 1)
---@return string name Name of the chat window
---@return number fontSize Font size for text displayed in the chat window
---@return number r Red component of the window's background color (0.0 - 1.0)
---@return number g Green component of the window's background color (0.0 - 1.0)
---@return number b Blue component of the window's background color (0.0 - 1.0)
---@return number alpha Alpha value (opacity) of the window's background (0 = fully transparent, 1 = fully opaque)
---@return number shown 1 if the window should be shown; 0 if it should be hidden
---@return number locked 1 if the window should be locked; 0 if it should be movable/resizable
---@return number docked 1 if the window should be docked to the main chat window; otherwise 0
---@return number uninteractable 1 if the window should ignore all mouse events; otherwise 0
function GetChatWindowInfo(index) end

--- Returns the saved list of messages to which a chat window is subscribed
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
function GetChatWindowMessages(index) end

--- Returns the name of the player character's default language. This is the language used in the chat system (Common or Orcish, as opposed to Taurahe, Darnassian, etc), not the real-world language of the client or server.
---@return string language Localized name of the player character's default language
function GetDefaultLanguage() end

--- Returns the localized name of a player character language
---@param index number Index of a player character language (between 1 and GetNumLanguages()
---@return string language Localized name of the language (e.g. "Common" or "Gnomish")
function GetLanguageByIndex(index) end

--- Returns the number of languages the player character can speak
---@return number languages Number of in-game languages known to the player character (generally 2 for most races, 1 for Orcs or Humans)
function GetNumLanguages() end

--- Enables or disables saving chat text to a file. Text received via the chat system (but not necessarily all text displayed in chat windows) will be saved to the file Logs/WoWChatLog.txt (path is relative to the folder containing the World of Warcraft client); the file is not actually updated until the player logs out.
---@param toggle boolean True to enable chat logging; false or omitted to disable
---@return any isLogging 1 if chat logging is enabled; otherwise nil
function LoggingChat(toggle) end

--- Enables or disables saving combat log data to a file. Combat log data will be saved to the file Logs/WoWCombatLog.txt (path is relative to the folder containing the World of Warcraft client); the file is not actually updated until the player logs out.
---@param toggle boolean True to enable combat logging; false or omitted to disable
---@return any isLogging 1 if combat logging is enabled; otherwise nil
function LoggingCombat(toggle) end

--- Initiates a public, server-side "dice roll". Used in the default UI to implement the /roll chat command; when called, the server generates a random integer and sends it to the player and all others nearby (or in the same party/raid) via a CHAT_MSG_SYSTEM event. (The server message is formatted according to the global RANDOM_ROLL_RESULT ; e.g. "Leeroy rolls 3 (1-100)".)
--- Flags: server
---@param min number Lowest number to be randomly chosen
---@param max number Highest number to be randomly chosen
function RandomRoll(min, max) end

--- Removes a message type from a chat window's list of saved message subscriptions. Used by the default UI's functions ChatFrame_RemoveMessageGroup() and ChatFrame_RemoveAllMessageGroups() which manage the set of message types shown in a displayed ChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param messageGroup string Token identifying a message type
function RemoveChatWindowMessages(index, messageGroup) end

--- Removes all saved color settings for chat message types, resetting them to default values
function ResetChatColors() end

--- Removes all saved chat window settings, resetting them to default values. Used by the default UI's function FCF_ ResetChatWindows() which resets the appearance and behavior of displayed FloatingChatFrames.
function ResetChatWindows() end

--- Sends a chat message
--- Flags: server
---@param text string Message to be sent (up to 255 characters)
---@param chatType any Channel on which to send the message (defaults to SAY if omitted) ( string ) BATTLEGROUND - Messages to a battleground raid group (sent with /bg in the default UI) CHANNEL - Message to a server or custom chat channel (sent with /1 , /2 , etc in the default UI); requires channel number for channel argument DND - Enables Away-From-Keyboard status for the player, with text as the custom message seen by others attempting to whisper the player EMOTE - Custom text emotes visible to nearby players (sent with /e in the default UI) GUILD - Messages to guild members (sent with /g in the default UI) OFFICER - Messages to guild officers (sent with /o in the default UI) PARTY - Messages to party members (sent with /p in the default UI) RAID - Messages to raid members (sent with /ra in the default UI) RAID_WARNING - Warning to raid members (sent with /rw in the default UI) SAY - Speech to nearby players (sent with /s in the default UI) WHISPER - Message to a specific character (sent with /w in the default UI); requires name of the character for channel argument YELL - Yell to not-so-nearby players
---@param language any Language in which to send the message; defaults to Common (for Alliance players) or Orcish (for Horde players) if omitted ( string ) COMMON - Alliance and Human language DARNASSIAN - Night Elf Language DRAENEI - Draenei Language DWARVEN - Dwarf Language GNOMISH - Gnome language GUTTERSPEAK - Undead language ORCISH - Horde and Orc Language TAURAHE - Tauren Language THALASSIAN - Night Elf Language TROLL - Troll language
---@param channel string If chatType is WHISPER , name of the target character; if chatType is CHANNEL , number identifying the target channel; ignored otherwise
function SendChatMessage(text, chatType, language, channel) end

--- Saves a chat window's background opacity setting. Used by the default UI's function FCF_SetWindowAlpha() which changes the opacity of a displayed FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param alpha number Alpha value (opacity) of the chat window background (0 = fully transparent, 1 = fully opaque)
function SetChatWindowAlpha(index, alpha) end

--- Saves a chat window's background color setting. Used by the default UI's function FCF_SetWindowColor() which changes the colors of a displayed FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param r number Red component of the background color (0.0 - 1.0)
---@param g number Green component of the background color (0.0 - 1.0)
---@param b number Blue component of the background color (0.0 - 1.0)
function SetChatWindowColor(index, r, g, b) end

--- Saves whether a chat window should be docked with the main chat window. Used by the default UI's functions FCF_DockFrame() and FCF_UnDockFrame() which manage the positioning of FloatingChatFrames.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param docked boolean True if the window should be docked with the main chat window; otherwise false
function SetChatWindowDocked(index, docked) end

--- Saves whether a chat window is locked. Used by the default UI's functions FCF_OpenNewWindow() and FCF_SetLocked() which manage the behavior of a FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param locked boolean True if the frame should be locked; otherwise false
function SetChatWindowLocked(index, locked) end

--- Saves a chat window's display name setting. Used by the default UI's function FCF_SetWindowName() which also handles setting the name displayed for a FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param name string Name to be displayed for the chat window
function SetChatWindowName(index, name) end

--- Saves whether a chat window should be shown. Used by the default UI's function FCF_OpenNewWindow() which initializes a displayed FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param shown boolean True if the window should be shown, false otherwise
function SetChatWindowShown(index, shown) end

--- Saves a chat window's font size setting. Used by the default UI's function FCF_SetChatWindowFontSize() which also handles changing the font displayed in a FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param size number Font size for the chat window (in points)
function SetChatWindowSize(index, size) end

--- Saves whether a chat window is marked as non-interactive. Used by the default UI's function FCF_SetUninteractable() which also handles enabling/disabling mouse events in the FloatingChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param setUninteractable boolean True flag the window as non-interactive; false otherwise
function SetChatWindowUninteractable(index, setUninteractable) end



--==============================
-- Class resource functions
--==============================

--- Destroys a specific totem (or ghoul). Totem functions are also used for ghouls summoned by a Death Knight's Raise Dead ability (if the ghoul is not made a controllable pet by the Master of Ghouls talent).
---@param slot any Which totem to destroy ( number ) 1 - Fire (or Death Knight's ghoul) 2 - Earth 3 - Water 4 - Air
function DestroyTotem(slot) end

--- Returns cooldown information about one of the player's rune resources. Note the placement of runes 3-4 (normally Unholy) and 5-6 (normally Frost) are reversed in the default UI. Also note the behavior of returned values differs slightly from most other GetXYZCooldown-style functions.
---@param slot any Index of a rune slot, as positioned in the default UI: ( number ) 1 - Leftmost 2 - Second from left 3 - Fifth from left (second from right) 4 - Sixth from left (rightmost) 5 - Third from left 6 - Fourth from left
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the rune is ready
---@return number duration The length of the cooldown (regardless of whether the rune is currently cooling down)
---@return boolean runeReady True if the rune can be used; false if the rune is cooling down
function GetRuneCooldown(slot) end

--- Returns the number of available rune resources in one of the player's rune slots. Returns 1 if a rune is ready and 0 if a rune is on cooldown.
---@param slot any Index of a rune slot, as positioned in the default UI: ( number ) 1 - Leftmost 2 - Second from left 3 - Fifth from left (second from right) 4 - Sixth from left (rightmost) 5 - Third from left 6 - Fourth from left
---@return number count Number of available runes in the slot
function GetRuneCount(slot) end

--- Returns the type of one of the player's rune resources. Note the placement of runes 3-4 (normally Unholy) and 5-6 (normally Frost) are reversed in the default UI.
---@param slot any Index of a rune slot, as positioned in the default UI: ( number ) 1 - Leftmost 2 - Second from left 3 - Fifth from left (second from right) 4 - Sixth from left (rightmost) 5 - Third from left 6 - Fourth from left
---@return any runeType Type of the rune ( number ) 1 - Blood rune 2 - Unholy rune 3 - Frost rune 4 - Death rune
function GetRuneType(slot) end

--- Returns information on a currently active totem (or ghoul). Totem functions are also used for ghouls summoned by a Death Knight's Raise Dead ability (if the ghoul is not made a controllable pet by the Master of Ghouls talent).
---@param slot any Which totem to query ( number ) 1 - Fire (or Death Knight's ghoul) 2 - Earth 3 - Water 4 - Air
---@return boolean haveTotem True if a totem of the given type is active
---@return string name The name of the totem
---@return number startTime The value of GetTime() when the totem was created
---@return number duration The total duration the totem will last (in seconds)
---@return string icon Path to a texture to use as the totem's icon
function GetTotemInfo(slot) end

--- Returns the time remaining before a totem (or ghoul) automatically disappears.
---@param slot any Which totem to query ( number ) 1 - Fire (or Death Knight's ghoul) 2 - Earth 3 - Water 4 - Air
---@return number seconds Time remaining before the totem/ghoul is automatically destroyed
function GetTotemTimeLeft(slot) end

--- Targets one of the player's totems (or a Death Knight's ghoul). Totem functions are also used for ghouls summoned by a Death Knight's Raise Dead ability (if the ghoul is not made a controllable pet by the Master of Ghouls talent).
--- Flags: protected
---@param slot any Which totem to target ( number ) 1 - Fire (or Death Knight's ghoul) 2 - Earth 3 - Water 4 - Air
function TargetTotem(slot) end



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



--==============================
-- Combat functions
--==============================

--- Begins auto-attack against the player's current target. (If the "Auto Attack/Auto Shot" option is turned on, also begins Auto Shot for hunters.)
--- Flags: protected
function AttackTarget() end

--- Begins auto-attack against a specified target
--- Flags: protected
---@param unit string A unit to attack
---@param name string The name of a unit to attack
function StartAttack(unit, name) end

--- Stops auto-attack if active
--- Flags: protected
function StopAttack() end

--- Returns whether a unit is currently in combat
---@param unit string A unit to query
---@return any inCombat 1 if the unit is currently involved in combat; otherwise nil
function UnitAffectingCombat(unit) end



--==============================
-- CombatLog functions
--==============================

--- Adds a filter to the combat log system. Each time this function is called a new filter is added to the combat log system.  Any combat log entry that passes the filter will be fired as a COMBAT_LOG_EVENT event in order from oldest to newest.
---@param events string Name of a combat log event type to include in the filtered list, or a comma-separated list of multiple names
---@param srcGUID string GUID of the source unit
---@param srcMask number Bit mask of the source unit
---@param destGUID string GUID of the destination unit
---@param destMask number Bit mask of the destination unit
function CombatLogAddFilter(events, srcGUID, srcMask, destGUID, destMask) end

--- Advances the "cursor" position used by other CombatLog functions. Information about the entry at the "cursor" position can be retrieved with CombatLogGetCurrentEntry() . That function then advances the cursor to the next entry, so calling it repeatedly returns all information in the combat log -- this function can be used to "rewind" the combat log to retrieve information about earlier events or skip entries without retrieving their information.
---@param count number Number of entries by which to advance the "cursor"; can be negative to move to a previous entry
---@param ignoreFilter boolean True to use the entire saved combat log history; false or omitted to use only events matching the current filter
---@return any hasEntry 1 if an entry exists at the new cursor position; otherwise nil
function CombatLogAdvanceEntry(count, ignoreFilter) end

--- Removes all entries from the combat log
function CombatLogClearEntries() end

--- Returns the combat log event information for the current entry and advances to the next entry. See COMBAT_LOG_EVENT for details of the event information.
---@param ignoreFilter boolean True to use the entire saved combat log history; false or omitted to use only events matching the current filter
---@return number timestamp Time at which the event occurred (same format as time() and date() , but with millisecond precision)
---@return string event Type of combat log event
---@return string srcGUID GUID of the unit that initiated the event
---@return string srcName Name of the unit that initiated the event
---@return number srcFlags Flags indicating the nature of the source unit
---@return string destGUID GUID of the unit that was the target of the event
---@return string destName Name of the unit that was the target of the event
---@return number destFlags Flags indicating the nature of the target unit
function CombatLogGetCurrentEntry(ignoreFilter) end

--- Returns the number of available combat log events
---@param ignoreFilter boolean True to use the entire saved combat log history; false or omitted to use only events matching the current filter
function CombatLogGetNumEntries(ignoreFilter) end

--- Returns the amount of time combat log entries are stored
---@return number seconds Amount of time entries remain available
function CombatLogGetRetentionTime() end

--- Removes any filters applied to the combat log
function CombatLogResetFilter() end

--- Sets the "cursor" position used by other CombatLog functions. Information about the entry at the "cursor" position can be retrieved with CombatLogGetCurrentEntry() . That function then advances the cursor to the next entry, so calling it repeatedly returns all information in the combat log -- this function can be used to "rewind" the combat log to retrieve information about earlier events.
---@param index number Index of a combat log event (between 1 and CombatLogGetNumEntries(ignoreFilter) , or between -1 and - CombatLogGetNumEntries(ignoreFilter) )
---@param ignoreFilter boolean True to use the entire saved combat log history; false or omitted to use only events matching the current filter
function CombatLogSetCurrentEntry(index, ignoreFilter) end

--- Sets the amount of time combat log entries will be stored
---@param seconds number The desired time
function CombatLogSetRetentionTime(seconds) end

--- Returns whether an entity from the combat log matches a given filter
---@param unitFlags number Source or destination unit flags from a combat log entry
---@param mask any One of the following global constants: ( number , bitfield ) COMBATLOG_FILTER_EVERYTHING - Any entity COMBATLOG_FILTER_FRIENDLY_UNITS - Entity is a friendly unit COMBATLOG_FILTER_HOSTILE_PLAYERS - Entity is a hostile player unit COMBATLOG_FILTER_HOSTILE_UNITS - Entity is a hostile non-player unit COMBATLOG_FILTER_ME - Entity is the player COMBATLOG_FILTER_MINE - Entity is a non-unit object belonging to the player; e.g. a totem COMBATLOG_FILTER_MY_PET - Entity is the player's pet COMBATLOG_FILTER_NEUTRAL_UNITS - Entity is a neutral unit COMBATLOG_FILTER_UNKNOWN_UNITS - Entity is a unit currently unknown to the WoW client
---@return any isMatch 1 if the entity flags match the given mask
function CombatLog_Object_IsA(unitFlags, mask) end

--- Returns a unit's globally unique identifier
---@param unit string A unit to query
---@return string guid The unit's GUID
function UnitGUID(unit) end



--==============================
-- Commentator functions
--==============================

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorAddPlayer() end

--- This is a Blizzard internal function internal
--- Flags: internal
function CommentatorEnterInstance() end

--- This is a Blizzard internal function internal
--- Flags: internal
function CommentatorExitInstance() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorFollowPlayer() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorGetCamera() end

--- This is a Blizzard internal function internal
--- Flags: internal
function CommentatorGetCurrentMapID() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorGetInstanceInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorGetMapInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorGetMode() end

--- This is a Blizzard internal function internal
--- Flags: internal
function CommentatorGetNumMaps() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorGetNumPlayers() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorGetPlayerInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorGetSkirmishMode() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorGetSkirmishQueueCount() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorGetSkirmishQueuePlayerInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorLookatPlayer() end

--- This is a Blizzard internal function internal
--- Flags: internal
function CommentatorRemovePlayer() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorRequestSkirmishMode() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorRequestSkirmishQueueData() end

--- This is a Blizzard internal function internal
--- Flags: internal
function CommentatorSetBattlemaster() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorSetCamera() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorSetCameraCollision() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorSetMapAndInstanceIndex() end

--- This is a Blizzard internal function internal
--- Flags: internal
function CommentatorSetMode() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorSetMoveSpeed() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorSetPlayerIndex() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorSetSkirmishMatchmakingMode() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorSetTargetHeightOffset() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorStartInstance() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorStartSkirmishMatch() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorToggleMode() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorUpdateMapInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorUpdatePlayerInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorZoomIn() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CommentatorZoomOut() end



--==============================
-- Companion functions
--==============================

--- Summons a non-combat pet or mount.
---@param type any Type of companion ( string ) CRITTER - A non-combat pet MOUNT - A mount
---@param index number Index of a companion (between 1 and GetNumCompanions(type) )
function CallCompanion(type, index) end

--- Unsummons the current non-combat pet or mount
---@param type any The type of companion ( string ) CRITTER - Non-combat pet MOUNT - Mount
function DismissCompanion(type) end

--- Returns cooldown information for a non-combat pet or mount
---@param type any Type of companion ( string ) CRITTER - A non-combat pet MOUNT - A mount
---@param index number Index of a companion (between 1 and GetNumCompanions(type) )
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the companion is ready
---@return number duration The length of the cooldown, or 0 if the companion is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the companion is ready.)
function GetCompanionCooldown(type, index) end

--- Returns information about a non-combat pet or mount
---@param type any Type of companion ( string ) CRITTER - A non-combat pet MOUNT - A mount
---@param index number Index of a companion (between 1 and GetNumCompanions(type) )
---@return number creatureID Unique ID of the companion (usable with PlayerModel:SetCreature )
---@return string creatureName Localized name of the companion
---@return number spellID The "spell" for summoning the companion (usable with GetSpellLink et al)
---@return string icon Path to an icon texture for the companion
---@return any active 1 if the companion queried is currently summoned; otherwise nil
function GetCompanionInfo(type, index) end

--- Returns the number of mounts or non-combat pets the player can summon
---@param type any The type of companion ( string ) CRITTER - Non-combat pets MOUNT - Mounts
---@return number count The number of available companions
function GetNumCompanions(type) end

--- Puts a non-combat pet or mount onto the cursor
---@param type any Type of companion ( string ) CRITTER - A non-combat pet MOUNT - A mount
---@param index number Index of a companion (between 1 and GetNumCompanions(type) )
function PickupCompanion(type, index) end

--- Summons a random critter companion
function SummonRandomCritter() end



--==============================
-- Complaint functions
--==============================

--- Returns whether a mail can be reported as spam. Returns nil for messages from Game Masters or friends, as well as for messages generated by the game itself (Auction House mail, mails from NPCs, etc).
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
---@return any complain 1 if the mail can be reported as spam; otherwise nil
function CanComplainInboxItem(mailID) end

--- Reports a mail message as spam
---@param mailID number Index of a message in the player's inbox (between 1 and GetInboxNumItems() )
function ComplainInboxItem(mailID) end



--==============================
-- Container functions
--==============================

--- Returns the inventoryID corresponding to a given containerID
---@param container number Index of one of the player's bags or other containers
---@return number inventoryID Identifier for the container usable with Inventory APIs
function ContainerIDToInventoryID(container) end

--- Sells an item purchased with alternate currency back to a vendor. Items bought with alternate currency (honor points, arena points, or special items such as Emblems of Heroism and Dalaran Cooking Awards) can be returned to a vendor for a full refund, but only within a limited time after the original purchase.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
function ContainerRefundItemPurchase(container, slot) end

--- Returns the name of one of the player's bags. Returns nil for the bank and keyring, for bank bags while the player is not at the bank, and for empty bag or bank bag slots.
---@param container number Index of one of the player's bags or other containers
---@return string name Name of the container
function GetBagName(container) end

--- Returns a list of open slots in a container. The optional argument returnTable allows for performance optimization in cases where this function is expected to be called repeatedly. Rather than creating new tables each time the function is called (eventually requiring garbage collection), an existing table can be recycled. (Note, however, that this function does not clear the table's contents; use wipe() first to guarantee consistent results.)
---@param container number Index of one of the player's bags or other containers
---@param returnTable table Reference to a table to be filled with return values
---@return table slotTable A table listing the indices of open slots in the given container
function GetContainerFreeSlots(container, returnTable) end

--- Returns cooldown information about an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the item is ready
---@return number duration The length of the cooldown, or 0 if the item is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the item is ready.)
function GetContainerItemCooldown(container, slot) end

--- Returns durability status for an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return number durability The item's current durability
---@return number max The item's maximum durability
function GetContainerItemDurability(container, slot) end

--- Returns the gems socketed in an item in the player's bags. The IDs returned refer to the gems themselves (not the enchantments they provide), and thus can be passed to GetItemInfo() to get a gem's name, quality, icon, etc.
---@param container any The index of the container
---@param slot number The slot within the given container; slots are numbered left-to-right, top-to-bottom, starting with the leftmost slot on the top row
---@return any gem1 Item ID of the first gem socketed in the item
---@return any gem2 Item ID of the second gem socketed in the item
---@return any gem3 Item ID of the third gem socketed in the item
function GetContainerItemGems(container, slot) end

--- Returns the item ID of an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return any id Numeric ID of the item in the given slot
function GetContainerItemID(container, slot) end

--- Returns information about an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return string texture Path to the icon texture for the item
---@return number count Number of items in the slot
---@return any locked 1 if the item is locked; otherwise nil. Items become locked while being moved, split, or placed into other UI elements (such as the mail, trade, and auction windows).
---@return number quality Quality (or rarity) of the item
---@return any readable 1 if the item is readable; otherwise nil. This value is used by the default UI to show a special cursor over items such as books and scrolls which can be read by right-clicking.
---@return any lootable 1 if the item is a temporary container containing items that can be looted; otherwise nil. Examples include the Bag of Fishing Treasures and Small Spice Bag rewarded by daily quests, lockboxes (once unlocked), and the trunks occasionally found while fishing.
---@return any link A hyperlink for the item
function GetContainerItemInfo(container, slot) end

--- Returns a hyperlink for an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return string link A hyperlink for the item
function GetContainerItemLink(container, slot) end

--- Returns information about alternate currencies refunded for returning an item to vendors.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@param IsEquipped boolean wheather to get an equipped item info
---@return number money Amount of copper to be refunded
---@return number itemCount Number of different item currencies to be refunded (e.g. the price a PvP mount is in 3 currencies, as it requires multiple battlegrounds' Marks of Honor)
---@return number refundSec Seconds remaining until this item is no longer eligible to be returned for a refund
---@return number currecycount Amount of currency to be refunded
---@return number hasEnchants weather the item is enchanted
function GetContainerItemPurchaseInfo(container, slot, IsEquipped) end

--- Returns information about a specific currency refunded for returning an item to vendors. See GetContainerItemPurchaseInfo for more information about alternate currency refunds.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@param index number Index of the currency type; between 1 and itemCount , where itemCount is the 4th return from GetContainerItemPurchaseInfo() for the same container and slot
---@return string texture Path to an icon texture for the currency item
---@return number quantity Quantity of the currency item to be refunded
---@return any link Hyperlink for the currency item
function GetContainerItemPurchaseItem(container, slot, index) end

--- Returns the number of free slots in a container and the types of items it can hold
---@param container number Index of one of the player's bags or other containers
---@return number freeSlots Number of empty slots in the bag
---@return number bagType Bitwise OR of the item families that can be put into the container; see GetItemFamily for details
function GetContainerNumFreeSlots(container) end

--- Returns the number of slots in one of the player's bags
---@param container number Index of one of the player's bags or other containers
---@return number numSlots Number of item slots in the container
function GetContainerNumSlots(container) end

--- Returns information about special bag types that can hold a given item. The meaning of bagType varies depending on the item:
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any bagType Bitwise OR of bag type flags: ( number , bitfield ) 0x0001 - Quiver 0x0002 - Ammo Pouch 0x0004 - Soul Bag 0x0008 - Leatherworking Bag 0x0010 - Inscription Bag 0x0020 - Herb Bag 0x0040 - Enchanting Bag 0x0080 - Engineering Bag 0x0100 - Keyring 0x0200 - Gem Bag 0x0400 - Mining Bag 0x0800 - Unused 0x1000 - Vanity Pets
function GetItemFamily(itemID, itemName, itemLink) end

--- Puts an equipped container onto the cursor
---@param slot number An inventory slot containing a bag (see GetInventorySlotInfo() , ContainerIDToInventoryID() )
function PickupBagFromSlot(slot) end

--- Picks up an item from or puts an item into a slot in one of the player's bags or other containers. If the cursor is empty and the referenced container slot contains an item, that item is put onto the cursor. If the cursor contains an item and the slot is empty, the item is placed into the slot. If both the cursor and the slot contain items, the contents of the cursor and the container slot are exchanged.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
function PickupContainerItem(container, slot) end

--- Puts the item on the cursor into the player's backpack. The item will be placed in the lowest numbered slot ( containerSlotID ) in the player's backpack.
---@return any hadItem 1 if the cursor had a item; otherwise nil
function PutItemInBackpack() end

--- Puts the item on the cursor into one of the player's bags or other containers. The item will be placed in the lowest numbered slot ( containerSlotID ) in the container.
---@param container number Index of one of the player's bags or other containers
---@return any hadItem 1 if the cursor had a item; otherwise nil
function PutItemInBag(container) end

--- Sets a Texture object to display the icon of one of the player's bags. Adapts the square item icon texture to fit within the circular "portrait" frames used in many default UI elements.
---@param texture table A Texture object
---@param container number Index of one of the player's bags or other containers
function SetBagPortraitTexture(texture, container) end

--- Opens an item from the player's bags for socketing
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
function SocketContainerItem(container, slot) end

--- Picks up only part of a stack of items from one of the player's bags or other containers. Has no effect if the given amount is greater than the number of items stacked in the slot.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@param amount number Number of items from the stack to pick up
function SplitContainerItem(container, slot, amount) end

--- Activate (as with right-clicking) an item in one of the player's bags. Has the same effect as right-clicking an item in the default UI; therefore, results may vary by context. In cases of conflict, conditions listed first override those below:
--- Flags: protected
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@param target string A unit to be used as target for the action
function UseContainerItem(container, slot, target) end



--==============================
-- Currency functions
--==============================

--- Expands or collapses a list header in the Currency UI
---@param index number Index of a header in the currency list (between 1 and GetCurrencyListSize())
---@param shouldExpand number 1 to expand the header, showing its contents; 0 to collapse the header, hiding its contents
function ExpandCurrencyList(index, shouldExpand) end

--- Returns information about a currency marked for watching on the Backpack UI
---@param index number Index of a 'slot' for displaying currencies on the backpack (between 1 and MAX_WATCHED_TOKENS )
---@return string name Name of the currency type
---@return number count Amount of the currency the player has
---@return any extraCurrencyType Type of the currency ( number ) 0 - Item-based currency 1 - Arena points 2 - Honor points
---@return string icon Path to an icon texture representing the currency item (for Honor/Arena points, not the icon displayed in the default UI)
---@return number itemID ID for the currency item
function GetBackpackCurrencyInfo(index) end

--- Returns information about a currency type (or headers in the Currency UI)
---@param index number Index of a currency type in the currency list (between 1 and GetCurrencyListSize() )
---@return string name Name of the currency type or category header
---@return boolean isHeader True if this listing is a category header, false for actual currencies
---@return boolean isExpanded True if this listing is a category header whose contents are shown, false for collapsed headers and actual currencies
---@return boolean isUnused True if the player has marked this currency as Unused
---@return boolean isWatched True if the player has marked this currency to be watched on the backpack UI
---@return number count Amount of the currency the player has
---@return number extraCurrencyType 1 for Arena points, 2 for Honor points, 0 for other currencies
---@return string icon Path to a texture representing the currency item (not applicable for Arena/Honor points)
---@return number itemID ID for the currency item
function GetCurrencyListInfo(index) end

--- Returns the number of list entries to show in the Currency UI
---@return number numEntries Number of currency types (including category headers) to be shown in the Currency UI
function GetCurrencyListSize() end

--- Returns the awarded honor and arena points for a Call to Arms battleground win or loss
---@return boolean unk Unknown
---@return number honorWinReward Honor points rewarded for a win
---@return number arenaWinReward Arena points rewarded for a win
---@return number honorLossReward Honor points rewarded for a loss
---@return number arenaLossReward Arena points rewarded for a loss
function GetHolidayBGHonorCurrencyBonuses() end

--- Returns the player's amount of honor points
---@return number honorPoints The player's current amount of honor points
---@return number maxHonor The maximum amount of honor currency the player can accrue
function GetHonorCurrency() end

--- Sets a currency type to be watched on the Backpack UI
---@param index number Index of a currency type or header in the currency list (between 1 and GetCurrencyListSize())
---@param watch number 1 to add this currency to the backpack UI; 0 to remove it from being watched
function SetCurrencyBackpack(index, watch) end

--- Moves a currency type to or from the Unused currencies list.
---@param index number Index of a currency type or header in the currency list (between 1 and GetCurrencyListSize())
---@param makeUnused number 1 to move this currency to the Unused category; 0 to return it to its original category
function SetCurrencyUnused(index, makeUnused) end



--==============================
-- Cursor functions
--==============================

--- Adds the money currently on the cursor to the trade window
function AddTradeMoney() end

--- Equips the item on the cursor. The item is automatically equipped in the first available slot in which it fits. To equip an item in a specific slot, see EquipCursorItem() .
function AutoEquipCursorItem() end

--- Clears any contents attached to the cursor. If the cursor contains an item picked up from inventory (equipment slots) or a container, the item returns to its point of origin and the inventory or container slot is unlocked. (To destroy an item, see DeleteCursorItem() ).
function ClearCursor() end

--- Picks up an item from or puts an item into an attachment slot for sending mail. If the cursor is empty and the mail attachment slot contains an item, that item is put onto the cursor. If the cursor contains an item and the slot is empty, the item is placed into the slot. If both the cursor and the slot contain items, the contents of the cursor and the mail attachment slot are exchanged.
---@param index number Index of a mail attachment slot (between 1 and ATTACHMENTS_MAX_SEND )
---@param autoReturn boolean True to automatically return the item in the given attachment slot to the player's bags; false or omitted to put the item on the cursor
function ClickSendMailItemButton(index, autoReturn) end

--- Picks up or places a gem in the Item Socketing UI. If the Item Socketing UI is open and the cursor contains a socketable gem, places the gem into socket index . If the cursor does not hold an item and socket index is not locked, picks up the gem in that socket.
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
function ClickSocketButton(index) end

--- Interacts with an item in a slot offered for trade by the target. Only meaningful when used with the last (7th) trade slot: if an enchantment-type spell is currently awaiting a target (i.e. the glowing hand cursor is showing), targets the item in the given trade slot for the enchantment. (The enchantment to be applied then shows for both parties in the trade, but is not actually performed until both parties accept the trade.)
---@param index number Index of an item slot on the target's side of the trade window (between 1 and MAX_TRADE_ITEMS )
function ClickTargetTradeButton(index) end

--- Picks up an item from or puts an item in a slot offered for trade by the player
---@param index number The index of the trade button window to click
function ClickTradeButton(index) end

--- Returns whether the item on the cursor can be equipped in an inventory slot. Returns nil if the cursor is empty or contains something other than an item.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any canBePlaced 1 if the item on the cursor can be equipped in the given slot; otherwise nil
function CursorCanGoInSlot(slot) end

--- Returns whether an item is on the cursor. See GetCursorInfo() for more detailed information.
---@return any hasItem 1 if the cursor is currently holding an item; otherwise nil
function CursorHasItem() end

--- Returns whether a macro is on the cursor. See GetCursorInfo() for more detailed information.
---@return any hasMacro 1 if the cursor is currently holding a macro; otherwise nil
function CursorHasMacro() end

--- Returns whether an amount of the player's money is on the cursor. Returns nil if the cursor holds guild bank money. See GetCursorInfo() for more detailed information.
---@return any hasMoney 1 if the cursor is currently holding an amount of the player's money; otherwise nil
function CursorHasMoney() end

--- Returns whether a spell is on the cursor. See GetCursorInfo() for more detailed information.
---@return any hasSpell 1 if the cursor is currently holding a spell; otherwise nil
function CursorHasSpell() end

--- Destroys the item on the cursor. Used in the default UI when accepting the confirmation prompt that appears when dragging and dropping an item to an empty area of the screen.
--- Flags: confirmation
function DeleteCursorItem() end

--- Drops any money currently on the cursor, returning it to where it was taken from
function DropCursorMoney() end

--- "Gives" the item on the cursor to another unit; results vary by context. If the unit is a friendly player, adds the item to the trade window (opening it if necessary, and placing it in the first available trade slot or the "will not be traded" slot depending on whether the item is soulbound). If the unit is the player's pet and the player is a Hunter, attempts to feed the item to the pet (since this casts the Feed Pet spell, in this case this action is protected and can only be called by the Blizzard user interface). For other units, nothing happens and the item remains on the cursor.
---@param unit string A unit to receive the item
---@param name string Name of a unit to receive the item; only valid for player , pet , and party/raid members
function DropItemOnUnit(unit, name) end

--- Puts the item on the cursor into a specific equipment slot. If the item on the cursor can be equipped but does not fit in the given slot, the item is automatically equipped in the first available slot in which it fits (as with AutoEquipCursorItem() ). Thus, this function is most useful when dealing with items which can be equipped in more than one slot: containers, rings, trinkets, and (for dual-wielding characters) one-handed weapons.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function EquipCursorItem(slot) end

--- Returns information about the contents of the cursor
---@return any type Type of data attached to the cursor ( string ) companion equipmentset guildbankmoney item macro merchant money spell
---@return number data Identifier for the data on the cursor; varies by type: ( value ) companion - Index of the companion in the non-combat pet or mount list ( number ) equipmentset - Name of the equipment set ( string ) guildbankmoney - Amount of the money from the guild bank (in copper) ( number ) item - Numeric identifier for the item ( number , itemID ) macro - Index of the macro in the macro listing ( number , macroID ) merchant - Index of the item in the vendor's listings ( number ) money - Amount of the player's money (in copper) ( number ) spell - Index of the spell in the player's spellbook
---@return any subType Secondary identifier for the data on the cursor; used only for certain types: ( string ) companion - "CRITTER" or "MOUNT" , indicating whether the returned data is an index in the non-combat pet or mount list item - A complete hyperlink for the item spell - "spell" or "pet" , indicating whether the returned data is an index in the player's or pet's spellbook
function GetCursorInfo() end

--- Returns the amount of money currently on the cursor
---@return number cursorMoney Amount of money currently on the cursor (in copper)
function GetCursorMoney() end

--- Returns the absolute position of the mouse cursor
---@return number cursorX Scale-independent X coordinate of the cursor's current position
---@return number cursorY Scale-independent Y coordinate of the cursor's current position
function GetCursorPosition() end

--- Returns the frame that is currently under the mouse, and has mouse input enabled.
---@return table frame The frame that currently has the mouse focus
function GetMouseFocus() end

--- Returns the cursor to normal mode after use of ShowRepairCursor()
function HideRepairCursor() end

--- Returns whether the item repair cursor mode is currently active. Repair mode is entered by calling ShowRepairCursor() and exited by calling HideRepairCursor() ; while in repair mode, calling PickupContainerItem() or PickupInventoryItem() will attempt to repair the item (and deduct the cost of such from the player's savings) instead of putting it on the cursor.
---@return any inRepair 1 if repair mode is currently active; otherwise nil
function InRepairMode() end

--- Picks up an item from or puts an item into the guild bank. If the cursor is empty and the referenced guild bank slot contains an item, that item is put onto the cursor. If the cursor contains an item and the slot is empty, the item is placed into the slot. If both the cursor and the slot contain items, the contents of the cursor and the guild bank slot are exchanged.
---@param tab number Index of a guild bank tab
---@param slot number Index of an item slot in the guild bank tab
function PickupGuildBankItem(tab, slot) end

--- Puts money from the guild bank onto the cursor. Money is not actually withdrawn from the guild bank; in the default UI, when the cursor "puts" the money into one of the player's bags, it calls WithdrawGuildBankMoney() .
---@param amount number Amount of money to pick up (in copper)
function PickupGuildBankMoney(amount) end

--- Picks up an item from or puts an item into an equipment slot. If the cursor is empty and the referenced inventory slot contains an item, that item is put onto the cursor. If the cursor contains an item (which can be equipped in the slot) and the slot is empty, the item is placed into the slot. If both the cursor and the slot contain items, the contents of the cursor and the inventory slot are exchanged.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function PickupInventoryItem(slot) end

--- Puts an arbitrary item onto the cursor. Puts an item onto the cursor regardless of its location (equipped, bags, bank or not even in the player's possession); can be used to put an item into an action slot (see PlaceAction() ) even if the player does not currently hold the item. Since the item is not picked up from a specific location, this function cannot be used to move an item to another bag, trade it to another player, attach it to a mail message, destroyed, etc.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
function PickupItem(itemID, itemName, itemLink) end

--- Puts a macro onto the cursor
---@param index number Index of a macro
---@param name string Name of a macro
function PickupMacro(index, name) end

--- Puts an item available for purchase from a vendor onto the cursor
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
function PickupMerchantItem(index) end

--- Puts an amount of the player's money onto the cursor. Money is not immediately deducted from the player's total savings (though it appears such on the default UI's money displays, which generally show GetMoney() - GetCursorMoney() ).
---@param amount number Amount of money to put on the cursor (in copper)
function PickupPlayerMoney(amount) end

--- Puts a spell from the player's or pet's spellbook onto the cursor
---@param id number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
function PickupSpell(id, bookType) end

--- Puts a pet from the stables onto the cursor. Use with ClickStablePet to move pets between stabled and active status.
---@param index any Index of a stable slot ( number ) 0 - Active pet 1 to NUM_PET_STABLE_SLOTS - A stable slot
function PickupStablePet(index) end

--- Puts money offered by the player for trade onto the cursor. Money put onto the cursor is subtracted from the amount offered for trade (see GetPlayerTradeMoney() ).
---@param amount number Amount of money to take from the trade window (in copper)
function PickupTradeMoney(amount) end

--- Returns the cursor to its normal appearance (the glove pointer) and behavior. Has effect after the cursor image/mode has been changed via SetCursor() , ShowContainerSellCursor() , or similar. Has no immediately visible effect if the cursor is holding an item, spell, or other data.
function ResetCursor() end

--- Changes the mouse cursor image. Changes only the appearance of the mouse cursor, not its behavior (and has no effect if the cursor is holding an item, spell, or other data). Passing nil will revert the cursor to its default image.
---@param cursor string Path to a texture to use as the cursor image (must be 32x32 pixels) or one of the built-in cursor tokens.  Valid cursor tokens can be found in the example code.
function SetCursor(cursor) end

--- Changes the cursor to prepare for repurchasing an item recently sold to a vendor. Only changes the cursor image and mode if the given index contains an item.
---@param index number Index of an item in the buyback listing (between 1 and GetNumBuybackItems() )
function ShowBuybackSellCursor(index) end

--- Changes the cursor to prepare for selling an item in the player's bags to a vendor. Only changes the cursor image and mode if the given container and slot contain an item.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
function ShowContainerSellCursor(container, slot) end

--- Changes the cursor to prepare for selling an equipped item to a vendor. Only changes the cursor image and mode if the given slot contains an item.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function ShowInventorySellCursor(slot) end

--- Changes the cursor to prepare for buying an item from a vendor. Only changes the cursor image and mode if the given index contains an item.
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
function ShowMerchantSellCursor(index) end

--- Puts the cursor in item repair mode. Unlike most other cursor functions, this functions changes the behavior as well as the appearance of the mouse cursor: while repair mode is active, calling PickupContainerItem() or PickupInventoryItem() will attempt to repair the item (and deduct the cost of such from the player's savings) instead of putting it on the cursor.
function ShowRepairCursor() end

--- Picks up only part of a stack of items from the guild bank. Has no effect if the given amount is greater than the number of items stacked in the slot.
---@param tab number Index of a guild bank tab
---@param slot number Index of an item slot in the guild bank tab
---@param amount number Number of items from the stack to pick up
function SplitGuildBankItem(tab, slot, amount) end



--==============================
-- Debugging and Profiling functions
--==============================

--- Enables or disables logging of XML loading. When logging is enabled, status and error text will be saved to the file Logs/FrameXML.log (path is relative to the folder containing the World of Warcraft client) as the client parses and loads XML files in the default UI and addons.
---@param enable boolean True to enable verbose XML logging; false to disable
function FrameXML_Debug(enable) end

--- Returns the amount of CPU time used by an addon. Only returns valid data if the scriptProfile CVar is set to 1; returns 0 otherwise.
---@param name string Name of an addon (name of the addon's folder and TOC file, not the Title found in the TOC)
---@param index number Index of an addon in the addon list (between 1 and GetNumAddOns() )
---@return number usage Amount of CPU time used by the addon (in milliseconds) since the UI was loaded or ResetCPUUsage() was last called
function GetAddOnCPUUsage(name, index) end

--- Returns the amount of memory used by an addon. The value returned is from a cache only updated when calling UpdateAddOnMemoryUsage() .
---@param name string Name of an addon (name of the addon's folder and TOC file, not the Title found in the TOC)
---@param index number Index of an addon in the addon list (between 1 and GetNumAddOns() )
---@return number mem Memory usage of the addon (in kilobytes)
function GetAddOnMemoryUsage(name, index) end

--- Returns information about the CPU usage of an event. Only returns valid data if the scriptProfile CVar is set to 1; returns 0 otherwise.
---@param event string Name of an event ; if omitted, returns usage information for all events
---@return number usage Amount of CPU time used by handlers for the event (in milliseconds) since the UI was loaded or ResetCPUUsage() was last called
---@return number numEvents Number of times the event has fired this session
function GetEventCPUUsage(event) end

--- Returns information about CPU usage by a frame's script handlers. Only returns valid data if the scriptProfile CVar is set to 1; returns 0 otherwise.
---@param frame table A Frame object
---@param includeChildren boolean True to include CPU usage by children of the frame; false to include only the frame itself
---@return number usage Amount of CPU time used by the frame's script handlers (in milliseconds) since the UI was loaded or ResetCPUUsage() was last called
---@return number calls Number of function calls made from the frame's script handlers
function GetFrameCPUUsage(frame, includeChildren) end

--- Returns the number of frames per second rendered by the client
---@return number framerate Number of frames per second rendered by the client
function GetFramerate() end

--- Returns information about CPU usage by a function. Only returns valid data if the scriptProfile CVar is set to 1; returns 0 otherwise.
---@param function function A function reference
---@param includeSubroutines boolean True to include time spent in other functions called by the given function; false to count only time spent in the function body
---@return number usage Amount of CPU time used by the function (in milliseconds) since the UI was loaded or ResetCPUUsage() was last called
---@return number calls Number times the function was called
function GetFunctionCPUUsage(function, includeSubroutines) end

--- Returns the total CPU time used by the scripting system. Only returns valid data if the scriptProfile CVar is set to 1; returns 0 otherwise.
---@return number usage Amount of CPU time used by the scripting system (in milliseconds) since the UI was loaded or ResetCPUUsage() was last called
function GetScriptCPUUsage() end

--- Returns whether flight path benchmark mode is enabled
---@return any isBenchmark 1 if taxi benchmark mode is enabled; otherwise nil
function GetTaxiBenchmarkMode() end

--- Resets CPU usage statistics. Only has effect if the scriptProfile CVar is set to 1.
function ResetCPUUsage() end

--- Enables or disables flight path benchmark mode. When benchmark mode is enabled, the next taxi flight the player takes will behave differently: camera movement is disabled and players/creatures/objects below the flight path will not be shown (allowing for consistent test conditions). After the flight, framerate statistics will be printed in the chat window and benchmark mode will be automatically disabled.
---@param arg string nil, "on" , or 1 to enable benchmark mode; "off" or 0 to disable
function SetTaxiBenchmarkMode(arg) end

--- Updates addon CPU profiling information. Only has effect if the scriptProfile CVar is set to 1. See GetAddOnCPUUsage() for the updated data.
function UpdateAddOnCPUUsage() end

--- Updates addon memory usage information. See GetAddOnMemoryUsage() for the updated data.
function UpdateAddOnMemoryUsage() end

--- Starts/resets the high resolution profiling timer. Subsequent calls to debugprofilestop() will return the current value of the timer.
function debugprofilestart() end

--- Returns the value of the profiling timer
---@return number time Current value of the profiling timer (in milliseconds, with sub-millisecond precision)
function debugprofilestop() end

--- Returns information about the current function call stack
---@param start number Stack level at which to begin listing functions; 0 is the debugstack() function itself, 1 is the function that called debugstack() , 2 is the function that called function 1, etc. Defaults to 1 if omitted
---@param countTop number Maximum number of functions to output at the top of the stack trace
---@param countBot number Maximum number of functions to output at the bottom of the stack trace,
---@return string debugstring A multi-line string describing the current function call stack
function debugstack(start, countTop, countBot) end

--- Returns the current error handler function
---@return function handler The current error handler
function geterrorhandler() end

--- Returns whether a variable is secure (and if not, which addon tainted it)
---@param table table A table to be used when checking table elements
---@param variable string The name of a variable to check.  In order to check the status of a table element, you should specify the table, and then the key of the element
---@return any issecure 1 if the variable is secure; otherwise nil
---@return string taint Name of the addon that tainted the variable, or nil if the variable is secure
function issecurevariable(table, variable) end

--- Changes the error handler to a specified function. The error handler is called by Lua's error() function, which in turn is called whenever a Lua error occurs. WoW's default error handler displays the error message, a stack trace and information about the local variables for the function.  This dialog will only be shown if the  "Show Lua errors" option is enabled in Interface Options.
---@param errHandler function A function to use as the error handler
function seterrorhandler(errHandler) end



--==============================
-- Deprecated functions
--==============================

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function AcceptSkillUps() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function AddSkillUp() end

--- This function is deprecated and should no longer be used deprecated
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/BuySkillTier
function BuySkillTier() end

--- This function is deprecated and should no longer be used deprecated
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/CancelSkillUps
function CancelSkillUps() end

--- This function is deprecated and should no longer be used deprecated
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetAdjustedSkillPoints
function GetAdjustedSkillPoints() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetExtendedItemInfo() end

--- This function is deprecated and should no longer be used deprecated
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/RemoveSkillUp
function RemoveSkillUp() end

--- . This function was once used to implement the /bug command, which was a feature of early World of Warcraft beta tests and is no longer available.
--- Flags: deprecated
function ReportBug() end

--- . This function was once used to implement the /suggest command, which was a feature of early World of Warcraft beta tests and is no longer available.
--- Flags: deprecated
function ReportSuggestion() end



--==============================
-- Duel functions
--==============================

--- Accepts a proposed duel
function AcceptDuel() end

--- Cancels an ongoing duel, or declines an offered duel
function CancelDuel() end

--- Challenges another player to a duel
---@param unit string A unit to target
---@param name string Name of a unit to target
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function StartDuel(unit, name, exactMatch) end



--==============================
-- Equipment Manager functions
--==============================

--- Returns whether the player has enabled the equipment manager. Despite the name, this returns true when the player has enabled the use of the equipment manager through the interface or CVars.
---@return boolean enabled Has the player enable the equipment manager
function CanUseEquipmentSets() end

--- Deletes an equipment set
--- Flags: confirmation
---@param name string Name of an equipment set (case sensitive)
function DeleteEquipmentSet(name) end

--- Clears the list of equipment slots to be ignored when saving sets
function EquipmentManagerClearIgnoredSlotsForSave() end

--- Adds an equipment slot to the list of those ignored when saving sets. Creating or saving a set with SaveEquipmentSet() will ignore any slots on the list, allowing the player to create sets which only switch certain items (e.g. to equip a fishing pole and hat while leaving non-fishing-related items equipped).
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function EquipmentManagerIgnoreSlotForSave(slot) end

--- Returns whether the contents of an equipment slot will be included when saving sets
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return boolean isIgnored True if the contents of the slot will not be included when next creating or saving an equipment set; otherwise false
function EquipmentManagerIsSlotIgnoredForSave(slot) end

--- Removes an equipment slot from the list of those ignored when saving sets. Creating or saving a set with SaveEquipmentSet() will ignore any slots on the list, allowing the player to create sets which only switch certain items (e.g. to equip a fishing pole and hat while leaving non-fishing-related items equipped).
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function EquipmentManagerUnignoreSlotForSave(slot) end

--- Returns whether an equipment set contains locked items. Locked items are those in a transient state -- e.g. on the cursor for moving within the player's bags, placed in the Send Mail or Trade UIs, etc. -- for which the default UI displays the item's icon as grayed out. A set cannot be equipped if it contains locked items.
---@param name string Name of an equipment set (case sensitive)
---@return boolean isLocked True if the equipment set contains locked items
function EquipmentSetContainsLockedItems(name) end

--- Returns information about an equipment set (specified by index)
---@param index number Index of an equipment set (between 1 and GetNumEquipmentSets() )
---@return string name Name of the equipment set
---@return string icon Path to an icon texture for the equipment set
---@return number setID Internal ID number for the set (not used elsewhere in API)
function GetEquipmentSetInfo(index) end

--- Returns information about an equipment set
---@param name string Name of an equipment set (case sensitive)
---@return string icon Unique part of the path to an icon texture for the equipment set; prepend "Interface\Icons\" for the full path
---@return number setID Internal ID number for the set (not used elsewhere in API)
function GetEquipmentSetInfoByName(name) end

--- Returns a table listing the items in an equipment set
---@param name string Name of an equipment set (case sensitive)
---@return table itemIDs A table listing the itemID s of the set's contents, keyed by inventoryID
function GetEquipmentSetItemIDs(name) end

--- Returns a table listing the locations of the items in an equipment set
---@param name string Name of an equipment set (case sensitive)
---@return table itemIDs A table listing the itemLocation s of the set's contents, keyed by inventoryID
function GetEquipmentSetLocations(name) end

--- Returns the number of saved equipment sets
---@return number numSets Number of saved equipment sets
function GetNumEquipmentSets() end

--- Puts an equipment set (specified by index) on the cursor. Can be used to place an equipment set in an action bar slot.
---@param index number Index of an equipment set (between 1 and GetNumEquipmentSets() )
function PickupEquipmentSet(index) end

--- Puts an equipment set on the cursor. Can be used to place an equipment set in an action bar slot.
---@param name string Name of an equipment set (case sensitive)
function PickupEquipmentSetByName(name) end

--- Changes the name of a saved equipment set
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/RenameEquipmentSet
function RenameEquipmentSet() end

--- Saves or creates an equipment set with the player's currently equipped items. If a set with the same name already exists, that set's contents are overwritten.
--- Flags: confirmation
---@param name string Name of the set
---@param icon number Index of an icon to associate with the set: between 1 and GetNumMacroIcons() for an icon from the set of macro icons; values between -INVSLOT_FIRST_EQUIPPED and -INVSLOT_LAST_EQUIPPED for the icon of an item in the equipment set at that (negative) inventoryID
function SaveEquipmentSet(name, icon) end

--- Equips the items in an equipment set
---@param name string Name of an equipment set (case sensitive)
---@return boolean equipped true if the set was equipped; otherwise nil
function UseEquipmentSet(name) end



--==============================
-- Experience (XP) functions
--==============================

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetRewardXP() end

--- Returns the amount of rested bonus experience available. This value increments as the player spends time resting and depletes as the player earns experience from kills while rested.
---@return number exhaustionXP The amount of rested bonus experience available
function GetXPExhaustion() end

--- Returns whether experience gain has been disabled for the player
---@return boolean isDisabled True if experience gain has been disabled for the player; false otherwise
function IsXPUserDisabled() end

--- Returns the player's current amount of experience points
---@param unit string A unit to query; only valid for player
---@return number currXP Current amount of experience points
function UnitXP(unit) end

--- Return the total amount of experience points required for the player to gain a level
---@param unit string A unit to query; only valid for player
---@return number playerMaxXP Total amount of experience points required for the player to gain a level
function UnitXPMax(unit) end



--==============================
-- Faction functions
--==============================

--- Collapses all headers and sub-headers in the Reputation UI. This function works for both major groups (Classic, Burning Crusade, Wrath of the Lich King, Inactive, etc.) and the sub-groups within them (Alliance Forces, Steamwheedle Cartel, Horde Expedition, Shattrath City, etc.).
function CollapseAllFactionHeaders() end

--- Collapses a given faction header or sub-header in the Reputation UI.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function CollapseFactionHeader(index) end

--- Expands all headers and sub-headers in the Reputation UI. Expands headers for both major groups (Classic, Burning Crusade, Wrath of the Lich King, Inactive, etc.) and the sub-groups within them (Alliance Forces, Steamwheedle Cartel, Horde Expedition, Shattrath City, etc.).
function ExpandAllFactionHeaders() end

--- Expands a given faction header or sub-header in the Reputation UI.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function ExpandFactionHeader(index) end

--- Toggles "at war" status for a faction.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function FactionToggleAtWar(index) end

--- Returns information about a faction or header listing
---@param index number The index of the faction in the Reputation window
---@return string name Name of the faction
---@return string description Brief description of the faction, as displayed in the default UI's detail window for a selected faction
---@return any standingID Current standing with the given faction ( number , standingID ) 1 - Hated 2 - Hostile 3 - Unfriendly 4 - Neutral 5 - Friendly 6 - Honored 7 - Revered 8 - Exalted
---@return number barMin The minimum value of the reputation bar at the given standing
---@return number barMax The maximum value of the reputation bar at the given standing
---@return number barValue The player's current reputation with the faction
---@return any atWarWith 1 if the player is at war with the given faction, otherwise nil
---@return any canToggleAtWar 1 if the player can declare war with the given faction, otherwise nil
---@return any isHeader 1 if the index refers to a faction group header
---@return any isCollapsed 1 if the index refers to a faction group header and currently collapsed
---@return any hasRep 1 if the index refers to a faction group header whose reputation value should be displayed
---@return any isWatched 1 if the faction is currently being watched (i.e. displayed above the experience bar)
---@return any isChild 1 if the index refers to a faction sub-group header within another group, or to an individual faction within a sub-group
function GetFactionInfo(index) end

--- Returns the number of entries in the reputation UI.
---@return number numFactions The number of visible factions and headers
function GetNumFactions() end

--- Returns which faction entry is selected in the reputation UI.
---@return number index Index of an entry in the faction list; between 1 and GetNumFactions()
function GetSelectedFaction() end

--- Returns information about the "watched" faction (displayed on the XP bar in the default UI)
---@return string name Name of the faction being watched
---@return any standingID The player's current standing with the faction ( number , standingID ) 1 - Hated 2 - Hostile 3 - Unfriendly 4 - Neutral 5 - Friendly 6 - Honored 7 - Revered 8 - Exalted
---@return number barMin The minimum value for the faction status bar
---@return number barMax The maximum value for the faction status bar
---@return number barValue The current value for the faction status bar
function GetWatchedFactionInfo() end

--- Returns whether a faction is flagged as "inactive". "Inactive" factions behave no differently; the distinction only exists to allow players to hide factions they don't care about from the main display. Factions thus marked are automatically moved to an "Inactive" group at the end of the faction list.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
---@return any isInactive 1 if the faction is currently flagged as "inactive"; otherwise nil
function IsFactionInactive(index) end

--- Removes the "inactive" status from a faction. "Inactive" factions behave no differently; the distinction only exists to allow players to hide factions they don't care about from the main display. Factions thus marked are automatically moved to an "Inactive" group at the end of the faction list.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function SetFactionActive(index) end

--- Flags a faction as inactive. "Inactive" factions behave no differently; the distinction only exists to allow players to hide factions they don't care about from the main display. Factions thus marked are automatically moved to an "Inactive" group at the end of the faction list.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function SetFactionInactive(index) end

--- Selects a faction in the reputation UI.
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function SetSelectedFaction(index) end

--- Makes a faction the "watched" faction (displayed on the XP bar in the default UI)
---@param index number Index of an entry in the faction list; between 1 and GetNumFactions()
function SetWatchedFactionIndex(index) end



--==============================
-- GM Survey functions
--==============================

--- Returns text of multiple-choice question answers in a GM survey
---@param questionIndex number Index of a survey question (between 1 and MAX_SURVEY_QUESTIONS )
---@param answerIndex number Index of one of the question's answers (between 1 and MAX_SURVEY_ANSWERS )
---@return string answerText Text of the answer choice
function GMSurveyAnswer(questionIndex, answerIndex) end

--- Submits an answer to a GM survey question
---@param question number The index of the question being answered
---@param rank number The rank selected
---@param comment string A comment for the given question
function GMSurveyAnswerSubmit(question, rank, comment) end

--- Submits a comment to the current GM survey
---@param comment string The comment made on the GM Survey
function GMSurveyCommentSubmit(comment) end

--- Returns the number of possible answers for a GM Survey question. Deprecated; default UI uses the constant MAX_SURVEY_ANSWERS instead.
--- Flags: deprecated
---@param questionIndex number Index of a survey question (between 1 and MAX_SURVEY_QUESTIONS )
---@return number numAnswers Number of multiple-choice answers to present for the question
function GMSurveyNumAnswers(questionIndex) end

--- Returns the text of a specific question from a GM survey
---@param index number The index of a GM survey question
---@return string surveyQuestion The question being asked
function GMSurveyQuestion(index) end

--- Submits the current GM survey
function GMSurveySubmit() end



--==============================
-- GM Ticket functions
--==============================

--- Abandons the currently pending GM ticket
--- Flags: confirmation
function DeleteGMTicket() end

--- Requests further GM interaction on a ticket to which a GM has already responded
function GMResponseNeedMoreHelp() end

--- Notifies the server that the player's GM ticket issue has been resolved
--- Flags: server
function GMResponseResolve() end

--- Requests GM ticket status from the server. The UPDATE_TICKET event fires when data is ready.
--- Flags: server
function GetGMTicket() end

--- Returns a list of available GM ticket categories. No longer used in the current GM Help UI.
--- Flags: deprecated
function GetGMTicketCategories() end

--- Opens a new GM support ticket. The default UI sets the needResponse flag to true for "Talk to a GM" and "Stuck" tickets, and false for "Report an issue" tickets.
--- Flags: protected
---@param text string The text to be sent in the ticket
---@param needResponse boolean true if the issue requires personal response from a GM; otherwise false
function NewGMTicket(text, needResponse) end

--- Uses the auto-unstuck feature
--- Flags: protected
function Stuck() end

--- Updates the open GM ticket with new text
--- Flags: protected
---@param text string New text for the ticket
function UpdateGMTicket(text) end



--==============================
-- Glyph functions
--==============================

--- Gets a hyperlink for the contents of a glyph socket.
---@param socket number Which glyph socket to query (between 1 and NUM_GLYPH_SLOTS )
---@param talentGroup any Which set of glyphs to query, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return string link A hyperlink for the glyph socket's contents, or "" if the socket is empty
function GetGlyphLink(socket, talentGroup) end

--- Returns information about a glyph socket and its contents.
---@param socket number Which glyph socket to query (between 1 and NUM_GLYPH_SLOTS )
---@param talentGroup any Which set of glyphs to query, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return boolean enabled True if the socket can be given a glyph at the player's current level; false if the socket is locked
---@return number glyphType 1 for minor glyph sockets, 2 for major glyph sockets, 3 for prime glyph sockets
---@return number glyphTooltipIndex Index to be used with GLYPH_SLOT_TOOLTIP# for the overlay
---@return number glyphSpell Spell ID of the spell that inscribed a glyph into the socket, or nil if the socket is empty
---@return string icon Path to a texture for the glyph inscribed into the socket, or nil if the socket is empty
function GetGlyphSocketInfo(socket, talentGroup) end

--- Currently unused. Use the constant NUM_GLYPH_SLOTS instead.
--- Flags: deprecated
function GetNumGlyphSockets() end

--- Returns whether a socket is eligible for the glyph currently awaiting a target.
---@param socket number Which glyph socket to query (between 1 and NUM_GLYPH_SLOTS )
---@return any match 1 if the glyph awaiting a target fits the given socket; nil if it doesn't fit or if no glyph is awaiting a target
function GlyphMatchesSocket(socket) end

--- Applies the glyph currently awaiting a target to a socket. Only valid during glyph application: when the player has activated the glyph item but before she has chosen the glyph slot to put it in (i.e. the glowing hand cursor is showing).
--- Flags: confirmation
---@param socket number Which glyph socket to apply the glyph to (between 1 and NUM_GLYPH_SLOTS )
function PlaceGlyphInSocket(socket) end

--- Removes the glyph from a socket
--- Flags: confirmation
---@param socket number Which glyph socket to query (between 1 and NUM_GLYPH_SLOTS )
function RemoveGlyphFromSocket(socket) end

--- Returns whether the spell currently awaiting a target requires a glyph slot to be chosen.
---@return any canTarget 1 if the spell can target glyph slots
function SpellCanTargetGlyph() end



--==============================
-- Guild bank functions
--==============================

--- Withdraws the item(s) from a slot in the guild bank, automatically adding to the player's bags
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param slot number Index of an item slot in the guild bank tab (between 1 and MAX_GUILDBANK_SLOTS_PER_TAB )
function AutoStoreGuildBankItem(tab, slot) end

--- Purchases the next available guild bank tab
--- Flags: confirmation
function BuyGuildBankTab() end

--- Returns whether the player is allowed to edit a guild bank tab's information
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@return any canEdit 1 if the player can edit the guild bank tab; otherwise nil
function CanEditGuildTabInfo(tab) end

--- Returns whether the player is allowed to pay for repairs using guild bank funds
---@return any canRepair 1 if the player can use guild bank funds for repair; otherwise nil
function CanGuildBankRepair() end

--- Returns whether the player is allowed to withdraw money from the guild bank
---@return any canWithdraw 1 if the player can withdraw money from the guild bank; otherwise nil
function CanWithdrawGuildBankMoney() end

--- Ends interaction with the guild bank vault. Fires the GUILDBANKFRAME_CLOSED event, indicating that APIs related to the Guild Bank vault may no longer have effects or return valid data. (APIs related to guild bank permissions are still usable.)
function CloseGuildBankFrame() end

--- Deposits money into the guild bank
--- Flags: confirmation
---@param money number Amount of money to deposit (in copper)
function DepositGuildBankMoney(money) end

--- Returns the currently selected guild bank tab
---@param currentTab number Index of the selected guild bank tab (between 1 and GetNumGuildBankTabs() )
function GetCurrentGuildBankTab(currentTab) end

--- Returns information about the contents of a guild bank item slot
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param slot number Index of an item slot in the guild bank tab (between 1 and MAX_GUILDBANK_SLOTS_PER_TAB )
---@return string texture Path to an icon texture for the item
---@return number count Number of stacked items in the slot
---@return any locked 1 if the slot is locked (as when a guild member has picked up an item and not yet deposited it elsewhere); otherwise nil
function GetGuildBankItemInfo(tab, slot) end

--- Returns a hyperlink for an item in the guild bank
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param slot number Index of an item slot in the guild bank tab (between 1 and MAX_GUILDBANK_SLOTS_PER_TAB )
---@return string item A hyperlink for the contents of the slot
function GetGuildBankItemLink(tab, slot) end

--- Returns the amount of money in the guild bank. The return value is cached and returns the last value seen when not interacting with a guild bank vault.  This cache works across characters, and is updated when the GUILDBANK_UPDATE_MONEY or GUILDBANKFRAME_OPENED event fires. If no player character has accessed a guild bank since the game client was launched, this function returns 0.
---@return number guildBankMoney Amount of money in the guild bank (in copper)
function GetGuildBankMoney() end

--- Returns information about a transaction in the guild bank money log
---@param index number Index of a transaction in the money log (between 1 and GetNumGuildBankMoneyTransactions() )
---@return any type Type of log event ( string ) deposit - Deposit into the guildbank repair - Repair cost withdrawal from the guildbank withdraw - Withdrawal from the guildbank
---@return string name Name of the guild member responsible for the event, or nil if the name is unknown
---@return number year Number of years since the event occurred
---@return number month Number of months since the event occurred
---@return number day Number of days since the event occurred
---@return number hour Number of hours since the event occurred
function GetGuildBankMoneyTransaction(index) end

--- Returns the cost of the next available guild bank tab
---@return number tabCost Cost to purchase the next guild bank tab (in copper)
function GetGuildBankTabCost() end

--- Returns information about a guild bank tab
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@return string name Name of the tab
---@return string icon Path to the icon texture for the tab
---@return any isViewable 1 if the player is allowed to view the contents of the tab; otherwise nil
---@return any canDeposit 1 if the player is allowed to deposit items into the tab; otherwise nil
---@return number numWithdrawals Maximum number of items (stacks) the player is allowed to withdraw from the tab per day
---@return number remainingWithdrawals Maximum number of items (stacks) the player is currently allowed to withdraw from the tab
function GetGuildBankTabInfo(tab) end

--- Returns information about guild bank tab privileges for the guild rank currently being edited. Used in the default UI's guild control panel.
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@return any canView 1 if the guild rank has permission to view the tab's contents; otherwise nil.
---@return any canDeposit 1 if the guild rank has permission to deposit items into the tab; otherwise nil.
---@return any canUpdateText 1 if the guild rank can update the tab's info text; otherwise nil.
---@return number numWithdrawls Maximum number of withdrawals per day the guild rank is allowed for the given tab.
function GetGuildBankTabPermissions(tab) end

--- Returns text associated with a guild bank tab. Only returns valid data after QueryGuildBankText() has been called to retrieve the text from the server and the following GUILDBANK_UPDATE_TEXT event has fired.
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@return string text Info text provided for the tab
function GetGuildBankText(tab) end

--- Returns information about a transaction in the log for a guild bank tab. Only returns valid information following the GUILDBANKLOG_UPDATE event which fires after calling QueryGuildBankLog() .
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param index number Index of a log entry (between 1 and GetNumGuildBankTransactions(tab) )
---@return any type Type of transaction ( string ) deposit move repair withdraw
---@return string name Name of the guild member responsible for the transaction
---@return string itemLink A hyperlink for the item involved in the transaction
---@return number count Number of stacked items involved in the transaction
---@return number tab1 Index of the source tab, if the item was moved between tabs
---@return number tab2 Index of the destination tab, if the item was moved between tabs
---@return number year Number of years since the event occurred
---@return number month Number of months since the event occurred
---@return number day Number of days since the event occurred
---@return number hour Number of hours since the event occurred
function GetGuildBankTransaction(tab, index) end

--- This function or event no longer exists in version 5.0.4 of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@return number goldWithdrawLimit Amount of money the guild rank is allowed to withdraw from the guild bank per day (in copper), or -1 if the guild rank has unlimited withdrawal privileges
function GetGuildBankWithdrawLimit() end

--- Returns the amount of money the player is allowed to withdraw from the guild bank per day
---@return number withdrawLimit Amount of money the player is allowed to withdraw from the guild bank per day (in copper), or -1 if the player has unlimited withdrawal privileges
function GetGuildBankWithdrawMoney() end

--- Returns the number of transactions in the guild bank money log
---@return number numTransactions Number of transactions in the money log
function GetNumGuildBankMoneyTransactions() end

--- Returns the number of purchased tabs in the guild bank. Returns valid information even if the player is not interacting with a guild bank vault.
---@return number numTabs Number of active tabs in the guild bank
function GetNumGuildBankTabs() end

--- Returns the number of entries in a guild bank tab's transaction log. Only returns valid information following the GUILDBANKLOG_UPDATE event which fires after calling QueryGuildBankLog() .
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@return number numTransactions Number of transactions in the tab's log
function GetNumGuildBankTransactions(tab) end

--- Requests the item transaction log for a guild bank tab from the server. Fires the GUILDBANKLOG_UPDATE event when transaction log information becomes available.
--- Flags: server
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
function QueryGuildBankLog(tab) end

--- Requests information about the contents of a guild bank tab from the server. Fires the GUILDBANKBAGSLOTS_CHANGED event when information about the tab's contents becomes available.
--- Flags: server
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
function QueryGuildBankTab(tab) end

--- Requests guild bank tab info text from the server. The text is not returned immediately; the GUILDBANK_UPDATE_TEXT event fires when text is available for retrieval by the GetGuildBankText() function.
--- Flags: server
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
function QueryGuildBankText(tab) end

--- Selects a tab in the guild bank
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
function SetCurrentGuildBankTab(tab) end

--- Sets the name and icon for a guild bank tab
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param name string New name for the tab
---@param iconIndex number Index of an icon for the tab (between 1 and GetNumMacroItemIcons() )
function SetGuildBankTabInfo(tab, name, iconIndex) end

--- Changes guild bank tab permissions for the guild rank being edited
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param permission any Index of a permission to edit ( number ) 1 - View tab 2 - Deposit items
---@param enabled boolean True to allow permission for the action to the guild rank; false to deny
function SetGuildBankTabPermissions(tab, permission, enabled) end

--- Sets the number of item withdrawals allowed per day for the guild rank being edited
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/SetGuildBankTabWithdraw
function SetGuildBankTabWithdraw() end

--- Sets the info text for a guild bank tab
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param text string New info text for the tab
function SetGuildBankText(tab, text) end

--- Sets the maximum amount of money withdrawals per day allowed for the guild rank being edited
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/SetGuildBankWithdrawLimit
function SetGuildBankWithdrawLimit() end

--- Attempts to withdraw money from the guild bank. Causes a PLAYER_MONEY event to fire, indicating the amount withdrawn has been added to the player's total (see GetMoney() ). Causes an error or system message if amount exceeds the amount of money in the guild bank or the player's allowed daily withdrawal amount.
--- Flags: confirmation
---@param amount number Amount of money to withdraw (in copper)
function WithdrawGuildBankMoney(amount) end



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



--==============================
-- Hyperlink functions
--==============================

--- Returns a hyperlink for an item recently sold to a vendor and available to be repurchased
---@param index number Index of an item in the buyback listing (between 1 and GetNumBuybackItems() )
---@return string link A hyperlink for the item
function GetBuybackItemLink(index) end

--- Returns a hyperlink for a permanently socketed gem. If the given socket contains a permanently socketed gem, returns an item link for that gem (even if a new gem has been dropped in the socket to overwrite the existing gem, but has not yet been confirmed). If the socket is empty, returns nil .
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
---@return string link A hyperlink for the socketed gem
function GetExistingSocketLink(index) end

--- Returns a hyperlink for an item attached to a mail in the player's inbox
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
---@param attachmentIndex number Index of an attachment to the mail (between 1 and ATTACHMENTS_MAX_RECEIVE )
---@return string itemlink A hyperlink for the attachment item
function GetInboxItemLink(mailID, attachmentIndex) end

--- Returns an item link for an equipped item
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return string link An item link for the given item
function GetInventoryItemLink(unit, slot) end

--- Returns information about gems socketed in an item
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@param index number Index of a socket on the item
---@return string name Name of the gem in the socket
---@return string link A hyperlink for the gem in the socket
function GetItemGem(itemID, itemName, itemLink, index) end

--- Returns a hyperlink for an item currently up for loot rolling
---@param id number Index of an item currently up for loot rolling (as provided in the START_LOOT_ROLL event)
---@return string link A hyperlink for the loot roll item
function GetLootRollItemLink(id) end

--- Returns a hyperlink for an item available as loot. Returns nil if the loot slot is empty or contains money.
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
---@return string link A hyperlink for the item
function GetLootSlotLink(slot) end

--- Returns information about the item used by a macro. If a macro contains conditional, random, or sequence commands, this function returns the item which would currently be used if the macro were run.
---@param index number Index of a macro
---@param name string Name of a macro
---@return string name Name of the item
---@return string link A hyperlink for the item
function GetMacroItem(index, name) end

--- Returns a hyperlink for an item available for purchase from a vendor
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@return string link A hyperlink for the item
function GetMerchantItemLink(index) end

--- Returns a hyperlink for a gem added to a socket. If the given socket contains a new gem (one that has been placed in the UI, but not yet confirmed for permanently socketing into the item), returns an item link for that gem. If the socket is empty or has a permanently socketed gem but no new gem, returns nil .
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
---@return string link A hyperlink for the gem added to the socket
function GetNewSocketLink(index) end

--- Returns a hyperlink for an item in a questgiver dialog. Only valid when the questgiver UI is showing the accept/decline, progress, or completion stages of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED , QUEST_PROGRESS and QUEST_FINISHED , or QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return nil or a value from the most recently displayed quest.
---@param itemType any Token identifying one of the possible sets of items ( string ) choice - Items from which the player may choose a reward required - Items required to complete the quest reward - Items given as reward for the quest
---@param index number Index of an item in the set (between 1 and GetNumQuestChoices() , GetNumQuestItems() , or GetNumQuestRewards() , according to itemType )
---@return string link A hyperlink for the item
function GetQuestItemLink(itemType, index) end

--- Returns a hyperlink for an entry in the player's quest log
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
---@return string link A hyperlink for the quest
function GetQuestLink(questIndex) end

--- Returns a hyperlink for an item related to the selected quest in the quest log
---@param itemType any Token identifying one of the possible sets of items ( string ) choice - Items from which the player may choose a reward reward - Items always given as reward for the quest
---@param index number Index of an item in the set (between 1 and GetNumQuestLogChoices() or GetNumQuestLogRewards() , according to itemType )
function GetQuestLogItemLink(itemType, index) end

--- Returns a hyperlink for an item attached to the outgoing message
---@param slot number Index of an outgoing attachment slot (between 1 and ATTACHMENTS_MAX_SEND )
---@return string itemlink A hyperlink for the attachment item
function GetSendMailItemLink(slot) end

--- Returns a hyperlink for a spell
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell, optionally including secondary text (e.g. "Mana Burn" to find the player's highest rank, or "Mana Burn(Rank 2)" -- no space before the parenthesis -- for a specific rank)
---@param id number Numeric ID of a spell
---@return string link A hyperlink for the spell
---@return string tradeLink A hyperlink representing the player's list of trade skill recipes, if the spell is a trade skill (i.e. if "casting" the spell opens a trade skill window)
function GetSpellLink(index, bookType, name, id) end

--- Returns a hyperlink for a talent
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param talentIndex number Index of a talent option (between 1 and GetNumTalents() )
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return string link A hyperlink representing the talent and the number of points spent in it
function GetTalentLink(tabIndex, talentIndex, inspect, pet, talentGroup) end

--- Returns a hyperlink for an item offered for trade by the player
---@param index number Index of an item offered for trade by the player (between 1 and MAX_TRADE_ITEMS )
---@return string link A hyperlink for the item
function GetTradePlayerItemLink(index) end

--- Returns a hyperlink for the item created by a tradeskill recipe. The tooltip produced when resolving the link describes only the item created by the recipe. For a link which describes the recipe itself (its reagents and description), see GetTradeSkillRecipeLink() .
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string link A hyperlink for the item created by the recipe
function GetTradeSkillItemLink(index) end

--- Returns a hyperlink to the player's list of recipes for the current trade skill
---@return string link A hyperlink other players can resolve to see the player's full list of tradeskill recipes
function GetTradeSkillListLink() end

--- Returns a hyperlink for a reagent in a tradeskill recipe
---@param skillIndex number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@param reagentIndex number Index of a reagent in the recipe (between 1 and GetTradeSkillNumReagents() )
---@return string link A hyperlink for the reagent item
function GetTradeSkillReagentItemLink(skillIndex, reagentIndex) end

--- Returns hyperlink for a tradeskill recipe. The tooltip produced when resolving the link describes the recipe itself -- its reagents and (if present) description -- in addition to (if applicable) the item created. For a link which only describes the created item, see GetTradeSkillItemLink() .
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string link A hyperlink for the trade skill recipe
function GetTradeSkillRecipeLink(index) end

--- Returns a hyperlink for an item offered for trade by the target
---@param index number Index of an item offered for trade by the target (between 1 and MAX_TRADE_ITEMS )
---@return string link A hyperlink for the item
function GetTradeTargetItemLink(index) end

--- Returns a hyperlink for the item associated with a trainer service. Currently only returns item links for trainer services which teach trade skill recipes which produce items; does not return spell or recipe links.
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string link A hyperlink for the item associated with a trainer service
function GetTrainerServiceItemLink(index) end



--==============================
-- In-game movie playback functions
--==============================

--- Ends in-game movie playback
function GameMovieFinished() end

--- Returns the horizontal resolution available for displaying movie content
---@return number resolution Horizontal resolution (in pixels) available for displaying movie content
function GetMovieResolution() end

--- Returns whether an in-game cinematic is playing. Applies to in-game-engine cinematics (such as when logging into a new character for the first time), not prerecorded movies.
---@return any inCinematic 1 if an in-game cinematic is playing; otherwise nil
function InCinematic() end

--- Displays the introductory cinematic for the player's race. Only has effect if the player has never gained any experience.
function OpeningCinematic() end

--- Exits a currently playing in-game cinematic. Applies to in-game-engine cinematics (such as when logging into a new character for the first time), not prerecorded movies.
function StopCinematic() end



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



--==============================
-- Instance functions
--==============================

--- Returns whether the player can reset instances. Used to determine whether to display the "Reset Instance" option in the unit popup menu for the player.
---@return any canResetInstances 1 if the player can currently reset instances; otherwise nil
function CanShowResetInstances() end

--- Returns the 5 player selected dungeon difficulty
---@return any difficulty The current 5 player dungeon difficulty ( number ) 1 - Normal 2 - Heroic
function GetDungeonDifficulty() end

--- Returns the amount of time left until the player is removed from the current instance. Used when the player is in an instance he doesn't own; e.g. if the player enters an instance with a group and is then removed from the group.
---@return number timeleft The number of seconds until the player is booted from the current instance
function GetInstanceBootTimeRemaining() end

--- Returns difficulty setting for the current dungeon/raid instance.
---@return any difficulty The current instance's difficulty setting ( number ) 1 - Normal (5 or 10 players) 2 - Heroic (5 players) / Normal (25 players) 3 - Heroic (10 players) 4 - Heroic
function GetInstanceDifficulty() end

--- Returns instance information about the current area
---@return string name Name of the instance or world area
---@return any type Type of the instance ( string ) arena - A PvP Arena instance none - Normal world area (e.g. Northrend, Kalimdor, Deeprun Tram) party - An instance for 5-man groups pvp - A PvP battleground instance raid - An instance for raid groups
---@return any difficulty Difficulty setting of the instance ( number ) 1 - In raids, this represents 10 Player.  In instances, Normal. 2 - In raids, this represents 25 Player.  In instances, Heroic. 3 - In raids, this represents 10 Player Heroic.  In instances, Epic (unused for PvE instances but returned in some battlegrounds). 4 - In raids, this represents 25 Player Heroic.  No corollary in instances.
---@return string difficultyName String representing the difficulty of the instance. E.g. "10 Player"
---@return number maxPlayers Maximum number of players allowed in the instance
---@return number playerDifficulty Unknown
---@return boolean isDynamicInstance Unknown
function GetInstanceInfo() end

--- Returns time remaining before the player is saved to a recently entered instance.
---@return number seconds Time remaining before the player is saved to the instance
function GetInstanceLockTimeRemaining() end

--- Returns the number of instances to which the player is saved
---@return number savedInstances Number of instances to which the player is saved
function GetNumSavedInstances() end

--- Returns the number of world state UI elements. World State UI elements include PvP, instance, and quest objective information (displayed at the top center of the screen in the default UI) as well as more specific information for "control point" style PvP objectives. Examples: the Horde/Alliance score in Arathi Basin, the tower status and capture progress bars in Hellfire Peninsula, the progress text in the Black Morass and Violet Hold instances, and the event status text for quests The Light of Dawn and The Battle For The Undercity .
---@return number numUI Returns the number of world state elements
function GetNumWorldStateUI() end

--- Returns information on a specific instance to which the player is saved
---@param index number Index of a saved instance (between 1 and GetNumSavedInstances() )
---@return string instanceName Name of the instance
---@return number instanceID Unique identifier of the saved instance (commonly known as a RaidID)
---@return number instanceReset Approximate number of seconds remaining until the instance resets
---@return any instanceDifficulty Difficulty level of the saved instance ( number ) 1 - Normal ('10 Player' if instance is a raid) 2 - Heroic ('25 Player' if instance is a raid) 3 - 10 Player Heroic 4 - 25 Player Heroic
---@return boolean locked
---@return boolean extended true if the reset time has been extended past its normal time; otherwise false
---@return number instanceIDMostSig
---@return boolean isRaid
---@return number maxPlayers Number of players allowed
---@return string difficultyName A string representing the difficulty of the given instance.
function GetSavedInstanceInfo(index) end

--- Returns information about a world state UI element. World State UI elements include PvP, instance, and quest objective information (displayed at the top center of the screen in the default UI) as well as more specific information for "control point" style PvP objectives. Examples: the Horde/Alliance score in Arathi Basin, the tower status and capture progress bars in Hellfire Peninsula, the progress text in the Black Morass and Violet Hold instances, and the event status text for quests The Light of Dawn and The Battle For The Undercity .
---@param index number Index of a world state UI element (between 1 and GetNumWorldStateUI() )
---@return number uiType 1 if the element should be conditionally displayed (based on the state of the "Show World PvP Objectives" setting and the player's location); any other value if the element is always displayed
---@return number state State of the element: 0 always indicates the element should be hidden; other possible states vary by context (e.g. in Warsong Gulch, state 2 indicates the team holds the enemy flag)
---@return string text Text to be displayed for the element
---@return string icon Path to a texture for the element's main icon (usually describing the element itself: e.g. a Horde or Alliance icon for elements displaying a battleground score)
---@return string dynamicIcon Path to a texture for a secondary icon (usually describing transient status: e.g. a flag icon in Warsong Gulch)
---@return string tooltip Text to be displayed when mousing over the UI element
---@return string dynamicTooltip Text to be displayed when mousing over the element's dynamicIcon
---@return any extendedUI Identifies the type of additional UI elements to display if applicable ( string ) "" - No additional UI should be displayed "CAPTUREPOINT" - A capture progress bar should be displayed for the element
---@return number extendedUIState1 Index of the capture progress bar corresponding to the element
---@return number extendedUIState2 Position of the capture bar (0 = left/Horde edge, 100 = right/Alliance edge)
---@return number extendedUIState3 Width of the neutral section of the capture bar: e.g. if 50, the extendedUIState2 values 0-25 correspond to Horde ownership of the objective, values 76-100  to Alliance ownership, and values 26-75 to no ownership
function GetWorldStateUIInfo(index) end

--- Returns whether the player is in an instance (and its type if applicable)
---@return any isInstance 1 if the player is in an instance, otherwise nil
---@return any instanceType The type of instance the player is in ( string ) arena - Player versus player arena none - Not inside an instance party - 5-man instance pvp - Player versus player battleground raid - Raid instance
function IsInInstance() end

--- Teleports the player to or from their current LFG dungeon
---@param portOut boolean A boolean flag that indicates if the player is trying to teleport out of the dungeon, or not.
function LFGTeleport(portOut) end

--- Requests information about saved instances from the server. Data is not returned immediately; the UPDATE_INSTANCE_INFO event when the raid information is available for retrieval via GetSavedInstanceInfo() and related functions.
--- Flags: server
function RequestRaidInfo() end

--- Resets all non-saved instances associated with the player. Only instances to which the player is not saved may be reset (i.e. normal 5-man dungeons, not heroic dungeons or raids), and only by a solo player or group leader.
function ResetInstances() end

--- Allows leaving a recently entered instance to which the player would otherwise be saved.
---@param response any Whether the player wishes to remain in the instance ( boolean ) false - Exit to the nearest graveyard true - Remain in the zone, saving the player to this instance
function RespondInstanceLock(response) end

--- Sets the player's 5 player dungeon difficulty preference.
---@param difficulty any A difficulty level ( number ) 1 - 5 Player (Normal) 2 - 5 Player
function SetDungeonDifficulty(difficulty) end

--- Sets the player's raid dungeon difficulty preference. The dungeon difficulty has no effect on the instance created if the player is not the raid leader or while you are inside an instance already.
---@param difficulty any Difficulty level for raid dungeons 1 - 10 Player 2 - 25 Player 3 - 10 Player (Heroic) 4 - 25 Player
function SetRaidDifficulty(difficulty) end



--==============================
-- Inventory functions
--==============================

--- Cancels equipping a bind-on-equip item. When the player attempts to equip a bind-on-equip item, the default UI displays a dialog warning that equipping the item will cause it to become soulbound; this function is called when canceling that dialog.
---@param index number Index of a pending equip warning; currently always 0 as only one equip warning will be given at a time
function CancelPendingEquip(index) end

--- Attempts to equip an arbitrary item. The item is automatically equipped in the first available slot in which it fits. To equip an item in a specific slot, see EquipCursorItem() .
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
function EquipItemByName(itemID, itemName, itemLink) end

--- Confirms equipping a bind-on-equip item. Usable following the EQUIP_BIND_CONFIRM or AUTOEQUIP_BIND_CONFIRM , which fires when the player attempts to equip a bind-on-equip item
--- Flags: confirmation
---@param index number Index provided by the EQUIP_BIND_CONFIRM or AUTOEQUIP_BIND_CONFIRM event; currently always 0
function EquipPendingItem(index) end

--- Returns the durability warning status of an equipped item. Looking up the status returned by this function in the INVENTORY_ALERT_COLORS table provides color values, used in the default UI to highlight parts of the DurabiltyFrame (i.e. the "armored man" image) that appears when durability is low.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any status Alert status for the item in the given slot ( number ) 0 - No alert; the slot is empty, contains an item whose durability is above critical levels, or contains an item without a durability value 1 - The item's durability is dangerously low 2 - The item's durability is at zero
function GetInventoryAlertStatus(slot) end

--- Returns whether an equipped item is broken
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any isBroken 1 if the item is broken (durability zero); otherwise nil
function GetInventoryItemBroken(unit, slot) end

--- Returns cooldown information about an equipped item
---@param unit string A unit to query; only valid for 'player'
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the item is ready
---@return number duration The length of the cooldown, or 0 if the item is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the item is ready.)
function GetInventoryItemCooldown(unit, slot) end

--- Returns the number of items stacked in an inventory slot.
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return number count The amount of items stacked in the inventory slot
function GetInventoryItemCount(unit, slot) end

--- Returns the current durability level of an equipped item. If an item does not have durability (for example, heirlooms, tabards and some other items) then this function will simply return nil .
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return number durability The item's current durability, the first number listed in the item's tooltip where it displays the durability information: for example 4 in 4/29.
---@return number max The item's maximum durability, the first number listed in the item's tooltip where it displays the durability information: for example 29 in 4/29
function GetInventoryItemDurability(slot) end

--- Returns the gems socketed in an equipped item. The IDs returned refer to the gems themselves (not the enchantments they provide), and thus can be passed to GetItemInfo() to get a gem's name, quality, icon, etc.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any gem1 Item ID of the first gem socketed in the item
---@return any gem2 Item ID of the second gem socketed in the item
---@return any gem3 Item ID of the third gem socketed in the item
function GetInventoryItemGems(slot) end

--- Returns the item ID of an equipped item
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any id Numeric ID of the item in the given slot
function GetInventoryItemID(unit, slot) end

--- Returns the quality level of an equipped item
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return number quality The quality level of the item
function GetInventoryItemQuality(unit, slot) end

--- Returns the icon texture for an equipped item
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return string texture Path to an icon texture for the item
function GetInventoryItemTexture(unit, slot) end

--- Returns a list of items that can be equipped in a given inventory slot
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return table availableItems A table listing itemID s of items which can be equipped in the slot, keyed by itemLocation
function GetInventoryItemsForSlot(slot) end

--- Returns information about an inventory slot
---@param slotName any Name of an inventory slot to query ( string ) AmmoSlot - Ranged ammunition slot BackSlot - Back (cloak) slot Bag0Slot - Backpack slot Bag1Slot - First bag slot Bag2Slot - Second bag slot Bag3Slot - Third bag slot ChestSlot - Chest slot FeetSlot - Feet (boots) slot Finger0Slot - First finger (ring) slot Finger1Slot - Second finger (ring) slot HandsSlot - Hand (gloves) slot HeadSlot - Head (helmet) slot LegsSlot - Legs (pants) slot MainHandSlot - Main hand weapon slot NeckSlot - Necklace slot RangedSlot - Ranged weapon or relic slot SecondaryHandSlot - Off-hand (weapon, shield, or held item) slot ShirtSlot - Shirt slot ShoulderSlot - Shoulder slot TabardSlot - Tabard slot Trinket0Slot - First trinket slot Trinket1Slot - Second trinket slot WaistSlot - Waist (belt) slot WristSlot - Wrist (bracers) slot
---@return number id The numeric slotId usable in other Inventory functions
---@return string texture The path to the texture to be displayed when this slot is empty
---@return any checkRelic 1 if the slot might be the relic slot; otherwise nil. The ranged slot token is re-used for the relic slot; if this return is 1, UnitHasRelicSlot should be used to determine how the slot should be displayed.
function GetInventorySlotInfo(slotName) end

--- Returns whether an item is currently equipped
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isEquipped 1 if the item is equipped on the player character; otherwise nil
function IsEquippedItem(itemID, itemName, itemLink) end

--- Returns whether any items of a given type are currently equipped. Possible arguments include the localized names of item classes (as returned from GetAuctionItemClasses ; e.g. "Weapon", "Armor"), subclasses (as returned from GetAuctionItemSubClasses ; e.g. "One-handed axes", "Shields", "Cloth"), and the global tokens or localized names for equip locations (as returned from GetAuctionInvTypes ; e.g. "INVTYPE_WEAPONMAINHAND", "Off Hand").
---@param type string Name of an item class, subclass, or equip location
---@return any isEquipped 1 if the player has equipped any items of the given type; otherwise nil
function IsEquippedItemType(type) end

--- Returns whether an inventory slot is locked. Items become locked while being moved, split, or placed into other UI elements (such as the mail, trade, and auction windows); the item is unlocked once such an action is completed.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any isLocked 1 if the item in the inventory slot is locked; otherwise nil
function IsInventoryItemLocked(slot) end

--- This function or event no longer exists in version 4.3.0 of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param slot number Index of a key slot within the keyring
---@return number slot Identifier for the key slot usable with Inventory APIs
function KeyRingButtonIDToInvSlotID(slot) end

--- Sets a Texture object to display the icon of an equipped item. Adapts the square item icon texture to fit within the circular "portrait" frames used in many default UI elements.
---@param texture table A Texture object
---@param unit string A unit whose item should be displayed; only valid for player
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function SetInventoryPortraitTexture(texture, unit, slot) end

--- Opens an equipped item for socketing
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function SocketInventoryItem(slot) end

--- This is a Blizzard internal function internal
--- Flags: internal
function UpdateInventoryAlertStatus() end

--- Activate (as with right-clicking) an equipped item. If the inventoryID passed refers to an empty slot or a slot containing an item without a "Use:" action, this function is not protected (i.e. usable only by the Blizzard UI), but also has no effect.
--- Flags: protected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function UseInventoryItem(slot) end



--==============================
-- Item Text functions
--==============================

--- Ends interaction with a text object or item. Causes the ITEM_TEXT_CLOSED event to fire, indicating that ItemText APIs are no longer valid.
function CloseItemText() end

--- Returns the original author of the currently viewed text item. Used for mail messages sent by other players; when the player makes a permanent copy of a letter and reads it from inventory, the default UI uses this function to display a signature (e.g. "From, Leeroy") at the end of the message text.
---@return string creator Creator of the text item, or nil if not available
function ItemTextGetCreator() end

--- Returns the name of the currently viewed text item. Used for readable world objects (plaques, books on tables, etc) and readable inventory items (looted books/parchments/scrolls/etc, saved copies of mail messages). For saved mail messages the name returned is always "Plain Letter" (or localized equivalent); the message subject is lost when saving a copy.
---@return string text Name of the text item
function ItemTextGetItem() end

--- Returns display style information for the currently viewed text item. The value returned can be used to look up background textures and text colors for display:
---@return any material String identifying a display style for the current text item, or nil for the default style ( string ) Bronze - Colored metallic background Marble - Light stone background Parchment - Yellowed parchment background (default) Silver - Gray metallic background Stone - Dark stone background
function ItemTextGetMaterial() end

--- Returns the current page number in the currently viewed text item
---@return number page Number of the currently displayed page
function ItemTextGetPage() end

--- Returns the text of the currently viewed text item. Used for readable world objects (plaques, books on tables, etc) and readable inventory items (looted books/parchments/scrolls/etc, saved copies of mail messages). Returns valid data only between the ITEM_TEXT_BEGIN and ITEM_TEXT_CLOSED events, with the ITEM_TEXT_READY event indicating when new text is available (as when changing pages).
---@return string text Text to be displayed for the current page of the currently viewed text item
function ItemTextGetText() end

--- Returns whether the currently viewed text item has additional pages
---@return any next 1 if the currently viewed text item has one or more pages beyond the current page; otherwise nil
function ItemTextHasNextPage() end

--- Moves to the next page in the currently viewed text item. The ITEM_TEXT_READY event fires when text for the next page becomes available. Does nothing if already viewing the last page of text.
function ItemTextNextPage() end

--- Moves to the previous page in the currently viewed text item. The ITEM_TEXT_READY event fires when text for the previous page becomes available. Does nothing if already viewing the first page of text.
function ItemTextPrevPage() end



--==============================
-- Item functions
--==============================

--- Confirms enchanting an item (when the item will become soulbound as a result). Usable following the BIND_ENCHANT event which fires upon attempting to perform an enchantment that would cause the target item to become soulbound.
--- Flags: confirmation
function BindEnchant() end

--- Confirms using an item, if using the item causes it to become soulbound. Usable in response to the USE_BIND_CONFIRM which fires when the player attempts to use a "Bind on Use" item.
--- Flags: confirmation
function ConfirmBindOnUse() end

--- Confirms taking an action which renders a looted Bind on Pickup item non-tradeable. A Bind on Pickup item looted by the player can be traded to other characters who were originally eligible to loot it, but only within a limited time after looting. This period can be ended prematurely if the player attempts certain actions (such as enchanting the item).
--- Flags: confirmation
---@param id number Number identifying the item (as provided by the END_BOUND_TRADEABLE event)
function EndBoundTradeable(id) end

--- Confirms taking an action which renders a purchased item non-refundable. Items bought with alternate currency (honor points, arena points, or special items such as Emblems of Heroism and Dalaran Cooking Awards) can be returned to a vendor for a full refund, but only within a limited time after the original purchase. This period can be ended prematurely if the player attempts certain actions (such as enchanting the item).
--- Flags: confirmation
---@param id number Number identifying the item (as provided by the END_REFUND event)
function EndRefund(id) end

--- Returns cooldown information about an arbitrary item
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the item is ready
---@return number duration The length of the cooldown, or 0 if the item is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the item is ready.)
function GetItemCooldown(itemID, itemName, itemLink) end

--- Returns information about how many of a given item the player has or on remaining item charges.
---@param itemId number An item id
---@param itemName string An item name
---@param itemLink string An item link
---@param includeBank boolean true to include items in the bank in the returned count, otherwise false
---@param includeCharges boolean true to count charges for applicable items, otherwise false
---@return number itemCount The number of the given item the player has in possession (possibly including items in the bank), or the total number of charges on those items
function GetItemCount(itemId, itemName, itemLink, includeBank, includeCharges) end

--- Returns the path to an icon texture for the item. Unlike GetItemInfo , this function always returns icons for valid items, even if the item is not in the client's cache.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return string texture Path to an icon texture for the item
function GetItemIcon(itemID, itemName, itemLink) end

--- Returns information about an item, by name, link or id. Only returns information for items in the WoW client's local cache; returns nil for items the client has not seen.
---@param itemID number An item's ID
---@param itemName string An item's name.  This value will only work if the player has the item in their bags.
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return string name Name of the item
---@return string link A hyperlink for the item
---@return number quality Quality (rarity) level of the item.
---@return number iLevel Internal level of the item;
---@return number reqLevel Minimum character level required to use or equip the item
---@return string class Localized name of the item's class/type (as in the list returned by GetAuctionItemClasses() )
---@return string subclass Localized name of the item's subclass/subtype (as in the list returned by GetAuctionItemSubClasses() )
---@return number maxStack Maximum stack size for the item (i.e. largest number of items that can be held in a single bag slot)
---@return string equipSlot Non-localized token identifying the inventory type of the item (as in the list returned by GetAuctionItemInvTypes() ); name of a global variable containing the localized name of the inventory type
---@return string texture Path to an icon texture for the item
---@return number vendorPrice Price an NPC vendor will pay to buy the item from the player.  This value was added in patch 3.2.
function GetItemInfo(itemID, itemName, itemLink) end

--- Returns color values for use in displaying items of a given quality. Color components are floating-point values between 0 (no component) and 1 (full intensity of the component).
---@param quality number An numeric item quality (rarity) value
---@return number redComponent Red component of the color
---@return number greenComponent Green component of the color
---@return number blueComponent Blue component of the color
---@return string hexColor Color value of a colorString for formatting text with the color
function GetItemQualityColor(quality) end

--- Returns information about the spell cast by an item's "Use:" effect
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return string name Name of the spell
---@return string rank Secondary text associated with the spell (often a rank, e.g. "Rank 7"); or the empty string ( "" ) if not applicable
function GetItemSpell(itemID, itemName, itemLink) end

--- Returns a summary of the difference in stat bonuses between two items. Keys in the table returned are the names of global variables containing the localized names of the stats (e.g. _G["ITEM_MOD_SPIRIT_SHORT"] = "Spirit" , _G["ITEM_MOD_HIT_RATING_SHORT"] = "Hit Rating" ).
---@param item1Link string An item's hyperlink, or any string containing the itemString portion of an item link
---@param item2Link string Another item's hyperlink, or any string containing the itemString portion of an item link
---@param returnTable table Reference to a table to be filled with return values
---@return table statTable A table listing the difference in stat bonuses provided by the items (i.e. if item1Link is equipped, what changes to the player's stats would occur if it is replaced by item2Link )
function GetItemStatDelta(item1Link, item2Link, returnTable) end

--- Returns a summary of an item's stat bonuses. Keys in the table returned are the names of global variables containing the localized names of the stats (e.g. _G["ITEM_MOD_SPIRIT_SHORT"] = "Spirit" , _G["ITEM_MOD_HIT_RATING_SHORT"] = "Hit Rating" ).
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@param returnTable table Reference to a table to be filled with return values
---@return table statTable A table listing the stat bonuses provided by the item
function GetItemStats(itemLink, returnTable) end

--- Returns information about uniqueness restrictions for equipping an item.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's link
---@return number uniqueFamily The family of items with special uniqueness restrictions to which the item belongs
---@return number maxEquipped The maximum number of items under this restriction that can be equipped
function GetItemUniqueness(itemID, itemName, itemLink) end

--- Returns whether an item is consumable. Indicates whether the item is destroyed upon use, not necessarily whether it belongs to the "Consumable" type/class.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any consumable 1 if the item is consumable; otherwise nil
function IsConsumableItem(itemID, itemName, itemLink) end

--- Returns whether an item is being used
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isItem 1 if the item's "Use:" action is currently being cast, is waiting for the user to choose a target, or is otherwise in progress; otherwise nil
function IsCurrentItem(itemID, itemName, itemLink) end

--- Returns whether an item's appearance can be previewed using the Dressing Room feature
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isDressable 1 if the item's appearance can be previewed using the Dressing Room feature; otherwise nil
function IsDressableItem(itemID, itemName, itemLink) end

--- Returns whether an item can be equipped. Indicates whether an item is capable of being equipped on a character, not necessarily whether the player character is able to wear it.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isEquippable 1 if the item can be equipped, otherwise nil
function IsEquippableItem(itemID, itemName, itemLink) end

--- Returns whether an item can be used against hostile units. Harmful items include grenades and various quest items ("Use this to zap 30 murlocs!").
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isHarmful 1 if the item can be used against hostile units; otherwise nil
function IsHarmfulItem(itemID, itemName, itemLink) end

--- Returns whether an item can be used on the player or friendly units. Helpful items include potions, scrolls, food and drink.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isHarmful 1 if the item can be used on the player or friendly units; otherwise nil
function IsHelpfulItem(itemID, itemName, itemLink) end

--- Returns whether the player is in range to use an item on a unit
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@param unit string A unit on which to use the item
---@return any inRange 1 if the player is near enough to use the item on the unit; 0 if not in range; nil if the unit is not a valid target for the item
function IsItemInRange(itemID, itemName, itemLink, unit) end

--- Returns whether an item can currently be used. Does not account for item cooldowns (see GetItemCooldown() -- returns 1 if other conditions allow for using the item (e.g. if the item can only be used while outdoors).
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's link
---@return any isUsable 1 if the item is usable; otherwise nil
---@return any notEnoughMana 1 if the player lacks the resources (e.g. mana, energy, runes) to use the item; otherwise nil
function IsUsableItem(itemID, itemName, itemLink) end

--- Returns whether an item has a range limitation for its use. For example, Mistletoe can only be used on another character within a given range of the player, but a Hearthstone has no target and thus no range restriction. Returns nil for items which have a range restriction but are area-targeted and not unit-targeted (e.g. grenades).
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any hasRange 1 if the item has an effective range; otherwise nil.
function ItemHasRange(itemID, itemName, itemLink) end

--- Confirms replacing an existing enchantment. Usable in response to the REPLACE_ENCHANT event which fires when the player attempts to apply a temporary or permanent enchantment to an item which already has one.
--- Flags: confirmation
function ReplaceEnchant() end

--- Returns whether the spell currently awaiting a target requires an item to be chosen. Only applies when the player has attempted to cast a spell but the spell requires a target before it can begin casting (i.e. the glowing hand cursor is showing).
---@return any canTarget 1 if the spell can target an item; otherwise nil
function SpellCanTargetItem() end

--- Casts the spell currently awaiting a target on an item. Usable when the player has attempted to cast a spell (e.g. an Enchanting recipe or the "Use:" effect of a sharpening stone or fishing lure) but the spell requires a target before it can begin casting (i.e. the glowing hand cursor is showing).
--- Flags: protected
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
function SpellTargetItem(itemID, itemName, itemLink) end

--- Uses an arbitrary item (optionally on a specified unit) protected
--- Flags: protected
---@param name string The name of the item to use
---@param target any The unit to use as the target of the item, if applicable
function UseItemByName(name, target) end



--==============================
-- Keybind functions
--==============================

--- Clears any registered override bindings for a given owner. An override binding is a temporary key or click binding that can be used to override the default bindings.  The bound key will revert to its normal setting once the override has been removed.
---@param owner table A Frame (or other widget ) object for which override bindings are registered
function ClearOverrideBindings(owner) end

--- Returns information about a key binding
---@param index number Index in the key bindings list (between 1 and GetNumBindings() )
---@return string commandName Name of the binding command
---@return string binding1 First key binding for the command, or nil if no key is bound
---@return string binding2 Second key binding for the command, or nil if no key is bound
function GetBinding(index) end

--- Returns the action bound to a key or key combination
---@param key string A key or key combination (e.g. "CTRL-2")
---@param checkOverride boolean True to check possible override bindings for the key , false or omitted to check only normal bindings
---@return string action Name of the action associated with the key, or the empty string ( "" ) if the key is not bound to an action
function GetBindingAction(key, checkOverride) end

--- Returns the action bound to a key or key combination
---@param key string A key or key combination (e.g. "CTRL-2")
---@return string action Name of the action associated with the key, or the empty string ( "" ) if the key is not bound to an action
function GetBindingByKey(key) end

--- Returns the key combinations for a given binding command. Although the default UI only allows two combinations to be bound to a command, more than two can be set via the API.
---@param COMMAND string Name of a binding command
---@return string key1 First key binding for the command, or nil if no key is bound
function GetBindingKey(COMMAND) end

--- Returns which set of key bindings is currently in use
---@return any bindingSet Set of bindings currently in use ( number ) 1 - Key bindings shared by all characters 2 - Character specific key bindings
function GetCurrentBindingSet() end

--- Returns the number of entries in the key bindings list
---@return number numBindings Number of binding actions (and headers) in the key bindings list
function GetNumBindings() end

--- Loads a set of key bindings. The UPDATE_BINDINGS event fires when the new bindings have taken effect.
---@param set any A set of key bindings to load ( number ) 0 - Default key bindings 1 - Account-wide key bindings 2 - Character-specific key bindings
function LoadBindings(set) end

--- Runs the script associated with a key binding action. Note: this function is not protected, but the scripts for many default key binding actions are (and can only be called by the Blizzard UI).
---@param COMMAND string Name of a key binding command
function RunBinding(COMMAND) end

--- Saves the current set of key bindings
---@param set any A set to which to save the current bindings ( number ) 1 - Account-wide key bindings 2 - Character-specific key bindings
function SaveBindings(set) end

--- Binds a key combination to a binding command
---@param key string A key or key combination (e.g. "CTRL-2")
---@param command string Name of a key binding command, or nil to unbind the key
---@return any success 1 if the key binding (or unbinding) was successful; otherwise nil
function SetBinding(key, command) end

--- Binds a key combination to "click" a Button object. When the binding is used, all of the relevant mouse handlers on the button (save for OnEnter and OnLeave ) fire just as if the button were activated by the mouse (including OnMouseDown and OnMouseUp as the key is pressed and released).
---@param key string A key or key combination (e.g. "CTRL-2")
---@param buttonName string Name of a Button object on which the binding simulates a click
---@param mouseButton string Name of the mouse button with which the binding simulates a click
---@return any success 1 if the key binding was successful; otherwise nil
function SetBindingClick(key, buttonName, mouseButton) end

--- Binds a key combination to use an item in the player's possession
---@param key string A key or key combination (e.g. "CTRL-2")
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any success 1 if the binding was successful; otherwise nil
function SetBindingItem(key, itemID, itemName, itemLink) end

--- Binds a key combination to run a macro
---@param key string A key or key combination (e.g. "CTRL-2")
---@param index number Index of a macro
---@param name string Name of a macro
---@return any success 1 if the key binding was successful; otherwise nil
function SetBindingMacro(key, index, name) end

--- Binds a key combination to cast a spell
---@param key string A key or key combination (e.g. "CTRL-2")
---@param spellname string Name of a spell to bind
---@return any success 1 if the key binding was successful; otherwise nil
function SetBindingSpell(key, spellname) end

--- Overrides the default mouselook bindings to perform another binding with the mouse buttons
---@param key any The mouselook key to override ( string ) BUTTON1 - Override the left mouse button BUTTON2 - Override the right mouse button
---@param binding string The binding to perform instead of mouselooking, or nil to clear the override
function SetMouselookOverrideBinding(key, binding) end

--- Sets an override binding for a binding command. Override bindings are temporary. The bound key will revert to its normal setting once the override is removed. Priority overrides work the same way but will revert to the previous override binding (if present) rather than the base binding for the key.
---@param owner table The Frame (or other widget ) object responsible for this override
---@param isPriority boolean True if this binding takes higher priority than other override bindings; false otherwise
---@param key string A key or key combination (e.g. "CTRL-2")
---@param command string Name of a key binding command, or nil to remove the override binding
function SetOverrideBinding(owner, isPriority, key, command) end

--- Sets an override binding to "click" a Button object. Override bindings are temporary. The bound key will revert to its normal setting once the override is removed. Priority overrides work the same way but will revert to the previous override binding (if present) rather than the base binding for the key.
---@param owner table The Frame (or other widget ) object responsible for this override
---@param isPriority boolean True if this binding takes higher priority than other override bindings; false otherwise
---@param key string A key or key combination (e.g. "CTRL-2")
---@param buttonName string Name of a Button object on which the binding simulates a click
---@param mouseButton string Name of the mouse button with which the binding simulates a click
function SetOverrideBindingClick(owner, isPriority, key, buttonName, mouseButton) end

--- Sets an override binding to use an item in the player's possession. Override bindings are temporary. The bound key will revert to its normal setting once the override is removed. Priority overrides work the same way but will revert to the previous override binding (if present) rather than the base binding for the key.
---@param owner table The Frame (or other widget ) object responsible for this override
---@param isPriority boolean True if this binding takes higher priority than other override bindings; false otherwise
---@param key string A key or key combination (e.g. "CTRL-2")
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
function SetOverrideBindingItem(owner, isPriority, key, itemID, itemName, itemLink) end

--- Sets an override binding to run a macro. Override bindings are temporary. The bound key will revert to its normal setting once the override is removed. Priority overrides work the same way but will revert to the previous override binding (if present) rather than the base binding for the key.
---@param owner table The Frame (or other widget ) object responsible for this override
---@param isPriority boolean True if this binding takes higher priority than other override bindings; false otherwise
---@param key string A key or key combination (e.g. "CTRL-2")
---@param index number Index of a macro
---@param name string Name of a macro
function SetOverrideBindingMacro(owner, isPriority, key, index, name) end

--- Set an override binding to a specific spell. Override bindings are temporary. The bound key will revert to its normal setting once the override is removed. Priority overrides work the same way but will revert to the previous override binding (if present) rather than the base binding for the key. See ClearOverrideBindings() to remove bindings associated with a given owner .
---@param owner table The Frame (or other widget ) object responsible for this override
---@param isPriority boolean True if this binding takes higher priority than other override bindings; false otherwise
---@param key string A key or key combination (e.g. "CTRL-2")
---@param spellname string Name of a spell, or nil to remove the override binding
function SetOverrideBindingSpell(owner, isPriority, key, spellname) end



--==============================
-- Keyboard functions
--==============================

--- Returns the frame currently handling keyboard input. Typically an EditBox
---@return table frame Frame currently handling keyboard input, or nil if no frame is currently focused
function GetCurrentKeyBoardFocus() end

--- Returns whether an Alt key on the keyboard is held down.
---@return any isDown 1 if an Alt key on the keyboard is currently held down; otherwise nil
function IsAltKeyDown() end

--- Returns whether a Control key on the keyboard is held down
---@return any isDown 1 if a Control key on the keyboard is currently held down; otherwise nil
function IsControlKeyDown() end

--- Returns whether the left Alt key is currently held down. (Note: The Mac WoW client does not distingish between left and right modifier keys, so both Alt keys are reported as Left Alt.)
---@return any isDown 1 if the left Alt key on the keyboard is currently held down; otherwise nil
function IsLeftAltKeyDown() end

--- Returns whether the left Control key is held down. (Note: The Mac WoW client does not distingish between left and right modifier keys, so both Control keys are reported as Left Control.)
---@return any isDown 1 if the left Control key is held down; otherwise nil
function IsLeftControlKeyDown() end

--- Returns whether the left Shift key on the keyboard is held down. (Note: The Mac WoW client does not distingish between left and right modifier keys, so both Shift keys are reported as Left Shift.)
---@return any isDown 1 if the left Shift key on the keyboard is currently held down; otherwise nil
function IsLeftShiftKeyDown() end

--- Returns whether a modifier key is held down. Modifier keys include shift, control or alt on either side of the keyboard. WoW does not recognize platform-specific modifier keys (such as fn, meta, Windows, or Command).
---@return any isDown 1 if any modifier key is held down; otherwise nil
function IsModifierKeyDown() end

--- Returns whether the right Alt key is currently held down. (Note: The Mac WoW client does not distingish between left and right modifier keys, so both Alt keys are reported as Left Alt.)
---@return any isDown 1 if the right Alt key on the keyboard is currently held down; otherwise nil
function IsRightAltKeyDown() end

--- Returns whether the right Control key on the keyboard is held down. (Note: The Mac WoW client does not distingish between left and right modifier keys, so both Control keys are reported as Left Control.)
---@return any isDown 1 if the right Control key on the keyboard is held down; otherwise nil
function IsRightControlKeyDown() end

--- Returns whether the right shift key on the keyboard is held down. (Note: The Mac WoW client does not distingish between left and right modifier keys, so both Shift keys are reported as Left Shift.)
---@return any isDown 1 if the right shift key on the keyboard is currently held down; otherwise nil
function IsRightShiftKeyDown() end

--- Returns whether a Shift key on the keyboard is held down
---@return any isDown 1 if a Shift key on the keyboard is currently held down; otherwise nil
function IsShiftKeyDown() end



--==============================
-- Knowledge-base functions
--==============================

--- Requests a specific knowledge base article from the server
--- Flags: server
---@param articleId number The unique articleId to request
---@param searchType any The search type of the request ( number ) 1 - Default "top issues" search 2 - Search for specific text
function KBArticle_BeginLoading(articleId, searchType) end

--- Returns information about the last requested knowledge base article. Only available once the KNOWLEDGE_BASE_ARTICLE_LOAD_SUCCESS event has fired following an article request.
---@return number id A unique identifier for the article
---@return string subject The subject of the article
---@return string subjectAlt Alternate text for the article subject
---@return string text The body of the article
---@return string keywords A comma separated list of keywords for the article
---@return number languageId Identifier for the article's language (ee KBSetup_GetLanguageData )
---@return boolean isHot true if the article is a "Hot Item", otherwise false
function KBArticle_GetData() end

--- Returns whether the requested knowledge base article has been loaded. The KNOWLEDGE_BASE_ARTICLE_LOAD_SUCCESS also indicates that the requested article is available; this function presents an alternative that can be used across UI reloads or login/logout.
---@return boolean isLoaded True if data for the last requested article is available; otherwise false
function KBArticle_IsLoaded() end

--- Queries the knowledge base server for articles
--- Flags: server
---@param searchText string The search string to use.  The empty string will search for all articles in the given category
---@param categoryIndex number The category index
---@param subcategoryIndex number The subcategory index
---@param numArticles number The number of articles to be returned for each page
---@param page number The page of the total results that should be displayed.
function KBQuery_BeginLoading(searchText, categoryIndex, subcategoryIndex, numArticles, page) end

--- Returns the number of articles on the current knowledge base search result page
---@return number articleHeaderCount The number of articles on the current knowledge base search result base page
function KBQuery_GetArticleHeaderCount() end

--- Returns information about an article returned in a knowledge base query
---@param index number The index of the article to query
---@return number articleId A unique articleId for the article
---@return string title The title of the article
---@return boolean isHotIssue true if the article is a "Hot Issue", otherwise false
---@return boolean isRecentlyUpdated true if the article has been recently updated, otherwise false
function KBQuery_GetArticleHeaderData(index) end

--- Returns the total number of articles returned for the given query
---@return number totalArticleHeaderCount The total number of articles returned for the given query
function KBQuery_GetTotalArticleCount() end

--- Returns whether results of a knowledge base query have been loaded. The KNOWLEDGE_BASE_QUERY_LOAD_SUCCESS also indicates that the requested results are available; this function presents an alternative that can be used across UI reloads or login/logout.
---@return boolean isLoaded True if query results are available; otherwise false
function KBQuery_IsLoaded() end

--- Loads a maximum number of "Top Issues" from a given page
---@param numArticles number The number of articles displayed per page.  This is typically the constant KBASE_NUM_ARTICLES_PER_PAGE
---@param currentPage number The page to display
function KBSetup_BeginLoading(numArticles, currentPage) end

--- Returns the number of "Top Issues" articles on the current page
---@return number articleHeaderCount The number of "Top Issues" articles on the current page
function KBSetup_GetArticleHeaderCount() end

--- Returns header information about a "Top Issue" article
---@param index number The index of the article to query
---@return number articleId A unique articleId for the article
---@return string title The title of the article
---@return boolean isHotIssue true if the article is a "Hot Issue", otherwise false
---@return boolean isRecentlyUpdated true if the article has been recently updated, otherwise false
function KBSetup_GetArticleHeaderData(index) end

--- Returns the number of available knowledge base categories
---@return number numCategories The number of available knowledge base categories
function KBSetup_GetCategoryCount() end

--- Returns information about a knowledge base category
---@param index number The index of the category
---@return number categoryId The unique identifier for the given category
---@return string name The name of the category
function KBSetup_GetCategoryData(index) end

--- Returns the number of available knowledge base languages
---@return number numLanguages The number of available knowledge base languages
function KBSetup_GetLanguageCount() end

--- Returns information about a given knowledge base language
---@param index number Index of a language to query (between 1 and KBSetup_GetLanguageCount()
---@return number languageId A number identifying the language in article headers
---@return string name The name of the language
function KBSetup_GetLanguageData(index) end

--- Returns the number of available subcategories for a given category
---@param index number The index of the category
---@return number numSubCategories The number of available subcategories
function KBSetup_GetSubCategoryCount(index) end

--- Returns information a knowledge base subcategory
---@param index number The index of the category
---@param subindex number The index of the subcategory
---@return number categoryId The unique categoryId for the given subcategory
---@return string name The name of the subcategory
function KBSetup_GetSubCategoryData(index, subindex) end

--- Returns the number of "Top Issues" articles
---@return number numArticles The total number of "Top Issues" articles
function KBSetup_GetTotalArticleCount() end

--- Returns whether the knowledge base default query has completed successfully. The KNOWLEDGE_BASE_SETUP_LOAD_SUCCESS also indicates that the knowledge base setup is complete; this function presents an alternative that can be used across UI reloads or login/logout.
---@return boolean isLoaded True if results for the knowledge base's default "Top Issues" query are available; false if a query is in progress or has failed
function KBSetup_IsLoaded() end

--- Returns the currently knowledge base MOTD
---@return string text The message of the day for the knowledge base system
function KBSystem_GetMOTD() end

--- Returns the text of the knowledge base server system notice
---@return string text The text of the knowledgebase system server notice
function KBSystem_GetServerNotice() end

--- Returns the knowledge base server system status message
---@return string statusMessage The knowledge base server status message, or nil
function KBSystem_GetServerStatus() end



--==============================
-- Limited play time functions
--==============================

--- Returns the amount of time for which the player must be offline in order to lift play time restrictions. After playing for a number of hours, restrictions may be placed on the player's ability to gain loot or XP, complete quests, or use trade skills; if in such a state, the player must log off for the period of time specified by this function in order to return to normal play.
---@return number time Offline time required to lift play time restrictions (in minutes)
function GetBillingTimeRested() end

--- Returns whether the player has exceeded the allowed play time limit. When in this state, the player is unable to gain loot or XP or complete quests and cannot use trade skills; returning to normal requires logging out of the game for a period of time (see GetBillingTimeRested ).
---@return any hasNoTime 1 if the player is out of play time, otherwise nil
function NoPlayTime() end

--- Returns whether the player is near the allowed play time limit. When in this state, the player receives half the normal amount of money and XP from kills and quests and cannot use trade skills; returning to normal requires logging out of the game for a period of time (see GetBillingTimeRested ).
---@return any partialPlayTime 1 if the character gains only partial xp, nil if not.
function PartialPlayTime() end



--==============================
-- Locale-specific functions
--==============================

--- Returns suggested declensions for a name. In the Russian language, nouns (including proper names) take different form based on their usage in a sentence. When the player enters the base name for a character or pet, the game suggests one or more sets of variations for the five additional cases; the player is asked to choose from among the suggestions and/or enter their own. (The set of declensions ultimately chosen/entered by the player are only used internally and not available to addons.)
---@param name string Nominative form of the player's or pet's name
---@param gender any Gender for the returned names (for declensions of the player's name, should match the player's gender; for the pet's name, should be neuter) ( number ) 1or nil - Neuter 2 - Male 3 - Female
---@param declensionSet number Index of a set of suggested declensions (between 1 and GetNumDeclensionSets(name,gender) . Lower indices correspond to "better" suggestions for the given name.
---@return string genitive Genitive form of the name
---@return string dative Dative form of the name
---@return string accusative Accusative form of the name
---@return string instrumental Instrumental form of the name
---@return string prepositional Prepositional form of the name
function DeclineName(name, gender, declensionSet) end

--- Fills a table with localized class names keyed by non-localized class tokens. Note that while localized class names have no gender in English, other locales have different names for each gender.
---@param table number An empty table to be filled
---@param female boolean True to fill the table with female class names; false or omitted to fill it with male class names
function FillLocalizedClassList(table, female) end

--- Returns the number of suggested declension sets for a name. Used in the Russian localized World of Warcraft client; see DeclineName for further details. Returns 0 in other locales.
---@param name string Nominative form of the player's or pet's name
---@param gender any Gender for names (for declensions of the player's name, should match the player's gender; for the pet's name, should be neuter) ( number ) 1 or nil - Neuter 2 - Male 3 - Female
---@return number numSets Number of available declension sets usable with DeclineName
function GetNumDeclensionSets(name, gender) end



--==============================
-- Looking for group functions
--==============================

--- Provides information about the LFG status of the player.
---@return any mode Current LFG status ( string ) abandonedInDungeon - The party disbanded and player is still in the dungeon. lfgparty - LFG dungeon is in-progress. nil - Player is not in LFG proposal - LFG party formed, notifying matched players dungeon is ready. queued - Player is in LFG queue. rolecheck - Querying groupmates to select their LFG roles before queuing.
---@return any submode Your LFG sub-status. Used to indicate priority for filling party slots. ( string ) empowered - Indicates that your party has lost a player and is set to higher priority for finding a replacement nil - Not looking for more party members unempowered - Default priority in the LFG system.
function GetLFGMode() end

--- Returns the group roles for which the player has signed up in the LFG system
---@return boolean leader True if the player is willing to lead a group; otherwise false
---@return boolean tank True if the player is willing to take on the role of protecting allies by drawing enemy attacks; otherwise false
---@return boolean healer True if the player is willing to take on the role of healing allies who take damage; otherwise false
---@return boolean damage True if the player is willing to take on the role of damaging enemies; otherwise false
function GetLFGRoles() end

--- Returns a list of LFG query types
function GetLFGTypes() end

--- Associates a brief text comment with the player's listing in the LFG system. In the default UI, other players see this comment when mousing over the player's name in the Looking for More listing.
---@param comment string A comment to be associated with the player's listing in the LFG system (max 63 characters); or the empty string ( "" ) to clear an existing comment
function SetLFGComment(comment) end

--- Sets group roles for which to advertise the player in the LFG system. Passing true for a role the player's class does not support (e.g. healing on a warrior or tanking on a priest) has no effect: see example.
---@param leader boolean True if the player is willing to lead a group; otherwise false
---@param tank boolean True if the player is willing to take on the role of protecting allies by drawing enemy attacks; otherwise false
---@param healer boolean True if the player is willing to take on the role of healing allies who take damage; otherwise false
---@param damage boolean True if the player is willing to take on the role of damaging enemies; otherwise false
function SetLFGRoles(leader, tank, healer, damage) end



--==============================
-- Loot functions
--==============================

--- Ends interaction with a lootable corpse or object. Causes the LOOT_CLOSED event to fire, indicating that Loot APIs may no longer have effects or return valid data.
function CloseLoot() end

--- Confirms the player's intent regarding an item up for loot rolling. Usable after the CONFIRM_LOOT_ROLL event fires, warning that an item binds on pickup.
--- Flags: confirmation
---@param id number Index of an item currently up for loot rolling (as provided in the START_LOOT_ROLL event)
---@param rollType any Type of roll action to perform ( number ) 0 - Pass (declines the loot) 1 - Roll "need" (wins if highest roll) 2 - Roll "greed"
function ConfirmLootRoll(id, rollType) end

--- Confirms picking up an item available as loot. Usable after the LOOT_BIND_CONFIRM event fires, warning that an item binds on pickup.
--- Flags: confirmation
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
function ConfirmLootSlot(slot) end

--- Returns information about the current loot method in a party or raid. Only returns useful information if the player is in a party or raid.
---@return any method Current loot method ( string ) freeforall - Free for All - any group member can take any loot at any time group - Group Loot - like Round Robin, but items above a quality threshold are rolled on master - Master Looter - like Round Robin, but items above a quality threshold are left for a designated loot master to needbeforegreed - Need before Greed - like Group Loot, but members automatically pass on items roundrobin - Round Robin - group members take turns being able to loot
---@return number partyMaster Numeric portion of the party unitID of the loot master (e.g. if 2 , the loot master's unitID is party2 ); nil if not using the Master Looter method or if the player is in a raid whose loot master is not in the player's subgroup.  If the player is the master looter, this value will return 0.
---@return number raidMaster Numeric portion of the raid unitID of the loot master (e.g. if 17 , the loot master's unitID is raid17 ); nil if not using the Master Looter method or not in a raid group
function GetLootMethod() end

--- Returns information about an item currently up for loot rolling
---@param id number Index of an item currently up for loot rolling (as provided in the START_LOOT_ROLL event)
---@return string texture Path to an icon texture for the item
---@return string name Name of the item
---@return number count Number of stacked items
---@return number quality Quality (rarity) of the item.
---@return any bindOnPickUp 1 if the item is bind on pickup; otherwise nil
function GetLootRollItemInfo(id) end

--- Returns the amount of time remaining before loot rolling for an item expires. When the time expires, all group members who have not yet chosen to roll Need or Greed automatically pass, random roll results are produced for those who chose to roll, and the server declares a winner and awards the item.
---@param id number Index of an item currently up for loot rolling (as provided in the START_LOOT_ROLL event)
---@return number timeLeft Amount of time remaining before loot rolling for the item expires (in milliseconds)
function GetLootRollTimeLeft(id) end

--- Returns a hyperlink for an item available as loot
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
---@return string texture Path to an icon texture for the item or amount of money
---@return string item Name of the item, or description of the amount of money
---@return number quantity Number of stacked items, or 0 for money
---@return number quality Quality (rarity) of the item
---@return any locked 1 if the item is locked (preventing the player from looting it); otherwise nil
function GetLootSlotInfo(slot) end

--- Returns the threshold used for Master Looter, Group Loot, and Need Before Greed loot methods. Items above the threshold quality will trigger the special behavior of the current loot method: for Group Loot and Need Before Greed, rolling will automatically begin once a group member loots the corpse or object holding the item; for Master Loot, the item will be invisible to all but the loot master tasked with assigning the loot.
---@return number threshold Minimum item quality to trigger the loot method
function GetLootThreshold() end

--- Returns information about a given loot candidate. Used in the default UI to build the popup menu used in master loot assignment. Only valid if the player is the master looter.
---@param index number Index of a member of the party or raid ( not equivalent to the numeric part of a party or raid unitID )
---@return string candidate Name of the candidate
function GetMasterLootCandidate(index) end

--- Returns the number of items available to be looted
---@return number numItems Number of the items available to be looted
function GetNumLootItems() end

--- Returns whether the player has opted out of loot rolls. When opting out, no prompt will be shown for loot which ordinarily would prompt the player to roll (need/greed) or pass; the loot rolling process will continue for other group members as if the player had chosen to pass on every roll.
---@return any isOptOut 1 if the has opted out of loot rolls; otherwise nil
function GetOptOutOfLoot() end

--- Awards a loot item to a group member. Has no effect if the player is not the loot master or if no loot or candidate matching the given parameters exists.
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
---@param index number Index of a loot candidate (see GetMasterLootCandidate() )
function GiveMasterLoot(slot, index) end

--- Returns whether the currently displayed loot came from fishing. Used in the default UI to play a fishing sound effect and change the appearance of the loot window.
---@return any isFishing 1 if the currently displayed loot is fishing loot; otherwise nil
function IsFishingLoot() end

--- Attempts to pick up an item available as loot. If the item in the loot slot binds on pickup, the LOOT_BIND_CONFIRM event fires, indicating that ConfirmLootSlot(slot) must be called in order to actually loot the item. Please note: if you call this while processing a LOOT_OPENED event and it is the last item to be looted from the corpse, can cause LOOT_CLOSED to fire and be processed before your LOOT_OPENED event handler completes.
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
function LootSlot(slot) end

--- Returns whether a loot slot contains money
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
---@return any isCoin 1 if the loot slot contains money; otherwise nil
function LootSlotIsCoin(slot) end

--- Returns whether a loot slot contains an item
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
---@return any isItem 1 if the loot slot contains an item; otherwise nil
function LootSlotIsItem(slot) end

--- Register the player's intent regarding an item up for loot rolling. Rolls are not actually performed until all eligible group members have registered their intent or the time period for rolling expires.
---@param id number Index of an item currently up for loot rolling (as provided in the START_LOOT_ROLL event)
---@param rollType any Type of roll action to perform ( number ) 0 - Pass (declines the loot) 1 - Roll "need" (wins if highest roll) 2 - Roll "greed" (wins if highest roll and no other member rolls "need") 3 - Disenchant
function RollOnLoot(id, rollType) end

--- Sets the loot method for a party or raid group. Has no effect if the player is not the party or raid leader.
---@param method any Method to use for loot distribution ( string ) freeforall - Free for All - any group member can take any loot at any time group - Group Loot - like Round Robin, but items above a quality threshold are rolled on master - Master Looter - like Round Robin, but items above a quality threshold are left for a designated loot master to needbeforegreed - Need before Greed - like Group Loot, but members automatically pass on items roundrobin - Round Robin - group members take turns being able to loot
---@param master string Name or unitID of the master looter
function SetLootMethod(method, master) end

--- Sets a Texture object to show the appropriate portrait image when looting. Normally, the loot portrait image is the same as that of the creature being looted. Not used in the default UI -- a generic image for all loot is used instead.
---@param texture table A Texture object
function SetLootPortrait(texture) end

--- Sets the threshold used for Master Looter, Group Loot, and Need Before Greed loot methods. Has no effect if the player is not the party or raid leader.
---@param threshold number Minimum item quality to trigger the loot method
function SetLootThreshold(threshold) end

--- Changes the player's preference to opt out of loot rolls. When opting out, no prompt will be shown for loot which ordinarily would prompt the player to roll (need/greed) or pass; the loot rolling process will continue for other group members as if the player had chosen to pass on every roll.
---@param enable boolean True to opt out of loot, false to participate in loot rolls
function SetOptOutOfLoot(enable) end



--==============================
-- Lua library functions
--==============================

--- Returns the absolute value of a number. Alias for the standard library function math.abs .
---@param x number A number
---@return number absoluteValue Absolute value of x
function abs(x) end

--- Causes a Lua error if a condition is failed
---@param condition any Any value (commonly the result of an expression)
---@param message string Error message to be produced if condition is false or nil
---@return any value The condition value provided, if not false or nil
function assert(condition, message) end

--- Returns the smallest integer larger than or equal to a number. Alias for the standard library function math.ceil .
---@param x number A number
---@return number ceiling Smallest integer larger than or equal to x
function ceil(x) end

--- Interface to the Lua garbage collector
---@param option any One of the following options collect - Performs a full garbage collection cycle count - Returns the total Lua memory usage (in kilobytes) restart - Restarts the garbage collector setpause - Sets the garbage collector's pause percentage to arg ; e.g., if 200, the collector waits for memory usage to double before starting a new cycle setstepmul - Sets the garbage collector's speed (as a percentage relative to memory allocation) to arg ; e.g., if 200, the collector runs twice as fast as memory is allocated step - Performs a garbage collection step, with size arg stop - Stops the garbage collector
---@param arg any Argument applicable to some options
function collectgarbage(option, arg) end

--- Returns a formatted date/time string for a date (or the current date). Alias to the standard library function os.date .
---@param format string A string describing the formatting of time values (as in the ANSI C strftime() function), or *t to return the time as a table; optionally preceded by ! for Coordinated Universal Time instead of the local time zone; omitted for a date printed in the default format
---@param time number Time value to be formatted (see time() for description); if omitted, uses the current time
---@return string dateValue A formatted date/time string,
function date(format, time) end

--- Converts an angle measurement in radians to degrees. Alias for the standard library function math.deg .
---@param radians number An angle specified in radians
---@return number degrees The angle specified in degrees
function deg(radians) end

--- Returns the number of seconds between two time values. Alias for the standard library function os.difftime .
---@param time2 number A time value (see time() for description)
---@param time1 number A time value (see time() for description)
---@return number seconds Number of seconds between time2 and time1 ; equivalent to time2 - time1 on all current WoW clients
function difftime(time2, time1) end

--- Causes a Lua error message
---@param message string An error message to be displayed
---@param level number Level in the function stack at which the error message begins providing function information; e.g. 1 (the default, if omitted) to start at the position where error() was called, 2 to start at the function which called error() , 3 to start at the function which called that function, etc.
function error(message, level) end

--- Returns the value of the exponential function for a number. Alias for the standard library function math.exp .
---@param x number A number
---@return number exp Value of the mathematical constant e (Euler's number) raised to the x th power
function exp(x) end

--- Returns the largest integer smaller than or equal to a number. Alias for the standard library function math.floor .
---@param x number A number
---@return number floor Largest integer smaller than or equal to x
function floor(x) end

--- . Alias for the standard library function table.foreach . Deprecated in Lua 5.1; use a for loop and the pairs function instead (see example).
--- Flags: deprecated
function foreach() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function foreachi() end

--- Returns a formatted string containing specified values. Alias for the standard library function string.format .  This version, however, includes the positional argument specifiers from Lua 4.0.
---@param formatString string A string containing format specifiers as per the ANSI C printf function
---@return number formatted The formatted string
function format(formatString) end

--- Returns the normalized fraction and base-2 exponent for a number. Alias for the standard library function math.frexp .
---@param x number A number
---@return number m A number whose absolute value is in the range [0.5, 1), or 0 if x is 0
---@return number e An integer, such that x = m * 2 ^ e
function frexp(x) end

--- Returns the total Lua memory usage. Deprecated in Lua 5.1; use collectgarbage("count") instead.
--- Flags: deprecated
---@return number count Total Lua memory usage (in kilobytes)
function gcinfo() end

--- Returns the environment for a function (or the global environment). If the environment has a __environment metatable, that value is returned instead.
---@param f function A function
---@param stackLevel number Level of a function in the calling stack
---@return table env Table containing all variables in the function's environment, or the global environment if f or stackLevel is omitted
function getfenv(f, stackLevel) end

--- Returns an object's metatable
---@param object any Any table or userdata object
---@return any metatable Contents of the object's __metatable field, or nil if the object has no metatable
function getmetatable(object) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function getn() end

--- Returns an iterator function for finding pattern matches in a string. Alias for the standard library function string.gmatch .
---@param s string A string
---@param pattern string A regular expression pattern
---@return function iterator A function which, each time it is called, returns the next capture of pattern in the string s ; always returns the whole string if pattern specifies no captures
function gmatch(s, pattern) end

--- Returns a string in which occurrences of a pattern are replaced. Alias for the standard library function string.gsub .
---@param s string A string
---@param pattern string A regular expression pattern
---@param rep string String with which to replace occurrences of pattern ; may contain specifiers for numbered captures in the pattern
---@param repTable table Table containing replacement strings; replacements are looked up using captured substrings as keys, or the entire match if pattern specifies no captures
---@param repFunc function Function to supply replacement strings; called with captured substrings (or the entire match if pattern specifies no captures) as arguments
---@param maxReplaced number Maximum number of replacements to be made
---@return string newString A copy of s in which occurrences of the pattern have been replaced as specified
---@return number numMatched Number of matches found
function gsub(s, pattern, rep, repTable, repFunc, maxReplaced) end

--- Returns an iterator function for integer keys in a table. Return values are such that the construction
---@param t table A table
---@return function iterator An iterator
---@return table t The table provided
---@return number index Always 0; used internally
function ipairs(t) end

--- Returns the number generated by a normalized fraction and base-2 exponent. Alias for the standard library function math.ldexp .
---@param m number A number
---@param e number A number
---@return number x The value of m * 2 ^ e
function ldexp(m, e) end

--- Loads and compiles Lua source code
---@param s string A string containing Lua code
---@param chunkname string Name for the loaded chunk; used in error messages and debug information
---@return function chunk A function which can be run to execute the provided code, or nil if the code could not be compiled
---@return string error Error message, if the code could not be compiled
function loadstring(s, chunkname) end

--- Returns the natural logarithm of a number. Alias for the standard library function math.log .
---@param x number A number
---@return number naturalLog The natural logarithm of x
function log(x) end

--- Returns the base-10 logarithm of a number. Alias for the standard library function math.log10 .
---@param x number A number
---@return number base10log The base-10 logarithm of x
function log10(x) end

--- Returns the greatest of a list of numbers. Alias for the standard library function math.max .
---@return number maximum The highest number among all arguments
function max() end

--- Returns the least of a list of numbers. Alias for the standard library function math.min .
---@return number maximum The lowest number among all arguments
function min() end

--- Returns the remainder from division of two numbers. Alias for the standard library function math.fmod .
---@param x number A number
---@param y number A number
---@return number remainder Remainder of the division of x by y that rounds the quotient towards zero
function mod(x, y) end

--- Returns the next key/value pair in a table
---@param t table A table
---@param key any A key in the table
---@return any nextKey The next key in the table t
---@return any nextValue Value associated with the next key in the table t
function next(t, key) end

--- Returns an iterator function for a table. Return values are such that the construction
---@param t table A table
---@return function iterator The next() function
---@return table t The table provided
---@return number index Always nil; used internally
function pairs(t) end

--- Executes a function in protected mode. When running a function in protected mode, any errors do not propagate beyond the function (i.e. they do not stop all execution and call the default error handler).
---@param f function A function
---@return boolean status True if the function succeeded without errors; false otherwise
function pcall(f) end

--- Converts an angle specified in degrees to radians. Alias for the standard library function math.rad .
---@param degrees number An angle specified in degrees
---@return number radians The angle specified in radians
function rad(degrees) end

--- Generates a pseudo-random number. Alias for the standard library function math.random .
---@param m number First limit for randomly generated numbers
---@param n number Second limit for randomly generated numbers
---@return number randomNum If called without arguments, a uniform pseudo-random real number in the range [0,1); if m is specified, a uniform pseudo-random integer in the range [1,m]; if both m and n are specified, a uniform pseudo-random integet in the range [m,n]
function random(m, n) end

--- Returns whether two values are equal without invoking any metamethods
---@param v1 any Any value
---@param v2 function Any value
---@return boolean isEqual True if the values are equal; false otherwise
function rawequal(v1, v2) end

--- Returns the real value associated with a key in a table without invoking any metamethods
---@param t table A table
---@param key any A key in the table
---@return any value Value of t[key]
function rawget(t, key) end

--- Sets the value associated with a key in a table without invoking any metamethods
---@param t table A table
---@param key any A key in the table (cannot be nil )
---@param value any New value to set for the key
function rawset(t, key, value) end

--- Returns one or more values from a list ( ... ), or the number of values in a list
---@param index number Index of a value in the list
function select(index) end

--- Sets the environment to be used by a function. If the environment has a __environment metatable, this function will error.
---@param f function A function
---@param stackLevel number Level of a function in the calling stack, or 0 to set the global environment
---@param t table A table
---@return function f The input function f
function setfenv(f, stackLevel, t) end

--- Sets the metatable for a table
---@param t table A table
---@param metatable table A metatable for the table t , or nil to remove an existing metatable
---@return table t The input table t
function setmetatable(t, metatable) end

--- Sorts a table. Alias for the standard library function table.sort .
---@param table number A table
---@param comparator function A function to compare table elements during the sort; takes two arguments and returns true if the first argument should be ordered before the second in the sorted table; equivalent to function(a,b) return a < b end if omitted
function sort(table, comparator) end

--- Returns the square root of a number. Alias for the standard library function math.sqrt .
---@param x number A number
---@return number root The square root of x
function sqrt(x) end

--- Returns the numeric code for one or more characters in a string. Alias for the standard library function string.byte .
---@param s string A string
---@param firstChar number Position of a character in the string (can be negative to count backwards from the end of the string); defaults to 1 if omitted
---@param lastChar number Position of a later character in the string (can be negative to count backwards from the end of the string); defaults to firstChar if omitted
---@return number value Numeric code for the character at position firstChar in the string
function strbyte(s, firstChar, lastChar) end

--- Returns the character(s) for one or more numeric codes. Alias for the standard library function string.char .
---@param n number An integer
---@return number s A string containing the character(s) for the given numeric code(s)
function strchar(n) end

--- Returns information about matches for a pattern in a string. Alias for the standard library function string.find .
---@param s string A string
---@param pattern string A regular expression pattern
---@param init number Initial position in the string s at which to begin the search; defaults to 1 if omitted
---@param plain boolean True to perform a simple substring search (i.e. considering pattern only as a literal string, not a regular expression); false or omitted otherwise
---@return number start Character position in s at which the first match begins
---@return number end Character position in s at which the first match ends
function strfind(s, pattern, init, plain) end

--- Returns the number of characters in a string. Alias for the standard library function string.len .
---@param s string A string
---@return number length Number of characters in the string
function strlen(s) end

--- Returns a copy of a string with all uppercase letters converted to lowercase. Alias for the standard library function string.lower
---@param s string A string
---@return string lowerCase A copy of the string s with all uppercase letters converted to lowercase
function strlower(s) end

--- Returns the matches for a for a pattern in a string. Alias for the standard library function string.match .
---@param s string A string
---@param pattern string A regular expression pattern
---@return string match First substring of s matching pattern , or the first capture if pattern specifies captures; nil if no match is found
function strmatch(s, pattern) end

--- Returns a string produced by a number of repetitions of another string. Alias for the standard library function string.rep .
---@param s string A string
---@param n number A number
---@return string repeated The concatenation of n copies of the string s
function strrep(s, n) end

--- Returns the reverse of a string. Alias for the standard library function string.reverse .
---@param s string A string
---@return string s A string containing the characters of string s in reverse order
function strrev(s) end

--- Returns a substring of a string. Alias for the standard library function string.sub .
---@param s string A string
---@param firstChar number Position of a character in the string (can be negative to count backwards from the end of the string)
---@param lastChar number Position of a later character in the string (can be negative to count backwards from the end of the string); defaults to -1 if omitted
---@return string s The substring of s starting at the character firstChar and ending with the character lastChar
function strsub(s, firstChar, lastChar) end

--- Returns a copy of a string with all lowercase letters converted to uppercase. Alias for the standard library function string.upper .
---@param str string A string
---@return string lowerCase A copy of the string s with all lowercase letters converted to uppercase
function strupper(str) end

--- Returns the numeric time value for a described date/time (or the current time). Alias for the standard library function os.time .
---@param timeDesc table Table describing a date and time, as returned by date("*t") ; if omitted, uses the current time
---@return number t Number of seconds elapsed since midnight, January 1, 1970 UTC
function time(timeDesc) end

--- Inserts a value into a table. Alias for the standard library function table.insert .
---@param table table A table
---@param position number Index in the table at which to insert the new value; if omitted, defaults to #table + 1
---@param value any Any value
function tinsert(table, position, value) end

--- Returns the numeric value of a string
---@param x any A string or number
---@param base number Base in which to interpret the numeral (integer between 2 and 36); letters 'A-Z' can be used to denote place values 10 or above in bases greater than 10; defaults to 10 if omitted
---@return number numValue Numeric value of x in the given base, or nil if the value cannot be converted to a number
function tonumber(x, base) end

--- Returns a string representation of a value
---@param value any Any value
---@return string stringValue String representation of the given value (if value is an object with a __tostring metamethod, that method is used to produce the string representation)
function tostring(value) end

--- Removes an element from a table. Alias for the standard library function table.remove .
---@param table table A table
---@param position number Index in the table from which to remove the value; if omitted, defaults to #table
function tremove(table, position) end

--- Returns a string describing the data type of a value
---@param v any Any value
---@return any typeString A string describing the type of value v ( string ) boolean - A boolean value ( true or false ) function - A function nil - The special value nil number - A numeric value string - A string table - A table thread - A coroutine thread userdata - Data external to the Lua environment
function type(v) end

--- Returns the list of elements in a table. Equivalent to
---@param t table A table
---@param i number A numeric index to the table; defaults to 1 if omitted
---@param j number A numeric index to the table; defaults to #t if omitted
function unpack(t, i, j) end

--- Executes a function in protected mode with a custom error handler
---@param f function A function
---@param err function Error handler function to be used should f cause an error
---@return boolean status True if the function succeeded without errors; false otherwise
function xpcall(f, err) end



--==============================
-- Mac client functions
--==============================

--- Cancels video recording and compression. If a recording is in progress, recording is stopped and the results discarded. If compression is in progress, compression is stopped and the uncompressed portion of the movie is deleted.
function MovieRecording_Cancel() end

--- Returns the data rate required for a given set of video recording parameters. The value returned is a prediction of the rate at which data will be written to the hard drive while recording -- if the hardware cannot support this data rate, game performance may suffer and recording may stop.
---@param width number Width of the output video (in pixels)
---@param framerate number Number of video frames to be recorded per second
---@param sound number 1 if game audio is to be captured with video; otherwise 0
---@return string dataRate Summary of the data rate (e.g. "438.297 KB/s", "11.132 MB/s")
function MovieRecording_DataRate(width, framerate, sound) end

--- Deletes an uncompressed movie
---@param filename string Path to an uncompressed movie (as provided in the MOVIE_UNCOMPRESSED_MOVIE event)
function MovieRecording_DeleteMovie(filename) end

--- Returns the aspect ratio of the game display. Used in the default UI to calculate dimensions for scaling captured video to predetermined widths.
---@return number ratio Ratio of the game display's width to its height
function MovieRecording_GetAspectRatio() end

--- Returns a path to the movie currently being recorded or compressed. If no movie is being recorded or compressed, returns either the empty string ( "" ) or the path of the last movie recorded/compressed.
---@return string path Path to the movie currently being recorded or compressed, relative to the folder containing the World of Warcraft app
function MovieRecording_GetMovieFullPath() end

--- Returns information about movie compression progress
---@return boolean recovering True if a previous compression was interrupted (e.g. due to WoW being crashing or being forced to quit), indicating that recovery is being attempted on the file; otherwise false
---@return number progress Progress of the movie compression process (0 = just started, 1 = finished)
function MovieRecording_GetProgress() end

--- Returns the amount of time since video recording was last started. Used in the default UI to show the length of the recording in progress when mousing over the recording indicator on the minimap.
---@return string time Amount of time since video recording was last started (HH:MM:SS)
function MovieRecording_GetTime() end

--- Returns the current width of the game display. Used in the default UI to allow the current screen resolution (or an integral factor thereof) to be selected as the video recording resolution.
---@return number width Width of the game display
function MovieRecording_GetViewportWidth() end

--- Returns whether a video codec is supported on the current system
---@param codecID any Four-byte identifier of a QuickTime codec ( number ) 1635148593 - H.264 - supported natively by Apple devices like the iPod, iPhone and AppleTV; best ratio quality/size but slowest to compress 1768124260 - Apple Intermediate Codec - fastest to compress, but exclusive to Mac OS X 1835692129 - Motion JPEG - faster to compress than H.264 but it will generate a bigger file 1836070006 - MPEG-4 - supported by many digital cameras and iMovie
---@return boolean isSupported true if the codec is supported on the current system, otherwise false
function MovieRecording_IsCodecSupported(codecID) end

--- Returns whether a movie file is currently being compressed
---@return boolean isCompressing true if the client is currently compressing a recording; otherwise false
function MovieRecording_IsCompressing() end

--- Returns whether the current system supports recording the mouse cursor in movies
---@return boolean isSupported True if the cursor recording option should be enabled; otherwise false
function MovieRecording_IsCursorRecordingSupported() end

--- Returns whether movie recording is currently in progress
---@return any isRecording 1 if the client is currently recording, otherwise nil
function MovieRecording_IsRecording() end

--- Returns whether movie recording is supported on the current system
---@return boolean isSupported true if the client supports video recording; otherwise nil
function MovieRecording_IsSupported() end

--- Returns the maximum length of recorded video for a given set of video recording parameters. The value returned reflects both the data rate associated with the given parameters and the amount of space remaining on the hard drive.
---@param width number Width of the output video (in pixels)
---@param framerate number Number of video frames to be recorded per second
---@param sound number 1 if game audio is to be captured with video; otherwise 0
---@return string time Maximum length of recorded video (HH:MM:SS)
function MovieRecording_MaxLength(width, framerate, sound) end

--- Queues an uncompressed movie for compression. If there are no items currently in the queue the movie will begin compressing immediately.
---@param filename string Path to an uncompressed movie (as provided in the MOVIE_UNCOMPRESSED_MOVIE event)
function MovieRecording_QueueMovieToCompress(filename) end

--- Enables or disables a search for uncompressed movies. After calling this function with true , a MOVIE_UNCOMPRESSED_MOVIE fires for the first uncompressed movie found (causing the default UI to prompt the user to choose whether to compress, ignore, or delete the movie). Calling this function with false ignores the movie, causing the search to continue (firing a MOVIE_UNCOMPRESSED_MOVIE event for the next uncompressed movie found, and so forth).
---@param enable boolean True to begin searching for uncompressed movies, false to ignore a movie for compression
function MovieRecording_SearchUncompressedMovie(enable) end

--- Begins or ends video recording. Used by the MOVIE_RECORDING_STARTSTOP key binding.
function MovieRecording_Toggle() end

--- Enables or disables inclusion of UI elements in a video recording. Equivalent to the MovieRecordingGUI CVar, but provided as a convenience for the MOVIE_RECORDING_GUI so UI recording can be turned on or off while a movie is recording.
function MovieRecording_ToggleGUI() end

--- Causes iTunes to return to the previous track played. Used by the iTunes Remote key bindings only available on the Mac OS X WoW client. Only has effect while the iTunes application is open.
--- Flags: protected
function MusicPlayer_BackTrack() end

--- Causes iTunes to play the next track in sequence. Used by the iTunes Remote key bindings only available on the Mac OS X WoW client. Only has effect while the iTunes application is open.
--- Flags: protected
function MusicPlayer_NextTrack() end

--- Causes iTunes to start or pause playback. Used by the iTunes Remote key bindings only available on the Mac OS X WoW client. Only has effect while the iTunes application is open.
--- Flags: protected
function MusicPlayer_PlayPause() end

--- Causes iTunes to lower its playback volume. Affects the iTunes volume setting only, not the overall system volume or any of WoW's volume settings.
--- Flags: protected
function MusicPlayer_VolumeDown() end

--- Causes iTunes to raise its playback volume. Affects the iTunes volume setting only, not the overall system volume or any of WoW's volume settings.
--- Flags: protected
function MusicPlayer_VolumeUp() end



--==============================
-- Macro functions
--==============================

--- Creates a new macro
---@param name string Name for the new macro (up to 16 characters); need not be unique, though duplicate names can cause issues for other Macro API functions
---@param icon number Index of a macro icon (between 1 and GetNumMacroIcons() )
---@param body string Body of the macro (up to 255 characters)
---@param perCharacter any 1 if the macro should be stored as a character-specific macro; otherwise nil
---@return number index Index of the newly created macro
function CreateMacro(name, icon, body, perCharacter) end

--- Deletes a macro
---@param index number Index of a macro
---@param name string Name of a macro
function DeleteMacro(index, name) end

--- Changes the name, icon, and/or body of a macro. After patch 4.3 then the numeric 'icon' argument has been replaced by 'iconTexture'.
--- Flags: nocombat
---@param index number Existing index of the macro
---@param name string New name for the macro (up to 16 characters); nil to keep an existing name
---@param iconTexture string name of icon texture; nil to keep an existing texture
---@param body string Body of the macro (up to 255 characters); nil to keep the existing body
---@return number newIndex Index at which the macro is now saved (may differ from input index if the macro's name was changed, as macros are saved in alphabetical order)
function EditMacro(index, name, iconTexture, body) end

--- Returns the body text of a macro
---@param index number Index of a macro
---@param name string Name of a macro
---@return string body Body text / commands of the macro
function GetMacroBody(index, name) end

--- This function or event no longer exists in version 4.3.0 of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param index number Index of a macro icon option (between 1 and GetNumMacroIcons() )
---@return string texture Path to the icon texture
function GetMacroIconInfo(index) end

--- Returns the index of a macro specified by name
---@param name string Name of a macro
---@return number index Index of the named macro, or 0 if no macro by that name exists
function GetMacroIndexByName(name) end

--- Returns information about a macro
---@param index number Index of a macro
---@param name string Name of a macro
---@return string name Name of the macro
---@return string texture Path to an icon texture for the macro
---@return string body Body text / commands of the macro
function GetMacroInfo(index, name) end

--- This function or event no longer exists in version 4.3.0 of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param index number Index of an item icon option (between 1 and GetNumMacroItemIcons() )
---@return string texture Path to the icon texture
function GetMacroItemIconInfo(index) end

--- Returns information about the spell cast by a macro. If a macro contains conditional, random, or sequence commands, this function returns the spell which would currently be cast if the macro were run.
---@param index number Index of a macro
---@param name string Name of a macro
---@return string name Name of the spell
---@return string rank Secondary text associated with the spell (e.g. "Rank 4", "Racial")
function GetMacroSpell(index, name) end

--- This function or event no longer exists in version 4.3.0 of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@return number numMacroIcons The number of available macro icons
function GetNumMacroIcons() end

--- Returns the number of available item icons. Despite the "macro" in the title, this function is only used by the default UI for providing tab icon options in the guild bank.
---@return number numIcons Number of available item icons
function GetNumMacroItemIcons() end

--- Returns the number of macros the player has stored
---@return number numAccountMacros Number of account-wide macros
---@return number numCharacterMacros Number of character-specific macros
function GetNumMacros() end

--- Returns the index of the currently running macro.
---@return number index Index of the currently running macro, or nil if no macro is running
function GetRunningMacro() end

--- Returns the mouse button that was used to activate the running macro
---@return any button Name of the mouse button used to activate the macro; always "LeftButton" if the macro was triggered by a key binding ( string ) Button4 Button5 LeftButton MiddleButton RightButton
function GetRunningMacroButton() end

--- Runs a macro
--- Flags: protected
---@param index number Index of a macro
---@param name string Name of a macro
function RunMacro(index, name) end

--- Runs arbitrary text as a macro
--- Flags: protected
function RunMacroText() end

--- Returns the action (and target, if applicable) for a secure macro command. Used in the default UI to parse macro conditionals.
---@param cmd string A command to be parsed (typically the body of a macro, macrotext attribute or slash command
---@return string action Argument to the base macro command (e.g. the name of a spell for /cast ), or the empty string ( "" ) if the base command takes no arguments (e.g. /stopattack ); nil if the command should not be executed
---@return string target Unit or name to use as the target of the action
function SecureCmdOptionParse(cmd) end

--- Changes the item used for dynamic feedback for a macro. Normally a macro uses the item or spell specified by its commands to provide dynamic feedback when placed on an action button (through the Action APIs, e.g. IsActionUsable() ): e.g. if the macro uses a consumable item, the button will show the number of items remaining; if the macro uses an item with a cooldown, the button will show the state of the cooldown. This function allows overriding the item or spell used by the macro with another item -- the given item's state will be used for such feedback instead of the item or spell used by the macro.
---@param index number Index of a macro
---@param name string Name of a macro
---@param item string Name of an item to use for the macro
---@param target any A unit to use as target of the item (affects the macro's range indicator)
function SetMacroItem(index, name, item, target) end

--- Changes the spell used for dynamic feedback for a macro. Normally a macro uses the item or spell specified by its commands to provide dynamic feedback when placed on an action button (through the Action APIs, e.g. IsActionUsable() ): e.g. if the macro uses a consumable item, the button will show the number of items remaining; if the macro uses an item with a cooldown, the button will show the state of the cooldown. This function allows overriding the item or spell used by the macro with another item -- the given item's state will be used for such feedback instead of the item or spell used by the macro.
---@param index number Index of a macro
---@param name string Name of a macro
---@param spell string Name of a spell to use for the macro
---@param target any A unit to use as target of the spell (affects the macro's range indicator)
function SetMacroSpell(index, name, spell, target) end

--- Stops execution of a running macro
--- Flags: protected
function StopMacro() end



--==============================
-- Mail functions
--==============================

--- Automatically takes any attached items and money from a mail. If the mail does not have body text (which can be saved as a permanent copy), also deletes the mail.
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
function AutoLootMailItem(mailID) end

--- Requests information on the player's mailbox contents from the server server
--- Flags: server
function CheckInbox() end

--- Clears any text, items, or money from the mail message to be sent
function ClearSendMail() end

--- Ends interaction with a mailbox. Fires the MAIL_CLOSED event, indicating that Mail/Inbox APIs may no longer have effects or return valid data.
function CloseMail() end

--- Deletes a mail from the player's inbox
--- Flags: confirmation
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
function DeleteInboxItem(mailID) end

--- Returns information about a mail in the player's inbox
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
---@return string packageIcon Path to an icon texture for the message if it contains an item; nil for other messages
---@return string stationeryIcon Path to an icon texture for the message
---@return string sender Name of the mail's sender
---@return string subject Subject text of the mail
---@return number money Amount of money attached to the mail (in copper)
---@return number CODAmount Cash-On-Delivery cost to take any items attached to the mail (in copper)
---@return number daysLeft Number of days remaining before the mail is automatically returned or deleted
---@return number itemCount Number of item attachments to the mail
---@return any wasRead 1 if the player has read the mail; otherwise nil
---@return any wasReturned 1 if the mail was sent by the player to another character and returned by the recipient; otherwise nil
---@return any textCreated 1 if the player has saved a copy of the mail text as an item; otherwise nil
---@return any canReply 1 if the player can reply to the mail; otherwise nil
---@return any isGM 1 if the mail is from a game master; otherwise nil
---@return number itemQuantity Number of stacked items attached to the mail if the mail has one attachment; nil if the mail has zero or multiple attachments
function GetInboxHeaderInfo(mailID) end

--- Returns information for an item attached to a message in the player's inbox
---@param mailID number Index of a message in the player's inbox (between 1 and GetInboxNumItems() )
---@param attachmentIndex number Index of an attachment to the message (between 1 and select(8, GetInboxHeaderInfo(mailID) ) )
---@return string name Name of the item
---@return string itemTexture Path to an icon texture for the item
---@return number count Number of stacked items
---@return number quality Quality (rarity) of the item
---@return any canUse 1 if the player can use or equip the item; otherwise nil
function GetInboxItem(mailID, attachmentIndex) end

--- Returns the number of mails in the player's inbox
---@return number numItems Number of mails in the player's inbox
---@return number totalItems Total number of items both in the inbox and on the server.
function GetInboxNumItems() end

--- Returns information about the text of an inbox mail. Also marks the mail as read if it wasn't already.
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
---@return string bodyText Text of the mail
---@return string texture Unique part of the path to a background texture to be displayed for the message; actual texture paths are STATIONERY_PATH .. texture .. "1" and STATIONERY_PATH .. texture .. "2"
---@return any isTakeable 1 if the text of the mail can be saved as an item; otherwise nil
---@return any isInvoice 1 if the mail is an auction house invoice; otherwise nil
function GetInboxText(mailID) end

--- Returns the names of the last three senders of new mail. Returns sender names for new messages which the player has not yet seen in the mailbox; returns nothing if the player's inbox only contains unread messages which have been seen in the mailbox listing but not yet opened.
---@return string sender1 Name of a recent message's sender
---@return string sender2 Name of a recent message's sender
---@return string sender3 Name of a recent message's sender
function GetLatestThreeSenders() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetNumPackages() end

--- Returns the number of available stationery types. Always returns 1; the stationery feature for sending mail is not implemented in the current version of World of Warcraft.
--- Flags: internal
---@return number numStationeries Number of available stationery types
function GetNumStationeries() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetPackageInfo() end

--- Returns the currently selected stationery type. Always returns 1; the stationery feature for sending mail is not implemented in the current version of World of Warcraft.
--- Flags: internal
---@return number index Index of the selected stationery type (between 1 and GetNumStationeries() )
function GetSelectedStationeryTexture() end

--- Returns the Cash-On-Delivery cost of the outgoing message. Returns the amount set via SetSendMailCOD() , which in the default UI is only called once its Send button has been clicked (immediately before sending the message). Thus, does not return the COD amount set in the default UI's Send Mail window.
---@return number amount COD cost for the items attached to the message (in copper)
function GetSendMailCOD() end

--- Returns information for an item attached to the outgoing message
---@param slot number Index of an outgoing attachment slot (between 1 and ATTACHMENTS_MAX_SEND )
---@return string itemName Name of the attachment item
---@return string itemTexture Path to an icon texture for the attachment item
---@return string stackCount Number of stacked items
---@return number quality Quality (rarity) of the attachment item
function GetSendMailItem(slot) end

--- Returns the amount of money to be sent with the outgoing message. Returns the amount set via SetSendMailMoney() , which in the default UI is only called once its Send button has been clicked (immediately before sending the message). Thus, does not return the Send Money amount set in the default UI's Send Mail window.
---@return number amount Amount of money to be sent (in copper)
function GetSendMailMoney() end

--- Returns the cost to send the outgoing mail message. The cost of sending a message rises as more items are attached.
---@return number price Cost to send the outgoing mail message (in copper)
function GetSendMailPrice() end

--- Returns information about a stationery type. Only returns information for the default stationery type; the stationery feature for sending mail is not implemented in the current version of World of Warcraft.
--- Flags: internal
---@param index number Index of a stationery type (between 1 and GetNumStationeries() )
---@return string name Name of the stationery type
---@return string texture Path to an icon texture for the stationery type
---@return number cost Cost to use the stationery when sending a message, in addition to normal postage (in copper)
function GetStationeryInfo(index) end

--- Returns whether the player has received new mail since last visiting a mailbox
---@return any hasMail 1 if the player has received new mail since last visiting a mailbox; otherwise nil
function HasNewMail() end

--- Returns whether a message in the player's inbox can be deleted
---@param mailID number Index of a message in the player's inbox (between 1 and GetInboxNumItems() )
---@return any canDelete 1 if the message can be deleted; otherwise nil
function InboxItemCanDelete(mailID) end

--- Returns a message in the player's inbox to its sender
---@param mailID number Index of a message in the player's inbox (between 1 and GetInboxNumItems() )
function ReturnInboxItem(mailID) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function SelectPackage() end

--- Selects a given stationery for usage when sending mail. Has no effect; the stationery feature for sending mail is not implemented in the current version of World of Warcraft.
--- Flags: internal
---@param index number Index of a stationery type (between 1 and GetNumStationeries() )
function SelectStationery(index) end

--- Sends the outgoing message. Any money or COD costs and attachments specified for the mail (via SetSendMailMoney() , SetSendMailCOD() , and ClickSendMailItemButton() ) are included with the mail (and the values for such are reset for the next outgoing mail).
---@param recipient string Name of the character to receive the mail
---@param subject string Subject text of the mail
---@param body string Body text of the mail
function SendMail(recipient, subject, body) end

--- Sets the Cash-On-Delivery cost of the outgoing message. Called in the default UI when clicking its Send button, immediately before sending the mail.
---@param amount number COD cost for the items attached to the mail (in copper)
function SetSendMailCOD(amount) end

--- Sets the amount of money to be sent with the outgoing message. Called in the default UI when clicking its Send button, immediately before sending the message. Causes an error message if the amount plus postage exceeds the player's total money.
---@param amount number Amount of money to send (in copper)
---@return any success 1 if the player has enough money to send the message; otherwise nil
function SetSendMailMoney(amount) end

--- Enables or disables shortcuts for attaching items to outgoing mail. When shortcuts are enabled, UseContainerItem() (i.e. right-click in the default UI's container frames) attaches the item to the outgoing message instead of using it.
---@param enable boolean True to enable shortcuts; false to disable
function SetSendMailShowing(enable) end

--- Retrieves an item attachment from a message in the player's inbox (accepting COD charges if applicable)
--- Flags: confirmation
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
---@param attachmentIndex number Index of an attachment to the mail (between 1 and select(8, GetInboxHeaderInfo(mailID) ) )
function TakeInboxItem(mailID, attachmentIndex) end

--- Retrieves any money attached to a mail in the player's inbox
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
function TakeInboxMoney(mailID) end

--- Requests a copy of a mail's body text as an item. The text of an in-game mail can be retrieved as a readable " Plain Letter " item to store in the player's bags; this function sends a request to the server for this item, causing the standard inventory events to fire as the item is placed into the player's inventory.
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
function TakeInboxTextItem(mailID) end



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



--==============================
-- Merchant functions
--==============================

--- Purchases an item available from a vendor
--- Flags: confirmation
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@param quantity number Number of items to purchase (between 1 and GetMerchantItemMaxStack(index) )
function BuyMerchantItem(index, quantity) end

--- Repurchases an item recently sold to a vendor
---@param index number Index of an item in the buyback listing (between 1 and GetNumBuybackItems() )
function BuybackItem(index) end

--- Returns whether the vendor with whom the player is currently interacting can repair equipment
---@return any canRepair 1 if the vendor can repair equipment; otherwise nil
function CanMerchantRepair() end

--- Ends interaction with a vendor. Causes the MERCHANT_CLOSED event to fire, indicating that Merchant APIs may no longer have effects or return valid data.
function CloseMerchant() end

--- Returns information about an item recently sold to a vendor and available to be repurchased
---@param index number Index of an item in the buyback listing (between 1 and GetNumBuybackItems() )
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number price Current cost to repurchase the item from this vendor (in copper)
---@return number quantity Number of stacked items per purchase
---@return number numAvailable Number of items available for purchase, if the vendor has a limited stock of the item; generally 0 for buyback items
---@return any isUsable 1 if the player can use or equip the item; otherwise nil
function GetBuybackItemInfo(index) end

--- Returns information about alternate currencies required to purchase an item from a vendor
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@return number currencyCount Number of different currencies required to purchase the item (see GetMerchantItemCostItem() for amount of each item currency required)
function GetMerchantItemCostInfo(index) end

--- Returns information about currency items required to purchase an item from a vendor
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@param currency number Index of one of the item currencies required to purchase the item (between 1 and GetMerchantItemCostInfo(index) )
---@return string texture Path to an icon texture for the currency item
---@return number value Amount of the currency required for purchase
---@return string link A hyperlink for the currency item
---@return string name The localized name of the currency
function GetMerchantItemCostItem(index, currency) end

--- Returns information about an item available for purchase from a vendor
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number price Current cost to purchase the item from this vendor (in copper)
---@return number quantity Number of stacked items per purchase
---@return number numAvailable Number of items available for purchase, if the vendor has a limited stock of the item; -1 if the vendor has an unlimited supply of the item
---@return any isUsable 1 if the player can use or equip the item; otherwise nil
---@return any extendedCost 1 if the item's price uses one or more alternate currencies (for which details can be found via GetMerchantItemCostInfo(index) ); otherwise nil
function GetMerchantItemInfo(index) end

--- Returns the maximum number of an item allowed in a single purchase. Determines the largest value usable for the second argument ( quantity ) of BuyMerchantItem() when purchasing the item. For most items, this is the same as the maximum stack size of the item.
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@return number maxStack Largest number of items allowed in a single purchase
function GetMerchantItemMaxStack(index) end

--- Returns the number of different items available for purchase from a vendor
---@return number numMerchantItems Number of different items available for purchase
function GetMerchantNumItems() end

--- Returns the number of items recently sold to a vendor and available to be repurchased
---@return number numBuybackItems Number of items available to be repurchased
function GetNumBuybackItems() end

--- Returns the cost to repair all of the player's damaged items. Returns 0, nil if none of the player's items are damaged. Only returns valid data while interacting with a vendor which allows repairs (i.e. for whom CanMerchantRepair() returns 1 ).
---@return number repairAllCost Cost to repair all damaged items (in copper)
---@return any canRepair 1 if repairs are currently available; otherwise nil
function GetRepairAllCost() end

--- Attempts to repair all of the player's damaged items
---@param useGuildMoney any 1 to use guild bank money (if available); nil or omitted to use the player's own money
function RepairAllItems(useGuildMoney) end



--==============================
-- Minigame functions
--==============================

--- This is a Blizzard internal function internal
--- Flags: internal
function GetMinigameState() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GetMinigameType() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function MakeMinigameMove() end



--==============================
-- Modified click functions
--==============================

--- Returns the keys/buttons bound for a modified click action
---@param name string Token identifying a modified click action
---@return string binding The set of modifiers (and mouse button, if applicable) registered for the action
function GetModifiedClick(name) end

--- Returns the token identifying a modified click action
---@param index number Index of a modified click action (between 1 and GetNumModifiedClickActions() )
---@return string action Token identifying the modified click action, or nil if no action is defined at the given index
function GetModifiedClickAction(index) end

--- Returns the number of modified click actions registered. May return an invalid result if called when no modified click actions have been registered (i.e. early in the UI loading process).
---@return number num Number of modifed click actions registered
function GetNumModifiedClickActions() end

--- Determines if the modifiers specified in the click-type had been held down while the button click occurred.. If called from a click handler ( OnMouseDown , OnMouseUp , OnClick , OnDoubleClick , PreClick , or PostClick ), checks mouse buttons included in the binding; otherwise checks modifiers only (see example).
---@param type string Token identifying a modified click action
---@return any modifiedClick 1 if the modifier key set bound to the action is active (i.e. the keys are held down); otherwise nil
function IsModifiedClick(type) end

--- Sets a modified click for a given action
---@param action string Token identifying the modified click action
---@param binding string The set of modifiers (and mouse button, if applicable) to register for the action
function SetModifiedClick(action, binding) end



--==============================
-- Money functions
--==============================

--- Returns an icon representing an amount of money
---@param amount number Amount of money in copper
---@return any icon Path to an icon texture representing the amount ( string ) Interface\Icons\INV_Misc_Coin_01 - Small amount of Gold Interface\Icons\INV_Misc_Coin_02 - Large amount of Gold Interface\Icons\INV_Misc_Coin_03 - Small amount of Silver Interface\Icons\INV_Misc_Coin_04 - Large amount of Silver Interface\Icons\INV_Misc_Coin_05 - Small amount of Copper Interface\Icons\INV_Misc_Coin_06 - Large amount of Copper
function GetCoinIcon(amount) end

--- Returns a localized string describing an amount of money
---@param amount number Amount of money in copper
---@param separator string String to use as separator (', ' is used if nil)
---@return string coinText Text description of the amount using localized names for 'Gold', 'Silver' and 'Copper'
function GetCoinText(amount, separator) end

--- Returns a string with embedded coin icons describing an amount of money. As in most places where money amounts are shown in the UI, lesser denominations are only shown when non-zero.
---@param amount number Amount of money in copper
---@param fontSize number Size of the money icons. Defaults to 14.
---@return string coinText Text description of the amount using embedded texture codes for gold, silver, and copper coin icons
function GetCoinTextureString(amount, fontSize) end

--- Returns the total amount of money currently in the player's possession
---@return number money Amount of money currently in the player's possession (in copper)
function GetMoney() end

--- Returns the amount of money offered for trade by the player
---@return number amount Amount of money offered for trade by the player (in copper)
function GetPlayerTradeMoney() end

--- Returns the amount of money required for the selected quest in the quest log
---@return number money The amount of money required to complete the quest (in copper)
function GetQuestLogRequiredMoney() end

--- Returns the money reward for the selected quest in the quest log
---@return number money Amount of money rewarded for completing the quest (in copper)
function GetQuestLogRewardMoney() end

--- Returns the amount of money offered for trade by the target
---@return number amount Amount of money offered for trade by the target (in copper)
function GetTargetTradeMoney() end

--- Offers an amount of money for trade
---@param amount number Amount of money to offer for trade (in copper)
function SetTradeMoney(amount) end



--==============================
-- Movement functions
--==============================

--- Stops movement initiated by JumpOrAscendStart . Used by the JUMP binding, which also controls ascent when swimming or flying. Has no meaningful effect if called while jumping (in which case movement is generally stopped by hitting the ground).
--- Flags: protected
function AscendStop() end

--- Stops movement initiated by SitStandOrDescendStart . Used by the SITORSTAND binding, which also controls descent when swimming or flying. Has no meaningful effect if called while sitting/standing.
--- Flags: protected
function DescendStop() end

--- Causes the player character to automatically follow another unit. Only friendly player units can be followed.
---@param unit string A unit to follow
---@param name string Name of a unit to follow
---@param strict boolean True if only an exact match for the given name should be allowed; false to allow partial matches
function FollowUnit(unit, name, strict) end

--- Interacts with (as with right-clicking on) a unit
--- Flags: protected
---@param unit any The unit to interact with
function InteractUnit(unit) end

--- Causes the player character to jump (or begins ascent if swimming or flying). Used by the JUMP binding, which also controls ascent when swimming or flying.
--- Flags: protected
function JumpOrAscendStart() end

--- Begins moving the player character forward while steering via mouse movement. After calling this function, the player character begins moving forward while cursor movement rotates (or steers) the character, altering yaw (facing) and/or pitch (vertical movement angle) as well as camera position.
--- Flags: protected
function MoveAndSteerStart() end

--- Ends movement initiated by MoveAndSteerStart . After calling this function, forward movement and character steering stops and normal cursor movement resumes.
--- Flags: protected
function MoveAndSteerStop() end

--- Begins moving the player character backward. Used by the MOVEBACKWARD binding.
--- Flags: protected
function MoveBackwardStart() end

--- Ends movement initiated by MoveBackwardStart
--- Flags: protected
function MoveBackwardStop() end

--- Begins moving the player character forward. Used by the MOVEFORWARD binding.
--- Flags: protected
function MoveForwardStart() end

--- Ends movement initiated by MoveForwardStart
--- Flags: protected
function MoveForwardStop() end

--- Begins adjusting the player character's angle of vertical movement downward. Affects only the angle or slope of movement for swimming or flying; has no immediately visible effect if the player is not moving, but alters the trajectory followed as soon as the player begins moving. Continuously adjusts pitch until the minimum angle is reached or PitchDownStop() is called.
--- Flags: protected
function PitchDownStart() end

--- Ends movement initiated by PitchDownStart
--- Flags: protected
function PitchDownStop() end

--- Begins adjusting the player character's angle of vertical movement upward. Affects only the angle or slope of movement for swimming or flying; has no immediately visible effect if the player is not moving, but alters the trajectory followed as soon as the player begins moving. Continuously adjusts pitch until the maximum angle is reached or PitchUpStop() is called.
--- Flags: protected
function PitchUpStart() end

--- Ends movement initiated by PitchUpStart
--- Flags: protected
function PitchUpStop() end

--- Causes the player character to sit down if standing and vice versa (or begins descent if swimming or flying). Used by the SITORSTAND binding, which also controls descent when swimming or flying.
--- Flags: protected
function SitStandOrDescendStart() end

--- Begins moving the player character sideways to his or her left
--- Flags: protected
function StrafeLeftStart() end

--- Ends movement initiated by StrafeLeftStart
--- Flags: protected
function StrafeLeftStop() end

--- Begins moving the player character sideways to his or her right
--- Flags: protected
function StrafeRightStart() end

--- Ends movement initiated by StrafeRightStart
--- Flags: protected
function StrafeRightStop() end

--- Starts or stops the player character automatically moving forward
--- Flags: protected
function ToggleAutoRun() end

--- Switches the character's ground movement mode between running and walking. If running, switches to walking, and vice versa. Has no effect on swimming or flying speed.
--- Flags: protected
function ToggleRun() end

--- Begins turning the player character to the left. "Left" here is relative to the player's facing; i.e. if looking down at the character from above, he or she turns counter-clockwise.
--- Flags: protected
function TurnLeftStart() end

--- Ends movement initiated by TurnLeftStart
--- Flags: protected
function TurnLeftStop() end

--- Begins character steering or interaction (equivalent to right-clicking in the 3-D world). After calling this function (i.e. while the right mouse button is held), cursor movement rotates (or steers) the player character, altering yaw (facing) and/or pitch (vertical movement angle) as well as camera position. Final results vary by context and are determined when calling TurnOrActionStop() (i.e. releasing the right mouse button).
--- Flags: protected
function TurnOrActionStart() end

--- Ends action initiated by TurnOrActionStart . After calling this function (i.e. releasing the right mouse button), character steering stops and normal cursor movement resumes. If the cursor has not moved significantly since calling TurnOrActionStart() (i.e. pressing the right mouse button), results vary by context:
--- Flags: protected
function TurnOrActionStop() end

--- Begins turning the player character to the right. "Right" here is relative to the player's facing; i.e. if looking down at the character from above, he or she turns clockwise.
--- Flags: protected
function TurnRightStart() end

--- Ends movement initiated by TurnRightStart
--- Flags: protected
function TurnRightStop() end



--==============================
-- Multi-cast actions
--==============================

--- Sets a multi-cast action slot to a given spell. This function is used to set up the multi-cast action slots, such as the totem bar that was introduced with WoW 3.2.  The player is able to customize three different sets of totems that can then be cast with a single click.
---@param action number The multi-cast action slot to set
---@param spell number The numeric spellId to set to the given action slot
function SetMultiCastSpell(action, spell) end



--==============================
-- NPC "Gossip" Dialog functions
--==============================

--- Ends an NPC "gossip" interaction. Causes the GOSSIP_CLOSED event to fire, indicating that Gossip APIs may no longer have effects or return valid data.
function CloseGossip() end

--- Returns a list of quests which can be turned in to the current Gossip NPC. These quests are displayed with a question mark icon in the default UI's GossipFrame.
---@return string name Name of the quest
---@return number level Suggested character level for attempting the quest
---@return any isTrivial 1 if the quest is considered "trivial" at the player's level (rewards no XP); otherwise nil
function GetGossipActiveQuests() end

--- Returns a list of quests available from the current Gossip NPC. For quests which can be turned in to the NPC, see GetGossipActiveQuests() .
---@return string name Name of the quest
---@return number level Suggested character level for attempting the quest
---@return any isTrivial 1 if the quest is considered "trivial" at the player's level (rewards no XP); otherwise nil
---@return any isDaily 1 if the quest may be repeated only once per day; otherwise nil
---@return any isRepeatable 1 if the quest may be repeated at any time; otherwise nil
function GetGossipAvailableQuests() end

--- Returns a list of interaction options for the Gossip NPC
---@return string text Text to be displayed for the gossip option
---@return any gossipType Non-localized string indicating the type of gossip option ( string ) Banker - Begin a Bank interaction BattleMaster - Queue for a battleground instance Binder - Set the player's Hearthstone location Gossip - Talk to the NPC Tabard - Begin a Tabard design interaction Taxi - Begin a Taxi (flight master) interaction Trainer - Begin a Trainer interaction Vendor - Begin a Merchant interaction
function GetGossipOptions() end

--- Returns greeting or other text to be displayed in an NPC dialog
---@return string text Text to be displayed for the NPC conversation
function GetGossipText() end

--- Returns the number of quests which can be turned in to the current Gossip NPC. These quests are displayed with a question mark icon in the default UI's GossipFrame.
---@return number num Number of quests which can be turned in to the current Gossip NPC
function GetNumGossipActiveQuests() end

--- Returns the number of quests available from the current Gossip NPC. These quests are displayed with an exclamation mark icon in the default UI's GossipFrame.
---@return number num Number of quests available from the current Gossip NPC
function GetNumGossipAvailableQuests() end

--- Returns the number of non-quest dialog options for the current Gossip NPC. Used by the default UI to skip greeting gossip for NPCs which provide only a greeting and one gossip option leading to the NPC's main interaction type (e.g. flight masters, merchants).
---@return number numOptions Number of options available from the current Gossip NPC
function GetNumGossipOptions() end

--- Chooses a quest which can be turned in to the current Gossip NPC. Causes the QUEST_PROGRESS event to fire, in which it is determined whether the player can complete the quest.
---@param index number Index of a quest which can be turned in to the current Gossip NPC (between 1 and GetNumGossipActiveQuests() )
function SelectGossipActiveQuest(index) end

--- Chooses a quest available from the current Gossip NPC. Usable after a QUEST_GREETING event. Causes the QUEST_DETAIL event to fire, in which the questgiver presents the player with the details of a quest and the option to accept or decline.
---@param index number Index of a quest available from the current Gossip NPC (between 1 and GetNumGossipAvailableQuests() )
function SelectGossipAvailableQuest(index) end

--- Chooses and activates an NPC dialog option. Results may vary according to the gossip option chosen; may end the gossip (firing a GOSSIP_CLOSED event) and start another interaction (firing a MERCHANT_SHOW , TRAINER_SHOW , TAXIMAP_OPENED , or similar event) or may continue the gossip with new text and new options (firing another GOSSIP_SHOW event).
---@param index number The option in the NPC gossip window to select, from 1 to GetNumGossipOptions()
---@param text string Text to include when confirming the selection
---@param confirm boolean true to confirm the selection; false or omitted otherwise
function SelectGossipOption(index, text, confirm) end



--==============================
-- Objectives tracking functions
--==============================

--- Adds a quest to the objectives tracker
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
function AddQuestWatch(questIndex) end

--- Returns the number of quests included in the objectives tracker
---@return number numWatches Number of quests from the quest log currently marked for watching
function GetNumQuestWatches() end

--- Returns the quest log index of a quest in the objectives tracker
---@param index number Index of a quest in the list of quests on the objectives tracker (between 1 and GetNumQuestWatches() )
---@return number questIndex Index of the quest in the quest log (between 1 and GetNumQuestLogEntries() )
function GetQuestIndexForWatch(index) end

--- Returns cooldown information about an item associated with a current quest. Available for a number of quests which involve using an item (i.e. "Use the MacGuffin to summon and defeat the boss", "Use this saw to fell 12 trees", etc.)
---@param questIndex number Index of a quest log entry with an associated usable item (between 1 and GetNumQuestLogEntries() )
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the item is ready
---@return number duration The length of the cooldown, or 0 if the item is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the item is ready.)
function GetQuestLogSpecialItemCooldown(questIndex) end

--- Returns information about a usable item associated with a current quest. Available for a number of quests which involve using an item (i.e. "Use the MacGuffin to summon and defeat the boss", "Use this saw to fell 12 trees", etc.)
---@param questIndex number Index of a quest log entry with an associated usable item (between 1 and GetNumQuestLogEntries() )
---@return string link A hyperlink for the item
---@return string icon Path to an icon texture for the item
---@return number charges Number of times the item can be used, or 0 if no limit
function GetQuestLogSpecialItemInfo(questIndex) end

--- Returns whether the player's target is in range for using an item associated with a current quest. Available for a number of quests which involve using an item (i.e. "Use the MacGuffin to summon and defeat the boss", "Use this saw to fell 12 trees", etc.)
---@param questIndex number Index of a quest log entry with an associated usable item (between 1 and GetNumQuestLogEntries() )
---@return number inRange 1 if the player is close enough to the target to use the item; 0 if the target is out of range; nil if the quest item does not require a target
function IsQuestLogSpecialItemInRange(questIndex) end

--- Returns whether a quest from the quest log is listed in the objectives tracker
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
---@return any isWatched 1 if the quest is being watched; otherwise nil
function IsQuestWatched(questIndex) end

--- Removes a quest from the objectives tracker
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
function RemoveQuestWatch(questIndex) end

--- Uses the item associated with a current quest. Available for a number of quests which involve using an item (i.e. "Use the MacGuffin to summon and defeat the boss", "Use this saw to fell 12 trees", etc.)
--- Flags: protected
---@param questIndex number Index of a quest log entry with an associated usable item (between 1 and GetNumQuestLogEntries() )
function UseQuestLogSpecialItem(questIndex) end



--==============================
-- Party functions
--==============================

--- Accepts an invitation to join a party or raid. Usable in response to the PARTY_INVITE_REQUEST event which fires when the player is invited to join a group.  This function does not automatically hide the default UI's group invite dialog; doing such requires calling StaticPopup_Hide("PARTY_INVITE") , but only after the PARTY_MEMBERS_CHANGED event fires indicating the player has successfully joined the group.
function AcceptGroup() end

--- Removes a group role assignment from a member of the player's party or raid. If no unit (or name) is given, removes the role assignment from all members of the party or raid.
--- Flags: protected
---@param assignment any A group role to assign to the unit ( string ) MAINASSIST - Remove the main assist role MAINTANK - Remove the main tank role
---@param unit string A unit in the player's party or raid
---@param name string Name of a unit in the player's party or raid
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function ClearPartyAssignment(assignment, unit, name, exactMatch) end

--- Responds to a ready check
---@param ready any True to report as "ready"; false to report as "not ready"
function ConfirmReadyCheck(ready) end

--- Converts a party to a raid. Only has effect if the player is in a party and the party leader.
function ConvertToRaid() end

--- Declines an invitation to join a party or raid. Usable in response to the PARTY_INVITE_REQUEST event which fires when the player is invited to join a group.
function DeclineGroup() end

--- Initiates a ready check. Only has effect if the player is the party/raid leader or a raid assistant.
function DoReadyCheck() end

--- Returns the number of additional members in the player's party
---@return number numPartyMembers Number of additional members in the player's party (between 1 and MAX_PARTY_MEMBERS , or 0 if the player is not in a party)
function GetNumPartyMembers() end

--- Returns whether a party/raid member is assigned a specific group role
---@param assignment any A group role assignment ( string ) MAINASSIST - Return whether the unit is assigned the main assist role MAINTANK - Return whether the unit is assigned the main tank role
---@param unit string A unit in the player's party or raid
---@param name string Name of a unit in the player's party or raid
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
---@return any isAssigned 1 if the unit is assigned the specified role; otherwise nil
function GetPartyAssignment(assignment, unit, name, exactMatch) end

--- Returns the index of the current party leader. Returns 0 if the player is the party leader or if the player is not in a party.
---@return number index Numeric portion of the party unitID for the party leader (e.g. 3 = party3 )
function GetPartyLeaderIndex() end

--- Returns whether a party member exists at a given index
---@param index number Index of a party member (between 1 and MAX_PARTY_MEMBERS ), or the numeric portion of a party unitID (e.g. 3 = party3 )
---@return any hasMember 1 if the given index corresponds to a member in the player's party; otherwise nil
function GetPartyMember(index) end

--- Returns a unit's status during a ready check. Returns nil for all units unless the player is the party/raid leader or a raid assistant.
---@param unit string A unit in the player's party or raid
---@return any status Ready check status for the unit ( string ) "notready" - Unit has responded as not ready "ready" - Unit has responded as ready "waiting" - Unit has not yet responded nil - No ready check is in progress
function GetReadyCheckStatus(unit) end

--- Returns the amount of time left on the current ready check. Returns 0 if no ready check is in progress.
---@return number timeLeft Amount of time remaining on the ready check (in seconds)
function GetReadyCheckTimeLeft() end

--- Invites a character to the player's party or raid
---@param name string Name of a character to invite
function InviteUnit(name) end

--- Returns whether or not a unit is the current party leader
---@param unit any The unit to query
---@return any isLeader 1 if the unit is the party leader, otherwise nil
function IsPartyLeader(unit) end

--- Exits the current party or raid. If there are only two characters in the party or raid, causes the party or raid to be disbanded.
function LeaveParty() end

--- Promotes a player to party/raid leader
---@param unit string A unit in the party or raid
---@param name string Name of a party member
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function PromoteToLeader(unit, name, exactMatch) end

--- Assigns a group role to a member of the player's party or raid
--- Flags: protected
---@param assignment any A group role to assign to the unit ( string ) MAINASSIST - Assign the main assist role MAINTANK - Assign the main tank role
---@param unit string A unit in the player's party or raid
---@param name string Name of a unit in the player's party or raid
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function SetPartyAssignment(assignment, unit, name, exactMatch) end

--- Removes a character from the player's party or raid. Only works if the player is the party leader, raid leader, or raid assistant.
---@param name string Name of a character to uninvite
function UninviteUnit(name) end

--- Returns whether or not a given unit is in the player's party.. This function always returns 1 for the "player" unit.  If the player has a pet, it is not considered part of the party.
---@param unit any The unit to query for party membership
---@return any inParty 1 if the unit is in the player's party, otherwise nil.
function UnitInParty(unit) end

--- Returns whether a unit is the leader of the player's party
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any leader 1 if the unit is the party leader; otherwise nil
function UnitIsPartyLeader(unit, name) end

--- Returns whether a unit is in the player's party or belongs to a party member. Returns nil for the player and the player's pet.
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any inParty 1 if the unit is in the player's party or is a pet belonging to a party member; otherwise nil
function UnitPlayerOrPetInParty(unit, name) end



--==============================
-- Pet Stable functions
--==============================

--- Purchases the next available stable slot, without confirmation. Only available while interacting with a Stable Master NPC (between the PET_STABLE_SHOW and PET_STABLE_CLOSED events and only if IsAtStableMaster() returns true).
--- Flags: confirmation
function BuyStableSlot() end

--- This function or event no longer exists in version 6.0.2 (19034) of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param index any Index of a stable slot ( number ) 0 - Active pet 1 to NUM_PET_STABLE_SLOTS - A stable slot
---@return any selected 1 if the function selected a stabled pet, rather than placed a pet in the stable slot
function ClickStablePet(index) end

--- Ends use of the Pet Stables UI/API. Causes the PET_STABLE_CLOSED event to fire, indicating that stables-related APIs are no longer valid.
function ClosePetStables() end

--- Returns the cost of the next available stable slot
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetNextStableSlotCost
function GetNextStableSlotCost() end

--- Returns the number of stabled pets. Returned value does not include the current pet.
---@return number numPets Number of pets in the stables
function GetNumStablePets() end

--- Returns the number of stable slots the player has purchased.
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetNumStableSlots
function GetNumStableSlots() end

--- Returns the index of the selected stable pet
---@return any selectedPet Index of the currently selected stable pet ( number ) -1 - The player has no pets (in the stables or otherwise) 0 - The active pet is selected 1 to NUM_PET_STABLE_SLOTS - A stable slot is selected
function GetSelectedStablePet() end

--- Returns the types of food that a stabled pet will eat
---@param index any Index of a stable slot ( number ) 0 - Active pet 1 to NUM_PET_STABLE_SLOTS - A stabled pet
function GetStablePetFoodTypes(index) end

--- Returns information about a stabled pet
---@param index any Index of a stable slot ( number ) 0 - Active pet 1 to NUM_PET_STABLE_SLOTS - A stable slot
---@return string icon Path to an icon texture for the pet
---@return string name Name of the pet
---@return number level Level of the pet
---@return string family Localized name of the pet's creature family (e.g. Cat, Bear, Chimaera)
---@return string talent Localized name of the pet's talent tree (e.g. Ferocity, Tenacity, Cunning)
function GetStablePetInfo(index) end

--- Returns whether the player is interacting with a Stable Master NPC. The Pet Stable UI/API can be active without an NPC if the player is using the Call Stabled Pet ability. New stable slots can only be purchased while talking to an NPC -- the default UI uses this function to determine whether to show UI elements related to purchasing slots.
---@return boolean isAtNPC True if the player is interacting with a Stable Master NPC; otherwise false
function IsAtStableMaster() end

--- Sets the given Model to show the selected stabled pet
---@param model table A Model frame
function SetPetStablePaperdoll(model) end

--- Puts the player's current pet into the stables
function StablePet() end

--- Makes a pet from the stables the active pet
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/UnstablePet
function UnstablePet() end



--==============================
-- Pet functions
--==============================

--- Disables automatic casting of a pet spell
---@param spell string The name of a pet spell
function DisableSpellAutocast(spell) end

--- Enables automatic casting of a pet spell
---@param spell string Name of a pet spell
function EnableSpellAutocast(spell) end

--- Returns information about experience points for the player's pet
---@return number currXP The pet's current amount of experience points
---@return number nextXP Total amount of experience points required for the pet to gain a level
function GetPetExperience() end

--- Returns a list of the food types the player's pet will eat
function GetPetFoodTypes() end

--- Returns information about the player's pet's happiness
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetPetHappiness
function GetPetHappiness() end

--- Returns an icon representing the current pet. Used in the default Pet Stables and Talent UIs for hunter pets; returns nil for other pets.
---@return string texture Path to an icon texture for the pet
function GetPetIcon() end

--- Returns the name of the talent tree used by the player's current pet. Hunter pets use one of three different talent trees according to pet type. Returns nil if the player does not have a pet or the player's current pet does not use talents (i.e. warlock pets, quest pets, etc.)
---@return string talent Localized name of the pet's talent tree
function GetPetTalentTree() end

--- Returns the time remaining before a temporary pet is automatically dismissed. Temporary pets include priests' Shadowfriend, mages' Water Elemental, and various quest-related pets.
---@return number petTimeRemaining Amount of time remaining until the temporary pet is automatically dismissed (in seconds), or nil if the player does not have a temporary pet
function GetPetTimeRemaining() end

--- Returns whether the player's current pet has a spellbook
---@return any hasPetSpells 1 if the player currently has an active pet with spells/abilities; otherwise nil
---@return any petType Non-localized token identifying the type of pet ( string ) DEMON - A warlock's demonic minion PET - A hunter's beast
function HasPetSpells() end

--- Returns whether the pet UI should be displayed for the player's pet. Special quest-related pets, vehicles, and possessed units all count as pets but do not use the pet UI or associated functions.
---@return any hasPetUI 1 if the pet UI should be displayed for the player's pet
---@return any isHunterPet 1 if the player's pet is a hunter pet
function HasPetUI() end

--- Returns whether the pet's attack action is currently active
---@return any isActive 1 if the pet's attack action is currently active; otherwise nil
function IsPetAttackActive() end

--- Releases the player's pet. For Hunter pets, this function sends the pet away, never to return (in the default UI, it's called when accepting the "Are you sure you want to permanently abandon your pet?" dialog). For other pets, this function is equivalent to PetDismiss() .
--- Flags: confirmation
function PetAbandon() end

--- Enables aggressive mode for the player's pet. In this mode, the pet automatically attacks any nearby hostile targets.
--- Flags: protected
function PetAggressiveMode() end

--- Instructs the pet to attack. The pet will attack the player's current target if no unit is specified.
--- Flags: protected
---@param unit string A unit to attack
---@param name string The name of a unit to attack
function PetAttack(unit, name) end

--- Returns whether the player's pet can be abandoned. Only Hunter pets can be permanently abandoned.
---@return any canAbandon 1 if the player's pet can be abandoned, otherwise nil
function PetCanBeAbandoned() end

--- Returns whether a Dismiss Pet command should be available for the player's pet. Returns 1 for hunter pets even though they use the Dismiss Pet (cast) spell instead of a Dismiss Pet (instant) command; the value of PetCanBeAbandoned() overrides this in causing the default UI to hide the command. Currently unused, but may be used in the future for other pets.
---@return any canDismiss 1 if a Dismiss Pet command should be available for the player's pet; otherwise nil
function PetCanBeDismissed() end

--- Returns whether the player's pet can be renamed. Only hunter pets can be renamed, and only once (barring use of a Certificate of Ownership ).
---@return any canRename 1 if the player can rename the currently controlled pet, otherwise nil
function PetCanBeRenamed() end

--- Enables defensive mode for the player's pet. In this mode, the pet automatically attacks only units which attack it or the player or units the player is attacking.
--- Flags: protected
function PetDefensiveMode() end

--- Dismisses the currently controlled pet. Used for dismissing Warlock pets, Mind Control targets, etc. Has no effect for Hunter pets, which can only be dismissed using the Dismiss Pet spell.
function PetDismiss() end

--- Instructs the pet to follow the player. If the pet is currently attacking a target, the pet will stop attacking.
--- Flags: protected
function PetFollow() end

--- Returns whether the player's current pet has an action bar
---@return any hasActionBar Returns 1 if the player's pet has an action bar; otherwise nil
function PetHasActionBar() end

--- Enables passive mode for the player's pet. In this mode, the pet will not automatically attack any target.
--- Flags: protected
function PetPassiveMode() end

--- Renames the currently controlled pet. Only Hunter pets can be renamed, and a given pet can only be renamed once (barring use of a Certificate of Ownership ).
---@param name string New name for the pet (nominative form on Russian clients)
---@param genitive string Genitive form of the pet's new name; applies only on Russian clients
---@param dative string Dative form of the pet's new name; applies only on Russian clients
---@param accusative string Accusative form of the pet's new name; applies only on Russian clients
---@param instrumental string Instrumental form of the pet's new name; applies only on Russian clients
---@param prepositional string Prepositional form of the pet's new name; applies only on Russian clients
function PetRename(name, genitive, dative, accusative, instrumental, prepositional) end

--- Instructs the pet to stop attacking
--- Flags: protected
function PetStopAttack() end

--- Instructs the pet to stay at its current location. If the pet is currently attacking a target, the pet will stop attacking.
--- Flags: protected
function PetWait() end



--==============================
-- Petition functions
--==============================

--- Purchases an arena team charter
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/BuyPetition
function BuyPetition() end

--- Returns whether the player can sign the currently offered petition. Petitions can only be signed once per account, rather than once per character.
---@return any canSign 1 if the player can sign the offered petition; otherwise nil
function CanSignPetition() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function ClickPetitionButton() end

--- Ends interaction with a petition. Fires the PETITION_CLOSED event, indicating that Petition APIs may no longer have effects or return valid data.
function ClosePetition() end

--- Ends interaction with an arena registrar
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/ClosePetitionVendor
function ClosePetitionVendor() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function GetNumPetitionItems() end

--- Returns the number of people who have signed the open petition
---@return number numNames Number of characters that have signed the petition
function GetNumPetitionNames() end

--- Returns information about the currently open petition
---@return any petitionType Type of the petition ( string ) arena - An arena team charter guild - A guild charter
---@return string title Title of the petition
---@return string bodyText Body text of the petition
---@return number maxSignatures Maximum number of signatures allowed
---@return string originatorName Name of the character who initially purchased the charter
---@return any isOriginator 1 if the player is the petition's originator; otherwise nil
---@return number minSignatures Minimum number of signatures required to establish the charter
function GetPetitionInfo() end

--- Returns information about a purchasable arena team charter
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetPetitionItemInfo
function GetPetitionItemInfo() end

--- Returns the name of a character who has signed the currently offered petition
---@param index number Index of a signature slot on the petition (between 1 and minSignatures , where minSignatures = select(7, GetPetitionInfo() ) )
---@return string name Name of the signatory character, or nil if the slot has not yet been signed
function GetPetitionNameInfo(index) end

--- Returns whether the player has a completed petition
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/HasFilledPetition
function HasFilledPetition() end

--- Requests an arena or guild charter signature from the targeted unit
function OfferPetition() end

--- Renames the guild or arena team to be created by the open petition
---@param name string New name for the guild or arena team
function RenamePetition(name) end

--- Signs the currently offered petition
function SignPetition() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function TurnInPetition() end



--==============================
-- Player information functions
--==============================

--- Accepts an offered resurrection spell. Not used for self-resurrection; see UseSoulstone() for such cases.
function AcceptResurrect() end

--- Resurrects the player at a spirit healer, accepting possible consequences. Resurrecting at a spirit healer generally results in a loss of durability (both equipped items and those in the player's bags) and may also result in the Resurrection Sickness debuff.
--- Flags: confirmation
function AcceptXPLoss() end

--- Returns whether the player is in a world PvP zone offering an exit option.
---@return any status 1 if in a world PvP zone with an exit option; otherwise nil
function CanHearthAndResurrectFromArea() end

--- Returns whether the player is in range of an NPC that can set the Hearthstone location. Usable following the CONFIRM_BINDER event which fires when the player speaks to an Innkeeper (or similar) NPC and chooses to set his or her Hearthstone location. Used in the default UI to hide the confirmation window for such if the player moves too far away from the NPC.
---@return any inRange 1 if the player is in range of an NPC that can set the Hearthstone location; otherwise nil
function CheckBinderDist() end

--- Returns whether the player is in range of a spirit healer. Usable following the CONFIRM_XP_LOSS event which fires upon speaking to a spirit healer while dead and choosing the option to immediately resurrect. Used in the default UI to hide the confirmation window for such if the player moves too far away from the spirit healer.
---@return any inRange 1 if the player is in range of a spirit healer; otherwise nil
function CheckSpiritHealerDist() end

--- Sets the player's Hearthstone to the current location. Usable in response to the CONFIRM_BINDER event which fires upon speaking to an Innkeeper (or similar NPC) and choosing the Hearthstone option.
function ConfirmBinder() end

--- Declines an offered resurrection spell. Usable following the RESURRECT_REQUEST event which fires when the player is offered resurrection by another unit.
function DeclineResurrect() end

--- Dismounts from the player's summoned mount
function Dismount() end

--- Returns the name of the player's Hearthstone location
---@return string location Name of the player's Hearthstone location
function GetBindLocation() end

--- Returns the player's number of combo points on the target.
---@param unit string Either 'player' or 'vehicle'
---@param target string Unit to check for combo points.
---@return number comboPoints Number of combo points (between 0 and MAX_COMBO_POINTS )
function GetComboPoints(unit, target) end

--- Returns the amount of time left until the player can recover their corpse. Applies to resurrection spells offered by other units, resurrecting by returning to the player's corpse as a ghost, and to resurrecting at a graveyard's spirit healer, if the player has recently died several times in short succession.
---@return number timeLeft Amount of time remaining before the player can resurrect (in seconds); 0 if the player can resurrect immediately
function GetCorpseRecoveryDelay() end

--- Returns the currently selected player title
---@return number currentTitle Index of the player's current title (between 1 and GetNumTitles() )
function GetCurrentTitle() end

--- Returns the number of available player titles. Includes all titles, not just those earned by the player
---@return number numTitles Number of available player titles
function GetNumTitles() end

--- Returns the title reward for the selected quest in the quest log. Returns nil if no title is awarded or if no quest is selected.
---@return string title Title to be awarded to the player upon completing the quest
function GetQuestLogRewardTitle() end

--- Returns the name of the player's realm (server name)
---@return string realm The name of the player's realm (server)
function GetRealmName() end

--- Returns the amount of time remaining until the player's spirit is automatically released when dead. Returns -1 if the player died in a dungeon or raid instance; in such cases, the player's spirit will not be released automatically (see RepopMe() to release manually).
---@return number timeleft Amount of time remaining until the player's spirit is automatically released to the nearest graveyard (in seconds)
function GetReleaseTimeRemaining() end

--- Returns the duration of resurrection sickness at the player's current level. Returns nil for players under level 10, who are allowed to resurrect at a spirit healer without suffering resurrection sickness.
---@return string resSicknessTime Text describing the duration of resurrection sickness were the player to resurrect at a spirit healer
function GetResSicknessDuration() end

--- Returns the player's current rest state
---@return any state Number identiying the current rest state ( number ) 1 - Rested 2 - Normal 3 - Tired - used in locales with account play time limits 4 - Unhealthy - used in locales with account play time limits
---@return string name Localized text describing the player's current rest state
---@return number multiplier Multiplier for experience points earned from kills
function GetRestState() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetTimeToWellRested() end

--- Returns the text of an available player title
---@param titleIndex number Index of a title available to the player (between 1 and GetNumTitles() )
---@return string titleName The text of the title
function GetTitleName(titleIndex) end

--- Returns the player's current pitch (slope or angle of movement). Only valid for the unitID "player". The slope returned here reflects only the direction of movement for swimming or flying, not the current orientation of the player model or camera. (When on solid ground, GetUnitPitch indicates what the angle of flight would be were the player to start flying.)
---@param unit string Unit to query; only valid for player
---@return number pitch Unit's slope of movement in radians
function GetUnitPitch(unit) end

--- Returns a unit's current speed. Valid for all observable units. Values returned indicate the current movement speed in yards per second. (It's not relative to facing or ground position; i.e. you won't see a smaller value when flying up at an angle or a negative value when backing up.) Does not indicate falling speed or the speed of boats, zeppelins, and some forms of quest-related transportation, but does indicate current speed on taxi flights and when moving due to combat effects such as Disengage, Death Grip, or various knockback abilities.
---@param unit any Unit to query
---@return number speed Unit's current speed in yards per second
function GetUnitSpeed(unit) end

--- Returns whether the player character can be controlled
---@return any hasControl 1 if the player character can be controlled (i.e. isn't feared, charmed, etc); otherwise nil
function HasFullControl() end

--- Returns whether the player has any keys stored in the Keyring container. Used in the default UI to show or hide the UI for the Keyring container
---@return any hasKey Returns 1 if the player has any keys stored in the Keyring container; otherwise nil
function HasKey() end

--- Returns whether the player can instantly resurrect in place. Only returns valid information while the player is dead and has not yet released his or her spirit to the graveyard.
---@return string text If the player can resurrect in place, the text to be displayed on the dialog button for such (e.g. "Use Soulstone", "Reincarnate"); otherwise nil
function HasSoulstone() end

--- Returns whether the player has a wand equipped
---@return any isEquipped 1 if a wand is equipped; otherwise nil
function HasWandEquipped() end

--- Returns whether the player is currently falling
---@return any falling 1 if the player is falling; otherwise nil
function IsFalling() end

--- Returns whether flight is allowed on the continent where the player is currently located
---@return any isFlyable 1 if the current area is a flyable area, otherwise nil
function IsFlyableArea() end

--- Returns whether the player is currently flying
---@return any isFlying 1 if the player is currently flying; otherwise nil
function IsFlying() end

--- Returns whether the player is currently indoors
---@return any inside 1 if the player is currently indoors; otherwise nil
function IsIndoors() end

--- Returns whether the player is mounted
---@return any mounted 1 if the player is mounted, otherwise nil
function IsMounted() end

--- Returns whether the player is currently outside the bounds of the world. Used in the default UI (in conjunction with IsFalling() ) to allow the player to release to a graveyard if the character has encountered a bug and fallen underneath the world geometry.
---@return any outOfBounds 1 if the player is currently outside the bounds of the world; otherwise nil
function IsOutOfBounds() end

--- Returns whether the player is currently outdoors. "Outdoors" as defined by this function corresponds to the ability to use a mount in that specific location, not necessarily whether there is a roof above the player character's head. For example, returns 1 in Ironforge, Undercity, and the Caverns of Time, but nil in the nominally outdoor areas of instances such as Stratholme, Drak'tharon Keep, and Hellfire Ramparts. (Note that even in "outdoor" areas, standing on top of certain objects may interfere with the player's ability to mount up.)
---@return any isOutdoors 1 if the player is currently outdoors; otherwise nil
function IsOutdoors() end

--- Returns whether the player is currently resting. Rest state is provided in Inns and major cities and allows the player to log out immediately (instead of after a brief delay) and accrue bonus XP to be awarded for kills.
---@return boolean resting 1 if the player is resting; otherwise nil
function IsResting() end

--- Returns whether the player is currently stealthed
---@return any stealthed 1 if rogue Stealth, druid cat form Prowl, or a similar ability is active on the player; otherwise nil
function IsStealthed() end

--- Returns whether the player is currently swimming. "Swimming" as defined by this function corresponds to the ability to use swimming abilities (such as druid Aquatic Form) or inability to use land-restricted abilities (such as eating or summoning a flying mount), not necessarily to whether the player is in water.
---@return any isSwimming 1 if the player is currently swimming; otherwise nil
function IsSwimming() end

--- Returns whether the player has earned the ability to display a title
---@param titleIndex number Index of a title available to the player (between 1 and GetNumTitles() )
---@return any isKnown 1 if the player has earned the ability to display the title; otherwise nil
function IsTitleKnown(titleIndex) end

--- Returns whether the player has an equipped weapon in the off hand slot
---@return any hasWeapon 1 if the player has a weapon equipped in the off hand slot; otherwise nil
function OffhandHasWeapon() end

--- Releases the player's spirit to the nearest graveyard. Only has effect if the player is dead.
function RepopMe() end

--- Returns the name of a unit offering to resurrect the player.
---@return string name Name of the unit offering resurrection
function ResurrectGetOfferer() end

--- Returns whether accepting an offered resurrection spell will cause the player to suffer Resurrection Sickness. Usable following the RESURRECT_REQUEST event which fires when the player is offered resurrection by another unit.
---@return any hasSickness 1 if accepting resurrection will cause Resurrection Sickness; otherwise nil
function ResurrectHasSickness() end

--- Returns whether the player must wait before resurrecting. Applies to resurrection spells offered by other units, resurrecting by returning to the player's corpse as a ghost, and to resurrecting at a graveyard's spirit healer, if the player has recently died several times in short succession. See GetCorpseRecoveryDelay() for the time remaining until the player can resurrect.
---@return any hasTimer 1 if the player must wait before resurrecting; otherwise nil
function ResurrectHasTimer() end

--- Confirms resurrection by returning to the player's corpse
function RetrieveCorpse() end

--- Changes a player's displayed title
---@param titleIndex number Index of a title available to the player (between 1 and GetNumTitles() ), or -1 to show no title
function SetCurrentTitle(titleIndex) end

--- Enables or disables display of the player's cloak. Only affects the player's appearance; does not change the other effects of having the cloak equipped. Determines not only the appearance of the player character on the local client, but the way other players see the character as well.
---@param show any 1 to display the player's cloak; nil to hide it
function ShowCloak(show) end

--- Enables or disables display of the player's headgear. Only affects the player's appearance; does not change the other effects of having the headgear equipped. Determines not only the appearance of the player character on the local client, but the way other players see the character as well.
---@param show any 1 to display the player's headgear; nil to hide it
function ShowHelm(show) end

--- Returns whether the player's cloak is displayed. Determines not only the appearance of the player character on the local client, but the way other players see the character as well.
---@return any isShown 1 if the player's cloak is shown; otherwise nil
function ShowingCloak() end

--- Returns whether the player's headgear is displayed. Determines not only the appearance of the player character on the local client, but the way other players see the character as well.
---@return any isShown 1 if the player's headgear is shown; otherwise nil
function ShowingHelm() end

--- Sheaths or unsheaths the player character's hand-held items. Calling repeatedly will cause the player character to draw his or her melee weapons, followed by his or her range weapon, followed by hiding all weapons.
function ToggleSheath() end

--- Returns the player's number of unused talent points and profession slots
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/UnitCharacterPoints
function UnitCharacterPoints() end

--- Instantly resurrects the player in place, if possible. Usable if the player is dead (and has not yet released his or her spirit to the graveyard) and has the ability to instantly resurrect (provided by a Warlock's Soulstone or a Shaman's Reincarnation passive ability).
function UseSoulstone() end



--==============================
-- PvP functions
--==============================

--- Returns whether the player can queue for Wintergrasp
---@return boolean canQueue Can the player queue for Wintergrasp
function CanQueueForWintergrasp() end

--- Returns whether the player has manually enabled PvP status. Only indicates whether the player has manually and directly enabled his PvP flag (e.g. by typing "/pvp" or using the default UI's menu when right-clicking the player portrait); returns 0 if the player only became PvP flagged by attacking an enemy player, entering an enemy zone, etc.
---@return number isPVPDesired 1 if the PVP flag was toggled on by the player manually; otherwise 0
function GetPVPDesired() end

--- Returns the player's lifetime total of honorable kills and highest rank achieved. Highest rank achieved applies only to the older PvP rewards system that was abandoned with the WoW 2.0 patch, but is still accurate for players who participated in it.
---@return number hk Number of honorable kills the player has scored
---@return number highestRank Highest rank the player ever achieved in the pre-2.0 PvP rewards system
function GetPVPLifetimeStats() end

--- Returns information about a given PvP rank index. These ranks are no longer in use, as they were part of the older PvP rewards system that was abandoned with the WoW 2.0 patch.
---@param index number Index of a rank (begins at 1, corresponding to a never-used "Pariah" rank; actual ranks start at 5)
---@param unit string A unit to use as basis for the rank name (i.e. to return Horde rank names for Horde units and Alliance rank names for Alliance units); if omitted, uses the player's faction
---@return string rankName Name of the rank
---@return number rankNumber Index of the rank relative to unranked status (positive values for ranks earned through honorable kills, negative values for the unused dishonorable ranks)
function GetPVPRankInfo(index, unit) end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function GetPVPRankProgress() end

--- Returns the number of kills and honor points scored by the player since logging in
---@return number honorKills Number of honorable kills scored
---@return number honorPoints Amount of honor currency earned
function GetPVPSessionStats() end

--- Returns the amount of time until the player's PVP flag expires. Returns 300000 or higher if the player's PvP flag is manually enabled or if the player is in a  PvP or enemy zone.
---@return number timer Milliseconds remaining until the player's PvP flag expires
function GetPVPTimer() end

--- Returns the number of kills and honor points scored by the player on the previous day
---@return number honorKills Number of honorable kills scored
---@return number honorPoints Amount of honor currency earned
function GetPVPYesterdayStats() end

--- Returns information on the players queue for a world PvP zone
---@param index number Index of the queue to get data for (between 1 and MAX_WORLD_PVP_QUEUES )
---@return any status Returns the status of the players queue ( string ) confirm - The player can enter the pvp zone none - No world pvp queue at this index queued - The player is queued for this pvp zone
---@return string mapName Map name they are queued for (e.g Wintergrasp)
---@return number queueID Queue ID, used for BattlefieldMgrExitRequest() and BattlefieldMgrEntryInviteResponse()
function GetWorldPVPQueueStatus(index) end

--- Returns PVP information about the current area. Information returned may apply to the current subzone, not the entire zone.
---@return any pvpType PvP status for the area ( string ) arena - Arena or outdoor free-for-all area (e.g. Gurubashi Arena) combat - Combat zone (e.g. Wintergrasp) contested - Horde/Alliance PvP is enabled for all players friendly - Zone is controlled by the player's faction; PvP status is optional for the player but mandatory for enemy players hostile - Zone is controlled by the enemy's faction; PvP status is optional for the enemy but mandatory for the player nil - PvP status is not automatically enabled for either faction (used for "contested" zones on Normal servers) sanctuary - PvP activity is not allowed
---@return any isSubZonePVP 1 if the current area allows free-for-all PVP; otherwise nil
---@return string factionName Name of the faction that controls the zone (only applies if pvpType is friendly or hostile)
function GetZonePVPInfo() end

--- Instantly exits the current world PvP zone, returning to the player's Hearthstone location.
function HearthAndResurrectFromArea() end

--- Returns whether the player's PvP flag will expire after a period of time.
---@return any isRunning 1 if the player's PvP flag will expire; otherwise nil
function IsPVPTimerRunning() end

--- Returns whether the current area has PvP (or other) objectives to be displayed. Used in the default UI when the "Display World PVP Objectives\ setting is set to \Dynamic\, in which case objective information is only shown when the player is near an objective. Examples include the towers in Eastern Plaguelands and Hellfire Peninsula as well as non-PvP objectives such as in the Old Hillsbrad instance, the Death Knight starter quests, and the Battle for Undercity quest event.
---@return any isPVPPOI 1 if the current subzone has objectives to display
function IsSubZonePVPPOI() end

--- Returns whether accepting the offered quest will flag the player for PvP. Only valid when the questgiver UI is showing the accept/decline stage of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED events); otherwise may return nil or a value from the most recently displayed quest.
---@return any questFlag 1 if accepting the quest will flag the player for PvP for as long as it remains in the quest log; otherwise nil
function QuestFlagsPVP() end

--- Enables or disables the player's desired PvP status. Enabling PvP takes effect immediately; disabling PvP begins a five-minute countdown after which PvP status will be disabled (if the player has taken no PvP actions).
---@param state any 1 to enable PVP, nil to disable
function SetPVP(state) end

--- Switches the player's desired PvP status. If PvP is currently disabled for the player, it becomes enabled immediately. If PvP is enabled, it will become disabled after five minutes of no PvP activity.
function TogglePVP() end

--- Returns whether a unit is flagged for free-for-all PvP. Free-for-all PvP allows all players to attack each other regardless of faction; used in certain outdoor areas (such as Gurubashi Arena and "The Maul" outside Dire Maul).
---@param unit string A unit to query
---@return any isFreeForAll 1 if the unit is enabled for free-for-all PvP; otherwise nil
function UnitIsPVPFreeForAll(unit) end

--- Returns whether a unit is in a Sanctuary area preventing PvP activity
---@param unit string A unit to query
---@return any state 1 if the unit is in a PVP Sanctuary; otherwise nil
function UnitIsPVPSanctuary(unit) end

--- Returns the name of a unit including the unit's current title. Titles are no longer specific to PvP; this function returns a unit's name with whichever title he or she is currently displaying (e.g. "Gladiator Spin", "Keydar Jenkins", "Ownsusohard, Champion of the Frozen Wastes", etc).
---@param unit string A unit to query
---@return string name Name of the unit including the unit's current title
function UnitPVPName(unit) end

--- Returns a unit's PVP rank as a number. Returns 0 for all units; was only applicable in the older PvP rewards system that was abandoned with the WoW 2.0 patch.
--- Flags: deprecated
---@param unit string A unit to query
---@return number rank The numeric PvP rank of the unit, or 0 if the unit has no PvP rank
function UnitPVPRank(unit) end



--==============================
-- Quest functions
--==============================

--- Confirms abandoning a quest. Use SetAbandonQuest() first to select the quest to abandon.
--- Flags: confirmation
function AbandonQuest() end

--- Accepts the quest offered by a questgiver
function AcceptQuest() end

--- Ends interaction with a questgiver. Fires the QUEST_FINISHED event, indicating that questgiver-related APIs may no longer have effects or return valid data.
function CloseQuest() end

--- Collapses a header in the quest log
---@param questIndex number Index of a header in the quest log (between 1 and GetNumQuestLogEntries() ), or 0 to collapse all headers
function CollapseQuestHeader(questIndex) end

--- Begins turning in a quest to a questgiver. Usable following the QUEST_PROGRESS event in which it is determined whether the player can complete the quest.
function CompleteQuest() end

--- Accepts a quest started by another group member. Usable following the QUEST_ACCEPT_CONFIRM event which fires when another member of the player's party or raid starts certain quests (e.g. escort quests).
function ConfirmAcceptQuest() end

--- Declines a quest.. Usable following the QUEST_DETAIL event in which the questgiver presents the player with the details of a quest and the option to accept or decline.
function DeclineQuest() end

--- Expands a quest header in the quest log
---@param questIndex number Index of a header in the quest log (between 1 and GetNumQuestLogEntries() ), or 0 to expand all headers
function ExpandQuestHeader(questIndex) end

--- Returns information about items that would be destroyed by abandoning a quest. Usable after calling SetAbandonQuest() but before calling AbandonQuest() .
---@return string items A string listing any items that would be destroyed
function GetAbandonQuestItems() end

--- Returns the name of the quest being abandoned. Usable after calling SetAbandonQuest() but before calling AbandonQuest() .
---@return string name Name of the quest being abandoned
function GetAbandonQuestName() end

--- Returns the level of a quest which can be turned in to the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@param index number Index of a quest which can be turned in to the current Quest NPC (between 1 and GetNumActiveQuests() )
---@return number level Recommended character level for attempting the quest
function GetActiveLevel(index) end

--- Returns the name of a quest which can be turned in to the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@param index number Index of a quest which can be turned in to the current Quest NPC (between 1 and GetNumActiveQuests() )
---@return string title Title of the quest
function GetActiveTitle(index) end

--- Returns the level of a quest available from the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@param index number Index of a quest available from the current Quest NPC (between 1 and GetNumAvailableQuests() )
---@return number level Recommended character level for attempting the quest
function GetAvailableLevel(index) end

--- Returns the name of a quest available from the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@param index number Index of a quest available from the current Quest NPC (between 1 and GetNumAvailableQuests() )
---@return string title Title of the quest
function GetAvailableTitle(index) end

--- Returns the number of daily quests the player has completed today. The daily quest period resets at or around 3:00 AM server time on most realms.
---@return number dailyQuestsComplete Number of daily quests completed in the current period
function GetDailyQuestsCompleted() end

--- Returns the greeting text displayed for quest NPCs with multiple quests. Not used often; most quest NPCs offering multiple quests (and/or other options) use the Gossip functions to provide a greeting (see GetGossipText() ).
---@return string greetingText Text to be displayed before choosing from among the NPC's multiple quests
function GetGreetingText() end

--- Returns the maximum number of daily quests that can be completed each day.
---@return number max The maximum number of daily quests that can be completed each day
function GetMaxDailyQuests() end

--- Returns the number of quests which can be turned in to the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@return number numActiveQuests Number of quests which can be turned in to the current Quest NPC
function GetNumActiveQuests() end

--- Returns the number quests available from the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@return number numAvailableQuests Number of quests available from the current Quest NPC
function GetNumAvailableQuests() end

--- Returns the number of available quest rewards from which the player must choose one upon completing the quest presented by a questgiver. Only valid during the accept/decline or completion stages of a quest dialog (following the QUEST_DETAIL or QUEST_COMPLETE events); otherwise may return 0 or a value from the most recently displayed quest.
---@return number numQuestChoices Number of available quest rewards from which the player must choose one upon completing the quest
function GetNumQuestChoices() end

--- Returns the number of different items required to complete the quest presented by a questgiver. Usable following the QUEST_PROGRESS event in which it is determined whether the player can complete the quest.
---@return number numRequiredItems Number of different items required to complete the quest
function GetNumQuestItems() end

--- Returns the number of quest objectives for a quest in the player's quest log
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() ); if omitted, defaults to the selected quest
---@return number numObjectives Number of trackable objectives for the quest
function GetNumQuestLeaderBoards(questIndex) end

--- Returns the number of available item reward choices for the selected quest in the quest log. This function refers to quest rewards for which the player is allowed to choose one item from among several; for items always awarded upon quest completion, see GetNumQuestLogRewards .
---@return number numChoices Number of items among which a reward can be chosen for completing the quest
function GetNumQuestLogChoices() end

--- Returns the number of quests and headers in the quest log
---@return number numEntries Total number of entries (quests and headers)
---@return number numQuests Number of quests only
function GetNumQuestLogEntries() end

--- Returns the number of item rewards for the selected quest in the quest log. This function refers to items always awarded upon quest completion; for quest rewards for which the player is allowed to choose one item from among several, see GetNumQuestLogChoices .
---@return number numRewards Number of rewards for completing the quest
function GetNumQuestLogRewards() end

--- Returns the number of different items always awarded upon completing the quest presented by a questgiver. Only valid during the accept/decline or completion stages of a quest dialog (following the QUEST_DETAIL or QUEST_COMPLETE events); otherwise may return 0 or a value from the most recently displayed quest.
---@return number numQuestRewards Number of different items always awarded upon completing the quest
function GetNumQuestRewards() end

--- Returns a summary of objectives for the quest offered by a questgiver. Only valid when the questgiver UI is showing the accept/decline stage of a quest dialog (between the QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return the empty string or a value from the most recently displayed quest.
---@return string questObjective The objective text for the currently displayed quest
function GetObjectiveText() end

--- Returns the quest progress text presented by a questgiver. Only valid when the questgiver UI is showing the progress stage of a quest dialog (between the QUEST_PROGRESS and QUEST_FINISHED events); otherwise may return the empty string or a value from the most recently displayed quest.
---@return string text Progress text for the quest
function GetProgressText() end

--- Returns background display style information for a questgiver dialog. The value returned can be used to look up background textures and text colors for display:
---@return any material String identifying a display style for the questgiver dialog, or nil for the default style ( string ) Bronze - Colored metallic background Marble - Light stone background Parchment - Yellowed parchment background (default) Silver - Gray metallic background Stone - Dark stone background
function GetQuestBackgroundMaterial() end

--- Returns a table of color values indicating the difficulty of a quest's level as compared to the player's
--- Flags: blizzardui
---@param level number Level for which to compare difficulty
---@return table color A table containing color values (keyed r , g , and b ) representing the difficulty of a quest at the input level as compared to the player's
function GetQuestDifficultyColor(level) end

--- Returns the level range in which a quest below the player's level still rewards XP. If a quest's level is up to range levels below the player's level, the quest is considered easy but still rewards experience points upon completion; these quests are colored green in the default UI's quest log. (Quests more than range levels below the player's are colored gray in the default UI and reward no XP.)
---@return number range Maximum difference between player level and a lower quest level for a quest to reward experience
function GetQuestGreenRange() end

--- Returns the quest log index of a timed quest's timer
---@param index number Index of a timer (in the list returned by GetQuestTimers() )
---@return number questIndex Index of the quest in the quest log (between 1 and GetNumQuestLogEntries() )
function GetQuestIndexForTimer(index) end

--- Returns information about items in a questgiver dialog. Only valid when the questgiver UI is showing the accept/decline, progress, or completion stages of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED , QUEST_PROGRESS and QUEST_FINISHED , or QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return empty values or those from the most recently displayed quest.
---@param type any Which of the possible sets of items to query ( string ) choice - Items from which the player may choose a reward required - Items required to complete the quest reward - Items given as reward for the quest
---@param index number Which item to query (from 1 to GetNumQuestChoices(), GetNumQuestItems(), or GetNumQuestRewards(), depending on the value of the itemType argument)
---@return string name The name of the item
---@return string texture Path to a texture for the item's icon
---@return number numItems Number of the item required or rewarded
---@return any quality The quality of the item ( number ) 0 - Poor 1 - Common 2 - Uncommon 3 - Rare 4 - Epic 5 - Legendary 6 - Artifact
---@return any isUsable 1 if the player can currently use/equip the item; otherwise nil
function GetQuestItemInfo(type, index) end

--- Returns information about available item rewards for the selected quest in the quest log. This function refers to quest rewards for which the player is allowed to choose one item from among several; for items always awarded upon quest completion, see GetQuestLogRewardInfo .
---@param index number Index of a quest reward choice (between 1 and GetNumQuestLogChoices())
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number numItems Number of items in the stack
---@return number quality Quality of the item
---@return any isUsable 1 if the player can use or equip the item; otherwise nil
function GetQuestLogChoiceInfo(index) end

--- Returns the completion text for the selected quest in the quest log. Completion text usually includes instructions on to whom and where to hand in the quest once it has been completed. Example: "Return to William Pestle at Goldshire in Elwynn Forest."
---@return string completionText Completion instructions for the quest
function GetQuestLogCompletionText() end

--- Returns the suggested group size for the selected quest in the quest log
---@return number suggestedGroup Recommended number of players in a group attempting the quest
function GetQuestLogGroupNum() end

--- Returns information about objectives for a quest in the quest log
---@param objective number Index of a quest objective (between 1 and GetNumQuestLeaderBoards() )
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() ); if omitted, defaults to the selected quest
---@return string text Text of the objective (e.g. "Gingerbread Cookie: 0/5")
---@return any type Type of objective ( string ) event - Requires completion of a scripted event item - Requires collecting a number of items monster - Requires slaying a number of NPCs object - Requires interacting with a world object reputation - Requires attaining a certain level of reputation with a faction
---@return any finished 1 if the objective is complete; otherwise nil
function GetQuestLogLeaderBoard(objective, questIndex) end

--- Return whether the selected quest in the quest log can be shared to party members
---@return any shareable 1 if the quest is shareable; otherwise nil
function GetQuestLogPushable() end

--- Returns the description and objective text for the selected quest in the quest log
---@return string questDescription Full description of the quest (as seen in the NPC dialog when accepting the quest)
---@return string questObjectives A (generally) brief summary of quest objectives
function GetQuestLogQuestText() end

--- Returns the honor reward for the selected quest in the quest log
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetQuestLogRewardHonor
function GetQuestLogRewardHonor() end

--- Returns information about item rewards for the selected quest in the quest log. This function refers to items always awarded upon quest completion; for quest rewards for which the player is allowed to choose one item from among several, see GetQuestLogChoiceInfo .
---@param index number Index of a quest reward (between 1 and GetNumQuestLogRewards())
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number numItems Number of items in the stack
---@return number quality Quality of the item
---@return any isUsable 1 if the player can use or equip the item; otherwise nil
function GetQuestLogRewardInfo(index) end

--- Returns information about the spell reward for the selected quest in the quest log. If both isTradeskillSpell and isSpellLearned are nil , the reward is a spell cast upon the player.
---@return string texture Path to the spell's icon texture
---@return string name Name of the spell
---@return any isTradeskillSpell 1 if the spell is a tradeskill recipe; otherwise nil
---@return any isSpellLearned 1 if the reward teaches the player a new spell; otherwise nil
function GetQuestLogRewardSpell() end

--- Returns the talent point reward for the selected quest in the quest log. Returns 0 for quests which do not award talent points.
---@return number talents Number of talent points to be awarded upon completing the quest
function GetQuestLogRewardTalents() end

--- Returns the index of the selected quest in the quest log
---@return number questIndex Index of the selected quest in the quest log (between 1 and GetNumQuestLogEntries() )
function GetQuestLogSelection() end

--- Returns a hyperlink for a spell in the selected quest in the quest log
---@return string link A hyperlink for the spell or tradeskill recipe
function GetQuestLogSpellLink() end

--- Returns time remaining for the selected quest in the quest log. If the selected quest is not timed, returns nil.
---@return number questTimer The amount of time left to complete the quest
function GetQuestLogTimeLeft() end

--- Returns information about an entry in the player's quest log
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
---@return string questLogTitleText Title of the quest
---@return number level Recommended character level for attempting the quest
---@return any questTag Localized tag describing the type of quest ( string ) Dungeon - Dungeon or instance quest Elite - Elite quest Group - Group quest Heroic - Heroic quest PVP - PVP specific quest Raid - Raid quest nil - Standard quest
---@return number suggestedGroup For some group quests, the recommended number of group members for attempting the quest
---@return any isHeader 1 if the entry is a group header; nil if the entry is a quest
---@return any isCollapsed 1 if the entry is a collapsed header; otherwise nil
---@return any isComplete Whether the quest is complete ( number ) -1 - The quest was failed 1 - The quest was completed nil - The quest has yet to reach a conclusion
---@return any isDaily 1 if the quest is a daily quest; otherwise nil
---@return number questID The quest's questID.
function GetQuestLogTitle(questIndex) end

--- Returns the amount of money required to complete the quest presented by a questgiver. Usable following the QUEST_PROGRESS event in which it is determined whether the player can complete the quest.
---@return number money Amount of money required to complete the quest (in copper)
function GetQuestMoneyToGet() end

--- Returns the amount of time remaining until the daily quest period resets
---@return number time Amount of time remaining until the daily quest period resets (in seconds)
function GetQuestResetTime() end

--- Finishes turning in a quest to a questgiver, selecting an item reward if applicable. Usable following the QUEST_COMPLETE event in which the questgiver presents the player with rewards.
---@param choice number Index of a quest reward choice (between 1 and GetNumQuestChoices() ), or nil if the quest does not offer a choice of item rewards
function GetQuestReward(choice) end

--- Returns a hyperlink for a spell in a questgiver dialog. Only valid when the questgiver UI is showing the accept/decline, progress, or completion stages of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED , QUEST_PROGRESS and QUEST_FINISHED , or QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return empty values or those from the most recently displayed quest.
---@return string link A hyperlink for the spell or tradeskill recipe
function GetQuestSpellLink() end

--- Returns the text for the quest offered by a questgiver. Only valid when the questgiver UI is showing the accept/decline stage of a quest dialog (between the QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return the empty string or a value from the most recently displayed quest.
---@return string text The text for the currently displayed quest
function GetQuestText() end

--- Returns a list of the times remaining for any active timed quests
function GetQuestTimers() end

--- Gets a table containing the quests the player has completed. This function will only return data after QueryQuestsCompleted() has been called and the QUEST_QUERY_COMPLETE event has fired.  The keys in the returned table are the numeric questIds, with a value of true for each set key.
---@param questTbl table A table that will be wiped and filled with the quest data
---@return table completedQuests A hash table containing a list of the questIds the player has completed.
function GetQuestsCompleted(questTbl) end

--- Returns the amount of honor points awarded when completing a quest.
---@return number honor The honor points to be awarded
function GetRewardHonor() end

--- Returns the amount of money awarded when completing a quest.
---@return number money The amount of money to be awarded (in copper)
function GetRewardMoney() end

--- Returns information about a spell awarded when completing a quest. Only valid when the questgiver UI is showing the accept/decline or completion stages of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED events, or between the QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return zero or values from the most recently displayed quest.
---@return string texture Path to the spell's icon texture
---@return string name Name of the spell
---@return any isTradeskillSpell 1 if the spell is a tradeskill recipe; otherwise nil
---@return any isSpellLearned 1 if the reward teaches the player a new spell; otherwise nil
function GetRewardSpell() end

--- Returns the talent points awarded when completing a quest. Only valid when the questgiver UI is showing the accept/decline or completion stages of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED events, or between the QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return zero or a value from the most recently displayed quest.
---@return number talents The talent points to be awarded
function GetRewardTalents() end

--- Returns questgiver dialog to be displayed when completing a quest. Only valid when the questgiver UI is showing the completion stage of a quest dialog (between the QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return the empty string or a value from the most recently displayed quest.
---@return string text Text to be displayed for the quest completion dialog
function GetRewardText() end

--- Returns the title awarded when completing a quest.
---@return string title The title to be awarded, or nil if the quest does not reward a title
function GetRewardTitle() end

--- Returns the suggested group size for attempting the quest currently offered by a questgiver. Usable following the QUEST_DETAIL event in which the questgiver presents the player with the details of a quest and the option to accept or decline.
---@return number suggestedGroup Suggested group size for attempting the quest currently offered by a questgiver
function GetSuggestedGroupNum() end

--- Returns the title text for the quest presented by a questgiver. Only valid following the QUEST_DETAIL , QUEST_PROGRESS , or QUEST_COMPLETE events; otherwise may return nil or a value from the most recently displayed quest.
---@return string text Title text for the quest
function GetTitleText() end

--- Returns whether a quest which can be turned in to the current Quest NPC is trivial at the player's level. Only returns valid information after a QUEST_GREETING event. Used in the default UI to display "(low level)" when listing the quest.
---@param index number Index of a quest which can be turned in to the current Quest NPC (between 1 and GetNumActiveQuests() )
---@return any trivial 1 if the quest is trivial at the player's level; otherwise nil
function IsActiveQuestTrivial(index) end

--- Returns whether a quest available from the current Quest NPC is trivial at the player's level. Only returns valid information after a QUEST_GREETING event. Used in the default UI to display "(low level)" when listing the quest.
---@param index number Index of a quest available from the current Quest NPC (between 1 and GetNumAvailableQuests() )
---@return any trivial 1 if the quest is trivial at the player's level; otherwise nil
function IsAvailableQuestTrivial(index) end

--- Returns whether the player has failed the selected quest in the quest log
---@return any isFailed 1 if the player has failed the quest; otherwise nil
function IsCurrentQuestFailed() end

--- Returns whether the player can complete the quest presented by a questgiver
---@return any isCompletable 1 if the player currently meets the requirements (e.g. number of items collected) complete the quest; otherwise nil
function IsQuestCompletable() end

--- Checks if a specified unit is on a quest from the players quest log.
---@param index number The quest index to query.
---@param unit string The name of the unit to query.
---@return any state 1 if the unit is on that quest, nil otherwise
function IsUnitOnQuest(index, unit) end

--- Queries the server for the player's completed quest information. This function is throttled by the server and can currently only be called every 15 minutes.  This function will return immediately, and the QUEST_QUERY_COMPLETE will fire when the information is available from the server.  At that point, it can be obtained using the GetQuestsCompleted function.
--- Flags: server
function QueryQuestsCompleted() end

--- Causes the default UI to display an error message indicating that the player must choose a reward to complete the quest presented by a questgiver. Fires a UI_ERROR_MESSAGE event containing a localized message identified by the global variable ERR_QUEST_MUST_CHOOSE . Choose wisely.
function QuestChooseRewardError() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestGetAutoAccept() end

--- Shares a quest with other group members
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() ); if omitted, defaults to the selected quest
function QuestLogPushQuest(questIndex) end

--- Selects a quest which can be turned in to the current Quest NPC. Usable after a QUEST_GREETING event. Causes the QUEST_PROGRESS event to fire, in which it is determined whether the player can complete the quest.
---@param index number Index of a quest which can be turned in to the current Quest NPC (between 1 and GetNumActiveQuests() )
function SelectActiveQuest(index) end

--- Chooses a quest available from the current Quest NPC. Causes the QUEST_DETAIL event to fire, in which the questgiver presents the player with the details of a quest and the option to accept or decline.
---@param index number Index of a quest available from the current Quest NPC (between 1 and GetNumAvailableQuests() )
function SelectAvailableQuest(index) end

--- Selects a quest from the quest log. The selected quest is used by other functions which do not take a quest index as argument (e.g. GetQuestLogQuestText() ).
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
function SelectQuestLogEntry(questIndex) end

--- Begins the process of abandoning a quest in the player's quest log. To finish abandoning the quest, call AbandonQuest() .
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
function SetAbandonQuest(questIndex) end



--==============================
-- Raid functions
--==============================

--- Demotes the given player from raid assistant status
---@param unit string A unit in the raid
---@param name string Name of a unit in the raid
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function DemoteAssistant(unit, name, exactMatch) end

--- Returns the number of members in the player's raid
---@return number numRaidMembers Number of members in the raid (including the player)
function GetNumRaidMembers() end

--- Returns information about a member of the player's raid
---@param index number The index of the raid member
---@return string name The name of the player
---@return any rank The player's rank in the raid ( number ) Raid Assistant Raid Leader 0 - Raid Member
---@return number subgroup The raid subgroup that the player belongs to
---@return number level The player's level
---@return string class The localized name of the player's class
---@return any fileName The uppercase english name of the player's class ( string ) DRUID HUNTER MAGE PALADIN PRIEST ROGUE SHAMAN WARLOCK WARRIOR
---@return string zone The name of the zone the player is currently in
---@return any online 1 if the player is currently online, otherwise nil
---@return any isDead 1 if the player is currently dead, otherwise nil
---@return any role The player's role, or nil ( string ) MAINASSIST MAINTANK
---@return any isML 1 if the player is the master-looter, otherwise nil
function GetRaidRosterInfo(index) end

--- Returns the index of the selected unit in the raid roster. Selection in the raid roster is used only for display in the default UI and has no effect on other Raid APIs.
---@return number raidIndex Index of the raid member (between 1 and GetNumRaidMembers() ); matches the numeric part of the unit's raid unitID , e.g. 21 for raid21
function GetRaidRosterSelection() end

--- Returns the index of the raid target marker on a unit
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any index Index of a target marker ( number ) 1 - Star 2 - Circle 3 - Diamond 4 - Triangle 5 - Moon 6 - Square 7 - Cross 8 - Skull nil - No marker
function GetRaidTargetIndex(unit, name) end

--- Returns whether the player is the raid leader
---@return any isLeader 1 if the player is the raid leader; otherwise nil
function IsRaidLeader() end

--- Returns whether the player is a raid assistant
---@return boolean isRaidOfficer 1 if the player is a raid assistant; otherwise nil
function IsRaidOfficer() end

--- Promotes a raid member to raid assistant
---@param unit string A unit in the raid
---@param name string Name of a unit in the raid
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function PromoteToAssistant(unit, name, exactMatch) end

--- Selects a unit in the raid roster. Selection in the raid roster is used only for display in the default UI and has no effect on other Raid APIs.
---@param index number Index of the raid member (between 1 and GetNumRaidMembers() ); matches the numeric part of the unit's raid unitID , e.g. 21 for raid21
function SetRaidRosterSelection(index) end

--- Moves a raid member to a non-full raid subgroup. Only has effect if the player is the raid leader or a raid assistant. To put a member into a full subgroup (switching places with a member of that group), see SwapRaidSubgroup() .
---@param index number Index of the raid member (between 1 and GetNumRaidMembers() ); matches the numeric part of the unit's raid unitID , e.g. 21 for raid21
---@param subgroup number Index of a raid subgroup (between 1 and MAX_RAID_GROUPS )
function SetRaidSubgroup(index, subgroup) end

--- Puts a raid target marker on a unit
---@param unit string A unit to mark
---@param name string Name of a unit to mark
---@param index any Index of a target marker ( number ) 0 - Clear any raid target markers 1 - Star 2 - Circle 3 - Diamond 4 - Triangle 5 - Moon 6 - Square 7 - Cross 8 - Skull
function SetRaidTarget(unit, name, index) end

--- Swaps two raid members between subgroups in the raid. Only has effect if the player is the raid leader or a raid assistant. To move a member into a non-full subgroup without switching places with another member, see SetRaidSubgroup() .
---@param index1 number Index of the first raid member (between 1 and GetNumRaidMembers() ); matches the numeric part of the unit's raid unitID , e.g. 21 for raid21
---@param index2 number Index of the other raid member
function SwapRaidSubgroup(index1, index2) end

--- Returns whether a unit is in the player's raid
---@param unit string A unit to query
---@return number inRaid Index of the unit in the raid (matches the numeric part of the unit's raid unitID minus 1; e.g. returns 0 for raid1 , 12 for raid13 , etc)
function UnitInRaid(unit) end

--- Returns whether a unit is a raid assistant in the player's raid
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any leader 1 if the unit is a raid assistant; otherwise nil
function UnitIsRaidOfficer(unit, name) end

--- Returns whether a unit is in the player's raid or belongs to a raid member
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any inParty 1 if the unit is in the player's raid or is a pet belonging to a raid member; otherwise nil
function UnitPlayerOrPetInRaid(unit, name) end

--- Returns whether attempts to target a unit should target its vehicle. The unit can still be targeted: this flag is used to provide a convenience in the default UI for certain cases (such as the Malygos encounter) such that clicking a unit in the raid UI targets its vehicle (e.g. so players can use their drakes to heal other players' drakes).
---@param unit string A unit to query
---@return boolean targetVehicle True if clicking the unit's raid UI representation should target the unit's vehicle instead of the unit itself; otherwise false
function UnitTargetsVehicleInRaidUI(unit) end



--==============================
-- Recruit-a-friend functions
--==============================

--- Accepts a level offered by the player's Recruit-a-Friend partner
function AcceptLevelGrant() end

--- Returns whether the player can give levels to a Recruit-a-Friend partner
---@param unit string Unit to gift a level
---@return any canGrant 1 if the player can grant a level to the unit; otherwise nil
function CanGrantLevel(unit) end

--- Returns whether a unit can be summoned via Recruit-a-Friend. Indicates whether the target unit is currently summonable, not just whether that unit's account is linked to the player's via the Recruit-A-Friend program.
---@param name string Exact name of a player to summon
---@param unit string A unit to summon
---@return any canSummon 1 if the unit can be summoned, otherwise nil
function CanSummonFriend(name, unit) end

--- Refuses a level offered by the player's Recruit-a-Friend partner
function DeclineLevelGrant() end

--- Returns cooldown information about the player's Summon Friend ability
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the ability is ready
---@return number duration The length of the cooldown, or 0 if the ability is ready
function GetSummonFriendCooldown() end

--- Grants a level to the player's Recruit-a-Friend partner. Does not immediately cause the partner character to level up: that player is given a chance to accept or decline the offered level.
---@param unit string Unit to gift a level
function GrantLevel(unit) end

--- Returns whether a unit's account is linked to the player's via the Recruit-a-Friend program
---@param unit string A unit to query
---@return any isLinked 1 if the unit's account is linked to the player's
function IsReferAFriendLinked(unit) end

--- Summons a unit whose account is linked to the player's via the Recruit-a-Friend program. Does not instantly teleport the unit -- calling this function begins casting the Summon Friend "spell", and once it completes the unit is prompted to accept or decline the summon.
---@param name string Exact name of a player to summon (only applies to units in the player's party or raid)
---@param unit string A unit to summon
function SummonFriend(name, unit) end



--==============================
-- Secure execution utility functions
--==============================

--- Returns whether the user interface is protected due to combat. Non-Blizzard code is allowed to perform certain UI actions (such as changing secure template attributes or moving/showing/hiding secure frames) only if the player is not in combat; this function can be used to determine whether such actions are currently available.
---@return any inLockdown 1 if the user interface is protected due to combat; otherwise nil
function InCombatLockdown() end

--- Causes the current execution path to continue outside the secure environment. Meaningless when called from outside of the secure environment.
function forceinsecure() end

--- Add a function to be called after execution of a secure function. Allows one to "post-hook" a secure function without tainting the original.
---@param table table A table object that contains the function to be hooked
---@param function string The name of the function to be hooked
---@param hookfunc function The function to be called each time the original function is called
function hooksecurefunc(table, function, hookfunc) end

--- Returns whether the current execution path is secure. Meaningless when called from outside of the secure environment: always returns nil in such situations.
---@return any secure 1 if the current execution path is secure; otherwise nil
function issecure() end

--- Calls a function without tainting the execution path. Meaningless when called from outside of the secure environment.
---@param function function Function to be called
function securecall(function) end



--==============================
-- Skill functions
--==============================

--- Unlearns a skill (used only for professions)
--- Flags: confirmation
---@param index number Index of an entry in the skills list (between 1 and GetNumSkillLines() )
function AbandonSkill(index) end

--- Collapses a group header in the Skills UI
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/CollapseSkillHeader
function CollapseSkillHeader() end

--- Expands a group header in the Skills UI
---@param index number Index of an entry in the skills list (between 1 and GetNumSkillLines() )
function ExpandSkillHeader(index) end

--- This function no longer exists in the current version of World of Warcraft
---@return number numSkills Number of skills and headers to be displayed in the Skills UI
function GetNumSkillLines() end

--- Returns the index of the selected skill in the Skills UI
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetSelectedSkill
function GetSelectedSkill() end

--- Returns information about an entry in the Skills UI list
---@param index number The index of the skill line
---@return string skillName The name of the skill
---@return any header 1 if the skill line is a header, instead of a skill
---@return any isExpanded 1 if the skill line is a header and is expanded, otherwise nil
---@return number skillRank The rank of the skill
---@return number numTempPoints The temporary profession rank increase (for example 15 for engineering for Gnomes due to the racial trait)
---@return number skillModifier The temporary rank modifier due to buffs, equipment, etc. (for example +Defense gear and the Defense skill)
---@return number skillMaxRank The max rank available
---@return any isAbandonable 1 if the skill can be unlearnt, otherwise nil
---@return number stepCost Unused return value
---@return number rankCost Unused return value
---@return number minLevel The minimum level required to learn the skill
---@return number skillCostType Unused return value
---@return string skillDescription The description of the skill
function GetSkillLineInfo(index) end

--- Selects a skill in the Skills UI
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/SetSelectedSkill
function SetSelectedSkill() end



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



--==============================
-- Socketing functions
--==============================

--- Accepts changes made in the Item Socketing UI. Any gems added are permanently socketed into the item, and any existing gems replaced by new gems are destroyed.  This function only has effect while the Item Socketing UI is open (i.e. between the SOCKET_INFO_UPDATE and SOCKET_INFO_CLOSE events).
--- Flags: confirmation
function AcceptSockets() end

--- Ends interaction with the Item Socketing UI, discarding any changes made. Causes the SOCKET_INFO_CLOSE event to fire, indicating that Socket API functions may no longer have effects or return valid data.
function CloseSocketInfo() end

--- Returns information about a permanently socketed gem. If the given socket contains a permanently socketed gem, returns information for that gem (even if a new gem has been dropped in the socket to overwrite the existing gem, but has not yet been confirmed). If the socket is empty, returns nil .
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
---@return string name Name of the socketed gem
---@return string texture Path to an icon texture for the socketed gem
---@return any name 1 if the gem matches the socket's color; otherwise nil
function GetExistingSocketInfo(index) end

--- Returns information about a gem added to a socket. If the given socket contains a new gem (one that has been placed in the UI, but not yet confirmed for permanently socketing into the item), returns information for that gem. If the socket is empty or has a permanently socketed gem but no new gem, returns nil .
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
---@return string name Name of the gem added to the socket
---@return string texture Path to an icon texture for the gem added to the socket
---@return any matches 1 if the gem matches the socket's color; otherwise nil
function GetNewSocketInfo(index) end

--- Returns the number of sockets on the item currently being socketed. Only returns valid information when the Item Socketing UI is open (i.e. between the SOCKET_INFO_UPDATE and SOCKET_INFO_CLOSE events).
---@return number numSockets Number of sockets on the item
function GetNumSockets() end

--- Returns whether the item open for socketing is temporarily tradeable. A Bind on Pickup item looted by the player can be traded to other characters who were originally eligible to loot it, but only within a limited time after looting. This period can be ended prematurely if the player attempts certain actions (such as socketing gems into the item).
---@return any tradeable 1 if the item can temporarily be traded to other players; otherwise nil
function GetSocketItemBoundTradeable() end

--- Returns information about the item currently being socketed. Only returns valid information when the Item Socketing UI is open (i.e. between the SOCKET_INFO_UPDATE and SOCKET_INFO_CLOSE events).
---@return string name Name of the item
---@return string icon Path to an icon texture for the item
---@return number quality Quality level of the item
function GetSocketItemInfo() end

--- Returns whether the item open for socketing is temporarily refundable. Items bought with alternate currency (honor points, arena points, or special items such as Emblems of Heroism and Dalaran Cooking Awards) can be returned to a vendor for a full refund, but only within a limited time after the original purchase. This period can be ended prematurely if the player attempts certain actions (such as socketing gems into the item).
---@return any refundable 1 if the item can be returned to a vendor for a refund; otherwise nil
function GetSocketItemRefundable() end

--- Returns information about the gem types usable in a socket. Only returns valid information when the Item Socketing UI is open (i.e. between the SOCKET_INFO_UPDATE and SOCKET_INFO_CLOSE events).
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
---@return any gemColor Type of the gem socket ( string ) Blue - Accepts any gem, but requires a blue, green, purple or prismatic gem to activate the item's socket bonus Meta - Accepts only meta gems Red - Accepts any gem, but requires a red, purple, orange or prismatic gem to activate the item's socket bonus Socket - Accepts any gem Yellow - Accepts any gem, but requires a yellow, orange, green or prismatic gem to activate the item's socket bonus
function GetSocketTypes(index) end



--==============================
-- Sound functions
--==============================

--- Plays an audio file as background music. Any other background music that is currently playing will be faded out as the new music begins; if the Sound_ZoneMusicNoDelay is set, music will loop continuously until StopMusic() is called.
---@param musicfile string Path to a music file
function PlayMusic(musicfile) end

--- Plays one of WoW's built-in sound effects. Only supports sounds found in the Sound\Interface directory within WoW's MPQ files; to play other built-in sounds or sounds in an addon directory, use PlaySoundFile() .
---@param sound string Name of a built-in sound effect
function PlaySound(sound) end

--- Plays an audio file at a given path. For a shorter way to specify one of WoW's built-in UI sound effects, see PlaySound() .
---@param soundFile string A path to the sound file to be played
function PlaySoundFile(soundFile) end

--- Returns the name of the given chat system sound input driver
---@param index number The desired index
function Sound_ChatSystem_GetInputDriverNameByIndex(index) end

--- Returns the number of chat system sound input drivers
function Sound_ChatSystem_GetNumInputDrivers() end

--- Returns the number of chat system sound output drivers
function Sound_ChatSystem_GetNumOutputDrivers() end

--- Returns the name of the given chat system sound output driver
---@param index number The desired index
function Sound_ChatSystem_GetOutputDriverNameByIndex(index) end

--- Returns the name of the given game sound input driver
---@param index number The desired index
function Sound_GameSystem_GetInputDriverNameByIndex(index) end

--- Returns the number of game sound input drivers
function Sound_GameSystem_GetNumInputDrivers() end

--- Returns the number of game sound output drivers
function Sound_GameSystem_GetNumOutputDrivers() end

--- Returns the name of the given game sound output driver
---@param index number The desired index
function Sound_GameSystem_GetOutputDriverNameByIndex(index) end

--- Restarts the game's sound systems
function Sound_GameSystem_RestartSoundSystem() end

--- Stops currently playing in-game music
function StopMusic() end

--- Returns the name of an audio input device for voice chat
---@param deviceIndex number Index of the device (between 1 and Sound_ChatSystem_GetNumInputDrivers() )
---@return string deviceName Name of the device
function VoiceEnumerateCaptureDevices(deviceIndex) end

--- Returns the name of an audio output device for voice chat
---@param deviceIndex number Index of the device (between 1 and Sound_ChatSystem_GetNumOutputDrivers() )
---@return string device Name of the device
function VoiceEnumerateOutputDevices(deviceIndex) end

--- Returns the index of the current voice capture device
---@return number index Index of the current voice capture device (between 1 and Sound_ChatSystem_GetNumInputDrivers() )
function VoiceGetCurrentCaptureDevice() end

--- Returns the index of the current voice output device
---@return number index Index of the current voice output device (between 1 and Sound_ChatSystem_GetNumOutputDrivers() )
function VoiceGetCurrentOutputDevice() end

--- Selects an audio input device for voice chat
---@param deviceName string Name of an audio input device, as returned from VoiceEnumerateCaptureDevices()
function VoiceSelectCaptureDevice(deviceName) end

--- Selects an audio output device for voice chat
---@param deviceName string Name of an audio output device, as returned from VoiceEnumerateOutputDevices()
function VoiceSelectOutputDevice(deviceName) end



--==============================
-- Spell functions
--==============================

--- Casts a from the spellbook. Only protected (i.e. usable only by the Blizzard UI) if the given id corresponds to a spell which can be cast (not a passive spell) and is not a trade skill; can be used by addons to cast the "spells" that open trade skill windows.
--- Flags: protected
---@param id number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
function CastSpell(id, bookType) end

--- Casts a spell specified by id (optionally on a specified unit). Only protected (i.e. usable only by the Blizzard UI) if the given spell is castable (not passive) and is not a trade skill; can be used by addons to cast the "spells" that open trade skill windows.
--- Flags: protected
---@param spellID number ID of the spell to cast
---@param target string A unit to target with the spell
function CastSpellByID(spellID, target) end

--- Casts a spell specified by name (optionally on a specified unit). Only protected (i.e. usable only by the Blizzard UI) if the given spell is castable (not passive) and is not a trade skill; can be used by addons to cast the "spells" that open trade skill windows.
--- Flags: protected
---@param name string Name of a spell to cast
---@param target string A unit to target with the spell
function CastSpellByName(name, target) end

--- Returns the spellbook slot for the player's highest known rank of a spell
---@param slot number Spellbook slot index of a known spell
---@return number maxRankSlot Spellbook slot index of the highest rank of that spell known to the player
function GetKnownSlotFromHighestRankSlot(slot) end

--- Returns the number of tabs in the player's spellbook
---@return number numTabs Number of spellbook tabs
function GetNumSpellTabs() end

--- Returns information about automatic casting for a spell in the spellbook. Generally, only certain pet spells can be autocast.
---@param id number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@return any autocastAllowed 1 if automatic casting is allowed for the action; otherwise nil
---@return any autocastEnabled 1 if automatic casting is currently turned on for the action; otherwise nil
function GetSpellAutocast(id, bookType) end

--- Returns cooldown information about a spell in the spellbook
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@param id number Numeric ID of a spell
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the spell is ready
---@return number duration The length of the cooldown, or 0 if the spell is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the spell is ready.)
function GetSpellCooldown(index, bookType, name, id) end

--- Returns the number of times a spell can be cast. Generally used for spells whose casting is limited by the number of item reagents in the player's possession.
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return number numCasts Number of times the spell can be cast, or 0 if unlimited
function GetSpellCount(index, bookType, name) end

--- Returns information about a spell
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell, optionally including secondary text (e.g. "Mana Burn" to find the player's highest rank, or "Mana Burn(Rank 2)" -- no space before the parenthesis -- for a specific rank)
---@param id number Numeric ID of a spell
---@return string name Name of the spell
---@return string rank Secondary text associated with the spell (e.g."Rank 5", "Racial", etc.)
---@return string icon Path to an icon texture for the spell
---@return number powerCost Amount of mana, rage, energy, runic power, or focus required to cast the spell
---@return boolean isFunnel True for spells with health funneling effects (like Health Funnel)
---@return any powerType Power type to cast the spell ( number ) -2 - Health 0 - Mana 1 - Rage 2 - Focus 3 - Energy 5 - Runes 6 - Runic Power
---@return number castingTime Casting time of the spell in milliseconds
---@return number minRange Minimum range from the target required to cast the spell
---@return number maxRange Maximum range from the target at which you can cast the spell
function GetSpellInfo(index, bookType, name, id) end

--- This function or event no longer exists in version 6.0.2 (19034) of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param id number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@return string spellName Localized name of the spell
---@return string subSpellName Secondary text associated with the spell (e.g. "Rank 5", "Racial Passive",  "Artisan")
function GetSpellName(id, bookType) end

--- Returns information about a tab in the spellbook
---@param index number Index of a spellbook tab (between 1 and GetNumSpellTabs() )
---@return string name Name of the spellbook tab
---@return string texture Path to an icon texture for the spellbook tab
---@return number offset spellbookID of the first spell to be listed under the tab
---@return number numSpells Number of spells listed under the tab
function GetSpellTabInfo(index) end

--- Returns the icon texture path for a spell
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return string texture Path to an icon texture for the spell
function GetSpellTexture(index, bookType, name) end

--- Returns whether a spell is the standard melee Attack spell
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isAttack 1 if the spell enables/disables melee auto-attack; otherwise nil
function IsAttackSpell(index, bookType, name) end

--- Returns whether a spell is an automatically repeating spell
---@param spellName string The name of the spell to query
---@return any isAutoRepeat If the spell is an auto-repeating spell
function IsAutoRepeatSpell(spellName) end

--- Returns whether casting a spell consumes a reagent item
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isConsumable 1 if casting the spell consumes a reagent item; otherwise nil
function IsConsumableSpell(index, bookType, name) end

--- Returns whether a spell is currently being used
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isCurrent 1 if the spell is currently being cast, is waiting for the user to choose a target, is a repeating spell which is currently repeating, or is the open trade skill; otherwise nil
function IsCurrentSpell(index, bookType, name) end

--- Returns whether a spell can be used against hostile units
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isHarmful 1 if the spell can be used against hostile units; otherwise nil
function IsHarmfulSpell(index, bookType, name) end

--- Returns whether an item can be used on the player or friendly units
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isHarmful 1 if the spell can be used on the player or friendly units; otherwise nil
function IsHelpfulSpell(index, bookType, name) end

--- Returns whether a spell is passive (cannot be cast)
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isPassive 1 if the spell is passive; otherwise nil
function IsPassiveSpell(index, bookType, name) end

--- Returns whether a spell is currently selected in the spellbook
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/IsSelectedSpell
function IsSelectedSpell() end

--- Returns whether the player is in range to cast a spell on a unit
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@param unit string A unit to target with the spell
---@return any inRange 1 if the player is near enough to cast the spell on the unit; 0 if not in range; nil if the unit is not a valid target for the spell
function IsSpellInRange(index, bookType, name, unit) end

--- Returns whether the player (or pet) knows a spell
---@param spellID number Numeric ID of a spell
---@param isPet boolean True to check only spells known to the player's pet; false or omitted to check only spells known to the player
---@return boolean isKnown True if the player (or pet) knows the given spell; false otherwise
function IsSpellKnown(spellID, isPet) end

--- Returns whether or not a given spell is usable or cannot be used due to lack of mana. Does not account for spell cooldowns (see GetSpellCooldown() -- returns 1 if other conditions allow for casting the spell (e.g. if the spell can only be cast while outdoors).
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isUsable 1 if the spell is castable; otherwise nil
---@return any notEnoughMana 1 if the player lacks the resources (e.g. mana, energy, runes) to cast the spell; otherwise nil
function IsUsableSpell(index, bookType, name) end

--- Returns whether the spell currently awaiting a target can target a given unit. Only applies when the player has attempted to cast a spell but the spell requires a target before it can begin casting (i.e. the glowing hand cursor is showing).
---@param unit string A unit to target
---@param name string The name of a unit to target; only valid for player , pet , and party/raid members
---@return any canTarget 1 if the spell currently awaiting targeting can target the given unit
function SpellCanTargetUnit(unit, name) end

--- Returns whether an item has a range limitation for its use. For example: Shadowbolt can only be used on a unit within a given range of the player; Ritual of Summoning requires a target but has no range restriction; Fel Armor has no target and thus no range restriction.
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any hasRange 1 if the spell has an effective range; otherwise nil.
function SpellHasRange(index, bookType, name) end

--- Returns whether a spell is currently awaiting a target
---@return any isTargeting 1 if a spell is currently awaiting a target; otherwise nil
function SpellIsTargeting() end

--- Stops casting or targeting the spell in progress
--- Flags: protected
function SpellStopCasting() end

--- Cancels the spell currently awaiting a target. When auto-self cast is not enabled and the player casts a spell that requires a target, the cursor changes to a glowing hand so the user can select a target. This function cancels targeting mode so the player can cast another spell.
--- Flags: protected
function SpellStopTargeting() end

--- Casts the spell currently awaiting a target on a unit
--- Flags: protected
---@param unit string A unit to target
---@param name string The name of a unit to target; only valid for player , pet , and party/raid members
function SpellTargetUnit(unit, name) end

--- Enables or disables automatic casting of a spell. Generally only pet spells can be autocast.
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
function ToggleSpellAutocast(index, bookType, name) end

--- Returns information about the spell a unit is currently casting
---@param unit string A unit to query
---@return string name Name of the spell being cast
---@return string subText Secondary text associated with the spell (e.g."Rank 5", "Racial", etc.)
---@return string text Text to be displayed on a casting bar
---@return string texture Path to an icon texture for the spell
---@return number startTime Time at which the cast was started (in milliseconds; can be compared to GetTime() * 1000 )
---@return number endTime Time at which the cast will finish (in milliseconds; can be compared to GetTime() * 1000 )
---@return any isTradeSkill 1 if the spell being cast is a trade skill recipe; otherwise nil
---@return number castID Reference number for this spell; matches the 4th argument of UNIT_SPELLCAST_* events for the same spellcast
---@return any notInterruptible 1 if the spell can be interrupted; otherwise nil. See the UNIT_SPELLCAST_NOT_INTERRUPTIBLE and UNIT_SPELLCAST_INTERRUPTIBLE events for changes to this status.
function UnitCastingInfo(unit) end

--- Returns information about the spell a unit is currently channeling
---@param unit string A unit to query
---@return string name Name of the spell being cast
---@return string subText Secondary text associated with the spell (e.g."Rank 5", "Racial", etc.)
---@return string text Text to be displayed on a casting bar
---@return string texture Path to an icon texture for the spell
---@return number startTime Time at which the cast was started (in milliseconds; can be compared to GetTime() * 1000 )
---@return number endTime Time at which the cast will finish (in milliseconds; can be compared to GetTime() * 1000 )
---@return any isTradeSkill 1 if the spell being cast is a trade skill recipe; otherwise nil
---@return boolean notInterruptible Indicates that the spell cannot be interrupted, UNIT_SPELLCAST_NOT_INTERRUPTIBLE and UNIT_SPELLCAST_INTERRUPTIBLE are fired to indicate changes in the interruptible status.
function UnitChannelInfo(unit) end

--- Requests spellbook information from the server server
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/UpdateSpells
function UpdateSpells() end



--==============================
-- Stance/Shapeshift functions
--==============================

--- Casts an ability on the stance/shapeshift bar
--- Flags: protected
---@param index number Index of an ability on the stance/shapeshift bar (between 1 and GetNumShapeshiftForms() )
function CastShapeshiftForm(index) end

--- Returns the number of abilities to be presented on the stance/shapeshift bar
---@return number numForms Number of abilities to be presented on the stance/shapeshift bar
function GetNumShapeshiftForms() end

--- Returns the index of the active ability on the stance/shapeshift bar
---@return number index Index of the active ability on the stance/shapeshift bar (between 1 and GetNumShapeshiftForms() )
function GetShapeshiftForm() end

--- Returns cooldown information about an ability on the stance/shapeshift bar
---@param index number Index of an ability on the stance/shapeshift bar (between 1 and GetNumShapeshiftForms() )
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the ability is ready
---@return number duration The length of the cooldown, or 0 if the ability is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the ability is ready.)
function GetShapeshiftFormCooldown(index) end

--- Returns information about a shapeshift form
---@param index number The index of a shapeshift form
---@return string texture The path to the shapeshift form's icon texture
---@return string name The name of the shapeshift form
---@return any isActive 1 if the shapeshift form is currently active, otherwise nil
---@return any isCastable 1 if the shapeshift form is currently castable, otherwise nil
function GetShapeshiftFormInfo(index) end



--==============================
-- Stat information functions
--==============================

--- Returns the percentage of enemy armor ignored due to the player's Armor Penetration Rating
---@return number amount Percentage of enemy armor ignored due to the player's Armor Penetration Rating
function GetArmorPenetration() end

--- Returns the attack power bonus provided by one of the player's basic statistics
---@param statIndex any Index of a basic statistic ( number ) 1 - Strength 2 - Agility 3 - Stamina 4 - Intellect 5 - Spirit
---@param effectiveStat number Value of the statistic to use in attack power calculation
---@return number attackPower Attack power bonus provided to the player by the basic statistic value
function GetAttackPowerForStat(statIndex, effectiveStat) end

--- Returns the player's percentage chance to block with a shield
---@return number chance Percentage chance to block
function GetBlockChance() end

--- Returns the value of a combat rating for the player
---@param ratingIndex any Index of a rating; the following global constants are provided for convenience ( number ) CR_BLOCK - Block skill CR_CRIT_MELEE - Melee critical strike chance CR_CRIT_RANGED - Ranged critical strike chance CR_CRIT_SPELL - Spell critical strike chance CR_CRIT_TAKEN_MELEE - Melee Resilience CR_CRIT_TAKEN_RANGED - Ranged Resilience CR_CRIT_TAKEN_SPELL - Spell Resilience CR_DEFENSE_SKILL - Defense skill CR_DODGE - Dodge skill CR_HASTE_MELEE - Melee haste CR_HASTE_RANGED - Ranged haste CR_HASTE_SPELL - Spell haste CR_HIT_MELEE - Melee chance to hit CR_HIT_RANGED - Ranged chance to hit CR_HIT_SPELL - Spell chance to hit CR_HIT_TAKEN_MELEE - Unused CR_HIT_TAKEN_RANGED - Unused CR_HIT_TAKEN_SPELL - Unused CR_PARRY - Parry skill CR_WEAPON_SKILL - Weapon skill CR_WEAPON_SKILL_MAINHAND - Main-hand weapon skill CR_WEAPON_SKILL_OFFHAND - Offhand weapon skill CR_WEAPON_SKILL_RANGED - Ranged weapon skill
---@return number rating Value of the rating for the player
function GetCombatRating(ratingIndex) end

--- Returns the percentage effect for the player's current value of a given combat rating. Used in the default UI to show tooltips with actual percentage effects (such as increased parry chance or reduced critical strike damage taken) when mousing over rating information in the Character window.
---@param ratingIndex any Index of a rating; the following global constants are provided for convenience ( number ) CR_BLOCK - Block skill CR_CRIT_MELEE - Melee critical strike chance CR_CRIT_RANGED - Ranged critical strike chance CR_CRIT_SPELL - Spell critical strike chance CR_CRIT_TAKEN_MELEE - Melee Resilience CR_CRIT_TAKEN_RANGED - Ranged Resilience CR_CRIT_TAKEN_SPELL - Spell Resilience CR_DEFENSE_SKILL - Defense skill CR_DODGE - Dodge skill CR_HASTE_MELEE - Melee haste CR_HASTE_RANGED - Ranged haste CR_HASTE_SPELL - Spell haste CR_HIT_MELEE - Melee chance to hit CR_HIT_RANGED - Ranged chance to hit CR_HIT_SPELL - Spell chance to hit CR_HIT_TAKEN_MELEE - Unused CR_HIT_TAKEN_RANGED - Unused CR_HIT_TAKEN_SPELL - Unused CR_PARRY - Parry skill CR_WEAPON_SKILL - Weapon skill CR_WEAPON_SKILL_MAINHAND - Main-hand weapon skill CR_WEAPON_SKILL_OFFHAND - Offhand weapon skill CR_WEAPON_SKILL_RANGED - Ranged weapon skill
---@return number ratingBonus Percentage change in the underlying statistic or mechanic conferred by the player's rating value
function GetCombatRatingBonus(ratingIndex) end

--- Returns the player's melee critical strike chance
---@return number critChance The player's percentage critical strike chance for melee attacks
function GetCritChance() end

--- Returns additional critical strike chance provided by Agility
---@param unit string A unit to query; only valid for player and pet , defaults to player if omitted
---@return number critChance Additional percentage chance of critical strikes conferred by the unit's Agility statistic
function GetCritChanceFromAgility(unit) end

--- This function or event no longer exists in version 6.0.2 (19034) of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@return any bonusStat Index of the basic statistic which provides attack  ( number ) 1 - Strength (Druids, Mages, Paladins, Priests, Shamans, Warlocks and Warriors) 2 - Agility
function GetDamageBonusStat() end

--- Returns the player's chance to dodge melee attacks
---@return number chance Percentage chance to dodge melee attacks
function GetDodgeChance() end

--- Returns the player's current expertise value
---@return number expertise The player's expertise value
function GetExpertise() end

--- Returns the reduction in chance to be dodged or parried conferred by the player's expertise value
---@return number expertisePerc Reduction in percentage chance for main hand attacks to be dodged or parried
---@return number offhandExpertisePercent Reduction in percentage chance for off hand attacks to be dodged or parried
function GetExpertisePercent() end

--- Returns information about the player's mana regeneration rate
---@return number base Amount of mana regenerated per second while not casting
---@return number casting Amount of mana regenerated per second while casting
function GetManaRegen() end

--- Returns the maximum possible percentage bonus for a given combat rating.
---@param ratingIndex any Which rating to query; the following global constants can be used for standard values: ( number ) CR_BLOCK - Block skill CR_CRIT_MELEE - Melee critical strike chance CR_CRIT_RANGED - Ranged critical strike chance CR_CRIT_SPELL - Spell critical strike chance CR_CRIT_TAKEN_MELEE - Resilience (as applied to melee attacks) CR_CRIT_TAKEN_RANGED - Resilience (as applied to ranged attacks) CR_CRIT_TAKEN_SPELL - Resilience (as applied to spell effects CR_DEFENSE_SKILL - Defense skill CR_DODGE - Dodge skill CR_HASTE_MELEE - Melee haste CR_HASTE_RANGED - Ranged haste CR_HASTE_SPELL - Spell haste CR_HIT_MELEE - Melee chance to hit CR_HIT_RANGED - Ranged chance to hit CR_HIT_SPELL - Spell chance to hit CR_HIT_TAKEN_MELEE - Unused CR_HIT_TAKEN_RANGED - Unused CR_HIT_TAKEN_SPELL - Unused CR_PARRY - Parry skill CR_WEAPON_SKILL - Weapon skill CR_WEAPON_SKILL_MAINHAND - Main-hand weapon skill CR_WEAPON_SKILL_OFFHAND - Offhand weapon skill CR_WEAPON_SKILL_RANGED - Ranged weapon skill
---@return number max The maximum possible percentage bonus for the given rating
function GetMaxCombatRatingBonus(ratingIndex) end

--- Returns the player's parry chance
---@return number chance The player's percentage chance to parry melee attacks
function GetParryChance() end

--- Returns information about the player's mana/energy/etc regeneration rate. Contexts for inactiveRegen and activeRegen vary by power type.
---@return number inactiveRegen Power change per second while inactive
---@return number activeRegen Power change per second while active
function GetPowerRegen() end

--- Returns the player's ranged critical strike chance
---@return number critChance The player's percentage critical strike chance for ranged attacks
function GetRangedCritChance() end

--- Returns the amount of damage prevented when the player blocks with a shield
---@return number damage The amount of damage prevented when the player blocks with a shield
function GetShieldBlock() end

--- Returns the player's spell damage bonus for a spell school
---@param school any Index of a spell school ( number ) 1 - Physical 2 - Holy 3 - Fire 4 - Nature 5 - Frost 6 - Shadow 7 - Arcane
---@return number minModifier The player's spell damage bonus for the given school
function GetSpellBonusDamage(school) end

--- Returns the player's amount of bonus healing
---@return number bonusHealing Amount of bonus healing
function GetSpellBonusHealing() end

--- Returns the player's spell critical strike chance for a spell school
---@param school any Index of a spell school ( number ) 1 - Physical 2 - Holy 3 - Fire 4 - Nature 5 - Frost 6 - Shadow 7 - Arcane
---@return number minCrit The player's percentage critical strike chance for spells from the given school
function GetSpellCritChance(school) end

--- Returns additional spell critical strike chance provided by Intellect
---@param unit string A unit to query; only valid for player and pet , defaults to player if omitted
---@return number critChance Additional percentage chance of spell critical strikes conferred by the unit's Intellect statistic
function GetSpellCritChanceFromIntellect(unit) end

--- Returns the amount of enemy magic resistance ignored due to the player's Spell Penetration Rating
---@return number penetration Amount of enemy magic resistance ignored due to the player's Spell Penetration Rating
function GetSpellPenetration() end

--- Returns the health modifier for the player's pet
---@param unit string A unit to query; only valid for pet
---@return number modifier Factor modifying the unit's health value
function GetUnitHealthModifier(unit) end

--- This function or event no longer exists in version 6.0.2 (19034) of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param unit string A unit to query; only valid for player or pet
---@return number regen Increase in non-combat health regeneration per second provided by Spirit
function GetUnitHealthRegenRateFromSpirit(unit) end

--- Returns the increase in mana regeneration rate provided by Spirit
---@param unit string A unit to query; only valid for player or pet
---@return number regen Increase in inactive (non-casting) mana regeneration per second provided by Spirit
function GetUnitManaRegenRateFromSpirit(unit) end

--- Returns the maximum health modifier for the player's pet
---@param unit string A unit to query; only valid for pet
---@return number modifier Factor modifying the unit's maximum health value
function GetUnitMaxHealthModifier(unit) end

--- Returns the mana modifier for the player's pet
---@param unit string A unit to query; only valid for pet
---@return number modifier Factor modifying the unit's mana value
function GetUnitPowerModifier(unit) end

--- Returns the player's or pet's armor value
---@param unit string A unit to query; only valid for player or pet
---@return number base The unit's base armor value
---@return number effectiveArmor The unit's effective armor value
---@return number armor The unit's current armor value
---@return number posBuff Positive modifiers to armor value
---@return number negBuff Negative modifiers to armor value
function UnitArmor(unit) end

--- Returns information about the player's or pet's weapon skill
---@param unit string A unit to query; only valid for player or pet
---@return number mainHandAttackBase The unit's base weapon skill for the main hand weapon
---@return number mainHandAttackMod Temporary modifiers to main hand weapon skill
---@return number offHandHandAttackBase The unit's base weapon skill for the off hand weapon
---@return number offHandAttackMod Temporary modifiers to off hand weapon skill
function UnitAttackBothHands(unit) end

--- Returns the player's or pet's melee attack power
---@param unit string A unit to query; only valid for player or pet
---@return number base The unit's ase attack power
---@return number posBuff Total effect of positive buffs to attack power
---@return number negBuff Total effect of negative buffs to attack power
function UnitAttackPower(unit) end

--- Returns information about the unit's melee attack speed
---@param unit string A unit to query
---@return number speed Current speed of the unit's main hand attack (number of seconds per attack)
---@return number offhandSpeed Current speed of the unit's off hand attack (number of seconds per attack)
function UnitAttackSpeed(unit) end

--- Returns information about the player's or pet's melee attack damage
---@param unit string A unit to query; only valid for player or pet
---@return number minDamage The unit's minimum melee damage
---@return number maxDamage The unit's maximum melee damage
---@return number minOffHandDamage The unit's minimum offhand melee damage
---@return number maxOffHandDamage The unit's maximum offhand melee damage
---@return number physicalBonusPos Positive physical bonus (should be >= 0)
---@return number physicalBonusNeg Negative physical bonus (should be <= 0)
---@return number percent Factor by which damage output is multiplied due to buffs/debuffs
function UnitDamage(unit) end

--- Returns the player's or pet's Defense skill
---@param unit string A unit to query; only valid for player or pet
---@return number base The unit's base defense skill
---@return number modifier Temporary modifiers to defense skill
function UnitDefense(unit) end

--- Returns information about the player's or pet's ranged weapon skill
---@param unit string A unit to query; only valid for player or pet
---@return number rangedAttackBase The unit's base ranged weapon skill
---@return number rangedAttackMod Temporary modifiers to ranged weapon skill
function UnitRangedAttack(unit) end

--- Returns the player's or pet's ranged attack power
---@param unit string A unit to query; only valid for player or pet
---@return number base Base ranged attack power
---@return number posBuff Positive buffs to ranged attack power
---@return number negBuff Negative buffs to ranged attack power
function UnitRangedAttackPower(unit) end

--- Returns information about the player's or pet's ranged attack damage and speed
---@param unit string A unit to query; only valid for player or pet
---@return number rangedAttackSpeed Current speed of the unit's ranged attack (attacks per second), or 0 if no ranged weapon is equipped
---@return number minDamage The minimum base damage per attack
---@return number maxDamage The maximum base damage per attack
---@return number physicalBonusPos Positive modifiers to ranged weapon damage
---@return number physicalBonusNeg Negative modifiers to ranged weapon damage
---@return number percent Factor by which damage output is multiplied due to buffs/debuffs
function UnitRangedDamage(unit) end

--- Returns information about the player's or pet's magic resistance
---@param unit string A unit to query; only valid for player or pet
---@param resistanceIndex any Index of a magic resistance type ( number ) 1 - Fire 2 - Nature 3 - Frost 4 - Shadow 5 - Arcane
---@return number base Base resistance value (generally 0)
---@return number resistance Current resistance value (including modifiers
---@return number positive Positive resistance modifiers
---@return number negative Negative resistance modifiers
function UnitResistance(unit, resistanceIndex) end

--- Returns information about a basic character statistic for the player or pet
---@param unit string A unit to query; only valid for player or pet
---@param statIndex any Index of a basic statistic ( number ) 1 - Strength 2 - Agility 3 - Stamina 4 - Intellect 5 - Spirit
---@return number stat Current value of the statistic
---@return number effectiveStat Effective value of the statistic
---@return number posBuff Positive modifiers to the statistic
---@return number negBuff Negative modifiers to the statistic
function UnitStat(unit, statIndex) end



--==============================
-- Summoning functions
--==============================

--- Declines an offered summons. Usable between when the CONFIRM_SUMMON event fires (due to a summoning spell cast by another player) and when the value returned by GetSummonConfirmTimeLeft() reaches zero.
function CancelSummon() end

--- Accepts an offered summons, teleporting the player to the summoner's location. Usable between when the CONFIRM_SUMMON event fires (due to a summoning spell cast by another player) and when the value returned by GetSummonConfirmTimeLeft() reaches zero.
function ConfirmSummon() end

--- Returns the destination area of an offered summons. The name returned is generally that of the subzone in which the summoner performed the spell.
---@return string area Name of the location to which the player will be teleported upon accepting the summons
function GetSummonConfirmAreaName() end

--- Returns the name of the unit offering a summons to the player. Usable between when the CONFIRM_SUMMON event fires (due to a summoning spell cast by another player) and when the value returned by GetSummonConfirmTimeLeft() reaches zero.
---@return string text Name of the summoning unit
function GetSummonConfirmSummoner() end

--- Returns the amount of time remaining before an offered summons expires. Returns 0 if no summons is currently available.
---@return number timeleft Time remaining until the offered summons can no longer be accepted (in seconds)
function GetSummonConfirmTimeLeft() end

--- Returns whether the player can accept a summons
---@return boolean amount True if the player is currently allowed to accept a summons
function PlayerCanTeleport() end



--==============================
-- Talent functions
--==============================

--- Spends (or unspends) talent points in the Talent UI's preview mode
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param talentIndex number Index of a talent option (between 1 and GetNumTalents() )
---@param points number Number of points to spend on the talent, or a negative number to unspend points. Values larger than allowed for the talent will be clipped to the maximum value (e.g. attempting to spend ten points on a talent that has five ranks will only spend up to five points).
---@param isPet boolean True to edit talents for the player's pet, false to edit talents for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
function AddPreviewTalentPoints(tabIndex, talentIndex, points, isPet, talentGroup) end

--- Returns whether the player is in range of an NPC that can reset talents. Usable following the CONFIRM_TALENT_WIPE event which fires when the player speaks to an trainer NPC and chooses to reset his or her talents. Used in the default UI to hide the confirmation window for such if the player moves too far away from the NPC.
---@return any inRange 1 if the player is in range of a talent trainer; otherwise nil
function CheckTalentMasterDist() end

--- Resets the player's talents. Usable following the CONFIRM_TALENT_WIPE event which fires when the player speaks to an trainer NPC and chooses to reset his or her talents.
--- Flags: confirmation
function ConfirmTalentWipe() end

--- Returns the index of the active talent specialization
---@param isInspect boolean true to query talent info for the currently inspected unit, false to query talent info for the player
---@param isPet boolean true to query talent info for the player's pet, false to query talent info for the player
---@return any activeTalentGroup Which talent group is currently active ( number ) 1 - Primary Talents 2 - Secondary Talents
function GetActiveTalentGroup(isInspect, isPet) end

--- Returns the total number of points spent in the Talent UI's preview mode.
---@param isPet boolean true to query talent info for the player's pet, false to query talent info for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return number pointsSpent Number of points spent in preview mode
function GetGroupPreviewTalentPointsSpent(isPet, talentGroup) end

--- Returns the number of talent specs a character can switch among
---@param isInspect boolean true to query talent info for the currently inspected unit, false to query talent info for the player
---@param isPet boolean true to query talent info for the player's pet, false to query talent info for the player
---@return any numTalentGroups Number of talent groups the character has enabled ( number ) 1 - Default 2 - The character has purchased Dual Talent Specialization
function GetNumTalentGroups(isInspect, isPet) end

--- Returns the number of talent tabs for the player, pet, or inspect target
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@return number numTabs Number of talent tabs
function GetNumTalentTabs(inspect, pet) end

--- Returns the number of options in a talent tab
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@return number numTalents Number of different talent options
function GetNumTalents(tabIndex, inspect, pet) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetPreviewTalentPointsSpent() end

--- Returns information about a talent option
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param talentIndex number Index of a talent option (between 1 and GetNumTalents() )
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return string name Name of the talent
---@return string iconTexture The icon texture of the talent.
---@return number tier Row in which the talent should be displayed (1 = top)
---@return number column Column in which the talent should be displayed (1 = left)
---@return number rank Number of points spent in the talent
---@return number maxRank Maximum number of points that can be spent in the talent
---@return any isExceptional 1 if the talent confers a new ability (spell); otherwise nil
---@return any meetsPrereq 1 if the prerequisites to learning the talent have been met; otherwise nil
---@return number previewRank Number of points spent in the talent in preview mode
---@return any meetsPreviewPrereq 1 if the prerequisites to learning the talent have been met in preview mode; otherwise nil
function GetTalentInfo(tabIndex, talentIndex, inspect, pet, talentGroup) end

--- Returns information about prerequisites to learning a talent
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param talentIndex number Index of a talent option (between 1 and GetNumTalents() )
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return number tier Row in which the talent's prerequisite is displayed (1 = top)
---@return number column Column in which the talent's prerequisite is displayed (1 = left)
---@return any isLearnable 1 if the talent is learnable; otherwise nil
---@return any isPreviewLearnable 1 if the talent is learnable in preview mode; otherwise nil
function GetTalentPrereqs(tabIndex, talentIndex, inspect, pet, talentGroup) end

--- Returns information about a talent tab
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return number id ID of the talent tab
---@return string name Name of the talent tab
---@return string description Localized summary of the talent tab
---@return string icon Path to an icon texture for the talent tab
---@return number points Number of points spent in the talent tab
---@return string background Path to a background texture for the talent tab
---@return number previewPoints Number of points spent in the talent tab in preview mode
---@return boolean isUnlocked Whether the player can put points into the talent tab or not
function GetTalentTabInfo(tabIndex, inspect, pet, talentGroup) end

--- Returns the number of unused talent points
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return number points Number of points available for spending
function GetUnspentTalentPoints(inspect, pet, talentGroup) end

--- Commits changes made in the Talent UI's preview mode
--- Flags: confirmation
---@param isPet boolean true to edit talents for the player's pet, false to edit talents for the player
function LearnPreviewTalents(isPet) end

--- Learns a talent, spending one talent point
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param talentIndex number Index of a talent option (between 1 and GetNumTalents() )
---@param isPet boolean True to edit talents for the player's pet, false to edit talents for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
function LearnTalent(tabIndex, talentIndex, isPet, talentGroup) end

--- Reverts all changes made in the Talent UI's preview mode
---@param isPet boolean true to edit talents for the player's pet, false to edit talents for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
function ResetGroupPreviewTalentPoints(isPet, talentGroup) end

--- Reverts changes made within a specific tab in the Talent UI's preview mode
---@param tabIndex number Index of a talent school/tab (between 1 and GetNumTalentTabs())
---@param isPet boolean true to edit talents for the player's pet, false to edit talents for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
function ResetPreviewTalentPoints(tabIndex, isPet, talentGroup) end

--- Switches the player's active talent specialization.
---@param talentGroup number Index of the talent specialization to enable
function SetActiveTalentGroup(talentGroup) end



--==============================
-- Targeting functions
--==============================

--- Targets the unit targeted by another unit
--- Flags: protected
---@param unit string A unit to assist
---@param name string The name of a unit to assist
function AssistUnit(unit, name) end

--- Clears the player's focus unit
--- Flags: protected
function ClearFocus() end

--- Clears the player's current target
--- Flags: protected
function ClearTarget() end

--- Changes the focus unitID to refer to a new unit
--- Flags: protected
---@param unit string A unit to focus
---@param name string The name of a unit to focus; only valid for player , pet , and party/raid members
function FocusUnit(unit, name) end

--- Targets the most recently targeted enemy unit
--- Flags: protected
function TargetLastEnemy() end

--- Targets the most recently targeted friendly unit
--- Flags: protected
function TargetLastFriend() end

--- Targets the most recently targeted unit
--- Flags: protected
function TargetLastTarget() end

--- Cycles targets through nearest units regardless of reaction/affiliation
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearest(backward) end

--- Cycles your target through the nearest enemy units.
--- Flags: protected
---@param backward boolean Reverses the direction of the cycling if true (e.g. TAB vs. SHIFT-TAB)
function TargetNearestEnemy(backward) end

--- Cycles targets through nearby enemy player units
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearestEnemyPlayer(backward) end

--- Cycles targets through nearby friendly units
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearestFriend(backward) end

--- Cycles targets through nearby friendly player units
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearestFriendPlayer(backward) end

--- Cycles targets through nearby party members
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearestPartyMember(backward) end

--- Cycles targets through nearby raid members
--- Flags: protected
---@param backward boolean Reverses direction of target cycling if true (as with the default TAB vs. SHIFT-TAB bindings)
function TargetNearestRaidMember(backward) end

--- Targets a unit. Passing nil is equivalent to calling ClearTarget() ).
--- Flags: protected
---@param unit string A unit to target
---@param name string Name of a unit to target
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function TargetUnit(unit, name, exactMatch) end



--==============================
-- Taxi/Flight functions
--==============================

--- Ends interaction with the Taxi (flight master) UI. Causes the TAXIMAP_CLOSED event to fire, indicating that Taxi APIs may no longer have effects or return valid data.
function CloseTaxiMap() end

--- Returns the number of hops from the current location to another taxi node. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
---@return number numHops Number of hops from the current location to the given node
function GetNumRoutes(index) end

--- Returns the number of flight points on the taxi map. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@return number numNodes Number of flight points on the taxi map
function NumTaxiNodes() end

--- Sets a Texture object to show the appropriate flight map texture. Only has effect while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param texture table A Texture object
function SetTaxiMap(texture) end

--- Embarks on a taxi flight to a given destination. Only has effect while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
function TakeTaxiNode(index) end

--- Returns the horizontal coordinate of a taxi flight's destination node. Used in the default UI to draw lines between nodes; TaxiNodeSetCurrent() should be called first so the client can compute routes.
---@param source number Index of the source flight point (between 1 and NumTaxiNodes() )
---@param dest number Index of the destination flight point (between 1 and NumTaxiNodes() )
---@return number dX X coordinate of the destination taxi node (as a proportion of the taxi map's width; 0 = left edge, 1 = right edge)
function TaxiGetDestX(source, dest) end

--- Returns the vertical coordinate of a taxi flight's destination node. Used in the default UI to draw lines between nodes; TaxiNodeSetCurrent() should be called first so the client can compute routes.
---@param source number Index of the source flight point (between 1 and NumTaxiNodes() )
---@param dest number Index of the destination flight point (between 1 and NumTaxiNodes() )
---@return number dY Y coordinate of the destination taxi node (as a proportion of the taxi map's height; 0 = bottom, 1 = top)
function TaxiGetDestY(source, dest) end

--- Returns the horizontal coordinate of a taxi flight's source node. Used in the default UI to draw lines between nodes; TaxiNodeSetCurrent() should be called first so the client can compute routes.
---@param source number Index of the source flight point (between 1 and NumTaxiNodes() )
---@param dest number Index of the destination flight point (between 1 and NumTaxiNodes() )
---@return number sX X coordinate of the source taxi node (as a proportion of the taxi map's width; 0 = left edge, 1 = right edge)
function TaxiGetSrcX(source, dest) end

--- Returns the vertical coordinate of a taxi flight's source node. Used in the default UI to draw lines between nodes; TaxiNodeSetCurrent() should be called first so the client can compute routes.
---@param source number Index of the source flight point (between 1 and NumTaxiNodes() )
---@param dest number Index of the destination flight point (between 1 and NumTaxiNodes() )
---@return number sY Y coordinate of the source taxi node (as a proportion of the taxi map's height; 0 = bottom, 1 = top)
function TaxiGetSrcY(source, dest) end

--- Returns the cost to fly to a given taxi node. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
---@return number cost Price of a flight to the given node (in copper)
function TaxiNodeCost(index) end

--- Returns the type of a flight pont. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
---@return any type Type of the flight point ( string ) CURRENT - The player's current location DISTANT - Unreachable from the current location NONE - Not currently in use REACHABLE - Reachable from the current location
function TaxiNodeGetType(index) end

--- Returns the name of a flight point. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
---@return string name Name of the taxi node
function TaxiNodeName(index) end

--- Returns the position of a flight point on the taxi map. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
---@return number x Horizontal coordinate of the taxi node (as a proportion of the taxi map's width; 0 = left edge, 1 = right edge)
---@return number y Vertical coordinate of the taxi node (as a proportion of the taxi map's height; 0 = bottom, 1 = top)
function TaxiNodePosition(index) end

--- Sets the "current" flight path node. Used in the default UI when mousing over a node; tells the client to compute the route paths involving the node (see TaxiGetSrcX() et al).
---@param slot number The internal index of a flight path node
function TaxiNodeSetCurrent(slot) end

--- Returns whether a unit is currently riding a flight path (taxi). Valid for any unit in the player's area of interest, but generally useful only for player -- taxi flights move quickly, so a taxi-riding unit visible to the player will not remain visible for very long.
---@param unit string A unit to query
---@return any onTaxi 1 if the unit is on a taxi; otherwise nil
function UnitOnTaxi(unit) end



--==============================
-- Threat functions
--==============================

--- Returns color values for a given threat status. Color component values are floating point numbers between 0 and 1, with 1 representing full intensity.
---@param status number A threat status category, as returned by UnitThreatSituation or UnitDetailedThreatSituation
---@return number red Red component of the color
---@return number green Green component of the color
---@return number blue Blue component of the color
function GetThreatStatusColor(status) end

--- Returns whether the default Aggro Warning UI should currently be shown.
---@return any enabled 1 if the Aggro Warning UI should be displayed; nil otherwise
function IsThreatWarningEnabled() end

--- Returns detailed information about the threat status of one unit against another.
---@param unit any The unit whose threat situation is being requested
---@param name string The name of a unit to query. Only valid for the player, pet, and party/raid members.
---@param mobUnit any An NPC unit the first unit may have threat against
---@return any isTanking 1 if unit is mobUnit's primary target, nil otherwise
---@return any status A threat status category ( number ) 0 - Unit has less than 100% raw threat (default UI shows no indicator) 1 - Unit has 100% or higher raw threat but isn't mobUnit's primary target (default UI shows yellow indicator) 2 - Unit is mobUnit 's primary target, and another unit has 100% or higher raw threat (default UI shows orange indicator) 3 - Unit is mobUnit 's primary target, and no other unit has 100% or higher raw threat
---@return number scaledPercent A percentage value representing unit's threat against mobUnit , scaled such that a value of 100% represents unit becoming mobUnit 's primary target
---@return number rawPercent A percentage value representing unit's threat against mobUnit relative to the the threat of mobUnit's primary target
---@return number threatValue The raw value of unit's threat against mobUnit
function UnitDetailedThreatSituation(unit, name, mobUnit) end

--- Returns the general threat status of a unit. See UnitDetailedThreatSituation for details about threat values.
---@param unit any The unit whose threat situation is being requested
---@param name string The name of a unit to query. Only valid for the player, pet, and party/raid members.
---@param mobUnit any An NPC unit the first unit may have threat against; if nil, returned values reflect whichever NPC unit the first unit has the highest threat against.
---@return any status A threat status category ( number ) 0 - Unit has less than 100% raw threat (default UI shows no indicator) 1 - Unit has 100% or higher raw threat but isn't mobUnit 's primary target (default UI shows yellow indicator) 2 - Unit is mobUnit 's primary target, and another unit has 100% or higher raw threat (default UI shows orange indicator) 3 - Unit is mobUnit 's primary target, and no other unit has 100% or higher raw threat
function UnitThreatSituation(unit, name, mobUnit) end



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



--==============================
-- Trade functions
--==============================

--- Accepts a proposed trade
function AcceptTrade() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function BeginTrade() end

--- Cancels a trade in progress. Can be used if either party has accepted the trade, but not once both have.
function CancelTrade() end

--- Cancels the player's acceptance of a trade. If the player has accepted the trade but the target has not, reverts the player to the pre-acceptance state but does not end the trade.
function CancelTradeAccept() end

--- Ends interaction with the Trade UI, canceling any trade in progress. Causes the TRADE_CLOSED event to fire, indicating that Trade APIs may no longer have effects or return valid data.
function CloseTrade() end

--- Returns information about an item offered for trade by the player
---@param index number Index of an item slot on the player's side of the trade window (between 1 and MAX_TRADE_ITEMS )
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number numItems Number of stacked items in the slot
---@return number quality Quality (rarity) level of the item
---@return any isUsable 1 if the player character can use or equip the item; otherwise nil
---@return string enchantment Name of the enchantment being applied to the item through trade; otherwise nil
function GetTradePlayerItemInfo(index) end

--- Returns information about an item offered for trade by the target
---@param index number Index of an item slot on the player's side of the trade window (between 1 and MAX_TRADE_ITEMS )
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number numItems Number of stacked items in the slot
---@return number quality Quality (rarity) level of the item
---@return any isUsable 1 if the player character can use or equip the item; otherwise nil
---@return string enchantment Name of the enchantment being applied to the item through trade; otherwise nil
function GetTradeTargetItemInfo(index) end

--- Offers to trade with a given unit. The trade process does not begin immediately; once the server has determined both clients can trade, the TRADE_SHOW event fires.
---@param unit string A unit with which to trade
---@param name string The name of a unit with which to trade; only valid for nearby units in the player's party/raid
function InitiateTrade(unit, name) end

--- Confirms replacement of an existing enchantment when offering an enchantment for trade. After confirming, the enchantment is not actually performed until both parties accept the trade.
--- Flags: confirmation
function ReplaceTradeEnchant() end



--==============================
-- Tradeskill functions
--==============================

--- Ends interaction with the Trade Skill UI. Fires the TRADE_SKILL_CLOSE event, indicating that TradeSkill APIs may no longer have effects or return valid data.
function CloseTradeSkill() end

--- Collapses a group header in the trade skill listing. Causes an error if index does not refer to a header.
---@param index number Index of a header in the trade skill list (between 1 and GetNumTradeSkills() )
function CollapseTradeSkillSubClass(index) end

--- Performs a trade skill recipe
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@param repeat number Number of times to repeat the recipe
function DoTradeSkill(index, repeat) end

--- Expands a group header in the trade skill listing. Causes an error if index does not refer to a header.
---@param index number Index of a header in the trade skill list (between 1 and GetNumTradeSkills() )
function ExpandTradeSkillSubClass(index) end

--- Returns the index of the first non-header in the trade skill listing
---@return number index Index of the first trade skill recipe (as opposed to group headers)
function GetFirstTradeSkill() end

--- Returns the number of entries in the trade skill listing. Entries include both group headers and individual trade skill recipes. Reflects the list as it should currently be displayed, not necessarily the complete list -- if headers are collapsed or a filter is enabled, a smaller number will be returned.
---@return number numSkills Number of headers and recipes to display in the trade skill list
function GetNumTradeSkills() end

--- Returns the time remaining on a trade skill recipe's cooldown
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return number cooldown Time remaining before the recipe can be performed again (in seconds), or nil if the recipe is currently available or has no cooldown
function GetTradeSkillCooldown(index) end

--- Returns descriptive text for a tradeskill recipe. Most recipes that create items don't provide descriptive text; it's more often used for enchants and special recipes such as inscription or alchemy research.
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string description Descriptive text for the tradeskill recipe, or nil if no text is associated with the recipe
function GetTradeSkillDescription(index) end

--- Returns the icon for a trade skill recipe. For recipes which create an item, this is generally the icon of the item created; for other recipes (such as enchants and alchemy/inscription research) a generic icon is used.
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string texturePath Path to an icon texture for the recipe
function GetTradeSkillIcon(index) end

--- Returns information about a trade skill header or recipe
---@param index number Index of an entry in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string skillName Name of the entry
---@return any skillType Indicates whether the entry is a header or recipe and difficulty of recipes ( string ) easy - Low chance for the player to gain skill by performing the recipe (displayed as green in the default UI header - This entry is a header and not an actual trade skill recipe medium - Moderate chance for the player to gain skill by performing the recipe (displayed as yellow in the default UI optimal - High chance for the player to gain skill by performing the recipe (displayed as orange in the default UI trivial - No chance for the player to gain skill by performing the recipe (displayed as gray in the default UI
---@return number numAvailable Number of times the player can repeat the recipe given available reagents
---@return any isExpanded 1 if the entry is a header and is expanded; otherwise nil
---@return any serviceType Indicates what type of service the recipe provides (items, enhancements,...) ( string ) Emboss - Applies an emboss (letherworkers) Embrodier - Applies an embroider (tailors) Enchant - Applies an enchant (enchanters) Engrave - Engraves a rune (runeforging) Inscribe - Puts an inscription (scribers) Modify - Puts a socket (blacksmiths) Tinker - Puts a device like webbing or flexweave (engineers) nil - Produces an item
function GetTradeSkillInfo(index) end

--- Returns whether the trade skill listing is filtered by a given item equipment slot
---@param index number Index of an item equipment slot (in the list returned by GetTradeSkillInvSlots() ), or 0 for the "All" filter
---@return any enabled 1 if the filter is enabled; otherwise nil
function GetTradeSkillInvSlotFilter(index) end

--- Returns a list of recipe equipment slots for the current trade skill. These inventory types correspond to those of the items produced (see GetItemInfo() and GetAuctionItemInvTypes() ) and can be used to filter the recipe list.
function GetTradeSkillInvSlots() end

--- Returns the current settings for filtering the trade skill listing by required level of items produced
---@return number minLevel Lowest required level of items to show in the filtered list
---@return number maxLevel Highest required level of items to show in the filtered list
function GetTradeSkillItemLevelFilter() end

--- Returns the current search text for filtering the trade skill listing by name
---@return string text Text to search for in recipe names, produced item names or descriptions, or reagents; nil if no search filter is in use
function GetTradeSkillItemNameFilter() end

--- Returns information about the current trade skill
---@return string tradeskillName Name of the trade skill, or "UNKNOWN" if no trade skill window is open
---@return number rank The character's current rank in the trade skill
---@return number maxLevel The character's current maximum rank in the trade skill (e.g. 300 for a character of Artisan status)
function GetTradeSkillLine() end

--- Returns the number of items created when performing a tradeskill recipe
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return number minMade Minimum number of items created when performing the recipe
---@return number maxMade Maximum number of items created when performing the recipe
function GetTradeSkillNumMade(index) end

--- Returns the number of different reagents required for a trade skill recipe
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return number numReagents Number of different reagents required for the recipe
function GetTradeSkillNumReagents(index) end

--- Returns information about a reagent in a trade skill recipe
---@param skillIndex number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@param reagentIndex number Index of a reagent in the recipe (between 1 and GetTradeSkillNumReagents() )
---@return string reagentName Name of the reagent
---@return string reagentTexture Path to an icon texture for the reagent
---@return number reagentCount Quantity of the reagent required to perform the recipe
---@return number playerReagentCount Quantity of the reagent in the player's possession
function GetTradeSkillReagentInfo(skillIndex, reagentIndex) end

--- Returns the index of the currently selected trade skill recipe. Selection in the recipe list is used only for display in the default UI and has no effect on other Trade Skill APIs.
---@return number index Index of the selected recipe in the trade skill list (between 1 and GetNumTradeSkills() )
function GetTradeSkillSelectionIndex() end

--- Returns whether the trade skill listing is filtered by a given item subclass
---@param index number Index of an item subclass (in the list returned by GetTradeSkillSubClasses() ), or 0 for the "All" filter
---@return any enabled 1 if the filter is enabled; otherwise nil
function GetTradeSkillSubClassFilter(index) end

--- Returns a list of recipe subclasses for the current trade skill. These subclasses correspond to those of the items produced (see GetItemInfo() and GetAuctionItemSubClasses() ) and can be used to filter the recipe list.
function GetTradeSkillSubClasses() end

--- Returns a list of required tools for a trade skill recipe. A tool may be an item (e.g. Blacksmith Hammer , Virtuoso Inking Set ) the player must possess, or a description of a generic (e.g. near an Anvil, in a Moonwell) or specific (e.g. Netherstorm, Emerald Dragonshrine) location to which the player must travel in order to perform the recipe. The hasTool return is only valid for the former.
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string toolName Name of the required tool
---@return any hasTool 1 if the tool is an item in the player's possession; otherwise nil
function GetTradeSkillTools(index) end

--- Returns the number of times the trade skill recipe currently being performed will repeat. Returns 1 if a recipe is not being performed; after DoTradeSkill() is called, returns the number of repetitions queued (which decrements as each repetition is finished).
---@return number repeatCount Number of times the current recipe will repeat
function GetTradeskillRepeatCount() end

--- Returns whether the TradeSkill UI is showing another player's skill
---@return any isLinked 1 if the TradeSkill APIs currently reflect another character's tradeskill; nil if showing the player's tradeskill or if no skill is shown
---@return string name If showing another character's skill, the name of that character
function IsTradeSkillLinked() end

--- Selects a recipe in the trade skill listing. Selection in the recipe list is used only for display in the default UI and has no effect on other Trade Skill APIs.
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
function SelectTradeSkill(index) end

--- Filters the trade skill listing by equipment slot of items produced
---@param index number Index of an item equipment slot (in the list returned by GetTradeSkillInvSlots() ), or 0 for no filter
---@param enable number 1 to show recipes matching inventory type index in the filtered list; 0 to hide them
---@param exclusive any 1 to disable other subclass filters when enabling this one; otherwise nil
function SetTradeSkillInvSlotFilter(index, enable, exclusive) end

--- Filters the trade skill listing by required level of items produced
---@param minLevel number Lowest required level of items to show in the filtered list
---@param maxLevel number Highest required level of items to show in the filtered list
function SetTradeSkillItemLevelFilter(minLevel, maxLevel) end

--- Filters the trade skill listing by name of recipe, item produced, or reagents. Uses a substring (not exact-match) search: e.g. for a Scribe, the search string "doc" might filter the list to show only Certificate of Ownership because it matches the word "documentation" in that item's tooltip; a search for "stam" will match all items providing a Stamina bonus.
---@param text string Text to search for in recipe names, produced item names or descriptions, or reagents
function SetTradeSkillItemNameFilter(text) end

--- Filters the trade skill listing by subclass of items produced
---@param index number Index of an item subclass (in the list returned by GetTradeSkillSubClasses() ), or 0 for no filter
---@param enable number 1 to show recipes matching subclass index in the filtered list; 0 to hide them
---@param exclusive any 1 to disable other subclass filters when enabling this one; otherwise nil
function SetTradeSkillSubClassFilter(index, enable, exclusive) end

--- Cancels repetition of a trade skill recipe. If a recipe is currently being performed, it will continue, but further scheduled repetitions will be canceled.
function StopTradeSkillRepeat() end

--- Filters the trade skill listing by whether the player currently has enough reagents for each recipe
---@param filter boolean True to filter the recipe listing to show only recipes for which the player currently has enough reagents; false to show all recipes
function TradeSkillOnlyShowMakeable(filter) end

--- Filters the trade skill listing by whether the player can gain skill ranks from each recipe. The default UI does not provide controls for this filter, but it can nonetheless be used to alter the contents of the trade skill recipe listing.
---@param filter boolean True to filter the recipe listing to show only recipes which the player can gain skill ranks by performing; false to show all recipes
function TradeSkillOnlyShowSkillUps(filter) end



--==============================
-- Trainer functions
--==============================

--- Purchases an ability or recipe available from a trainer
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
function BuyTrainerService(index) end

--- Ends interaction with a trainer. Fires the TRAINER_CLOSED event, indicating that Trainer APIs may no longer have effects or return valid data.
function CloseTrainer() end

--- Collapses a group header in the trainer service listing
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/CollapseTrainerSkillLine
function CollapseTrainerSkillLine() end

--- Expands a group header in the trainer service listing
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/ExpandTrainerSkillLine
function ExpandTrainerSkillLine() end

--- Returns the number of entries in the trainer service listing. Entries include both group headers and individual trainer services (i.e spells or recipes to be purchased). Reflects the list as it should currently be displayed, not necessarily the complete list -- if headers are collapsed or a filter is enabled, a smaller number will be returned.
---@return number numServices Number of headers and services to display in the trainer service listing
function GetNumTrainerServices() end

--- Returns the current trainer's greeting text. In the default UI, this text is displayed at the top of the trainer window.
---@return string text Greeting text for the trainer with whom the player is currently interacting
function GetTrainerGreetingText() end

--- Returns the index of the currently selected trainer service. Selection in the recipe list is used only for display in the default UI and has no effect on other Trade Skill APIs.
---@return number selectionIndex Index of the selected entry in the trainer service listing (between 1 and GetNumTrainerServices() )
function GetTrainerSelectionIndex() end

--- Returns information about an ability required for purchasing a trainer service
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@param abilityIndex number Index of one of the service's ability requirements (between 1 and GetTrainerServiceNumAbilityReq(index) )
---@return string ability Name of the required ability
---@return any hasReq 1 if the player has the required ability; otherwise nil
function GetTrainerServiceAbilityReq(index, abilityIndex) end

--- Returns the cost to purchase a trainer service
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return number moneyCost Amount of money required to purchase the service (in copper)
---@return number talentCost Number of talent points required to purchase the service (generally unused)
---@return number skillCost 1 if purchasing the service counts against the player's limit of learnable professions; otherwise 0
function GetTrainerServiceCost(index) end

--- Returns the description of a trainer service. Generally returns the same description found in the spell's tooltip for spells purchased from a class trainer; returns nil for trade skills and recipes.
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string text Description of the service
function GetTrainerServiceDescription(index) end

--- Returns the icon for a trainer service
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string icon Path to an icon texture for the service
function GetTrainerServiceIcon(index) end

--- Returns information about an entry in the trainer service listing
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string serviceName Name of the service
---@return string serviceSubText Secondary text associated with the service (often a spell rank; e.g. "(Rank 4)")
---@return any serviceType Type of service entry ( string ) available - The player can currently use this service header - This entry is a group header, not a trainer service unavailable - The player cannot currently use this service used - The player has already used this service
---@return any isExpanded 1 if the entry is a header which is currently expanded, or if the header containing the entry is expanded; otherwise nil
function GetTrainerServiceInfo(index) end

--- Returns the character level required to purchase a trainer service
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return number reqLevel Level required to purchase the service, or nil if the service has no level requirement
function GetTrainerServiceLevelReq(index) end

--- Returns the number of ability requirements for purchasing a trainer service. Ability requirements are often used for ranked class spells purchased from the trainer: e.g. learning Blood Strike (Rank 3) requires having learned Blood Strike (Rank 2). See GetTrainerServiceAbilityReq() for information about specific ability requirements.
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return number numRequirements Number of different ability requirements for the trainer service
function GetTrainerServiceNumAbilityReq(index) end

--- Returns the name of the skill line associated with a trainer service. For trade skill trainers, skill line is the name of the trade skill (e.g. Tailoring, First Aid). For other trainers, skill line is the name of the group header under which the skill appears (e.g. Riding, Frost, Protection, Holy, Defense, Dual Wield).
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string skillLine Name of the skill line associated with the service
function GetTrainerServiceSkillLine(index) end

--- Returns information about the skill requirement for a trainer service. Often used for trade skill recipes: e.g. Netherweave Bag requires Tailoring (315).
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string skill Name of the required skill
---@return number rank Rank required in the skill
---@return any hasReq 1 if the player has the required skill and rank; otherwise nil
function GetTrainerServiceSkillReq(index) end

--- This function is deprecated and should no longer be used deprecated
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetTrainerServiceStepIncrease
function GetTrainerServiceStepIncrease() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function GetTrainerServiceStepReq() end

--- Returns whether the trainer service listing is filtered by a service status
---@param type any A trainer service status ( string ) available - Services the player can use unavailable - Services the player cannot currently use used - Services the player has already used
---@return any isEnabled 1 if services matching the filter type are shown in the listing; otherwise nil
function GetTrainerServiceTypeFilter(type) end

--- Returns whether the trainer service listing is filtered by a skill line
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetTrainerSkillLineFilter
function GetTrainerSkillLineFilter() end

--- Returns the list of service group names available at a trainer
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetTrainerSkillLines
function GetTrainerSkillLines() end

--- Returns whether the player is interacting with a trade skill trainer (as opposed to a class trainer)
---@return any isTradeskill 1 if interacting with a trade skill trainer; otherwise nil
function IsTradeskillTrainer() end

--- Returns whether a trainer service is a trade skill level
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/IsTrainerServiceSkillStep
function IsTrainerServiceSkillStep() end

--- . Was used in early betas of World of Warcraft before trainer NPCs existed. Only remaining use is equivalent to CloseTrainer() .
--- Flags: deprecated
function OpenTrainer() end

--- Selects an entry in the trainer service listing. Selection in the service list is used only for display in the default UI and has no effect on other Trainer APIs.
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
function SelectTrainerService(index) end

--- Filters the trainer service listing by service status
---@param type any A service status ( string ) available - Services the player can use unavailable - Services the player cannot currently use used - Services the player has already used
---@param enable number 1 to show services matching type in the filtered list; 0 to hide them
---@param exclusive any 1 to disable other type filters when enabling this one; otherwise nil
function SetTrainerServiceTypeFilter(type, enable, exclusive) end

--- Filters the trainer service listing by skill line. The default UI does not provide control for skill line filters, but they can nonetheless be used to alter the contents of the trainer service listing.
---@param type string Index of a skill line filter (in the list returned by GetTrainerSkillLines() )
---@param enable number 1 to show services matching the given skill line in the filtered list; 0 to hide them
---@param exclusive any 1 to disable other skill line filters when enabling this one; otherwise nil
function SetTrainerSkillLineFilter(type, enable, exclusive) end



--==============================
-- Tutorial functions
--==============================

--- Disables contextual tutorial display
function ClearTutorials() end

--- Marks a contextual tutorial as displayed so it doesn't appear again
---@param tutorial string Numeric identifier for the tutorial step (as string); supplied in the TUTORIAL_TRIGGER event
function FlagTutorial(tutorial) end

--- Enables contextual tutorial display and clears the list of already displayed tutorials. Tutorials that have already been shown to the player will appear again (via TUTORIAL_TRIGGER events) once their conditions are met. The first tutorial will appear again immediately.
function ResetTutorials() end



--==============================
-- UI/Visual functions
--==============================

--- Prints text to the debug console.
function ConsoleAddMessage() end

--- Runs a console command. Used by the default UI to handle /console commands.
---@param console_command string The console command to run
function ConsoleExec(console_command) end

--- Sizes a frame to take up the entire screen regardless of screen resolution
---@param frame table Frame to resize to full screen
function SetupFullscreenScale(frame) end



--==============================
-- Unit functions
--==============================

--- Returns whether the player is close enough to a unit for certain types of interaction
---@param unit string A unit to query
---@param distIndex any Number identifying one of the following action types ( number ) 1 - Inspect 2 - Trade 3 - Duel 4 - Follow
---@return any canInteract 1 if the player is close enough to the other unit to perform the action; otherwise nil
function CheckInteractDistance(unit, distIndex) end

--- Returns whether a character is muted or silenced. If the channel argument is specified, this function checks the given character's voice/silence status on the channel as well as for whether the character is on the player's Muted list.
---@param unit string A unit to query
---@param name string Name of a character to query
---@param channel string Name of a voice channel
---@return any muteStatus 1 if the character is muted; otherwise nil
function GetMuteStatus(unit, name, channel) end

--- Returns information about a player character identified by globally unique identifier. Returns nil if given the GUID of a non-player unit. The leading 0x may be omitted.
---@param guid string Globally unique identifier of a player unit
---@return string class Localized name of the unit's class
---@return string classFilename Non-localized token identifying the unit's class
---@return string race Localized name of the unit's race
---@return string raceFilename Non-localized token identifying the unit's race
---@return any sex Number identifying the unit's gender ( number ) 1 - Neuter / Unknown 2 - Male 3 - Female
---@return string name Unit's name
---@return string realm Unit's realm (empty string if from the same realm)
function GetPlayerInfoByGUID(guid) end

--- Returns a string summarizing a unit's name and server
--- Flags: blizzardui
---@param unit string Unit to query
---@param showServerName boolean True to include the server name in the return value if the unit is not from the same server as the player; false to only include a short label in such circumstances
---@return string nameString The unit's name, possibly followed by the name of the unit's home server or a label indicating the unit is not from the player's server
function GetUnitName(unit, showServerName) end

--- Returns whether a unit can be heard due to ignored/muted status
---@param unit string A unit to query
---@return any isIgnoredOrMuted 1 if the unit is ignored or muted, nil otherwise
function IsIgnoredOrMuted(unit) end

--- Returns whether a character has been muted by the player
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any muted 1 if the unit is muted; otherwise nil
function IsMuted(unit, name) end

--- Sets a Texture object to show a portrait of a unit. Causes the client to render a view of the unit's model from a standard perspective into a circular 2D image and display it in the given Texture object.
---@param texture table A Texture object
---@param unit string A unit for which to display a portrait
function SetPortraitTexture(texture, unit) end

--- Returns whether one unit can assist another
---@param unit string A unit
---@param unit string Another unit
---@return any canAssist 1 if the first unit can assist the second; otherwise nil
function UnitCanAssist(unit, unit) end

--- Returns whether one unit can attack another
---@param unit string A unit
---@param unit string Another unit
---@return any canAttack 1 if the first unit can attack the second unit; otherwise nil
function UnitCanAttack(unit, unit) end

--- Returns whether two units can cooperate. Two units are considered to be able to cooperate with each other if they are of the same faction and are both players.
---@param unit string A unit
---@param unit string Another unit
---@return any canCooperate 1 if the two units can cooperate with each other; otherwise nil
function UnitCanCooperate(unit, unit) end

--- Returns a unit's class. The second return ( classFileName ) can be used for locale-independent verification of a unit's class, or to look up class-related data in various global tables:
---@param unit string A unit to query
---@param name string Name of a unit to query; only valid for player , pet , and party/raid members
---@return string class The localized name of the unit's class, or the unit's name if the unit is an NPC
---@return string classFileName A non-localized token representing the class
function UnitClass(unit, name) end

--- Returns a unit's class. The second return ( classFileName ) can be used for locale-independent verification of a unit's class, or to look up class-related data in various global tables:
---@param unit string A unit to query
---@param name string Name of a unit to query; only valid for player , pet , and party/raid members
---@return string class The localized name of the unit's class, or the unit's name if the unit is an NPC
---@return string classFileName A non-localized token representing the class
function UnitClassBase(unit, name) end

--- Returns a unit's classification
---@param unit string A unit to query
---@return any classification Classification of the unit ( string ) elite - Elite normal - Normal rare - Rare rareelite - Rare-Elite worldboss - World Boss
function UnitClassification(unit) end

--- Returns the creature family of the unit. Applies only to beasts of the kinds that can be taken as Hunter pets (e.g. cats, worms, and ravagers but not zhevras, talbuks and pterrordax), demons of the types that can be summoned by Warlocks (e.g. imps and felguards, but not demons that require enslaving such as infernals and doomguards or world demons such as pit lords and armored voidwalkers) and Death Knight's pets (ghouls).
---@param unit string A unit to query
---@return string family Localized name of the subtype of creature (e.g. Bear, Devilsaur, Voidwalker, Succubus), or nil if not applicable
function UnitCreatureFamily(unit) end

--- Returns the creature type of a unit. Note that some creatures have no type (e.g. slimes).
---@param unit string A unit to query
---@return string type Localized name of the type of creature (e.g. Beast, Humanoid, Undead), or nil if not applicable
function UnitCreatureType(unit) end

--- Returns whether a unit exists. A unit "exists" if it can be referenced by the player; e.g. party1 exists if the player is in a party with at least one other member (regardless of whether that member is nearby), target exists if the player has a target, npc exists if the player is currently interacting with an NPC, etc.
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , npc , and party/raid members
---@return any exists 1 if the unit exists, otherwise nil
function UnitExists(unit, name) end

--- Returns a unit's primary faction allegiance
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return string factionGroup Non-localized (English) faction name of the faction ("Horde" or "Alliance")
---@return string factionName Localized name of the faction
function UnitFactionGroup(unit, name) end

--- Returns whether a unit has a relic slot instead of a ranged weapon slot
---@param unit string A unit to query
---@return any hasRelic 1 if the unit has a relic slot; otherwise nil
function UnitHasRelicSlot(unit) end

--- Returns a unit's current amount of health
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return number health The unit's current amount of health (hit points)
function UnitHealth(unit, name) end

--- Returns a unit's maximum health value
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return number maxValue The unit's maximum health (hit points)
function UnitHealthMax(unit, name) end

--- Returns whether a party/raid member is nearby. The range check used by this function isn't directly based on the player's abilities (which may have varying ranges); it's fixed by Blizzard at a distance of around 40 yards (which encompasses many common healing spells and other abilities often used on raid members).
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for party/raid members and their pets
---@return any inRange 1 if the unit is close enough to the player to (likely) be in range for helpful spells; otherwise nil
function UnitInRange(unit, name) end

--- Returns whether a unit is marked AFK (Away From Keyboard)
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any isAFK 1 if the unit is AFK; otherwise nil
function UnitIsAFK(unit, name) end

--- Returns whether a unit is currently charmed. A charmed unit is affected by Mind Control (or a similar effect) and thus hostile to units which are normally his or her allies.
---@param unit string A unit to query
---@return any isCharmed 1 if the unit is charmed; otherwise nil
function UnitIsCharmed(unit) end

--- Returns whether a unit is connected (i.e. not Offline)
---@param unit string A unit to query
---@return any isConnected 1 if the player is connected; otherwise nil
function UnitIsConnected(unit) end

--- Returns whether a unit is controlling another unit. Applies to Mind Control and similar cases as well as to players piloting vehicles.
---@param unit string A unit to query
---@return any isControlling 1 if the unit is controlling another unit; otherwise nil
function UnitIsControlling(unit) end

--- Returns whether a unit is a corpse
---@param unit string A unit to query
---@return any isCorpse 1 if the unit is a corpse; otherwise nil
function UnitIsCorpse(unit) end

--- Returns whether a unit is marked DND (Do Not Disturb)
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any isDND 1 if the unit is marked Do Not Disturb, otherwise nil
function UnitIsDND(unit, name) end

--- Returns whether a unit is dead. Only returns 1 while the unit is dead and has not yet released his or her spirit. See UnitIsGhost() for after the unit has released.
---@param unit string A unit to query
---@return any isDead 1 if the unit is dead; otherwise nil
function UnitIsDead(unit) end

--- Returns whether a unit is either dead or a ghost
---@param unit string A unit to query
---@return any isDeadOrGhost 1 if the unit is dead or a ghost, otherwise nil
function UnitIsDeadOrGhost(unit) end

--- Returns whether two units are enemies
---@param unit string A unit
---@param unit string Another unit
---@return any isEnemy 1 if the units are enemies; otherwise nil
function UnitIsEnemy(unit, unit) end

--- Returns whether or not a given unit is feigning death. This function only works for friendly units.
---@param unit any The unit to query
---@return any isFeign 1 if the unit is feigning death, otherwise nil
function UnitIsFeignDeath(unit) end

--- Returns whether two units are friendly
---@param unit string A unit
---@param unit string Another unit
---@return any isFriends 1 if the two units are friendly; otherwise nil
function UnitIsFriend(unit, unit) end

--- Returns whether a unit is currently a ghost
---@param unit string A unit to query
---@return any isGhost 1 if the unit is a ghost; otherwise nil
function UnitIsGhost(unit) end

--- Returns whether a unit is flagged for PvP activity
---@param unit string A unit to query
---@return any isPVP 1 if the unit is flagged for PVP activity; otherwise nil
function UnitIsPVP(unit) end

--- Returns whether a unit is a player unit (not an NPC)
---@param unit string A unit to query
---@return any isPlayer 1 if the unit is a player unit; otherwise nil
function UnitIsPlayer(unit) end

--- Returns whether a unit is possessed by another
---@param unit string A unit to query
---@return any isPossessed 1 if the given unit is possessed; otherwise nil
function UnitIsPossessed(unit) end

--- Returns whether two units are from the same server. Only meaningful in cross-realm battlegrounds.
---@param unit string A unit
---@param unit string Another unit
---@return any isSame 1 if the two units are from the same server; otherwise nil.
function UnitIsSameServer(unit, unit) end

--- Returns whether a unit is tapped. Normally, rewards for killing a unit are available only to the character or group who first damaged the unit; once a character has thus established his claim on the unit, it is considered "tapped".
---@param unit any The unitid to query
function UnitIsTapped(unit) end

--- Returns whether a unit allows all players on its threat list to receive kill credit. Used to override the normal "tapping" behavior for certain mobs -- if this function returns 1, the player does not have to be the first to attack the mob (or in the same party/raid as the first player to attack) in order to receive quest or achievement credit for killing it.
---@param unit string A unit to query
---@return any allTapped 1 if the unit allows all players on its threat list to receive kill credit; otherwise nil
function UnitIsTappedByAllThreatList(unit) end

--- Returns whether a unit is tapped by the player or the player's group. Normally, rewards for killing a unit are available only to the character or group who first damaged the unit; once a character has thus established his claim on the unit, it is considered "tapped".
---@param unit string The unit to be queried
---@return any isTapped 1 if the unit is tapped by the player; otherwise nil
function UnitIsTappedByPlayer(unit) end

--- Returns whether a unit is trivial at the player's level. Killing trivial units (whose level is colored gray in the default UI) does not reward honor or experience.
---@param unit string A unit to query
---@return any isTrivial 1 if the unit is trivial at the player's level; otherwise nil
function UnitIsTrivial(unit) end

--- Returns whether two unit references are to the same unit. Useful for determining whether a composite unitID (such as raid19target ) also refers to a basic unitID ; see example.
---@param unit string A unit
---@param unit string Another unit
---@return any isSame Returns 1 if the two references are to the same unit; otherwise nil
function UnitIsUnit(unit, unit) end

--- Returns whether a unit is in the player's area of interest
---@param unit string A unit to query
---@return any isVisible 1 if the unit is is in the player's area of interest; otherwise nil
function UnitIsVisible(unit) end

--- Returns a unit's level. Returns -1 for boss units and hostile units whose level is ten levels or more above the player's.
---@param unit string A unit to query
---@return number level The unit's level
function UnitLevel(unit) end

--- . Replaced by UnitPower() .
--- Flags: deprecated
---@param unit any The unit to query
---@param name string The name of a unit to query. Only valid for the player, pet, and party/raid members.
---@return any mana The unit's current level of mana, rage, energy, runic power, or other power type
function UnitMana(unit, name) end

--- . Replaced by UnitPowerMax() .
--- Flags: deprecated
---@param unit any The unit to query
---@param name string The name of a unit to query. Only valid for the player, pet, and party/raid members.
---@return number maxValue The maximum amount of mana, rage, energy, or other power the unit can have.
function UnitManaMax(unit, name) end

--- Returns the name of a unit
---@param unit string A unit to query
---@return string name Name of the unit
---@return string realm Name of the unit's home realm if the unit is not from the player's realm; otherwise nil
function UnitName(unit) end

--- Returns whether a unit is controlled by a player
---@param unit string A unit to query
---@return any isPlayer 1 if the unit is controlled by a player; otherwise nil
function UnitPlayerControlled(unit) end

--- Returns a unit's current level of mana, rage, energy or other power type. Returns zero for non-existent units.
---@param unitID string A unit to query
---@param powerType string A specific power type to query
---@return any power The unit's current level of mana, rage, energy, runic power, or other power type
function UnitPower(unitID, powerType) end

--- Returns a unit's maximum mana, rage, energy or other power type. Returns the units current maximum power, if the unit does not exist then zero is returned. 
When querying with a powerType, as long as the unit exists you will get the maximum untalented power even if the class does not use the power type.
---@param unitID string A unit to query
---@param powerType number Specific power type to query for the unit
---@return number maxValue The unit's maximum mana, rage, energy, or other power
function UnitPowerMax(unitID, powerType) end

--- Returns the power type (energy, mana, rage) of the given unit. Does not return color values for common power types (mana, rage, energy, focus, and runic power); the canonical colors for these can be found in the PowerBarColor table. Color values may be included for special power types such as those used by vehicles.
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any powerType A number identifying the power type ( number ) 0 - Mana 1 - Rage 2 - Focus 3 - Energy 6 - Runic Power
---@return string powerToken The name of a global variable containing the localized name of the power type
---@return number altR Red component of the color used for displaying this power type
---@return number altG Green component of the color used for displaying this power type
---@return number altB Blue component of the color used for displaying this power type
function UnitPowerType(unit, name) end

--- Returns the name of a unit's race
---@param unit string A unit to query
---@return string race Localized name of the unit's race
---@return string fileName A non-localized token representing the unit's race
function UnitRace(unit) end

--- Returns the reaction of one unit with regards to another as a number. The returned value often (but not always) matches the unit's level of reputation with the second unit's faction, and can be used with the UnitReactionColor global table to return the color used to display a unit's reaction in the default UI.
---@param unit string A unit
---@param unit string Another unit
---@return any reaction Reaction of the first unit towards the second unit ( number ) 1 - Hated 2 - Hostile 3 - Unfriendly 4 - Neutral 5 - Friendly 6 - Honored 7 - Revered 8 - Exalted
function UnitReaction(unit, unit) end

--- Returns a color indicating hostility and related status of a unit. This color is used in various places in the default UI, such as the background behind a unit's name in the target and focus frames. For NPCs, the color reflects hostility and reputation, ranging from red (hostile) to orange or yellow (unfriendly or neutral) to green (friendly). When the unit is a player, a blue color is used unless the player is active for PvP, in which case the color may be red (he can attack you and you can attack him), yellow (you can attack him but he can't attack you) or green (ally). Color component values are floating point numbers between 0 and 1.
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return number red The red component of the color.
---@return number green The green component of the color.
---@return number blue The blue component of the color.
---@return number alpha The alpha (opacity) component of the color.
function UnitSelectionColor(unit, name) end

--- Returns the gender of the given unit or player
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any gender The unit's gender ( number ) 1 - Neuter / Unknown 2 - Male 3 - Female
function UnitSex(unit, name) end

--- Returns whether a unit is using a vehicle. Unlike similar functions, UnitUsingVehicle() also returns true while the unit is transitioning between seats in a vehicle.
---@param unit string A unit to query
---@return any usingVehicle 1 if the unit is using a vehicle; otherwise nil
function UnitUsingVehicle(unit) end



--==============================
-- Utility functions
--==============================

--- Creates a new Font object
---@param name string Name to assign to the newly created object; used both as the name of the object (retrievable with Font:GetName() ) and as a global variable referencing the object (unless another global by that name already exists)
---@return table fontObject The newly created Font object
function CreateFont(name) end

--- Creates a new Frame object
---@param frameType string Type of frame to create; see the widget documentation for details
---@param name string Name to assign to the newly created object; used both as the name of the object (retrievable via the GetName method) and as a global variable referencing the object, unless another global by that name already exists
---@param parent table Reference to another frame to be the new frame's parent
---@param template string Name of a template to be used in creating the frame; if creating a frame from multiple templates, a comma-separated list of names
---@return table frame A reference to the newly created Frame
function CreateFrame(frameType, name, parent, template) end

--- Returns the next frame following the frame passed, or nil if no more frames exist
---@param currentFrame table The current frame to get the next frame, or nil to get the first frame
---@return table nextFrame The frame following currentFrame or nil if no more frames exist, or the first frame if nil was passed
function EnumerateFrames(currentFrame) end

--- Returns a list of character names which complete a given partial name prefix
---@param inputString string Partial name for which to return completions
---@param includeBitfield any One or more of the following flags (combined via bit.bor() ), indicating which characters should be included in the result list: ( number , bitfield ) 0x00000000 - AUTOCOMPLETE_FLAG_NONE : No characters 0x00000001 - AUTOCOMPLETE_FLAG_IN_GROUP : Characters in the player's party or raid 0x00000002 - AUTOCOMPLETE_FLAG_IN_GUILD : Characters in the player's guild 0x00000004 - AUTOCOMPLETE_FLAG_FRIEND : Characters from the player's friends list 0x00000010 - AUTOCOMPLETE_FLAG_INTERACTED_WITH : Characters with whom the player has recently interacted 0x00000020 - AUTOCOMPLETE_FLAG_ONLINE : Currently online friends and guildmates 0xffffffff - AUTOCOMPLETE_FLAG_ALL : All characters
---@param excludeBitfield any One or more of the following flags (combined via bit.bor() ), indicating which characters should be excluded from the result list: ( number , bitfield ) 0x00000000 - AUTOCOMPLETE_FLAG_NONE : No characters 0x00000001 - AUTOCOMPLETE_FLAG_IN_GROUP : Characters in the player's party or raid 0x00000002 - AUTOCOMPLETE_FLAG_IN_GUILD : Characters in the player's guild 0x00000004 - AUTOCOMPLETE_FLAG_FRIEND : Characters from the player's friends list 0x00000010 - AUTOCOMPLETE_FLAG_INTERACTED_WITH : Characters with whom the player has recently interacted 0x00000020 - AUTOCOMPLETE_FLAG_ONLINE : Currently online friends and guildmates 0xffffffff - AUTOCOMPLETE_FLAG_ALL : All characters
---@param maxResults number Maximum number of results to be returned
---@param cursorPosition number Cursor position in the inputString ; currently unused
function GetAutoCompleteResults(inputString, includeBitfield, excludeBitfield, maxResults, cursorPosition) end

--- Returns the Frame object associated with the given name.
---@param name string Name of a Frame or other UI object
---@return table frame A reference to the named frame
function GetClickFrame(name) end

--- Returns all frames registered for a given event
---@param event string An event name
function GetFramesRegisteredForEvent(event) end

--- Returns information about special countdown timers
---@param index number Index of an available timer (between 1 and MIRRORTIMER_NUMTIMERS )
---@return any timer Non-localized token identifying the type of timer ( string ) BREATH - Used for the Breath timer when swimming underwater DEATH - Currently unused EXHAUSTION - Used for the Fatigue timer when swimming far from shore FEIGNDEATH - Used for the Hunter Feign Death ability
---@return number value Number of seconds remaining before the timer expires
---@return number maxvalue Maximum value of the timer
---@return number scale Rate at which the timer bar should move (e.g. -1 for a slowly "emptying" bar, 10 for a quickly "filling" bar); unused in the default UI
---@return number paused 1 if the timer is currently paused; otherwise 0
---@return string label Localized text to be displayed for the timer
function GetMirrorTimerInfo(index) end

--- Returns a high-resolution value for a special countdown timer
---@param timer any Non-localized token identifying the type of timer ( string ) BREATH - Used for the Breath timer when swimming underwater DEATH - Currently unused EXHAUSTION - Used for the Fatigue timer when swimming far from shore FEIGNDEATH - Used for the Hunter Feign Death ability
---@return number progress Number of milliseconds remaining before the timer expires
function GetMirrorTimerProgress(timer) end

--- Returns which mouse button triggered the current script. If called in a line of execution that started with a click handler (OnMouseDown, OnMouseUp, OnClick, OnDoubleClick, PreClick, or PostClick), returns a string identifying which mouse button triggered the handler. Otherwise, returns nil.
---@return string button Name of the mouse button that triggered the current script
function GetMouseButtonClicked() end

--- Returns the name for a mouse button specified by number
---@param buttonNumber number A mouse button number (1-5)
---@return any buttonName The name of the given mouse button ( string ) Button4 Button5 LeftButton MiddleButton RightButton
function GetMouseButtonName(buttonNumber) end

--- Returns the name of a character on the mute list
---@param index number Index of an entry in the mute listing (between 1 and GetNumMutes() )
---@return string name Name of the muted character
function GetMuteName(index) end

--- Returns the number of existing Frame objects (and derivatives). Only counts Frame objects and derivatives thereof (e.g. Button, Minimap, and StatusBar; but not FontString, AnimationGroup, and Texture).
---@return number numFrames Number of existing Frame objects (and derivatives)
function GetNumFrames() end

--- Returns a localized string according to given parameters. Applies to any global variable whose name fits a standard format: for example, GetText("foo") returns the value of the global variable foo (if it exists), and GetText("foo", 3) returns the value of foo_FEMALE (or if it does not exist, the value of foo ). Causes a Lua error if the given variable does not exists (or is nil).
---@param token string Base name of a localized string token
---@param gender number Gender of the string's subject (as returned by UnitSex() )
---@param ordinal number Currently unused
---@return string text The localized string according to the given parameters
function GetText(token, gender, ordinal) end

--- Returns a number representing the current time (with millisecond precision). Unlike with time() , the number returned by this function has no meaning of its own and may not be comparable across clients; however, since it also provides higher resolution it can be compared against itself for high-precision time measurements.
---@return number time A number that represents the current time in seconds (with millisecond precision)
function GetTime() end

--- Returns whether the login process has completed. The PLAYER_LOGIN event provides similar information; this function presents an alternative that can be used across UI reloads.
---@return any loggedIn 1 if the login process has completed; otherwise nil
function IsLoggedIn() end

--- Returns whether a given mouse button is held down. If no button is specified, returns 1 if any mouse button is held down.
---@param button any Number or name of a mouse button ( number,string ) 1 or LeftButton - Primary mouse button 2 or RightButton - Secondary mouse button 3 or MiddleButton - Third mouse button (or clickable scroll control) 4 or Button4 - Fourth mouse button 5 or Button5 - Fifth mouse button
---@return any isDown 1 if the mouse button is down; otherwise nil
function IsMouseButtonDown(button) end

--- Enables a global variable for automatic saving upon logout & UI reload. Used for some data saved on the local client by the default UI.
--- Flags: internal, protected
function RegisterForSave() end

--- Enables a global variable for automatic saving (on a per-character basis) upon logout & UI reload. Used for some data saved on the local client by the default UI.
--- Flags: internal, protected
function RegisterForSavePerCharacter() end

--- Requests information from the server about the player character's total time spent online. Information is not returned immediately; the TIME_PLAYED_MSG event fires when the requested data is available.
--- Flags: server
function RequestTimePlayed() end

--- Runs a string as a Lua script
---@param script string A Lua script to be run
function RunScript(script) end

--- Returns a description of an amount of time in appropriate units. Output includes markup normally hidden when displayed in a FontString (see last example); this markup allows the client to automatically print the singular or plural form of a word depending on the value of the preceding number.
--- Flags: blizzardui
---@param seconds number An amount of time (in seconds)
---@param noSeconds boolean True to omit a seconds term in the description; false or omitted otherwise
---@param notAbbreviated boolean True to use full unit names in the description (e.g. Hours, Minutes); false or omitted to use abbreviations (e.g. Hr, Min)
---@param maxCount number Maximum number of terms to include in the description; defaults to 2 if omitted
---@return string time A description of the amount of time in appropriate units (see examples)
function SecondsToTime(seconds, noSeconds, notAbbreviated, maxCount) end

--- Sets a Texture object to display an arbitrary texture, altering it to fit a circular frame. Used in the default UI to display square textures (such as item icons) within the circular "portrait" frames used in many default UI elements.
---@param frameName string Name of a Texture object
---@param texturePath string Path to a texture to display
function SetPortraitToTexture(frameName, texturePath) end

--- Returns information about the local variables at a given stack depth
---@param stackLevel number The stack level to query
---@return string localsInfo A string detailing the local variables at the given stack depth.
function debuglocals(stackLevel) end

--- Returns the value of a global variable. Often used in the default UI in cases where several similar names are systematically constructed. Examples:
---@param name string Name of a global variable
---@return any value Value of the given variable
function getglobal(name) end

--- Replaces non-simple values in a list with nil.
function scrub() end

--- Sets a global variable to a specified value. Allows setting the value of a global variable in contexts where its name might be overridden by that of a local variable; i.e. setglobal(name, value) is equivalent to _G.name = value or _G["name"] = value .
---@param name string Name of a global variable
---@param value any New value for the variable
function setglobal(name, value) end

--- Joins a list of strings (with no separator). Equivalent to strjoin("", ...) . If no strings are provided, returns the empty string ( "" ).
---@return string result The concatenated string
function strconcat() end

--- Joins a list of strings together with a given separator. If given a list of strings not already in a table, this function can be used instead of table.concat for better performance.
---@param sep string A separator to insert between joined strings
---@return string text The list of strings joined together with the given separator string
function strjoin(sep) end

--- Returns the length of a string, taking UTF-8 multi-byte characters into account
---@param string string The string to query.
---@return number length The length of the given string, taking UTF-8 multi-byte characters into account.
function strlenutf8(string) end

--- Fast simple substring substitution. Matches the semantics of string.gsub , but only finds and replaces specific substrings rather than using more powerful and more computationally expensive regular expression matching. Thus, this function can be used in place of string.gsub in performance-critical situations where only simple matching is needed.
---@param text string Text to be altered
---@param pattern string A substring to be located within the source text
---@param replacement string Text to be inserted in place of the found pattern
---@param count string Maximum number of replacements to be made
---@return string newText The input string with matching substrings replaced
---@return number count Number of occurrences of the substring replaced
function strreplace(text, pattern, replacement, count) end

--- Splits a string based on another seperator string. Also available as string.split (though not provided by the Lua standard library).
---@param sep string The seperator string to use
---@param text string The text to split
---@param limit number The maximum number of pieces to split the string into
function strsplit(sep, text, limit) end

--- Trims leading and trailing characters (whitespace by default) from a string. Also available as string.trim (though not provided by the Lua standard library).
---@param str string A string to trim
---@param trimChars string A string listing the characters to be trimmed (e.g. "[]{}()" to trim leading and trailing brackets, braces, and parentheses); if nil or omitted, whitespace characters (space, tab, newline, etc) are trimmed
---@return string text The trimmed string
function strtrim(str, trimChars) end

--- Removes all entries from a table
---@param aTable table A table whose contents are to be erased
---@return table emptyTable The input table, with all entries removed
function wipe(aTable) end



--==============================
-- Vehicle functions
--==============================

--- Returns whether the player can eject the occupant of a seat in the player's vehicle
---@param seat number Index of a seat in the player's vehicle
---@return boolean canEject True if the player can eject the seat's occupant; false if the player cannot eject the occupant or if the seat is empty
function CanEjectPassengerFromSeat(seat) end

--- Returns whether the player is in a vehicle. Used in the default UI to determine whether to show the "Leave Vehicle" button while controlling siege vehicles, turrets, and certain special mounts and quest entities.
---@return any canExit 1 if the player is in a vehicle and can exit; otherwise nil
function CanExitVehicle() end

--- Returns whether the player can change vehicle seats. Tells you if the player can switch seats in general, whereas UnitVehicleSeatInfo () tells you if the player can switch into a specific seat.
---@return boolean canSwitch Can the player change vehicle seats
function CanSwitchVehicleSeat() end

--- Returns whether the player is in a vehicle with multiple seats
---@return any canSwitch 1 if the player can switch seats; otherwise nil
function CanSwitchVehicleSeats() end

--- Sets the main unit for display of floating combat text.
---@param unit any Unit to show main combat text for
function CombatTextSetActiveUnit(unit) end

--- Ejects the occupant of a seat in the player's vehicle
---@param seat number Index of a seat in the player's vehicle
function EjectPassengerFromSeat(seat) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function IsUsingVehicleControls() end

--- Returns whether the player is controlling a vehicle weapon with adjustable aim angle
---@return any hasAngleControl 1 if the player is controlling a vehicle weapon with adjustable aim angle; otherwise nil
function IsVehicleAimAngleAdjustable() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function IsVehicleAimPowerAdjustable() end

--- Returns whether a unit is controlling a vehicle
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return boolean isControlling True if the unit is controlling a vehicle; otherwise false
function UnitControllingVehicle(unit, name) end

--- Returns whether a unit is controlling a vehicle or vehicle weapon. Used in the default UI to show the vehicle's health and power status bars in place of the controlling unit's. Returns false for passengers riding in but not controlling part of a vehicle; to find out whether a unit is riding in a vehicle, use UnitInVehicle . Also note that in some vehicles the player can command a vehicle weapon (e.g. gun turret) without controlling the vehicle itself; to find out whether a unit is controlling a vehicle, use UnitControllingVehicle .
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return boolean hasVehicle True if the unit is controlling a vehicle or vehicle weapon; otherwise false
function UnitHasVehicleUI(unit, name) end

--- Returns whether a unit is in a vehicle. A unit can be riding in a vehicle without controlling it: to test whether a unit is controlling a vehicle, use UnitControllingVehicle or UnitHasVehicleUI .
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any inVehicle 1 if the unit is in a vehicle; otherwise nil
function UnitInVehicle(unit, name) end

--- Returns whether a unit controls a vehicle
---@return boolean isInControl True if the unit controls a vehicle
function UnitInVehicleControlSeat() end

--- Moves the player to another seat within his current vehicle
---@param unit string Unit to move (only valid for player )
---@param seat number Index of a seat to switch to
function UnitSwitchToVehicleSeat(unit, seat) end

--- Returns the number of seats in a unit's vehicle. Note: returns 0 for multi-passenger mounts even thought multiple seats are available.
---@param unit string A unit to query
---@return number numSeats Number of seats in the unit's vehicle
function UnitVehicleSeatCount(unit) end

--- Returns information about seats in a vehicle. Note: multi-passenger mounts appear as vehicles for passengers but not for the owner; seat information applies only to the passenger seats.
---@param unit string A unit to query
---@param seat number Index of a seat in the unit's vehicle
---@return any controlType Type of control for the seat ( string ) Child - Unit in this seat controls part of the vehicle but not its movement (e.g. a gun turret) None - Unit in this seat has no control over the vehicle Root - Unit in this seat controls the movement of the vehicle
---@return string occupantName Name of the unit in the seat, or nil if the seat is empty
---@return string occupantRealm Home realm of the unit in the seat; nil if the seat is empty or its occupant is from the same realm as the player
---@return boolean canEject True if the vehicle's driver can eject the occupant of the seat
---@return boolean canSwitchSeats True if the player can switch to this seat.
function UnitVehicleSeatInfo(unit, seat) end

--- Returns the style of vehicle UI to display for a unit
---@param unit string A unit to query
---@param name string Name of a unit to query; only valid for player , pet , and party/raid members
---@return any skin Token identifying the style of vehicle UI to display for the unit ( string ) Mechanical - Used for mechanical vehicles Natural - Used for creature mounts
function UnitVehicleSkin(unit, name) end

--- Adjusts vehicle aim downward by a specified amount
---@param amount number Angle by which to adjust aim (in radians)
function VehicleAimDecrement(amount) end

--- Starts adjusting vehicle aim downward
--- Flags: protected
function VehicleAimDownStart() end

--- Stops adjusting vehicle aim downward
--- Flags: protected
function VehicleAimDownStop() end

--- Returns the aim angle of a vehicle weapon. The returned value is in radians, with positive values indicating upward angle, negative values indicating downward angle, and 0 indicating straight ahead.
---@return number angle Vertical angle of vehicle weapon aim (in radians)
function VehicleAimGetAngle() end

--- Returns the aim angle of a vehicle weapon relative to its minimum angle
function VehicleAimGetNormAngle() end

--- This is a Blizzard internal function internal
--- Flags: internal
function VehicleAimGetNormPower() end

--- Adjusts vehicle aim upward by a specified amount
---@param amount number Angle by which to adjust aim (in radians)
function VehicleAimIncrement(amount) end

--- Attempts to set a vehicle weapon's aim angle to a specific value. Causes aim angle to transition smoothly from the current value to the requested value (or to the closest allowed value to the requested value if it is beyond the vehicle's limits).
---@param amount number New aim angle (in radians)
function VehicleAimRequestAngle(amount) end

--- Attempts to set a vehicle weapon's aim angle to a specific value relative to its minimum value. Causes aim angle to transition smoothly from the current value to the requested value (or to the closest allowed value to the requested value if it is beyond the vehicle's limits).
---@param amount number New aim angle (in radians)
function VehicleAimRequestNormAngle(amount) end

--- This is a Blizzard internal function internal
--- Flags: internal
function VehicleAimSetNormPower() end

--- Starts adjusting vehicle aim upward
--- Flags: protected
function VehicleAimUpStart() end

--- Stops adjusting vehicle aim upward
--- Flags: protected
function VehicleAimUpStop() end

--- Zooms the player's view in while in a vehicle
function VehicleCameraZoomIn() end

--- Zooms the player's view out while in a vehicle
function VehicleCameraZoomOut() end

--- Removes the player from the current vehicle. Does nothing if the player is not in a vehicle.
function VehicleExit() end

--- Moves the player from his current seat in a vehicle to the next sequentially numbered seat. If the player is in the highest-numbered seat, cycles around to the lowest-numbered seat.
function VehicleNextSeat() end

--- Moves the player from his current seat in a vehicle to the previous sequentially numbered seat. If the player is in the lowest-numbered seat, cycles around to the highest-numbered seat.
function VehiclePrevSeat() end



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



--==============================
-- Voice functions
--==============================

--- Adds a character to the muted list for voice chat. The Muted list acts for voice chat as the Ignore list does for text chat: muted characters will never be heard regardless of which voice channels they join the player in.
---@param name string Name of a character to add to the mute list
function AddMute(name) end

--- Adds or removes a character from the voice mute list. Adds the character to the list if he/she is not already on it; removes the character if already on the list.
---@param unit string A unit to mute
---@param name string Name of a character to mute
function AddOrDelMute(unit, name) end

--- Removes a character from the muted list for voice chat. The Muted list acts for voice chat as the Ignore list does for text chat: muted characters will never be heard regardless of which voice channels they join the player in.
---@param name string Name of a character to remove from the mute list
function DelMute(name) end

--- Returns the number of characters on the player's mute list
---@return number numMuted The number of characters on the player's mute list
function GetNumMutes() end

--- Returns the number of members in a voice channel
---@param sessionId number Index of a voice session (between 1 and GetNumVoiceSessions() )
---@return number numMembers Number of members in the voice channel
function GetNumVoiceSessionMembersBySessionID(sessionId) end

--- Returns the number of available voice channels. Returns 0 if voice chat is disabled.
---@return number count Number of available voice sessions
function GetNumVoiceSessions() end

--- Returns the index of the selected entry in the Muted list. Mute list selection is only used for display purposes in the default UI and has no effect on other API functions.
---@return number selectedMute Index of the selected entry in the mute listing (between 1 and GetNumMutes() ), or 0 if no entry is selected
function GetSelectedMute() end

--- Returns an identifier for the active voice session
---@return number id Index of the active voice session (between 1 and GetNumVoiceSessions() ), or nil if no session is active
function GetVoiceCurrentSessionID() end

--- Returns information about a voice session
---@param session number Index of a voice session (between 1 and GetNumVoiceSessions() )
---@return string name Name of the voice session (channel)
---@return any active 1 if the session is the active voice channel; otherwise nil
function GetVoiceSessionInfo(session) end

--- Returns information about a member of a voice channel
---@param session number Index of a voice session (between 1 and GetNumVoiceSessions() )
---@param index number Index of a member in the voice session (between 1 and GetNumVoiceSessionMembersBySessionID(session) )
---@return string name Name of the member
---@return any voiceActive 1 if the member has enabled voice chat; otherwise nil
---@return any sessionActive 1 if the channel is the member's active voice channel; otherwise nil
---@return any muted 1 if the member is on the player's muted list; otherwise nil
---@return any squelched 1 if the member was silenced by the channel moderator; otherwise nil
function GetVoiceSessionMemberInfoBySessionID(session, index) end

--- Returns whether a character has voice chat enabled
---@param unit any The unitid to query
---@param name string The name of the player to query
---@param channel string Channel to query for voice status.
---@return any status 1 if voice is enabled; otherwise nil
function GetVoiceStatus(unit, name, channel) end

--- Returns whether the player is allowed to enable the voice chat feature
---@return any isAllowed 1 if voice chat is allowed; otherwise nil
function IsVoiceChatAllowed() end

--- Returns whether voice chat is supported by the realm server
function IsVoiceChatAllowedByServer() end

--- Returns whether the voice chat system is enabled
---@return any isEnabled 1 if the voice chat system is enabled; otherwise nil
function IsVoiceChatEnabled() end

--- Selects an entry in the Muted list. Mute list selection is only used for display purposes in the default UI and has no effect on other API functions.
---@param index number Index of an entry in the mute listing (between 1 and GetNumMutes() )
function SetSelectedMute(index) end

--- Returns whether a character is silenced on a voice channel
---@param name string Name of a character
---@param channel string Name of a chat channel
---@return any silenced 1 if the unit is silenced on the given channel; otherwise nil
function UnitIsSilenced(name, channel) end

--- Returns whether a unit is currently speaking in voice chat. Despite the "unit" name, this function only accepts player names, not unitID s.
---@param unit string Name of a character in the player's current voice channel
---@return any state 1 if the unit is currently speaking in voice chat; otherwise nil
function UnitIsTalking(unit) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function VoiceChat_ActivatePrimaryCaptureCallback() end

--- Returns the current volume level of the microphone signal
---@return number volume The current volume level of the microphone signal
function VoiceChat_GetCurrentMicrophoneSignalLevel() end

--- Returns whether the Microphone Test recording is playing
---@param isPlaying number 1 if the loopback sound is currently being played; otherwise nil
function VoiceChat_IsPlayingLoopbackSound(isPlaying) end

--- Returns whether a Microphone Test is recording
---@return number isRecording 1 if the player is recording a voice sample, otherwise 0
function VoiceChat_IsRecordingLoopbackSound() end

--- Plays back the Microphone Test recording
function VoiceChat_PlayLoopbackSound() end

--- Begins recording a Microphone Test
---@param seconds number The amount of time to record (in seconds)
function VoiceChat_RecordLoopbackSound(seconds) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function VoiceChat_StartCapture() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function VoiceChat_StopCapture() end

--- Stops playing the Microphone Test recording
function VoiceChat_StopPlayingLoopbackSound() end

--- Stops recording a Microphone Test
function VoiceChat_StopRecordingLoopbackSound() end

--- Returns whether the voice chat system cannot be enabled. Voice chat may be disabled if the underlying hardware does not support it or if multiple instances of World of Warcraft are running on the same hardware.
---@return any isDisabled 1 if the voice system is disabled; otherwise nil
function VoiceIsDisabledByClient() end

--- Used internally to start talking, when push-to-talk is active in voice chat.
--- Flags: deprecated
function VoicePushToTalkStart() end

--- Used internally to stop talking, when push-to-talk is active in voice chat
--- Flags: deprecated
function VoicePushToTalkStop() end



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



--==============================
-- Uncategorized functions
--==============================

--- Accepts a LFG dungeon invite.
function AcceptProposal() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNAcceptFriendInvite() end

--- Returns whether or not the player is connected to Battle.net
---@return boolean isOnline true if the player is connected to Battle.net; otherwise false
function BNConnected() end

--- Create a conversation between you and two friends
---@param presenceID_1 number The presenceID of your first friend
---@param presenceID_2 number The presenceID of your second friend
---@return boolean result ASSUMPTION: If creation conversation was successful or not
function BNCreateConversation(presenceID_1, presenceID_2) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNDeclineFriendInvite() end

--- Returns whether or not RealID services are disabled
---@return boolean isEnabled true if RealID is enabled; otherwise false
function BNFeaturesEnabled() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNFeaturesEnabledAndConnected() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetBlockedInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetBlockedToonInfo() end

--- Returns information about an existing battle.net conversation
---@param channel number ID of channel you want to check
---@return string type Seems to be 'conversation' if the conversation exists, nil if not
function BNGetConversationInfo(channel) end

--- Returns information about a member of a battle.net conversation
---@param channel number The index of the channel you want member info for
---@param memberIndex number The index of the member you want info for
---@return number presenceID This number seems to be the same as the presence ID of the RealID friend
---@return number unknown Unknown (ID?)
---@return string displayName The name that gets displayed with chat messages. Real name for friends, charname for FoF
function BNGetConversationMemberInfo(channel, memberIndex) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetCustomMessageTable() end

--- Returns information about the specified friend of a RealID friend
---@param presenceID number presenceID for the RealID friend for whom you are requesting friend info
---@param mutual boolean Should the list include mutual friends (i.e. people who you and the person referenced by presenceID are both friends with).
---@param non boolean mutual - Should the list include non-mutual friends.
---@param index number The index of the entry in the list to retrieve (1 to BNGetNumFOF(...))
---@return number presenceID a unique numeric identifier for this friend for this session
---@return string givenName a |K Escape Sequence representing the friend's first/given name
---@return string surname a |K Escape Sequence representing the friend's Surname/Family name
---@return boolean isFriend true if this person is a direct friend of yours, false otherwise
function BNGetFOFInfo(presenceID, mutual, non, index) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetFriendInviteInfo() end

--- Returns the maximum number of realID friends you can have in one conversation
---@return number count The max number of players that can be in one conversation
function BNGetMaxPlayersInConversation() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetNumBlocked() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetNumBlockedToons() end

--- Returns the number of members in a battle.net conversation
---@param channel number The index of the conversation to get member count for
---@return number memberCount Number of members in the conversation you asked for. 0 for non-existing conversations
function BNGetNumConversationMembers(channel) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetNumFOF() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetNumFriendInvites() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetSelectedBlock() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetSelectedToonBlock() end

--- Invite a friend into an existing conversation
---@param channel number The ID of the conversation to invite to
---@param presenceID number The presenceID of the friend to invite
function BNInviteToConversation(channel, presenceID) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNIsBlocked() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNIsFriend() end

--- Returns whether or not the presence ID is the one of the player
---@param presenceID number
---@return boolean isSelf true if the presence ID is the one of the player; false otherwise
function BNIsSelf(presenceID) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNIsToonBlocked() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNLeaveConversation() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNListConversation() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNRemoveFriend() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNReportFriendInvite() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNReportPlayer() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNRequestFOFInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSendConversationMessage() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSendFriendInvite() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSendFriendInviteByID() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSendWhisper() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetAFK() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetBlocked() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetDND() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetFocus() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetSelectedBlock() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetSelectedFriend() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetSelectedToonBlock() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetToonBlocked() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BattlefieldMgrEntryInviteResponse() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BattlefieldMgrExitRequest() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BattlefieldMgrQueueInviteResponse() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BattlefieldMgrQueueRequest() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CalendarContextInviteTentative() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CalendarEventTentative() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CalendarGetDayEventSequenceInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CanChangePlayerDifficulty() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CanMapChangeDifficulty() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CanPartyLFGBackfill() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CanResetTutorials() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CancelSell() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CannotBeResurrected() end

--- This function is not yet documented
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/ChangePlayerDifficulty
function ChangePlayerDifficulty() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function ClearAllLFGDungeons() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function ClearLFGDungeon() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CompleteLFGRoleCheck() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function DungeonUsesTerrainMap() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function FindSpellBookSlotByID() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function ForceGossip() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GMReportLag() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetAllowLowLevelRaid() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetAutoCompletePresenceID() end

--- Returns the flags of an available quest during an NPC dialog
---@param availableIndex number Number of an available quest in the dialog frame; 1.. GetNumAvailableQuests()
---@return boolean isTrivial True if the quest is trivial (gray), false otherwise.
---@return boolean isDaily True if the quest is daily, false otherwise.
---@return boolean isRepeatable True if the quest is repeatable, false otherwise.
function GetAvailableQuestInfo(availableIndex) end

--- Returns what roles the player is able to queue into the LFD system as
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetAvailableRoles
function GetAvailableRoles() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetChatWindowSavedDimensions() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetChatWindowSavedPosition() end

--- Returns quest information about an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return boolean isQuest true if the item is a quest item, nil otherwise.
---@return number questId ID of the quest started by the item, nil if the item does not start a quest.
---@return any isActive 1 if the quest started by the item is in the player's quest log, nil otherwise.
function GetContainerItemQuestInfo(container, slot) end

--- Returns information about a faction or header listing. Returns information about a faction regardless of whether the faction is known to the player (indeed, even for factions only available to the opposing alliance); see GetFactionInfo for information about factions listed in the player's Reputation UI.
---@param factionID number Unique numeric identifier for a faction
---@return string name Name of the faction
---@return string description Brief description of the faction, as displayed in the default UI's detail window for a selected faction
---@return any standingID Current standing with the given faction ( number , standingID ) 1 - Hated 2 - Hostile 3 - Unfriendly 4 - Neutral 5 - Friendly 6 - Honored 7 - Revered 8 - Exalted
---@return number barMin The minimum value of the reputation bar at the given standing
---@return number barMax The maximum value of the reputation bar at the given standing
---@return number barValue The player's current reputation with the faction
---@return any atWarWith 1 if the player is at war with the given faction, otherwise nil
---@return any canToggleAtWar 1 if the player can declare war with the given faction, otherwise nil
---@return any isHeader 1 if the index refers to a faction group header
---@return any isCollapsed 1 if the index refers to a faction group header and currently collapsed
---@return any hasRep 1 if the index refers to a faction group header whose reputation value should be displayed
---@return any isWatched 1 if the faction is currently being watched (i.e. displayed above the experience bar)
---@return any isChild 1 if the index refers to a faction sub-group header within another group, or to an individual faction within a sub-group
function GetFactionInfoByID(factionID) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetInstanceLockTimeRemainingEncounter() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDChoiceCollapseState() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDChoiceEnabledState() end

--- This function is not yet documented
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetLFDChoiceInfo
function GetLFDChoiceInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDChoiceLockedState() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDChoiceOrder() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDLockInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDLockPlayerCount() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGBootProposal() end

--- Returns the various rewards for a completed LFG dungeon
---@return string name Name of the instance
---@return number typeID Type of the dungeon (TYPEID DUNGEON, TYPEID HEROIC DIFFICULTY, TYPEID RANDOM_DUNGEON)
---@return string textureFilename Filename of the instance icon (to be used with 'Interface/LFGFrame/LFGIcon-'
---@return number moneyBase Base amount of money (moneyAmount = moneyBase + moneyVar * numStrangers)
---@return number moneyVar Money reward coefficient
---@return number experienceBase Base amount of experience (experienceGained = experienceBase + experienceVar * numStrangers)
---@return number experienceVar Experience reward coefficient
---@return number numStrangers Amount of pickups in the group
---@return number numRewards Amount of actual dungeon rewards (currency or item)
function GetLFGCompletionReward() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGCompletionRewardItem() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGDeserterExpiration() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGDungeonInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGDungeonRewardInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGDungeonRewardLink() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGDungeonRewards() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGInfoLocal() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGInfoServer() end

--- Returns info about the currently pending LFD operation
function GetLFGProposal() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGProposalEncounter() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGProposalMember() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGQueueStats() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGQueuedList() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGRandomCooldownExpiration() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGRandomDungeonInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGRoleUpdate() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGRoleUpdateMember() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGRoleUpdateSlot() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFRChoiceOrder() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLastQueueStatusIndex() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetMultiCastBarOffset() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetMultiCastTotemSpells() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetNextCompleatedTutorial() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetNumQuestItemDrops() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetNumQuestLogRewardFactions() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetNumRandomDungeons() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetPartyLFGBackfillInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetPetSpellBonusDamage() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetPrevCompleatedTutorial() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestLogItemDrop() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestLogRewardArenaPoints() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestLogRewardFactionInfo() end

--- Returns the experience reward at the player's level for the selected quest in the quest log
---@return number experience Amount of experience rewarded for completing the quest
function GetQuestLogRewardXP() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestPOILeaderBoard() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestSortIndex() end

--- Returns the quest watch (objective tracker) index of a quest in the quest log
---@param questLogIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
---@return number questWatchIndex Index of a quest in the list of quests on the objectives tracker (between 1 and GetNumQuestWatches() )
function GetQuestWatchIndex(questLogIndex) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestWorldMapAreaID() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetRaidDifficulty() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetRandomBGHonorCurrencyBonuses() end

--- Returns the dungeonID of the random dungeon group that provides the best loot for the player.. The dungeonID that is returned refers to an integer found in LFGDungeons.dbc. This function is normally used only for initialization of the LFGQueueFrame in FrameXML LFDFrame.lua. You can programatically join the suggested queue for a random dungeon for which your character is eligible.
function GetRandomDungeonBestChoice() end

--- Returns the amount of arena points awarded when completing a quest.
---@return number arenaPoints The arena points to be awarded
function GetRewardArenaPoints() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetVehicleUIIndicator() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetVehicleUIIndicatorSeat() end

--- Checks if the player has completed at least 1 achievement. Used to determine whether or not the achievements frame should be loaded, and if the Achievements button on the micro menu should be enabled or not.
---@return boolean state 1 if the player has completed at least one achievement, nil otherwise.
function HasCompletedAnyAchievement() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function HasLFGRestrictions() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsBNLogin() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsInLFGDungeon() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsLFGDungeonJoinable() end

--- Returns whether the player is currently listed in the Raid Browser
---@return boolean listedInLFR true if the player is listed in the raid browser; otherwise false
function IsListedInLFR() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsPartyLFG() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsPetAttackAction() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsTutorialFlagged() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsZoomOutAvailable() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function JoinLFG() end

--- Leave the LFG queue.
function LeaveLFG() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function PartyLFGStartBackfill() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function ProcessQuestLogRewardFactions() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestIsDaily() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestIsWeekly() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestMapUpdateAllQuests() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestPOIGetIconInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestPOIGetQuestIDByIndex() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestPOIGetQuestIDByVisibleIndex() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestPOIUpdateIcons() end

--- This function is not yet documented
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/QuestPOIUpdateTexture
function QuestPOIUpdateTexture() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function RefreshLFGList() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function RegisterStaticConstants() end

--- Rejects a LFG dungeon invite.
function RejectProposal() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function RequestLFDPartyLockInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function RequestLFDPlayerLockInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function RespondMailLockSendItem() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGGetEncounterResults() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGGetJoinedID() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGGetNumResults() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGGetPartyResults() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGGetResults() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGJoin() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGLeave() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGSort() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SendSystemMessage() end

--- Enabling this if your character is below level 10 will allow you to join a raid group.
---@param enable boolean 1 to enable low level raids for this character, nil otherwise.
function SetAllowLowLevelRaid(enable) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetAuctionsTabShowing() end

--- Sets whether the player names should be colored by class for a given chat type
---@param chatType string The chatType that is being set. This value of this is the same as the index of the global ChatTypeInfo table.
---@param colorByName boolean Whether or not names should be colored by class for the given chat type.
function SetChatColorNameByClass(chatType, colorByName) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetChatWindowSavedDimensions() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetChatWindowSavedPosition() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetLFGBootVote() end

--- Sets a flag indicating that the player would like to join a given dungeon/queue. This function simply indicates that the player would like to join a given dungeon or queue. Joining the queue is accomplished using the JoinLFG() function. Clearing the dungeons that have been flagged is accomplished using the ClearAllLFGDungeons function.
---@param queueIndex number A numeric identifier for the dungeon/queue being joined. For random queues this can be obtained using /dump LFDQueueFrame.type
function SetLFGDungeon(queueIndex) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetLFGDungeonEnabled() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetLFGHeaderCollapsed() end

--- Sets the map based on a specified ID. For example, if you are an Undead character in the starting area, which is map ID 21, you can open your map and run SetMapByID(22) to change it to Western Plaguelands. In fact, you can run that anywhere If you are a fresh undead in tirisfal glades(MapAreaID:21), you get your map out, then you use SetMapByID(22) it will change to WPL
---@param id number The unique numeric map ID, can be obtained from GetCurrentMapAreaID()
function SetMapByID(id) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetPOIIconOverlapDistance() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetPOIIconOverlapPushDistance() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetSavedInstanceExtend() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function ShiftQuestWatches() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SortBGList() end

--- Sorts the quests listed in the watch frame based on the set criteria
---@return boolean changed true if the quest watches were re-ordered during the sort, otherwise false
function SortQuestWatches() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_Clear() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_FinishCountdown() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_IsPlaying() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_Pause() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_Play() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_StartCountdown() end

--- Toggles visibility of the StopwatchFrame
function Stopwatch_Toggle() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function TriggerTutorial() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function UnitGroupRolesAssigned() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function UnitHasLFGDeserter() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function UnitHasLFGRandomCooldown() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function debughook() end

