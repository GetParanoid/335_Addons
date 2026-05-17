--==============================
-- Unit functions
--==============================

--- Returns whether the player is close enough to a unit for certain types of interaction
---@param unit string A unit to query
---@param distIndex any Number identifying one of the following action types ( number ) 1 - Inspect 2 - Trade 3 - Duel 4 - Follow
---@return any canInteract 1 if the player is close enough to the other unit to perform the action; otherwise nil
function CheckInteractDistance(unit, distIndex) end

--- Returns whether a character is muted or silenced. If the channel argument is specified, this function checks the given character's voice/silence status on the channel as well as for whether the character is on the player's Muted list.
---@param unit string A unit to query
---@param name string Name of a character to query
---@param channel string Name of a voice channel
---@return any muteStatus 1 if the character is muted; otherwise nil
function GetMuteStatus(unit, name, channel) end

--- Returns information about a player character identified by globally unique identifier. Returns nil if given the GUID of a non-player unit. The leading 0x may be omitted.
---@param guid string Globally unique identifier of a player unit
---@return string class Localized name of the unit's class
---@return string classFilename Non-localized token identifying the unit's class
---@return string race Localized name of the unit's race
---@return string raceFilename Non-localized token identifying the unit's race
---@return any sex Number identifying the unit's gender ( number ) 1 - Neuter / Unknown 2 - Male 3 - Female
---@return string name Unit's name
---@return string realm Unit's realm (empty string if from the same realm)
function GetPlayerInfoByGUID(guid) end

--- Returns a string summarizing a unit's name and server
--- Flags: blizzardui
---@param unit string Unit to query
---@param showServerName boolean True to include the server name in the return value if the unit is not from the same server as the player; false to only include a short label in such circumstances
---@return string nameString The unit's name, possibly followed by the name of the unit's home server or a label indicating the unit is not from the player's server
function GetUnitName(unit, showServerName) end

--- Returns whether a unit can be heard due to ignored/muted status
---@param unit string A unit to query
---@return any isIgnoredOrMuted 1 if the unit is ignored or muted, nil otherwise
function IsIgnoredOrMuted(unit) end

--- Returns whether a character has been muted by the player
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any muted 1 if the unit is muted; otherwise nil
function IsMuted(unit, name) end

--- Sets a Texture object to show a portrait of a unit. Causes the client to render a view of the unit's model from a standard perspective into a circular 2D image and display it in the given Texture object.
---@param texture table A Texture object
---@param unit string A unit for which to display a portrait
function SetPortraitTexture(texture, unit) end

--- Returns whether one unit can assist another
---@param unit string A unit
---@param unit string Another unit
---@return any canAssist 1 if the first unit can assist the second; otherwise nil
function UnitCanAssist(unit, unit) end

--- Returns whether one unit can attack another
---@param unit string A unit
---@param unit string Another unit
---@return any canAttack 1 if the first unit can attack the second unit; otherwise nil
function UnitCanAttack(unit, unit) end

--- Returns whether two units can cooperate. Two units are considered to be able to cooperate with each other if they are of the same faction and are both players.
---@param unit string A unit
---@param unit string Another unit
---@return any canCooperate 1 if the two units can cooperate with each other; otherwise nil
function UnitCanCooperate(unit, unit) end

--- Returns a unit's class. The second return ( classFileName ) can be used for locale-independent verification of a unit's class, or to look up class-related data in various global tables:
---@param unit string A unit to query
---@param name string Name of a unit to query; only valid for player , pet , and party/raid members
---@return string class The localized name of the unit's class, or the unit's name if the unit is an NPC
---@return string classFileName A non-localized token representing the class
function UnitClass(unit, name) end

--- Returns a unit's class. The second return ( classFileName ) can be used for locale-independent verification of a unit's class, or to look up class-related data in various global tables:
---@param unit string A unit to query
---@param name string Name of a unit to query; only valid for player , pet , and party/raid members
---@return string class The localized name of the unit's class, or the unit's name if the unit is an NPC
---@return string classFileName A non-localized token representing the class
function UnitClassBase(unit, name) end

