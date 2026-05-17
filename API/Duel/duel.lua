--==============================
-- Duel functions
--==============================

--- Accepts a proposed duel
function AcceptDuel() end

--- Cancels an ongoing duel, or declines an offered duel
function CancelDuel() end

--- Challenges another player to a duel
---@param unit string A unit to target
---@param name string Name of a unit to target
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function StartDuel(unit, name, exactMatch) end
