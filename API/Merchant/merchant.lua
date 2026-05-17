--==============================
-- Merchant functions
--==============================

--- Purchases an item available from a vendor
--- Flags: confirmation
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@param quantity number Number of items to purchase (between 1 and GetMerchantItemMaxStack(index) )
function BuyMerchantItem(index, quantity) end

--- Repurchases an item recently sold to a vendor
---@param index number Index of an item in the buyback listing (between 1 and GetNumBuybackItems() )
function BuybackItem(index) end

--- Returns whether the vendor with whom the player is currently interacting can repair equipment
---@return any canRepair 1 if the vendor can repair equipment; otherwise nil
function CanMerchantRepair() end

--- Ends interaction with a vendor. Causes the MERCHANT_CLOSED event to fire, indicating that Merchant APIs may no longer have effects or return valid data.
function CloseMerchant() end

--- Returns information about an item recently sold to a vendor and available to be repurchased
---@param index number Index of an item in the buyback listing (between 1 and GetNumBuybackItems() )
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number price Current cost to repurchase the item from this vendor (in copper)
---@return number quantity Number of stacked items per purchase
---@return number numAvailable Number of items available for purchase, if the vendor has a limited stock of the item; generally 0 for buyback items
---@return any isUsable 1 if the player can use or equip the item; otherwise nil
function GetBuybackItemInfo(index) end

--- Returns information about alternate currencies required to purchase an item from a vendor
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@return number currencyCount Number of different currencies required to purchase the item (see GetMerchantItemCostItem() for amount of each item currency required)
function GetMerchantItemCostInfo(index) end

--- Returns information about currency items required to purchase an item from a vendor
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@param currency number Index of one of the item currencies required to purchase the item (between 1 and GetMerchantItemCostInfo(index) )
---@return string texture Path to an icon texture for the currency item
---@return number value Amount of the currency required for purchase
---@return string link A hyperlink for the currency item
---@return string name The localized name of the currency
function GetMerchantItemCostItem(index, currency) end

--- Returns information about an item available for purchase from a vendor
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number price Current cost to purchase the item from this vendor (in copper)
---@return number quantity Number of stacked items per purchase
---@return number numAvailable Number of items available for purchase, if the vendor has a limited stock of the item; -1 if the vendor has an unlimited supply of the item
---@return any isUsable 1 if the player can use or equip the item; otherwise nil
---@return any extendedCost 1 if the item's price uses one or more alternate currencies (for which details can be found via GetMerchantItemCostInfo(index) ); otherwise nil
function GetMerchantItemInfo(index) end

--- Returns the maximum number of an item allowed in a single purchase. Determines the largest value usable for the second argument ( quantity ) of BuyMerchantItem() when purchasing the item. For most items, this is the same as the maximum stack size of the item.
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@return number maxStack Largest number of items allowed in a single purchase
function GetMerchantItemMaxStack(index) end

--- Returns the number of different items available for purchase from a vendor
---@return number numMerchantItems Number of different items available for purchase
function GetMerchantNumItems() end

--- Returns the number of items recently sold to a vendor and available to be repurchased
---@return number numBuybackItems Number of items available to be repurchased
function GetNumBuybackItems() end

--- Returns the cost to repair all of the player's damaged items. Returns 0, nil if none of the player's items are damaged. Only returns valid data while interacting with a vendor which allows repairs (i.e. for whom CanMerchantRepair() returns 1 ).
---@return number repairAllCost Cost to repair all damaged items (in copper)
---@return any canRepair 1 if repairs are currently available; otherwise nil
function GetRepairAllCost() end

--- Attempts to repair all of the player's damaged items
---@param useGuildMoney any 1 to use guild bank money (if available); nil or omitted to use the player's own money
function RepairAllItems(useGuildMoney) end
