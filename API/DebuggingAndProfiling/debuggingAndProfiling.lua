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
