--==============================
-- Equipment Manager functions
--==============================

--- Returns whether the player has enabled the equipment manager. Despite the name, this returns true when the player has enabled the use of the equipment manager through the interface or CVars.
---@return boolean enabled Has the player enable the equipment manager
function CanUseEquipmentSets() end

--- Deletes an equipment set
--- Flags: confirmation
---@param name string Name of an equipment set (case sensitive)
function DeleteEquipmentSet(name) end

--- Clears the list of equipment slots to be ignored when saving sets
function EquipmentManagerClearIgnoredSlotsForSave() end

--- Adds an equipment slot to the list of those ignored when saving sets. Creating or saving a set with SaveEquipmentSet() will ignore any slots on the list, allowing the player to create sets which only switch certain items (e.g. to equip a fishing pole and hat while leaving non-fishing-related items equipped).
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function EquipmentManagerIgnoreSlotForSave(slot) end

--- Returns whether the contents of an equipment slot will be included when saving sets
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return boolean isIgnored True if the contents of the slot will not be included when next creating or saving an equipment set; otherwise false
function EquipmentManagerIsSlotIgnoredForSave(slot) end

--- Removes an equipment slot from the list of those ignored when saving sets. Creating or saving a set with SaveEquipmentSet() will ignore any slots on the list, allowing the player to create sets which only switch certain items (e.g. to equip a fishing pole and hat while leaving non-fishing-related items equipped).
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function EquipmentManagerUnignoreSlotForSave(slot) end

--- Returns whether an equipment set contains locked items. Locked items are those in a transient state -- e.g. on the cursor for moving within the player's bags, placed in the Send Mail or Trade UIs, etc. -- for which the default UI displays the item's icon as grayed out. A set cannot be equipped if it contains locked items.
---@param name string Name of an equipment set (case sensitive)
---@return boolean isLocked True if the equipment set contains locked items
function EquipmentSetContainsLockedItems(name) end

--- Returns information about an equipment set (specified by index)
---@param index number Index of an equipment set (between 1 and GetNumEquipmentSets() )
---@return string name Name of the equipment set
---@return string icon Path to an icon texture for the equipment set
---@return number setID Internal ID number for the set (not used elsewhere in API)
function GetEquipmentSetInfo(index) end

--- Returns information about an equipment set
---@param name string Name of an equipment set (case sensitive)
---@return string icon Unique part of the path to an icon texture for the equipment set; prepend "Interface\Icons\" for the full path
---@return number setID Internal ID number for the set (not used elsewhere in API)
function GetEquipmentSetInfoByName(name) end

--- Returns a table listing the items in an equipment set
---@param name string Name of an equipment set (case sensitive)
---@return table itemIDs A table listing the itemID s of the set's contents, keyed by inventoryID
function GetEquipmentSetItemIDs(name) end

--- Returns a table listing the locations of the items in an equipment set
---@param name string Name of an equipment set (case sensitive)
---@return table itemIDs A table listing the itemLocation s of the set's contents, keyed by inventoryID
function GetEquipmentSetLocations(name) end

--- Returns the number of saved equipment sets
---@return number numSets Number of saved equipment sets
function GetNumEquipmentSets() end

--- Puts an equipment set (specified by index) on the cursor. Can be used to place an equipment set in an action bar slot.
---@param index number Index of an equipment set (between 1 and GetNumEquipmentSets() )
function PickupEquipmentSet(index) end

--- Puts an equipment set on the cursor. Can be used to place an equipment set in an action bar slot.
---@param name string Name of an equipment set (case sensitive)
function PickupEquipmentSetByName(name) end

--- Changes the name of a saved equipment set
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/RenameEquipmentSet
function RenameEquipmentSet() end

--- Saves or creates an equipment set with the player's currently equipped items. If a set with the same name already exists, that set's contents are overwritten.
--- Flags: confirmation
---@param name string Name of the set
---@param icon number Index of an icon to associate with the set: between 1 and GetNumMacroIcons() for an icon from the set of macro icons; values between -INVSLOT_FIRST_EQUIPPED and -INVSLOT_LAST_EQUIPPED for the icon of an item in the equipment set at that (negative) inventoryID
function SaveEquipmentSet(name, icon) end

--- Equips the items in an equipment set
---@param name string Name of an equipment set (case sensitive)
---@return boolean equipped true if the set was equipped; otherwise nil
function UseEquipmentSet(name) end
