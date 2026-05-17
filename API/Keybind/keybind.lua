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
