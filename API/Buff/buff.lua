--==============================
-- Buff functions
--==============================

--- Cancels a temporary weapon enchant
---@param slot number 1 to cancel the mainhand item enchant, 2 to cancel the offhand item enchant
function CancelItemTempEnchantment(slot) end

--- Cancels the current shapeshift form. Unlike other Shapeshift APIs, this function refers specifically to shapeshifting -- therefore including some abilities not found on the default UI's ShapeshiftBar and excluding some which are. For example, cancels shaman Ghost Wolf form and druid shapeshifts but not warrior stances, paladin auras, or rogue stealth.
function CancelShapeshiftForm() end

--- Cancels a buff on the player
---@param unit string A unit to query (only valid for 'player')
---@param index number Index of an aura to query
---@param name string Name of an aura to query
---@param rank string Secondary text of an aura to query (often a rank; e.g. "Rank 7")
---@param filter any A list of filters to use separated by the pipe '|' character; e.g. "RAID|PLAYER" will query group buffs cast by the player ( string ) CANCELABLE - Query auras that can be cancelled HARMFUL - Query debuffs only HELPFUL - Query buffs only NOT_CANCELABLE - Query auras that cannot be cancelled PLAYER - Query auras the player has cast RAID - Query auras the player can cast on party/raid members
function CancelUnitBuff(unit, index, name, rank, filter) end

--- Returns information about temporary enchantments on the player's weapons. Does not return information about permanent enchantments added via Enchanting, Runeforging, etc; refers instead to temporary buffs such as wizard oils, sharpening stones, rogue poisons, and shaman weapon enhancements.
---@return any hasMainHandEnchant 1 if the main hand weapon has a temporary enchant
---@return number mainHandExpiration The time until the enchant expires, in milliseconds
---@return number mainHandCharges The number of charges left on the enchantment
---@return any hasOffHandEnchant 1 if the offhand weapon has a temporary enchant
---@return number offHandExpiration The time until the enchant expires, in milliseconds
---@return number offHandCharges The number of charges left on the enchantment
function GetWeaponEnchantInfo() end

--- Returns information about buffs/debuffs on a unit
---@param unit string A unit to query
---@param index number Index of an aura to query
---@param name string Name of an aura to query
---@param rank string Secondary text of an aura to query (often a rank; e.g. "Rank 7")
---@param filter any A list of filters to use separated by the pipe '|' character; e.g. "RAID|PLAYER" will query group buffs cast by the player ( string ) CANCELABLE - Show auras that can be cancelled HARMFUL - Show debuffs only HELPFUL - Show buffs only NOT_CANCELABLE - Show auras that cannot be cancelled PLAYER - Show auras the player has cast RAID - When used with a HELPFUL filter it will show auras the player can cast on party/raid members (as opposed to self buffs). If used with a HARMFUL filter it will return debuffs the player can cure
---@return string name Name of the aura
---@return string rank Secondary text for the aura (often a rank; e.g. "Rank 7")
---@return string icon Path to an icon texture for the aura
---@return number count The number of times the aura has been applied
---@return any dispelType Type of aura (relevant for dispelling and certain other mechanics); nil if not one of the following values: ( string ) Curse Disease Magic Poison
---@return number duration Total duration of the aura (in seconds)
---@return number expires Time at which the aura will expire; can be compared to GetTime() to determine time remaining
---@return string caster Unit which applied the aura. If the aura was applied by a unit that does not have a token but is controlled by one that does (e.g. a totem or another player's vehicle), returns the controlling unit. Returns nil if the casting unit (or its controller) has no unitID.
---@return any isStealable 1 if the aura can be transferred to a player using the Spellsteal spell; otherwise nil
---@return any shouldConsolidate 1 if the aura is eligible for the 'consolidated' aura display in the default UI.
---@return number spellID spellID of the aura
function UnitAura(unit, index, name, rank, filter) end

--- Returns information about a buff on a given unit or player. This function is an alias for UnitAura() with a built-in HELPFUL filter (which cannot be removed or negated with the HARMFUL filter).
---@param unit string A unit to query
---@param index number Index of an aura to query
---@param name string Name of an aura to query
---@param rank string Secondary text of an aura to query (often a rank; e.g. "Rank 7")
---@param filter any A list of filters to use separated by the pipe '|' character; e.g. "RAID|PLAYER" will query group buffs cast by the player ( string ) CANCELABLE - Show auras that can be cancelled NOT_CANCELABLE - Show auras that cannot be cancelled PLAYER - Show auras the player has cast RAID - Show auras the player can cast on party/raid members
---@return string name Name of the aura
---@return string rank Secondary text for the aura (often a rank; e.g. "Rank 7")
---@return string icon Path to an icon texture for the aura
---@return number count The number of times the aura has been applied
---@return any dispelType Type of aura (relevant for dispelling and certain other mechanics); nil if not one of the following values: ( string ) Curse Disease Magic Poison
---@return number duration Total duration of the aura (in seconds)
---@return number expires Time at which the aura will expire; can be compared to <a href='/docs/api/GetTime'>GetTime()</a> to determine time remaining
---@return string caster Unit which applied the aura. If the aura was applied by a unit that does not have a token but is controlled by one that does (e.g. a totem or another player's vehicle), returns the controlling unit. Returns nil if the casting unit (or its controller) has no unitID.
---@return any isStealable 1 if the aura can be transferred to a player using the Spellsteal spell; otherwise nil
function UnitBuff(unit, index, name, rank, filter) end

--- Returns information about a debuff on a unit. This function is an alias for UnitAura() with a built-in HARMFUL filter (which cannot be removed or negated with the HELPFUL filter).
---@param unit string A unit to query
---@param index number Index of an aura to query
---@param name string Name of an aura to query
---@param rank string Secondary text of an aura to query (often a rank; e.g. "Rank 7")
---@param filter any A list of filters to use separated by the pipe '|' character; e.g. "CANCELABLE|PLAYER" will query cancelable debuffs cast by the player ( string ) CANCELABLE - Show auras that can be cancelled NOT_CANCELABLE - Show auras that cannot be cancelled PLAYER - Show auras the player has cast RAID - Show auras the player can cast on party/raid members
---@return string name Name of the aura
---@return string rank Secondary text for the aura (often a rank; e.g. "Rank 7")
---@return string icon Path to an icon texture for the aura
---@return number count The number of times the aura has been applied
---@return any dispelType Type of aura (relevant for dispelling and certain other mechanics); nil if not one of the following values: ( string ) Curse Disease Magic Poison
---@return number duration Total duration of the aura (in seconds)
---@return number expires Time at which the aura will expire; can be compared to GetTime() to determine time remaining
---@return string caster Unit which applied the aura. If the aura was applied by a unit that does not have a token but is controlled by one that does (e.g. a totem or another player's vehicle), returns the controlling unit. Returns nil if the casting unit (or its controller) has no unitID.
---@return any isStealable 1 if the aura can be transferred to a player using the Spellsteal spell; otherwise nil
function UnitDebuff(unit, index, name, rank, filter) end
