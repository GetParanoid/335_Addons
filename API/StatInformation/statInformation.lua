--==============================
-- Stat information functions
--==============================

--- Returns the percentage of enemy armor ignored due to the player's Armor Penetration Rating
---@return number amount Percentage of enemy armor ignored due to the player's Armor Penetration Rating
function GetArmorPenetration() end

--- Returns the attack power bonus provided by one of the player's basic statistics
---@param statIndex any Index of a basic statistic ( number ) 1 - Strength 2 - Agility 3 - Stamina 4 - Intellect 5 - Spirit
---@param effectiveStat number Value of the statistic to use in attack power calculation
---@return number attackPower Attack power bonus provided to the player by the basic statistic value
function GetAttackPowerForStat(statIndex, effectiveStat) end

--- Returns the player's percentage chance to block with a shield
---@return number chance Percentage chance to block
function GetBlockChance() end

--- Returns the value of a combat rating for the player
---@param ratingIndex any Index of a rating; the following global constants are provided for convenience ( number ) CR_BLOCK - Block skill CR_CRIT_MELEE - Melee critical strike chance CR_CRIT_RANGED - Ranged critical strike chance CR_CRIT_SPELL - Spell critical strike chance CR_CRIT_TAKEN_MELEE - Melee Resilience CR_CRIT_TAKEN_RANGED - Ranged Resilience CR_CRIT_TAKEN_SPELL - Spell Resilience CR_DEFENSE_SKILL - Defense skill CR_DODGE - Dodge skill CR_HASTE_MELEE - Melee haste CR_HASTE_RANGED - Ranged haste CR_HASTE_SPELL - Spell haste CR_HIT_MELEE - Melee chance to hit CR_HIT_RANGED - Ranged chance to hit CR_HIT_SPELL - Spell chance to hit CR_HIT_TAKEN_MELEE - Unused CR_HIT_TAKEN_RANGED - Unused CR_HIT_TAKEN_SPELL - Unused CR_PARRY - Parry skill CR_WEAPON_SKILL - Weapon skill CR_WEAPON_SKILL_MAINHAND - Main-hand weapon skill CR_WEAPON_SKILL_OFFHAND - Offhand weapon skill CR_WEAPON_SKILL_RANGED - Ranged weapon skill
---@return number rating Value of the rating for the player
function GetCombatRating(ratingIndex) end

--- Returns the percentage effect for the player's current value of a given combat rating. Used in the default UI to show tooltips with actual percentage effects (such as increased parry chance or reduced critical strike damage taken) when mousing over rating information in the Character window.
---@param ratingIndex any Index of a rating; the following global constants are provided for convenience ( number ) CR_BLOCK - Block skill CR_CRIT_MELEE - Melee critical strike chance CR_CRIT_RANGED - Ranged critical strike chance CR_CRIT_SPELL - Spell critical strike chance CR_CRIT_TAKEN_MELEE - Melee Resilience CR_CRIT_TAKEN_RANGED - Ranged Resilience CR_CRIT_TAKEN_SPELL - Spell Resilience CR_DEFENSE_SKILL - Defense skill CR_DODGE - Dodge skill CR_HASTE_MELEE - Melee haste CR_HASTE_RANGED - Ranged haste CR_HASTE_SPELL - Spell haste CR_HIT_MELEE - Melee chance to hit CR_HIT_RANGED - Ranged chance to hit CR_HIT_SPELL - Spell chance to hit CR_HIT_TAKEN_MELEE - Unused CR_HIT_TAKEN_RANGED - Unused CR_HIT_TAKEN_SPELL - Unused CR_PARRY - Parry skill CR_WEAPON_SKILL - Weapon skill CR_WEAPON_SKILL_MAINHAND - Main-hand weapon skill CR_WEAPON_SKILL_OFFHAND - Offhand weapon skill CR_WEAPON_SKILL_RANGED - Ranged weapon skill
---@return number ratingBonus Percentage change in the underlying statistic or mechanic conferred by the player's rating value
function GetCombatRatingBonus(ratingIndex) end

--- Returns the player's melee critical strike chance
---@return number critChance The player's percentage critical strike chance for melee attacks
function GetCritChance() end

--- Returns additional critical strike chance provided by Agility
---@param unit string A unit to query; only valid for player and pet , defaults to player if omitted
---@return number critChance Additional percentage chance of critical strikes conferred by the unit's Agility statistic
function GetCritChanceFromAgility(unit) end

--- This function or event no longer exists in version 6.0.2 (19034) of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@return any bonusStat Index of the basic statistic which provides attack  ( number ) 1 - Strength (Druids, Mages, Paladins, Priests, Shamans, Warlocks and Warriors) 2 - Agility
function GetDamageBonusStat() end

--- Returns the player's chance to dodge melee attacks
---@return number chance Percentage chance to dodge melee attacks
function GetDodgeChance() end

