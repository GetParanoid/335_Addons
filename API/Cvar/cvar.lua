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