--- Returns a unit's classification
---@param unit string A unit to query
---@return any classification Classification of the unit ( string ) elite - Elite normal - Normal rare - Rare rareelite - Rare-Elite worldboss - World Boss
function UnitClassification(unit) end

--- Returns the creature family of the unit. Applies only to beasts of the kinds that can be taken as Hunter pets (e.g. cats, worms, and ravagers but not zhevras, talbuks and pterrordax), demons of the types that can be summoned by Warlocks (e.g. imps and felguards, but not demons that require enslaving such as infernals and doomguards or world demons such as pit lords and armored voidwalkers) and Death Knight's pets (ghouls).
---@param unit string A unit to query
---@return string family Localized name of the subtype of creature (e.g. Bear, Devilsaur, Voidwalker, Succubus), or nil if not applicable
function UnitCreatureFamily(unit) end

--- Returns the creature type of a unit. Note that some creatures have no type (e.g. slimes).
---@param unit string A unit to query
---@return string type Localized name of the type of creature (e.g. Beast, Humanoid, Undead), or nil if not applicable
function UnitCreatureType(unit) end

--- Returns whether a unit exists. A unit "exists" if it can be referenced by the player; e.g. party1 exists if the player is in a party with at least one other member (regardless of whether that member is nearby), target exists if the player has a target, npc exists if the player is currently interacting with an NPC, etc.
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , npc , and party/raid members
---@return any exists 1 if the unit exists, otherwise nil
function UnitExists(unit, name) end

--- Returns a unit's primary faction allegiance
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return string factionGroup Non-localized (English) faction name of the faction ("Horde" or "Alliance")
---@return string factionName Localized name of the faction
function UnitFactionGroup(unit, name) end

--- Returns whether a unit has a relic slot instead of a ranged weapon slot
---@param unit string A unit to query
---@return any hasRelic 1 if the unit has a relic slot; otherwise nil
function UnitHasRelicSlot(unit) end

--- Returns a unit's current amount of health
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return number health The unit's current amount of health (hit points)
function UnitHealth(unit, name) end

--- Returns a unit's maximum health value
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return number maxValue The unit's maximum health (hit points)
function UnitHealthMax(unit, name) end

--- Returns whether a party/raid member is nearby. The range check used by this function isn't directly based on the player's abilities (which may have varying ranges); it's fixed by Blizzard at a distance of around 40 yards (which encompasses many common healing spells and other abilities often used on raid members).
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for party/raid members and their pets
---@return any inRange 1 if the unit is close enough to the player to (likely) be in range for helpful spells; otherwise nil
function UnitInRange(unit, name) end

--- Returns whether a unit is marked AFK (Away From Keyboard)
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any isAFK 1 if the unit is AFK; otherwise nil
function UnitIsAFK(unit, name) end

--- Returns whether a unit is currently charmed. A charmed unit is affected by Mind Control (or a similar effect) and thus hostile to units which are normally his or her allies.
---@param unit string A unit to query
---@return any isCharmed 1 if the unit is charmed; otherwise nil
function UnitIsCharmed(unit) end

--- Returns whether a unit is connected (i.e. not Offline)
---@param unit string A unit to query
---@return any isConnected 1 if the player is connected; otherwise nil
function UnitIsConnected(unit) end

--- Returns whether a unit is controlling another unit. Applies to Mind Control and similar cases as well as to players piloting vehicles.
---@param unit string A unit to query
---@return any isControlling 1 if the unit is controlling another unit; otherwise nil
function UnitIsControlling(unit) end

--- Returns whether a unit is a corpse
---@param unit string A unit to query
---@return any isCorpse 1 if the unit is a corpse; otherwise nil
function UnitIsCorpse(unit) end

--- Returns whether a unit is marked DND (Do Not Disturb)
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any isDND 1 if the unit is marked Do Not Disturb, otherwise nil
function UnitIsDND(unit, name) end

--- Returns whether a unit is dead. Only returns 1 while the unit is dead and has not yet released his or her spirit. See UnitIsGhost() for after the unit has released.
---@param unit string A unit to query
---@return any isDead 1 if the unit is dead; otherwise nil
function UnitIsDead(unit) end

