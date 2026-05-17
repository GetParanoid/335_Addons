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
