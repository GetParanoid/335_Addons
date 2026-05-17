--==============================
-- Trade functions
--==============================

--- Accepts a proposed trade
function AcceptTrade() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function BeginTrade() end

--- Cancels a trade in progress. Can be used if either party has accepted the trade, but not once both have.
function CancelTrade() end

--- Cancels the player's acceptance of a trade. If the player has accepted the trade but the target has not, reverts the player to the pre-acceptance state but does not end the trade.
function CancelTradeAccept() end

--- Ends interaction with the Trade UI, canceling any trade in progress. Causes the TRADE_CLOSED event to fire, indicating that Trade APIs may no longer have effects or return valid data.
function CloseTrade() end

--- Returns information about an item offered for trade by the player
---@param index number Index of an item slot on the player's side of the trade window (between 1 and MAX_TRADE_ITEMS )
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number numItems Number of stacked items in the slot
---@return number quality Quality (rarity) level of the item
---@return any isUsable 1 if the player character can use or equip the item; otherwise nil
---@return string enchantment Name of the enchantment being applied to the item through trade; otherwise nil
function GetTradePlayerItemInfo(index) end

--- Returns information about an item offered for trade by the target
---@param index number Index of an item slot on the player's side of the trade window (between 1 and MAX_TRADE_ITEMS )
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number numItems Number of stacked items in the slot
---@return number quality Quality (rarity) level of the item
---@return any isUsable 1 if the player character can use or equip the item; otherwise nil
---@return string enchantment Name of the enchantment being applied to the item through trade; otherwise nil
function GetTradeTargetItemInfo(index) end

--- Offers to trade with a given unit. The trade process does not begin immediately; once the server has determined both clients can trade, the TRADE_SHOW event fires.
---@param unit string A unit with which to trade
---@param name string The name of a unit with which to trade; only valid for nearby units in the player's party/raid
function InitiateTrade(unit, name) end

--- Confirms replacement of an existing enchantment when offering an enchantment for trade. After confirming, the enchantment is not actually performed until both parties accept the trade.
--- Flags: confirmation
function ReplaceTradeEnchant() end
