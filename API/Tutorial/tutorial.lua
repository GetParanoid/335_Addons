--==============================
-- Tutorial functions
--==============================

--- Disables contextual tutorial display
function ClearTutorials() end

--- Marks a contextual tutorial as displayed so it doesn't appear again
---@param tutorial string Numeric identifier for the tutorial step (as string); supplied in the TUTORIAL_TRIGGER event
function FlagTutorial(tutorial) end

--- Enables contextual tutorial display and clears the list of already displayed tutorials. Tutorials that have already been shown to the player will appear again (via TUTORIAL_TRIGGER events) once their conditions are met. The first tutorial will appear again immediately.
function ResetTutorials() end
