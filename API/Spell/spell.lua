--==============================
-- Spell functions
--==============================

--- Casts a from the spellbook. Only protected (i.e. usable only by the Blizzard UI) if the given id corresponds to a spell which can be cast (not a passive spell) and is not a trade skill; can be used by addons to cast the "spells" that open trade skill windows.
--- Flags: protected
---@param id number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
function CastSpell(id, bookType) end

--- Casts a spell specified by id (optionally on a specified unit). Only protected (i.e. usable only by the Blizzard UI) if the given spell is castable (not passive) and is not a trade skill; can be used by addons to cast the "spells" that open trade skill windows.
--- Flags: protected
---@param spellID number ID of the spell to cast
---@param target string A unit to target with the spell
function CastSpellByID(spellID, target) end

--- Casts a spell specified by name (optionally on a specified unit). Only protected (i.e. usable only by the Blizzard UI) if the given spell is castable (not passive) and is not a trade skill; can be used by addons to cast the "spells" that open trade skill windows.
--- Flags: protected
---@param name string Name of a spell to cast
---@param target string A unit to target with the spell
function CastSpellByName(name, target) end

--- Returns the spellbook slot for the player's highest known rank of a spell
---@param slot number Spellbook slot index of a known spell
---@return number maxRankSlot Spellbook slot index of the highest rank of that spell known to the player
function GetKnownSlotFromHighestRankSlot(slot) end

--- Returns the number of tabs in the player's spellbook
---@return number numTabs Number of spellbook tabs
function GetNumSpellTabs() end

--- Returns information about automatic casting for a spell in the spellbook. Generally, only certain pet spells can be autocast.
---@param id number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@return any autocastAllowed 1 if automatic casting is allowed for the action; otherwise nil
---@return any autocastEnabled 1 if automatic casting is currently turned on for the action; otherwise nil
function GetSpellAutocast(id, bookType) end

--- Returns cooldown information about a spell in the spellbook
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@param id number Numeric ID of a spell
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the spell is ready
---@return number duration The length of the cooldown, or 0 if the spell is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the spell is ready.)
function GetSpellCooldown(index, bookType, name, id) end

--- Returns the number of times a spell can be cast. Generally used for spells whose casting is limited by the number of item reagents in the player's possession.
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return number numCasts Number of times the spell can be cast, or 0 if unlimited
function GetSpellCount(index, bookType, name) end

