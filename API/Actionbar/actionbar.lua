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