--- Returns the player's current expertise value
---@return number expertise The player's expertise value
function GetExpertise() end

--- Returns the reduction in chance to be dodged or parried conferred by the player's expertise value
---@return number expertisePerc Reduction in percentage chance for main hand attacks to be dodged or parried
---@return number offhandExpertisePercent Reduction in percentage chance for off hand attacks to be dodged or parried
function GetExpertisePercent() end

--- Returns information about the player's mana regeneration rate
---@return number base Amount of mana regenerated per second while not casting
---@return number casting Amount of mana regenerated per second while casting
function GetManaRegen() end

--- Returns the maximum possible percentage bonus for a given combat rating.
---@param ratingIndex any Which rating to query; the following global constants can be used for standard values: ( number ) CR_BLOCK - Block skill CR_CRIT_MELEE - Melee critical strike chance CR_CRIT_RANGED - Ranged critical strike chance CR_CRIT_SPELL - Spell critical strike chance CR_CRIT_TAKEN_MELEE - Resilience (as applied to melee attacks) CR_CRIT_TAKEN_RANGED - Resilience (as applied to ranged attacks) CR_CRIT_TAKEN_SPELL - Resilience (as applied to spell effects CR_DEFENSE_SKILL - Defense skill CR_DODGE - Dodge skill CR_HASTE_MELEE - Melee haste CR_HASTE_RANGED - Ranged haste CR_HASTE_SPELL - Spell haste CR_HIT_MELEE - Melee chance to hit CR_HIT_RANGED - Ranged chance to hit CR_HIT_SPELL - Spell chance to hit CR_HIT_TAKEN_MELEE - Unused CR_HIT_TAKEN_RANGED - Unused CR_HIT_TAKEN_SPELL - Unused CR_PARRY - Parry skill CR_WEAPON_SKILL - Weapon skill CR_WEAPON_SKILL_MAINHAND - Main-hand weapon skill CR_WEAPON_SKILL_OFFHAND - Offhand weapon skill CR_WEAPON_SKILL_RANGED - Ranged weapon skill
---@return number max The maximum possible percentage bonus for the given rating
function GetMaxCombatRatingBonus(ratingIndex) end

--- Returns the player's parry chance
---@return number chance The player's percentage chance to parry melee attacks
function GetParryChance() end

--- Returns information about the player's mana/energy/etc regeneration rate. Contexts for inactiveRegen and activeRegen vary by power type.
---@return number inactiveRegen Power change per second while inactive
---@return number activeRegen Power change per second while active
function GetPowerRegen() end

--- Returns the player's ranged critical strike chance
---@return number critChance The player's percentage critical strike chance for ranged attacks
function GetRangedCritChance() end

--- Returns the amount of damage prevented when the player blocks with a shield
---@return number damage The amount of damage prevented when the player blocks with a shield
function GetShieldBlock() end

--- Returns the player's spell damage bonus for a spell school
---@param school any Index of a spell school ( number ) 1 - Physical 2 - Holy 3 - Fire 4 - Nature 5 - Frost 6 - Shadow 7 - Arcane
---@return number minModifier The player's spell damage bonus for the given school
function GetSpellBonusDamage(school) end

--- Returns the player's amount of bonus healing
---@return number bonusHealing Amount of bonus healing
function GetSpellBonusHealing() end

--- Returns the player's spell critical strike chance for a spell school
---@param school any Index of a spell school ( number ) 1 - Physical 2 - Holy 3 - Fire 4 - Nature 5 - Frost 6 - Shadow 7 - Arcane
---@return number minCrit The player's percentage critical strike chance for spells from the given school
function GetSpellCritChance(school) end

--- Returns additional spell critical strike chance provided by Intellect
---@param unit string A unit to query; only valid for player and pet , defaults to player if omitted
---@return number critChance Additional percentage chance of spell critical strikes conferred by the unit's Intellect statistic
function GetSpellCritChanceFromIntellect(unit) end

--- Returns the amount of enemy magic resistance ignored due to the player's Spell Penetration Rating
---@return number penetration Amount of enemy magic resistance ignored due to the player's Spell Penetration Rating
function GetSpellPenetration() end

--- Returns the health modifier for the player's pet
---@param unit string A unit to query; only valid for pet
---@return number modifier Factor modifying the unit's health value
function GetUnitHealthModifier(unit) end

--- This function or event no longer exists in version 6.0.2 (19034) of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param unit string A unit to query; only valid for player or pet
---@return number regen Increase in non-combat health regeneration per second provided by Spirit
function GetUnitHealthRegenRateFromSpirit(unit) end

--- Returns the increase in mana regeneration rate provided by Spirit
---@param unit string A unit to query; only valid for player or pet
---@return number regen Increase in inactive (non-casting) mana regeneration per second provided by Spirit
function GetUnitManaRegenRateFromSpirit(unit) end

--- Returns the maximum health modifier for the player's pet
---@param unit string A unit to query; only valid for pet
---@return number modifier Factor modifying the unit's maximum health value
function GetUnitMaxHealthModifier(unit) end

--- Returns the mana modifier for the player's pet
---@param unit string A unit to query; only valid for pet
---@return number modifier Factor modifying the unit's mana value
function GetUnitPowerModifier(unit) end

--- Returns the player's or pet's armor value
---@param unit string A unit to query; only valid for player or pet
---@return number base The unit's base armor value
---@return number effectiveArmor The unit's effective armor value
---@return number armor The unit's current armor value
---@return number posBuff Positive modifiers to armor value
---@return number negBuff Negative modifiers to armor value
function UnitArmor(unit) end

--- Returns information about the player's or pet's weapon skill
---@param unit string A unit to query; only valid for player or pet
---@return number mainHandAttackBase The unit's base weapon skill for the main hand weapon
---@return number mainHandAttackMod Temporary modifiers to main hand weapon skill
---@return number offHandHandAttackBase The unit's base weapon skill for the off hand weapon
---@return number offHandAttackMod Temporary modifiers to off hand weapon skill
function UnitAttackBothHands(unit) end

--- Returns the player's or pet's melee attack power
---@param unit string A unit to query; only valid for player or pet
---@return number base The unit's ase attack power
---@return number posBuff Total effect of positive buffs to attack power
---@return number negBuff Total effect of negative buffs to attack power
function UnitAttackPower(unit) end

--- Returns information about the unit's melee attack speed
---@param unit string A unit to query
---@return number speed Current speed of the unit's main hand attack (number of seconds per attack)
---@return number offhandSpeed Current speed of the unit's off hand attack (number of seconds per attack)
function UnitAttackSpeed(unit) end

--- Returns information about the player's or pet's melee attack damage
---@param unit string A unit to query; only valid for player or pet
---@return number minDamage The unit's minimum melee damage
---@return number maxDamage The unit's maximum melee damage
---@return number minOffHandDamage The unit's minimum offhand melee damage
---@return number maxOffHandDamage The unit's maximum offhand melee damage
---@return number physicalBonusPos Positive physical bonus (should be >= 0)
---@return number physicalBonusNeg Negative physical bonus (should be <= 0)
---@return number percent Factor by which damage output is multiplied due to buffs/debuffs
function UnitDamage(unit) end

--- Returns the player's or pet's Defense skill
---@param unit string A unit to query; only valid for player or pet
---@return number base The unit's base defense skill
---@return number modifier Temporary modifiers to defense skill
function UnitDefense(unit) end

--- Returns information about the player's or pet's ranged weapon skill
---@param unit string A unit to query; only valid for player or pet
---@return number rangedAttackBase The unit's base ranged weapon skill
---@return number rangedAttackMod Temporary modifiers to ranged weapon skill
function UnitRangedAttack(unit) end

--- Returns the player's or pet's ranged attack power
---@param unit string A unit to query; only valid for player or pet
---@return number base Base ranged attack power
---@return number posBuff Positive buffs to ranged attack power
---@return number negBuff Negative buffs to ranged attack power
function UnitRangedAttackPower(unit) end

--- Returns information about the player's or pet's ranged attack damage and speed
---@param unit string A unit to query; only valid for player or pet
---@return number rangedAttackSpeed Current speed of the unit's ranged attack (attacks per second), or 0 if no ranged weapon is equipped
---@return number minDamage The minimum base damage per attack
---@return number maxDamage The maximum base damage per attack
---@return number physicalBonusPos Positive modifiers to ranged weapon damage
---@return number physicalBonusNeg Negative modifiers to ranged weapon damage
---@return number percent Factor by which damage output is multiplied due to buffs/debuffs
function UnitRangedDamage(unit) end

--- Returns information about the player's or pet's magic resistance
---@param unit string A unit to query; only valid for player or pet
---@param resistanceIndex any Index of a magic resistance type ( number ) 1 - Fire 2 - Nature 3 - Frost 4 - Shadow 5 - Arcane
---@return number base Base resistance value (generally 0)
---@return number resistance Current resistance value (including modifiers
---@return number positive Positive resistance modifiers
---@return number negative Negative resistance modifiers
function UnitResistance(unit, resistanceIndex) end

--- Returns information about a basic character statistic for the player or pet
---@param unit string A unit to query; only valid for player or pet
---@param statIndex any Index of a basic statistic ( number ) 1 - Strength 2 - Agility 3 - Stamina 4 - Intellect 5 - Spirit
---@return number stat Current value of the statistic
---@return number effectiveStat Effective value of the statistic
---@return number posBuff Positive modifiers to the statistic
---@return number negBuff Negative modifiers to the statistic
function UnitStat(unit, statIndex) end
