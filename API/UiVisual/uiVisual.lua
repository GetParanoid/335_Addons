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
