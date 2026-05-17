--==============================
-- Player information functions
--==============================

--- Accepts an offered resurrection spell. Not used for self-resurrection; see UseSoulstone() for such cases.
function AcceptResurrect() end

--- Resurrects the player at a spirit healer, accepting possible consequences. Resurrecting at a spirit healer generally results in a loss of durability (both equipped items and those in the player's bags) and may also result in the Resurrection Sickness debuff.
--- Flags: confirmation
function AcceptXPLoss() end

--- Returns whether the player is in a world PvP zone offering an exit option.
---@return any status 1 if in a world PvP zone with an exit option; otherwise nil
function CanHearthAndResurrectFromArea() end

--- Returns whether the player is in range of an NPC that can set the Hearthstone location. Usable following the CONFIRM_BINDER event which fires when the player speaks to an Innkeeper (or similar) NPC and chooses to set his or her Hearthstone location. Used in the default UI to hide the confirmation window for such if the player moves too far away from the NPC.
---@return any inRange 1 if the player is in range of an NPC that can set the Hearthstone location; otherwise nil
function CheckBinderDist() end

--- Returns whether the player is in range of a spirit healer. Usable following the CONFIRM_XP_LOSS event which fires upon speaking to a spirit healer while dead and choosing the option to immediately resurrect. Used in the default UI to hide the confirmation window for such if the player moves too far away from the spirit healer.
---@return any inRange 1 if the player is in range of a spirit healer; otherwise nil
function CheckSpiritHealerDist() end

--- Sets the player's Hearthstone to the current location. Usable in response to the CONFIRM_BINDER event which fires upon speaking to an Innkeeper (or similar NPC) and choosing the Hearthstone option.
function ConfirmBinder() end

--- Declines an offered resurrection spell. Usable following the RESURRECT_REQUEST event which fires when the player is offered resurrection by another unit.
function DeclineResurrect() end

--- Dismounts from the player's summoned mount
function Dismount() end

--- Returns the name of the player's Hearthstone location
---@return string location Name of the player's Hearthstone location
function GetBindLocation() end

--- Returns the player's number of combo points on the target.
---@param unit string Either 'player' or 'vehicle'
---@param target string Unit to check for combo points.
---@return number comboPoints Number of combo points (between 0 and MAX_COMBO_POINTS )
function GetComboPoints(unit, target) end

--- Returns the amount of time left until the player can recover their corpse. Applies to resurrection spells offered by other units, resurrecting by returning to the player's corpse as a ghost, and to resurrecting at a graveyard's spirit healer, if the player has recently died several times in short succession.
---@return number timeLeft Amount of time remaining before the player can resurrect (in seconds); 0 if the player can resurrect immediately
function GetCorpseRecoveryDelay() end

--- Returns the currently selected player title
---@return number currentTitle Index of the player's current title (between 1 and GetNumTitles() )
function GetCurrentTitle() end

--- Returns the number of available player titles. Includes all titles, not just those earned by the player
---@return number numTitles Number of available player titles
function GetNumTitles() end

--- Returns the title reward for the selected quest in the quest log. Returns nil if no title is awarded or if no quest is selected.
---@return string title Title to be awarded to the player upon completing the quest
function GetQuestLogRewardTitle() end

--- Returns the name of the player's realm (server name)
---@return string realm The name of the player's realm (server)
function GetRealmName() end

--- Returns the amount of time remaining until the player's spirit is automatically released when dead. Returns -1 if the player died in a dungeon or raid instance; in such cases, the player's spirit will not be released automatically (see RepopMe() to release manually).
---@return number timeleft Amount of time remaining until the player's spirit is automatically released to the nearest graveyard (in seconds)
function GetReleaseTimeRemaining() end

--- Returns the duration of resurrection sickness at the player's current level. Returns nil for players under level 10, who are allowed to resurrect at a spirit healer without suffering resurrection sickness.
---@return string resSicknessTime Text describing the duration of resurrection sickness were the player to resurrect at a spirit healer
function GetResSicknessDuration() end

--- Returns the player's current rest state
---@return any state Number identiying the current rest state ( number ) 1 - Rested 2 - Normal 3 - Tired - used in locales with account play time limits 4 - Unhealthy - used in locales with account play time limits
---@return string name Localized text describing the player's current rest state
---@return number multiplier Multiplier for experience points earned from kills
function GetRestState() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetTimeToWellRested() end

--- Returns the text of an available player title
---@param titleIndex number Index of a title available to the player (between 1 and GetNumTitles() )
---@return string titleName The text of the title
function GetTitleName(titleIndex) end

--- Returns the player's current pitch (slope or angle of movement). Only valid for the unitID "player". The slope returned here reflects only the direction of movement for swimming or flying, not the current orientation of the player model or camera. (When on solid ground, GetUnitPitch indicates what the angle of flight would be were the player to start flying.)
---@param unit string Unit to query; only valid for player
---@return number pitch Unit's slope of movement in radians
function GetUnitPitch(unit) end

--- Returns a unit's current speed. Valid for all observable units. Values returned indicate the current movement speed in yards per second. (It's not relative to facing or ground position; i.e. you won't see a smaller value when flying up at an angle or a negative value when backing up.) Does not indicate falling speed or the speed of boats, zeppelins, and some forms of quest-related transportation, but does indicate current speed on taxi flights and when moving due to combat effects such as Disengage, Death Grip, or various knockback abilities.
---@param unit any Unit to query
---@return number speed Unit's current speed in yards per second
function GetUnitSpeed(unit) end

--- Returns whether the player character can be controlled
---@return any hasControl 1 if the player character can be controlled (i.e. isn't feared, charmed, etc); otherwise nil
function HasFullControl() end

--- Returns whether the player has any keys stored in the Keyring container. Used in the default UI to show or hide the UI for the Keyring container
---@return any hasKey Returns 1 if the player has any keys stored in the Keyring container; otherwise nil
function HasKey() end

--- Returns whether the player can instantly resurrect in place. Only returns valid information while the player is dead and has not yet released his or her spirit to the graveyard.
---@return string text If the player can resurrect in place, the text to be displayed on the dialog button for such (e.g. "Use Soulstone", "Reincarnate"); otherwise nil
function HasSoulstone() end

--- Returns whether the player has a wand equipped
---@return any isEquipped 1 if a wand is equipped; otherwise nil
function HasWandEquipped() end

--- Returns whether the player is currently falling
---@return any falling 1 if the player is falling; otherwise nil
function IsFalling() end

--- Returns whether flight is allowed on the continent where the player is currently located
---@return any isFlyable 1 if the current area is a flyable area, otherwise nil
function IsFlyableArea() end

--- Returns whether the player is currently flying
---@return any isFlying 1 if the player is currently flying; otherwise nil
function IsFlying() end

--- Returns whether the player is currently indoors
---@return any inside 1 if the player is currently indoors; otherwise nil
function IsIndoors() end

--- Returns whether the player is mounted
---@return any mounted 1 if the player is mounted, otherwise nil
function IsMounted() end

--- Returns whether the player is currently outside the bounds of the world. Used in the default UI (in conjunction with IsFalling() ) to allow the player to release to a graveyard if the character has encountered a bug and fallen underneath the world geometry.
---@return any outOfBounds 1 if the player is currently outside the bounds of the world; otherwise nil
function IsOutOfBounds() end

--- Returns whether the player is currently outdoors. "Outdoors" as defined by this function corresponds to the ability to use a mount in that specific location, not necessarily whether there is a roof above the player character's head. For example, returns 1 in Ironforge, Undercity, and the Caverns of Time, but nil in the nominally outdoor areas of instances such as Stratholme, Drak'tharon Keep, and Hellfire Ramparts. (Note that even in "outdoor" areas, standing on top of certain objects may interfere with the player's ability to mount up.)
---@return any isOutdoors 1 if the player is currently outdoors; otherwise nil
function IsOutdoors() end

--- Returns whether the player is currently resting. Rest state is provided in Inns and major cities and allows the player to log out immediately (instead of after a brief delay) and accrue bonus XP to be awarded for kills.
---@return boolean resting 1 if the player is resting; otherwise nil
function IsResting() end

--- Returns whether the player is currently stealthed
---@return any stealthed 1 if rogue Stealth, druid cat form Prowl, or a similar ability is active on the player; otherwise nil
function IsStealthed() end

--- Returns whether the player is currently swimming. "Swimming" as defined by this function corresponds to the ability to use swimming abilities (such as druid Aquatic Form) or inability to use land-restricted abilities (such as eating or summoning a flying mount), not necessarily to whether the player is in water.
---@return any isSwimming 1 if the player is currently swimming; otherwise nil
function IsSwimming() end

--- Returns whether the player has earned the ability to display a title
---@param titleIndex number Index of a title available to the player (between 1 and GetNumTitles() )
---@return any isKnown 1 if the player has earned the ability to display the title; otherwise nil
function IsTitleKnown(titleIndex) end

--- Returns whether the player has an equipped weapon in the off hand slot
---@return any hasWeapon 1 if the player has a weapon equipped in the off hand slot; otherwise nil
function OffhandHasWeapon() end

--- Releases the player's spirit to the nearest graveyard. Only has effect if the player is dead.
function RepopMe() end

--- Returns the name of a unit offering to resurrect the player.
---@return string name Name of the unit offering resurrection
function ResurrectGetOfferer() end

--- Returns whether accepting an offered resurrection spell will cause the player to suffer Resurrection Sickness. Usable following the RESURRECT_REQUEST event which fires when the player is offered resurrection by another unit.
---@return any hasSickness 1 if accepting resurrection will cause Resurrection Sickness; otherwise nil
function ResurrectHasSickness() end

--- Returns whether the player must wait before resurrecting. Applies to resurrection spells offered by other units, resurrecting by returning to the player's corpse as a ghost, and to resurrecting at a graveyard's spirit healer, if the player has recently died several times in short succession. See GetCorpseRecoveryDelay() for the time remaining until the player can resurrect.
---@return any hasTimer 1 if the player must wait before resurrecting; otherwise nil
function ResurrectHasTimer() end

--- Confirms resurrection by returning to the player's corpse
function RetrieveCorpse() end

--- Changes a player's displayed title
---@param titleIndex number Index of a title available to the player (between 1 and GetNumTitles() ), or -1 to show no title
function SetCurrentTitle(titleIndex) end

--- Enables or disables display of the player's cloak. Only affects the player's appearance; does not change the other effects of having the cloak equipped. Determines not only the appearance of the player character on the local client, but the way other players see the character as well.
---@param show any 1 to display the player's cloak; nil to hide it
function ShowCloak(show) end

--- Enables or disables display of the player's headgear. Only affects the player's appearance; does not change the other effects of having the headgear equipped. Determines not only the appearance of the player character on the local client, but the way other players see the character as well.
---@param show any 1 to display the player's headgear; nil to hide it
function ShowHelm(show) end

--- Returns whether the player's cloak is displayed. Determines not only the appearance of the player character on the local client, but the way other players see the character as well.
---@return any isShown 1 if the player's cloak is shown; otherwise nil
function ShowingCloak() end

--- Returns whether the player's headgear is displayed. Determines not only the appearance of the player character on the local client, but the way other players see the character as well.
---@return any isShown 1 if the player's headgear is shown; otherwise nil
function ShowingHelm() end

--- Sheaths or unsheaths the player character's hand-held items. Calling repeatedly will cause the player character to draw his or her melee weapons, followed by his or her range weapon, followed by hiding all weapons.
function ToggleSheath() end

--- Returns the player's number of unused talent points and profession slots
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/UnitCharacterPoints
function UnitCharacterPoints() end

--- Instantly resurrects the player in place, if possible. Usable if the player is dead (and has not yet released his or her spirit to the graveyard) and has the ability to instantly resurrect (provided by a Warlock's Soulstone or a Shaman's Reincarnation passive ability).
function UseSoulstone() end
