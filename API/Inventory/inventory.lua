--==============================
-- Inventory functions
--==============================

--- Cancels equipping a bind-on-equip item. When the player attempts to equip a bind-on-equip item, the default UI displays a dialog warning that equipping the item will cause it to become soulbound; this function is called when canceling that dialog.
---@param index number Index of a pending equip warning; currently always 0 as only one equip warning will be given at a time
function CancelPendingEquip(index) end

--- Attempts to equip an arbitrary item. The item is automatically equipped in the first available slot in which it fits. To equip an item in a specific slot, see EquipCursorItem() .
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
function EquipItemByName(itemID, itemName, itemLink) end

--- Confirms equipping a bind-on-equip item. Usable following the EQUIP_BIND_CONFIRM or AUTOEQUIP_BIND_CONFIRM , which fires when the player attempts to equip a bind-on-equip item
--- Flags: confirmation
---@param index number Index provided by the EQUIP_BIND_CONFIRM or AUTOEQUIP_BIND_CONFIRM event; currently always 0
function EquipPendingItem(index) end

--- Returns the durability warning status of an equipped item. Looking up the status returned by this function in the INVENTORY_ALERT_COLORS table provides color values, used in the default UI to highlight parts of the DurabiltyFrame (i.e. the "armored man" image) that appears when durability is low.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any status Alert status for the item in the given slot ( number ) 0 - No alert; the slot is empty, contains an item whose durability is above critical levels, or contains an item without a durability value 1 - The item's durability is dangerously low 2 - The item's durability is at zero
function GetInventoryAlertStatus(slot) end

--- Returns whether an equipped item is broken
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any isBroken 1 if the item is broken (durability zero); otherwise nil
function GetInventoryItemBroken(unit, slot) end

--- Returns cooldown information about an equipped item
---@param unit string A unit to query; only valid for 'player'
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the item is ready
---@return number duration The length of the cooldown, or 0 if the item is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the item is ready.)
function GetInventoryItemCooldown(unit, slot) end

--- Returns the number of items stacked in an inventory slot.
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return number count The amount of items stacked in the inventory slot
function GetInventoryItemCount(unit, slot) end

--- Returns the current durability level of an equipped item. If an item does not have durability (for example, heirlooms, tabards and some other items) then this function will simply return nil .
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return number durability The item's current durability, the first number listed in the item's tooltip where it displays the durability information: for example 4 in 4/29.
---@return number max The item's maximum durability, the first number listed in the item's tooltip where it displays the durability information: for example 29 in 4/29
function GetInventoryItemDurability(slot) end

--- Returns the gems socketed in an equipped item. The IDs returned refer to the gems themselves (not the enchantments they provide), and thus can be passed to GetItemInfo() to get a gem's name, quality, icon, etc.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any gem1 Item ID of the first gem socketed in the item
---@return any gem2 Item ID of the second gem socketed in the item
---@return any gem3 Item ID of the third gem socketed in the item
function GetInventoryItemGems(slot) end

--- Returns the item ID of an equipped item
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any id Numeric ID of the item in the given slot
function GetInventoryItemID(unit, slot) end

--- Returns the quality level of an equipped item
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return number quality The quality level of the item
function GetInventoryItemQuality(unit, slot) end

--- Returns the icon texture for an equipped item
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return string texture Path to an icon texture for the item
function GetInventoryItemTexture(unit, slot) end

--- Returns a list of items that can be equipped in a given inventory slot
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return table availableItems A table listing itemID s of items which can be equipped in the slot, keyed by itemLocation
function GetInventoryItemsForSlot(slot) end

--- Returns information about an inventory slot
---@param slotName any Name of an inventory slot to query ( string ) AmmoSlot - Ranged ammunition slot BackSlot - Back (cloak) slot Bag0Slot - Backpack slot Bag1Slot - First bag slot Bag2Slot - Second bag slot Bag3Slot - Third bag slot ChestSlot - Chest slot FeetSlot - Feet (boots) slot Finger0Slot - First finger (ring) slot Finger1Slot - Second finger (ring) slot HandsSlot - Hand (gloves) slot HeadSlot - Head (helmet) slot LegsSlot - Legs (pants) slot MainHandSlot - Main hand weapon slot NeckSlot - Necklace slot RangedSlot - Ranged weapon or relic slot SecondaryHandSlot - Off-hand (weapon, shield, or held item) slot ShirtSlot - Shirt slot ShoulderSlot - Shoulder slot TabardSlot - Tabard slot Trinket0Slot - First trinket slot Trinket1Slot - Second trinket slot WaistSlot - Waist (belt) slot WristSlot - Wrist (bracers) slot
---@return number id The numeric slotId usable in other Inventory functions
---@return string texture The path to the texture to be displayed when this slot is empty
---@return any checkRelic 1 if the slot might be the relic slot; otherwise nil. The ranged slot token is re-used for the relic slot; if this return is 1, UnitHasRelicSlot should be used to determine how the slot should be displayed.
function GetInventorySlotInfo(slotName) end

--- Returns whether an item is currently equipped
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isEquipped 1 if the item is equipped on the player character; otherwise nil
function IsEquippedItem(itemID, itemName, itemLink) end

--- Returns whether any items of a given type are currently equipped. Possible arguments include the localized names of item classes (as returned from GetAuctionItemClasses ; e.g. "Weapon", "Armor"), subclasses (as returned from GetAuctionItemSubClasses ; e.g. "One-handed axes", "Shields", "Cloth"), and the global tokens or localized names for equip locations (as returned from GetAuctionInvTypes ; e.g. "INVTYPE_WEAPONMAINHAND", "Off Hand").
---@param type string Name of an item class, subclass, or equip location
---@return any isEquipped 1 if the player has equipped any items of the given type; otherwise nil
function IsEquippedItemType(type) end

--- Returns whether an inventory slot is locked. Items become locked while being moved, split, or placed into other UI elements (such as the mail, trade, and auction windows); the item is unlocked once such an action is completed.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any isLocked 1 if the item in the inventory slot is locked; otherwise nil
function IsInventoryItemLocked(slot) end

--- This function or event no longer exists in version 4.3.0 of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param slot number Index of a key slot within the keyring
---@return number slot Identifier for the key slot usable with Inventory APIs
function KeyRingButtonIDToInvSlotID(slot) end

--- Sets a Texture object to display the icon of an equipped item. Adapts the square item icon texture to fit within the circular "portrait" frames used in many default UI elements.
---@param texture table A Texture object
---@param unit string A unit whose item should be displayed; only valid for player
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function SetInventoryPortraitTexture(texture, unit, slot) end

--- Opens an equipped item for socketing
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function SocketInventoryItem(slot) end

--- This is a Blizzard internal function internal
--- Flags: internal
function UpdateInventoryAlertStatus() end

--- Activate (as with right-clicking) an equipped item. If the inventoryID passed refers to an empty slot or a slot containing an item without a "Use:" action, this function is not protected (i.e. usable only by the Blizzard UI), but also has no effect.
--- Flags: protected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function UseInventoryItem(slot) end
