--==============================
-- Action functions
--==============================

--- Returns whether an action has a range restriction
---@param slot number An action bar slot
---@return any hasRange 1 if the action has a range restriction; otherwise nil
function ActionHasRange(slot) end

--- Casts a pet action on a specific target
--- Flags: protected
---@param index number Index of a pet action button (between 1 and NUM_PET_ACTION_SLOTS )
---@param unit string A unit to be used as target for the action
function CastPetAction(index, unit) end

--- Returns information about autocast actions. No player actions have allowed automatic casting since the initial public release of World of Warcraft.
--- Flags: deprecated
---@param slot number An action bar slot
---@return any autocastAllowed 1 if automatic casting is allowed for the action; otherwise nil
---@return any autocastEnabled 1 if automatic casting is currently turned on for the action; otherwise nil
function GetActionAutocast(slot) end

--- Returns cooldown information about an action
---@param slot number An action bar slot
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the action is ready
---@return number duration The length of the cooldown, or 0 if the action is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the action is ready.)
function GetActionCooldown(slot) end

--- Returns the number of uses remaining for the given action slot. Applies to spells that require reagents, items that stack, or items with charges; used in the default UI to display the count on action buttons.
---@param slot number An action bar slot
---@return number count Number of times the action can be used
function GetActionCount(slot) end

--- Returns information about an action slot
---@param slot number An action slot
---@return any type Type of action in the slot ( string ) companion - Summons a mount or non-combat pet equipmentset - Equips a set of items item - Uses an item macro - Runs a macro spell - Casts a spell
---@return any id An identifier for the action; varies by type: ( number or string ) companion - The companion's index in the mount or minipet list equipmentset - Name of the equipment set item - The item's itemID macro - The macro's index in the macro list ( macroID ) spell - The spell's index in the player's spellboook
---@return any subType Subtype of the action (or nil if not applicable) ( string ) CRITTER - For companion actions: indicates id is as an index in the non-combat pets list MOUNT - For companion actions: indicates id is an index in the mounts list spell - For spell actions: indicates id is an index in the player's spellbook
---@return string spellID For spell and companion actions, the global ID of the spell (or the summoning "spell" for a companion)
function GetActionInfo(slot) end

--- Returns the text label associated with an action. Currently used only for macros, which in the default UI show their name as a label on an action button.
---@param slot number An action bar slot
---@return string text Label for the action
function GetActionText(slot) end

--- Returns the icon texture for an action. Can be the icon of a spell or item, the icon manually set for a macro, or an icon reflecting the current state of a macro.
---@param slot number An action bar slot
---@return string texture Path to an icon texture for the action in the slot, or nil if the slot is empty
function GetActionTexture(slot) end

--- Returns cooldown information about a given pet action slot
---@param index number Index of a pet action button (between 1 and NUM_PET_ACTION_SLOTS )
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the action is ready
---@return number duration The length of the cooldown, or 0 if the action is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the action is ready.)
function GetPetActionCooldown(index) end

--- Returns information about a pet action
---@param index number Index of a pet action button (between 1 and NUM_PET_ACTION_SLOTS )
---@return string name Localized name of the action, or a token which can be used to get the localized name of a standard action
---@return string subtext Secondary text for the action (generally a spell rank; e.g. "Rank 8")
---@return string texture Path to an icon texture for the action, or a token which can be used to get the texture path of a standard action
---@return any isToken 1 if the returned name and texture are tokens for standard actions, which should be used to look up actual values (e.g. PET_ACTION_ATTACK , PET_ATTACK_TEXTURE ); nil if name and texture can be displayed as-is
---@return any isActive 1 if the action is currently active; otherwise nil. (Indicates which state is chosen for the follow/stay and aggressive/defensive/passive switches.)
---@return any autoCastAllowed 1 if automatic casting is allowed for the action; otherwise nil
---@return any autoCastEnabled 1 if automatic casting is currently turned on for the action; otherwise nil
function GetPetActionInfo(index) end

--- Returns whether a pet action can be used. Used in the default UI to show pet actions as grayed out when the pet cannot be commanded to perform them (e.g. when the player or pet is stunned).
---@param index number Index of a pet action button (between 1 and NUM_PET_ACTION_SLOTS )
---@return any usable 1 if the pet action is currently available; otherwise nil
function GetPetActionSlotUsable(index) end

--- Returns whether the pet's actions are usable. Note: GetPetActionSlotUsable can return nil for individual actions even if GetPetActionsUsable returns 1 (though not the other way around).
---@return any petActionsUsable 1 if the pet's actions are usable; otherwise nil
function GetPetActionsUsable() end

