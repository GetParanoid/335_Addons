--==============================
-- Money functions
--==============================

--- Returns an icon representing an amount of money
---@param amount number Amount of money in copper
---@return any icon Path to an icon texture representing the amount ( string ) Interface\Icons\INV_Misc_Coin_01 - Small amount of Gold Interface\Icons\INV_Misc_Coin_02 - Large amount of Gold Interface\Icons\INV_Misc_Coin_03 - Small amount of Silver Interface\Icons\INV_Misc_Coin_04 - Large amount of Silver Interface\Icons\INV_Misc_Coin_05 - Small amount of Copper Interface\Icons\INV_Misc_Coin_06 - Large amount of Copper
function GetCoinIcon(amount) end

--- Returns a localized string describing an amount of money
---@param amount number Amount of money in copper
---@param separator string String to use as separator (', ' is used if nil)
---@return string coinText Text description of the amount using localized names for 'Gold', 'Silver' and 'Copper'
function GetCoinText(amount, separator) end

--- Returns a string with embedded coin icons describing an amount of money. As in most places where money amounts are shown in the UI, lesser denominations are only shown when non-zero.
---@param amount number Amount of money in copper
---@param fontSize number Size of the money icons. Defaults to 14.
---@return string coinText Text description of the amount using embedded texture codes for gold, silver, and copper coin icons
function GetCoinTextureString(amount, fontSize) end

--- Returns the total amount of money currently in the player's possession
---@return number money Amount of money currently in the player's possession (in copper)
function GetMoney() end

--- Returns the amount of money offered for trade by the player
---@return number amount Amount of money offered for trade by the player (in copper)
function GetPlayerTradeMoney() end

--- Returns the amount of money required for the selected quest in the quest log
---@return number money The amount of money required to complete the quest (in copper)
function GetQuestLogRequiredMoney() end

--- Returns the money reward for the selected quest in the quest log
---@return number money Amount of money rewarded for completing the quest (in copper)
function GetQuestLogRewardMoney() end

--- Returns the amount of money offered for trade by the target
---@return number amount Amount of money offered for trade by the target (in copper)
function GetTargetTradeMoney() end

--- Offers an amount of money for trade
---@param amount number Amount of money to offer for trade (in copper)
function SetTradeMoney(amount) end