--- Returns whether a unit is either dead or a ghost
---@param unit string A unit to query
---@return any isDeadOrGhost 1 if the unit is dead or a ghost, otherwise nil
function UnitIsDeadOrGhost(unit) end

--- Returns whether two units are enemies
---@param unit string A unit
---@param unit string Another unit
---@return any isEnemy 1 if the units are enemies; otherwise nil
function UnitIsEnemy(unit, unit) end

--- Returns whether or not a given unit is feigning death. This function only works for friendly units.
---@param unit any The unit to query
---@return any isFeign 1 if the unit is feigning death, otherwise nil
function UnitIsFeignDeath(unit) end

--- Returns whether two units are friendly
---@param unit string A unit
---@param unit string Another unit
---@return any isFriends 1 if the two units are friendly; otherwise nil
function UnitIsFriend(unit, unit) end

--- Returns whether a unit is currently a ghost
---@param unit string A unit to query
---@return any isGhost 1 if the unit is a ghost; otherwise nil
function UnitIsGhost(unit) end

--- Returns whether a unit is flagged for PvP activity
---@param unit string A unit to query
---@return any isPVP 1 if the unit is flagged for PVP activity; otherwise nil
function UnitIsPVP(unit) end

--- Returns whether a unit is a player unit (not an NPC)
---@param unit string A unit to query
---@return any isPlayer 1 if the unit is a player unit; otherwise nil
function UnitIsPlayer(unit) end

--- Returns whether a unit is possessed by another
---@param unit string A unit to query
---@return any isPossessed 1 if the given unit is possessed; otherwise nil
function UnitIsPossessed(unit) end

--- Returns whether two units are from the same server. Only meaningful in cross-realm battlegrounds.
---@param unit string A unit
---@param unit string Another unit
---@return any isSame 1 if the two units are from the same server; otherwise nil.
function UnitIsSameServer(unit, unit) end

--- Returns whether a unit is tapped. Normally, rewards for killing a unit are available only to the character or group who first damaged the unit; once a character has thus established his claim on the unit, it is considered "tapped".
---@param unit any The unitid to query
function UnitIsTapped(unit) end

--- Returns whether a unit allows all players on its threat list to receive kill credit. Used to override the normal "tapping" behavior for certain mobs -- if this function returns 1, the player does not have to be the first to attack the mob (or in the same party/raid as the first player to attack) in order to receive quest or achievement credit for killing it.
---@param unit string A unit to query
---@return any allTapped 1 if the unit allows all players on its threat list to receive kill credit; otherwise nil
function UnitIsTappedByAllThreatList(unit) end

--- Returns whether a unit is tapped by the player or the player's group. Normally, rewards for killing a unit are available only to the character or group who first damaged the unit; once a character has thus established his claim on the unit, it is considered "tapped".
---@param unit string The unit to be queried
---@return any isTapped 1 if the unit is tapped by the player; otherwise nil
function UnitIsTappedByPlayer(unit) end

--- Returns whether a unit is trivial at the player's level. Killing trivial units (whose level is colored gray in the default UI) does not reward honor or experience.
---@param unit string A unit to query
---@return any isTrivial 1 if the unit is trivial at the player's level; otherwise nil
function UnitIsTrivial(unit) end

--- Returns whether two unit references are to the same unit. Useful for determining whether a composite unitID (such as raid19target ) also refers to a basic unitID ; see example.
---@param unit string A unit
---@param unit string Another unit
---@return any isSame Returns 1 if the two references are to the same unit; otherwise nil
function UnitIsUnit(unit, unit) end

--- Returns whether a unit is in the player's area of interest
---@param unit string A unit to query
---@return any isVisible 1 if the unit is is in the player's area of interest; otherwise nil
function UnitIsVisible(unit) end

--- Returns a unit's level. Returns -1 for boss units and hostile units whose level is ten levels or more above the player's.
---@param unit string A unit to query
---@return number level The unit's level
function UnitLevel(unit) end

--- . Replaced by UnitPower() .
--- Flags: deprecated
---@param unit any The unit to query
---@param name string The name of a unit to query. Only valid for the player, pet, and party/raid members.
---@return any mana The unit's current level of mana, rage, energy, runic power, or other power type
function UnitMana(unit, name) end

