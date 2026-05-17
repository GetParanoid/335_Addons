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
