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