--- Returns information about a spell
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell, optionally including secondary text (e.g. "Mana Burn" to find the player's highest rank, or "Mana Burn(Rank 2)" -- no space before the parenthesis -- for a specific rank)
---@param id number Numeric ID of a spell
---@return string name Name of the spell
---@return string rank Secondary text associated with the spell (e.g."Rank 5", "Racial", etc.)
---@return string icon Path to an icon texture for the spell
---@return number powerCost Amount of mana, rage, energy, runic power, or focus required to cast the spell
---@return boolean isFunnel True for spells with health funneling effects (like Health Funnel)
---@return any powerType Power type to cast the spell ( number ) -2 - Health 0 - Mana 1 - Rage 2 - Focus 3 - Energy 5 - Runes 6 - Runic Power
---@return number castingTime Casting time of the spell in milliseconds
---@return number minRange Minimum range from the target required to cast the spell
---@return number maxRange Maximum range from the target at which you can cast the spell
function GetSpellInfo(index, bookType, name, id) end

--- This function or event no longer exists in version 6.0.2 (19034) of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param id number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@return string spellName Localized name of the spell
---@return string subSpellName Secondary text associated with the spell (e.g. "Rank 5", "Racial Passive",  "Artisan")
function GetSpellName(id, bookType) end

--- Returns information about a tab in the spellbook
---@param index number Index of a spellbook tab (between 1 and GetNumSpellTabs() )
---@return string name Name of the spellbook tab
---@return string texture Path to an icon texture for the spellbook tab
---@return number offset spellbookID of the first spell to be listed under the tab
---@return number numSpells Number of spells listed under the tab
function GetSpellTabInfo(index) end

--- Returns the icon texture path for a spell
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return string texture Path to an icon texture for the spell
function GetSpellTexture(index, bookType, name) end

--- Returns whether a spell is the standard melee Attack spell
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isAttack 1 if the spell enables/disables melee auto-attack; otherwise nil
function IsAttackSpell(index, bookType, name) end

--- Returns whether a spell is an automatically repeating spell
---@param spellName string The name of the spell to query
---@return any isAutoRepeat If the spell is an auto-repeating spell
function IsAutoRepeatSpell(spellName) end

--- Returns whether casting a spell consumes a reagent item
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isConsumable 1 if casting the spell consumes a reagent item; otherwise nil
function IsConsumableSpell(index, bookType, name) end

--- Returns whether a spell is currently being used
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isCurrent 1 if the spell is currently being cast, is waiting for the user to choose a target, is a repeating spell which is currently repeating, or is the open trade skill; otherwise nil
function IsCurrentSpell(index, bookType, name) end

--- Returns whether a spell can be used against hostile units
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isHarmful 1 if the spell can be used against hostile units; otherwise nil
function IsHarmfulSpell(index, bookType, name) end

--- Returns whether an item can be used on the player or friendly units
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isHarmful 1 if the spell can be used on the player or friendly units; otherwise nil
function IsHelpfulSpell(index, bookType, name) end

--- Returns whether a spell is passive (cannot be cast)
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isPassive 1 if the spell is passive; otherwise nil
function IsPassiveSpell(index, bookType, name) end

--- Returns whether a spell is currently selected in the spellbook
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/IsSelectedSpell
function IsSelectedSpell() end

--- Returns whether the player is in range to cast a spell on a unit
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@param unit string A unit to target with the spell
---@return any inRange 1 if the player is near enough to cast the spell on the unit; 0 if not in range; nil if the unit is not a valid target for the spell
function IsSpellInRange(index, bookType, name, unit) end

--- Returns whether the player (or pet) knows a spell
---@param spellID number Numeric ID of a spell
---@param isPet boolean True to check only spells known to the player's pet; false or omitted to check only spells known to the player
---@return boolean isKnown True if the player (or pet) knows the given spell; false otherwise
function IsSpellKnown(spellID, isPet) end

--- Returns whether or not a given spell is usable or cannot be used due to lack of mana. Does not account for spell cooldowns (see GetSpellCooldown() -- returns 1 if other conditions allow for casting the spell (e.g. if the spell can only be cast while outdoors).
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any isUsable 1 if the spell is castable; otherwise nil
---@return any notEnoughMana 1 if the player lacks the resources (e.g. mana, energy, runes) to cast the spell; otherwise nil
function IsUsableSpell(index, bookType, name) end

--- Returns whether the spell currently awaiting a target can target a given unit. Only applies when the player has attempted to cast a spell but the spell requires a target before it can begin casting (i.e. the glowing hand cursor is showing).
---@param unit string A unit to target
---@param name string The name of a unit to target; only valid for player , pet , and party/raid members
---@return any canTarget 1 if the spell currently awaiting targeting can target the given unit
function SpellCanTargetUnit(unit, name) end

--- Returns whether an item has a range limitation for its use. For example: Shadowbolt can only be used on a unit within a given range of the player; Ritual of Summoning requires a target but has no range restriction; Fel Armor has no target and thus no range restriction.
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
---@return any hasRange 1 if the spell has an effective range; otherwise nil.
function SpellHasRange(index, bookType, name) end

--- Returns whether a spell is currently awaiting a target
---@return any isTargeting 1 if a spell is currently awaiting a target; otherwise nil
function SpellIsTargeting() end

--- Stops casting or targeting the spell in progress
--- Flags: protected
function SpellStopCasting() end

--- Cancels the spell currently awaiting a target. When auto-self cast is not enabled and the player casts a spell that requires a target, the cursor changes to a glowing hand so the user can select a target. This function cancels targeting mode so the player can cast another spell.
--- Flags: protected
function SpellStopTargeting() end

--- Casts the spell currently awaiting a target on a unit
--- Flags: protected
---@param unit string A unit to target
---@param name string The name of a unit to target; only valid for player , pet , and party/raid members
function SpellTargetUnit(unit, name) end

--- Enables or disables automatic casting of a spell. Generally only pet spells can be autocast.
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell
function ToggleSpellAutocast(index, bookType, name) end

--- Returns information about the spell a unit is currently casting
---@param unit string A unit to query
---@return string name Name of the spell being cast
---@return string subText Secondary text associated with the spell (e.g."Rank 5", "Racial", etc.)
---@return string text Text to be displayed on a casting bar
---@return string texture Path to an icon texture for the spell
---@return number startTime Time at which the cast was started (in milliseconds; can be compared to GetTime() * 1000 )
---@return number endTime Time at which the cast will finish (in milliseconds; can be compared to GetTime() * 1000 )
---@return any isTradeSkill 1 if the spell being cast is a trade skill recipe; otherwise nil
---@return number castID Reference number for this spell; matches the 4th argument of UNIT_SPELLCAST_* events for the same spellcast
---@return any notInterruptible 1 if the spell can be interrupted; otherwise nil. See the UNIT_SPELLCAST_NOT_INTERRUPTIBLE and UNIT_SPELLCAST_INTERRUPTIBLE events for changes to this status.
function UnitCastingInfo(unit) end

--- Returns information about the spell a unit is currently channeling
---@param unit string A unit to query
---@return string name Name of the spell being cast
---@return string subText Secondary text associated with the spell (e.g."Rank 5", "Racial", etc.)
---@return string text Text to be displayed on a casting bar
---@return string texture Path to an icon texture for the spell
---@return number startTime Time at which the cast was started (in milliseconds; can be compared to GetTime() * 1000 )
---@return number endTime Time at which the cast will finish (in milliseconds; can be compared to GetTime() * 1000 )
---@return any isTradeSkill 1 if the spell being cast is a trade skill recipe; otherwise nil
---@return boolean notInterruptible Indicates that the spell cannot be interrupted, UNIT_SPELLCAST_NOT_INTERRUPTIBLE and UNIT_SPELLCAST_INTERRUPTIBLE are fired to indicate changes in the interruptible status.
function UnitChannelInfo(unit) end

--- Requests spellbook information from the server server
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/UpdateSpells
function UpdateSpells() end
