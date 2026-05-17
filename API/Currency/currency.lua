--==============================
-- Currency functions
--==============================

--- Expands or collapses a list header in the Currency UI
---@param index number Index of a header in the currency list (between 1 and GetCurrencyListSize())
---@param shouldExpand number 1 to expand the header, showing its contents; 0 to collapse the header, hiding its contents
function ExpandCurrencyList(index, shouldExpand) end

--- Returns information about a currency marked for watching on the Backpack UI
---@param index number Index of a 'slot' for displaying currencies on the backpack (between 1 and MAX_WATCHED_TOKENS )
---@return string name Name of the currency type
---@return number count Amount of the currency the player has
---@return any extraCurrencyType Type of the currency ( number ) 0 - Item-based currency 1 - Arena points 2 - Honor points
---@return string icon Path to an icon texture representing the currency item (for Honor/Arena points, not the icon displayed in the default UI)
---@return number itemID ID for the currency item
function GetBackpackCurrencyInfo(index) end

--- Returns information about a currency type (or headers in the Currency UI)
---@param index number Index of a currency type in the currency list (between 1 and GetCurrencyListSize() )
---@return string name Name of the currency type or category header
---@return boolean isHeader True if this listing is a category header, false for actual currencies
---@return boolean isExpanded True if this listing is a category header whose contents are shown, false for collapsed headers and actual currencies
---@return boolean isUnused True if the player has marked this currency as Unused
---@return boolean isWatched True if the player has marked this currency to be watched on the backpack UI
---@return number count Amount of the currency the player has
---@return number extraCurrencyType 1 for Arena points, 2 for Honor points, 0 for other currencies
---@return string icon Path to a texture representing the currency item (not applicable for Arena/Honor points)
---@return number itemID ID for the currency item
function GetCurrencyListInfo(index) end

--- Returns the number of list entries to show in the Currency UI
---@return number numEntries Number of currency types (including category headers) to be shown in the Currency UI
function GetCurrencyListSize() end

--- Returns the awarded honor and arena points for a Call to Arms battleground win or loss
---@return boolean unk Unknown
---@return number honorWinReward Honor points rewarded for a win
---@return number arenaWinReward Arena points rewarded for a win
---@return number honorLossReward Honor points rewarded for a loss
---@return number arenaLossReward Arena points rewarded for a loss
function GetHolidayBGHonorCurrencyBonuses() end

--- Returns the player's amount of honor points
---@return number honorPoints The player's current amount of honor points
---@return number maxHonor The maximum amount of honor currency the player can accrue
function GetHonorCurrency() end

--- Sets a currency type to be watched on the Backpack UI
---@param index number Index of a currency type or header in the currency list (between 1 and GetCurrencyListSize())
---@param watch number 1 to add this currency to the backpack UI; 0 to remove it from being watched
function SetCurrencyBackpack(index, watch) end

--- Moves a currency type to or from the Unused currencies list.
---@param index number Index of a currency type or header in the currency list (between 1 and GetCurrencyListSize())
---@param makeUnused number 1 to move this currency to the Unused category; 0 to return it to its original category
function SetCurrencyUnused(index, makeUnused) end
