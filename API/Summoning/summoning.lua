--==============================
-- Summoning functions
--==============================

--- Declines an offered summons. Usable between when the CONFIRM_SUMMON event fires (due to a summoning spell cast by another player) and when the value returned by GetSummonConfirmTimeLeft() reaches zero.
function CancelSummon() end

--- Accepts an offered summons, teleporting the player to the summoner's location. Usable between when the CONFIRM_SUMMON event fires (due to a summoning spell cast by another player) and when the value returned by GetSummonConfirmTimeLeft() reaches zero.
function ConfirmSummon() end

--- Returns the destination area of an offered summons. The name returned is generally that of the subzone in which the summoner performed the spell.
---@return string area Name of the location to which the player will be teleported upon accepting the summons
function GetSummonConfirmAreaName() end

--- Returns the name of the unit offering a summons to the player. Usable between when the CONFIRM_SUMMON event fires (due to a summoning spell cast by another player) and when the value returned by GetSummonConfirmTimeLeft() reaches zero.
---@return string text Name of the summoning unit
function GetSummonConfirmSummoner() end

--- Returns the amount of time remaining before an offered summons expires. Returns 0 if no summons is currently available.
---@return number timeleft Time remaining until the offered summons can no longer be accepted (in seconds)
function GetSummonConfirmTimeLeft() end

--- Returns whether the player can accept a summons
---@return boolean amount True if the player is currently allowed to accept a summons
function PlayerCanTeleport() end
