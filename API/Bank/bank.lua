--==============================
-- Bank functions
--==============================

--- Returns the inventoryID corresponding to a bank item or bag slot
---@param buttonID number Numeric ID of an item or bag slot in the bank UI
---@param isBag any 1 if the given ID corresponds to a bank bag slot; nil if the ID corresponds to an item slot
---@return number inventoryID An inventory slot ID usable with various Inventory API functions
function BankButtonIDToInvSlotID(buttonID, isBag) end

--- Ends interaction with the bank. Causes the BANKFRAME_CLOSED event to fire, indicating that APIs querying bank contents may no longer return valid results.
function CloseBankFrame() end

--- Unpacks an inventory location bitfield into usable components
---@param location number A bit field that represents an item's location in the player's possession.  This bit field can be obtained using the GetInventoryItemsForSlot function.
---@return boolean player A flag indicating whether or not the item exists in the player's inventory (i.e. an equipped item).
---@return boolean bank A flag indicating whether or not the item exists in the payer's bank.
---@return boolean bags A flag indicating whether or not the item exists in the player's bags.
---@return number bag The bagID of the container that contains the item.
function EquipmentManager_UnpackLocation(location) end

--- Returns the cost of the next purchasable bank bag slot. Returns 999999999 if the player owns all available slots.
---@return number cost Cost of the next available bank bag slot (in copper)
function GetBankSlotCost() end

--- Returns information about purchased bank bag slots
---@return number numSlots Number of bank bag slots the player has purchased
---@return any isFull 1 if the player has purchased all available slots; otherwise nil
function GetNumBankSlots() end

--- Purchases the next available bank slot. Only available while interacting with a banker NPC (i.e. between the BANKFRAME_OPENED and BANKFRAME_CLOSED events).
--- Flags: confirmation
function PurchaseSlot() end