--- Returns whether an action slot contains an action
---@param slot number An action bar slot
---@return any hasAction 1 if the slot contains an action; otherwise nil
function HasAction(slot) end

--- Returns whether the player's target is in range of an action
---@param slot number An action bar slot
---@return number inRange 1 if the player's target is in range for the action or 0 if out of range; nil if the action cannot be used on the player's target regardless of range
function IsActionInRange(slot) end

--- Returns whether an action is the standard melee Attack action. Used in the default UI to flash the action button while auto-attack is active. Does not apply to other repeating actions such as Auto Shot (for hunters) and Shoot (for wand users); for those, see IsAutoRepeatAction .
---@param slot number An action bar slot
---@return any isAttack 1 if the action enables/disables melee auto-attack; otherwise nil
function IsAttackAction(slot) end

--- Returns whether an action is an automatically repeating action. Used in the default UI to flash the action button while the action is repeating. Applies to  actions such as Auto Shot (for hunters) and Shoot (for wand and other ranged weapon users) but not to the standard melee Attack action; for it, see IsAttackAction .
---@param slot number An action bar slot
---@return any isRepeating 1 if the action is an auto-repeat action; otherwise nil
function IsAutoRepeatAction(slot) end

--- Returns whether using an action consumes an item. Applies both to consumable items (such as food and potions) and to spells which use a reagent (e.g. Prayer of Fortitude, Divine Intervention, Water Walking, Portal: Dalaran).
---@param slot number An action bar slot
---@return any isConsumable 1 if using the action consumes an item; otherwise nil
function IsConsumableAction(slot) end

--- Returns whether an action is currently being used
---@param slot number An action bar slot
---@return any isCurrent 1 if the action is currently being cast, is waiting for the user to choose a target, is a repeating action which is currently repeating, or is the open trade skill; otherwise nil
function IsCurrentAction(slot) end

--- Returns whether an action contains an equipped item. Applies to actions involving equippable items (not to consumables or other items with "Use:" effects) and indicates the effect of performing the action: if an action's item is not equipped, using the action will equip it; if the item is equipped and has a "Use:" effect, using the action will activate said effect.
---@param slot number An action bar slot
---@return any isEquipped 1 if the action contains an equipped item; otherwise nil
function IsEquippedAction(slot) end

--- Returns whether an action uses stackable items. Applies to consumable items such as potions, wizard oils, food and drink; not used for spells which consume reagents (for those, see IsConsumableAction ).
---@param slot number An action bar slot
---@return any isStackable 1 if the action uses stackable items; otherwise nil
function IsStackableAction(slot) end

--- Returns whether an action is usable
---@param slot number An action bar slot
---@return any isUsable 1 if the action is usable; otherwise nil
---@return any notEnoughMana 1 if the player lacks the resources (e.g. mana, energy, runes) to use the action; otherwise nil
function IsUsableAction(slot) end

--- Puts the contents of an action bar slot onto the cursor or the cursor contents into an action bar slot. After an action is picked up via this function, it can only be placed into other action bar slots (with PlaceAction() or by calling PickupAction() again), even if the action is an item which could otherwise be placed elsewhere. Unlike many other "pickup" cursor functions, this function removes the picked-up action from the source slot -- an action slot can be emptied by calling this function followed by ClearCursor() .
--- Flags: nocombat
---@param slot number An action bar slot
function PickupAction(slot) end

--- Puts the contents of a pet action slot onto the cursor or the cursor contents into a pet action slot. Only pet actions and spells from the "pet" portion of the spellbook can be placed into pet action slots.
---@param index number Index of a pet action (between 1 and NUM_PET_ACTION_SLOTS )
function PickupPetAction(index) end

--- Puts the contents of the cursor into an action bar slot. If the action slot is empty and the cursor already holds an action, a spell, a companion (mount or non-combat pet), a macro, an equipment set, or an item (with a "Use:" effect), it is put into the action slot. If both the cursor and the slot hold an action (or any of the above data types), the contents of the cursor and the slot are exchanged.
--- Flags: nocombat
---@param slot number Destination action bar slot
function PlaceAction(slot) end

--- Turns autocast on or off for a pet action. Turns autocast on if not autocasting and vice versa.
--- Flags: protected
---@param index number Index of a pet action button (between 1 and NUM_PET_ACTION_SLOTS )
function TogglePetAutocast(index) end

--- Uses an action protected
--- Flags: protected
---@param slot number The action to use (1-132)
---@param target any The desired target of the action
---@param button string The mouse button used to activate the action
function UseAction(slot, target, button) end
