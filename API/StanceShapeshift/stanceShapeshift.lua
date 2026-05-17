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