--- . Replaced by UnitPowerMax() .
--- Flags: deprecated
---@param unit any The unit to query
---@param name string The name of a unit to query. Only valid for the player, pet, and party/raid members.
---@return number maxValue The maximum amount of mana, rage, energy, or other power the unit can have.
function UnitManaMax(unit, name) end

--- Returns the name of a unit
---@param unit string A unit to query
---@return string name Name of the unit
---@return string realm Name of the unit's home realm if the unit is not from the player's realm; otherwise nil
function UnitName(unit) end

--- Returns whether a unit is controlled by a player
---@param unit string A unit to query
---@return any isPlayer 1 if the unit is controlled by a player; otherwise nil
function UnitPlayerControlled(unit) end

--- Returns a unit's current level of mana, rage, energy or other power type. Returns zero for non-existent units.
---@param unitID string A unit to query
---@param powerType string A specific power type to query
---@return any power The unit's current level of mana, rage, energy, runic power, or other power type
function UnitPower(unitID, powerType) end

--- Returns a unit's maximum mana, rage, energy or other power type. Returns the units current maximum power, if the unit does not exist then zero is returned. 
When querying with a powerType, as long as the unit exists you will get the maximum untalented power even if the class does not use the power type.
---@param unitID string A unit to query
---@param powerType number Specific power type to query for the unit
---@return number maxValue The unit's maximum mana, rage, energy, or other power
function UnitPowerMax(unitID, powerType) end

--- Returns the power type (energy, mana, rage) of the given unit. Does not return color values for common power types (mana, rage, energy, focus, and runic power); the canonical colors for these can be found in the PowerBarColor table. Color values may be included for special power types such as those used by vehicles.
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any powerType A number identifying the power type ( number ) 0 - Mana 1 - Rage 2 - Focus 3 - Energy 6 - Runic Power
---@return string powerToken The name of a global variable containing the localized name of the power type
---@return number altR Red component of the color used for displaying this power type
---@return number altG Green component of the color used for displaying this power type
---@return number altB Blue component of the color used for displaying this power type
function UnitPowerType(unit, name) end

--- Returns the name of a unit's race
---@param unit string A unit to query
---@return string race Localized name of the unit's race
---@return string fileName A non-localized token representing the unit's race
function UnitRace(unit) end

--- Returns the reaction of one unit with regards to another as a number. The returned value often (but not always) matches the unit's level of reputation with the second unit's faction, and can be used with the UnitReactionColor global table to return the color used to display a unit's reaction in the default UI.
---@param unit string A unit
---@param unit string Another unit
---@return any reaction Reaction of the first unit towards the second unit ( number ) 1 - Hated 2 - Hostile 3 - Unfriendly 4 - Neutral 5 - Friendly 6 - Honored 7 - Revered 8 - Exalted
function UnitReaction(unit, unit) end

--- Returns a color indicating hostility and related status of a unit. This color is used in various places in the default UI, such as the background behind a unit's name in the target and focus frames. For NPCs, the color reflects hostility and reputation, ranging from red (hostile) to orange or yellow (unfriendly or neutral) to green (friendly). When the unit is a player, a blue color is used unless the player is active for PvP, in which case the color may be red (he can attack you and you can attack him), yellow (you can attack him but he can't attack you) or green (ally). Color component values are floating point numbers between 0 and 1.
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return number red The red component of the color.
---@return number green The green component of the color.
---@return number blue The blue component of the color.
---@return number alpha The alpha (opacity) component of the color.
function UnitSelectionColor(unit, name) end

--- Returns the gender of the given unit or player
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any gender The unit's gender ( number ) 1 - Neuter / Unknown 2 - Male 3 - Female
function UnitSex(unit, name) end

--- Returns whether a unit is using a vehicle. Unlike similar functions, UnitUsingVehicle() also returns true while the unit is transitioning between seats in a vehicle.
---@param unit string A unit to query
---@return any usingVehicle 1 if the unit is using a vehicle; otherwise nil
function UnitUsingVehicle(unit) end
