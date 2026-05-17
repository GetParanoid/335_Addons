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
