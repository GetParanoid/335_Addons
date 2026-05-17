--==============================
-- Pet functions
--==============================

--- Disables automatic casting of a pet spell
---@param spell string The name of a pet spell
function DisableSpellAutocast(spell) end

--- Enables automatic casting of a pet spell
---@param spell string Name of a pet spell
function EnableSpellAutocast(spell) end

--- Returns information about experience points for the player's pet
---@return number currXP The pet's current amount of experience points
---@return number nextXP Total amount of experience points required for the pet to gain a level
function GetPetExperience() end

--- Returns a list of the food types the player's pet will eat
function GetPetFoodTypes() end

--- Returns information about the player's pet's happiness
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetPetHappiness
function GetPetHappiness() end

--- Returns an icon representing the current pet. Used in the default Pet Stables and Talent UIs for hunter pets; returns nil for other pets.
---@return string texture Path to an icon texture for the pet
function GetPetIcon() end

--- Returns the name of the talent tree used by the player's current pet. Hunter pets use one of three different talent trees according to pet type. Returns nil if the player does not have a pet or the player's current pet does not use talents (i.e. warlock pets, quest pets, etc.)
---@return string talent Localized name of the pet's talent tree
function GetPetTalentTree() end

--- Returns the time remaining before a temporary pet is automatically dismissed. Temporary pets include priests' Shadowfriend, mages' Water Elemental, and various quest-related pets.
---@return number petTimeRemaining Amount of time remaining until the temporary pet is automatically dismissed (in seconds), or nil if the player does not have a temporary pet
function GetPetTimeRemaining() end

--- Returns whether the player's current pet has a spellbook
---@return any hasPetSpells 1 if the player currently has an active pet with spells/abilities; otherwise nil
---@return any petType Non-localized token identifying the type of pet ( string ) DEMON - A warlock's demonic minion PET - A hunter's beast
function HasPetSpells() end

--- Returns whether the pet UI should be displayed for the player's pet. Special quest-related pets, vehicles, and possessed units all count as pets but do not use the pet UI or associated functions.
---@return any hasPetUI 1 if the pet UI should be displayed for the player's pet
---@return any isHunterPet 1 if the player's pet is a hunter pet
function HasPetUI() end

--- Returns whether the pet's attack action is currently active
---@return any isActive 1 if the pet's attack action is currently active; otherwise nil
function IsPetAttackActive() end

--- Releases the player's pet. For Hunter pets, this function sends the pet away, never to return (in the default UI, it's called when accepting the "Are you sure you want to permanently abandon your pet?" dialog). For other pets, this function is equivalent to PetDismiss() .
--- Flags: confirmation
function PetAbandon() end

--- Enables aggressive mode for the player's pet. In this mode, the pet automatically attacks any nearby hostile targets.
--- Flags: protected
function PetAggressiveMode() end

--- Instructs the pet to attack. The pet will attack the player's current target if no unit is specified.
--- Flags: protected
---@param unit string A unit to attack
---@param name string The name of a unit to attack
function PetAttack(unit, name) end

--- Returns whether the player's pet can be abandoned. Only Hunter pets can be permanently abandoned.
---@return any canAbandon 1 if the player's pet can be abandoned, otherwise nil
function PetCanBeAbandoned() end

--- Returns whether a Dismiss Pet command should be available for the player's pet. Returns 1 for hunter pets even though they use the Dismiss Pet (cast) spell instead of a Dismiss Pet (instant) command; the value of PetCanBeAbandoned() overrides this in causing the default UI to hide the command. Currently unused, but may be used in the future for other pets.
---@return any canDismiss 1 if a Dismiss Pet command should be available for the player's pet; otherwise nil
function PetCanBeDismissed() end

--- Returns whether the player's pet can be renamed. Only hunter pets can be renamed, and only once (barring use of a Certificate of Ownership ).
---@return any canRename 1 if the player can rename the currently controlled pet, otherwise nil
function PetCanBeRenamed() end

--- Enables defensive mode for the player's pet. In this mode, the pet automatically attacks only units which attack it or the player or units the player is attacking.
--- Flags: protected
function PetDefensiveMode() end

--- Dismisses the currently controlled pet. Used for dismissing Warlock pets, Mind Control targets, etc. Has no effect for Hunter pets, which can only be dismissed using the Dismiss Pet spell.
function PetDismiss() end

--- Instructs the pet to follow the player. If the pet is currently attacking a target, the pet will stop attacking.
--- Flags: protected
function PetFollow() end

--- Returns whether the player's current pet has an action bar
---@return any hasActionBar Returns 1 if the player's pet has an action bar; otherwise nil
function PetHasActionBar() end

--- Enables passive mode for the player's pet. In this mode, the pet will not automatically attack any target.
--- Flags: protected
function PetPassiveMode() end

--- Renames the currently controlled pet. Only Hunter pets can be renamed, and a given pet can only be renamed once (barring use of a Certificate of Ownership ).
---@param name string New name for the pet (nominative form on Russian clients)
---@param genitive string Genitive form of the pet's new name; applies only on Russian clients
---@param dative string Dative form of the pet's new name; applies only on Russian clients
---@param accusative string Accusative form of the pet's new name; applies only on Russian clients
---@param instrumental string Instrumental form of the pet's new name; applies only on Russian clients
---@param prepositional string Prepositional form of the pet's new name; applies only on Russian clients
function PetRename(name, genitive, dative, accusative, instrumental, prepositional) end

--- Instructs the pet to stop attacking
--- Flags: protected
function PetStopAttack() end

--- Instructs the pet to stay at its current location. If the pet is currently attacking a target, the pet will stop attacking.
--- Flags: protected
function PetWait() end
