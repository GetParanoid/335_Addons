--==============================
-- Guild bank functions
--==============================

--- Withdraws the item(s) from a slot in the guild bank, automatically adding to the player's bags
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param slot number Index of an item slot in the guild bank tab (between 1 and MAX_GUILDBANK_SLOTS_PER_TAB )
function AutoStoreGuildBankItem(tab, slot) end

--- Purchases the next available guild bank tab
--- Flags: confirmation
function BuyGuildBankTab() end

--- Returns whether the player is allowed to edit a guild bank tab's information
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@return any canEdit 1 if the player can edit the guild bank tab; otherwise nil
function CanEditGuildTabInfo(tab) end

--- Returns whether the player is allowed to pay for repairs using guild bank funds
---@return any canRepair 1 if the player can use guild bank funds for repair; otherwise nil
function CanGuildBankRepair() end

--- Returns whether the player is allowed to withdraw money from the guild bank
---@return any canWithdraw 1 if the player can withdraw money from the guild bank; otherwise nil
function CanWithdrawGuildBankMoney() end

--- Ends interaction with the guild bank vault. Fires the GUILDBANKFRAME_CLOSED event, indicating that APIs related to the Guild Bank vault may no longer have effects or return valid data. (APIs related to guild bank permissions are still usable.)
function CloseGuildBankFrame() end

--- Deposits money into the guild bank
--- Flags: confirmation
---@param money number Amount of money to deposit (in copper)
function DepositGuildBankMoney(money) end

--- Returns the currently selected guild bank tab
---@param currentTab number Index of the selected guild bank tab (between 1 and GetNumGuildBankTabs() )
function GetCurrentGuildBankTab(currentTab) end

--- Returns information about the contents of a guild bank item slot
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param slot number Index of an item slot in the guild bank tab (between 1 and MAX_GUILDBANK_SLOTS_PER_TAB )
---@return string texture Path to an icon texture for the item
---@return number count Number of stacked items in the slot
---@return any locked 1 if the slot is locked (as when a guild member has picked up an item and not yet deposited it elsewhere); otherwise nil
function GetGuildBankItemInfo(tab, slot) end

--- Returns a hyperlink for an item in the guild bank
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param slot number Index of an item slot in the guild bank tab (between 1 and MAX_GUILDBANK_SLOTS_PER_TAB )
---@return string item A hyperlink for the contents of the slot
function GetGuildBankItemLink(tab, slot) end

--- Returns the amount of money in the guild bank. The return value is cached and returns the last value seen when not interacting with a guild bank vault.  This cache works across characters, and is updated when the GUILDBANK_UPDATE_MONEY or GUILDBANKFRAME_OPENED event fires. If no player character has accessed a guild bank since the game client was launched, this function returns 0.
---@return number guildBankMoney Amount of money in the guild bank (in copper)
function GetGuildBankMoney() end

--- Returns information about a transaction in the guild bank money log
---@param index number Index of a transaction in the money log (between 1 and GetNumGuildBankMoneyTransactions() )
---@return any type Type of log event ( string ) deposit - Deposit into the guildbank repair - Repair cost withdrawal from the guildbank withdraw - Withdrawal from the guildbank
---@return string name Name of the guild member responsible for the event, or nil if the name is unknown
---@return number year Number of years since the event occurred
---@return number month Number of months since the event occurred
---@return number day Number of days since the event occurred
---@return number hour Number of hours since the event occurred
function GetGuildBankMoneyTransaction(index) end

--- Returns the cost of the next available guild bank tab
---@return number tabCost Cost to purchase the next guild bank tab (in copper)
function GetGuildBankTabCost() end

--- Returns information about a guild bank tab
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@return string name Name of the tab
---@return string icon Path to the icon texture for the tab
---@return any isViewable 1 if the player is allowed to view the contents of the tab; otherwise nil
---@return any canDeposit 1 if the player is allowed to deposit items into the tab; otherwise nil
---@return number numWithdrawals Maximum number of items (stacks) the player is allowed to withdraw from the tab per day
---@return number remainingWithdrawals Maximum number of items (stacks) the player is currently allowed to withdraw from the tab
function GetGuildBankTabInfo(tab) end

--- Returns information about guild bank tab privileges for the guild rank currently being edited. Used in the default UI's guild control panel.
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@return any canView 1 if the guild rank has permission to view the tab's contents; otherwise nil.
---@return any canDeposit 1 if the guild rank has permission to deposit items into the tab; otherwise nil.
---@return any canUpdateText 1 if the guild rank can update the tab's info text; otherwise nil.
---@return number numWithdrawls Maximum number of withdrawals per day the guild rank is allowed for the given tab.
function GetGuildBankTabPermissions(tab) end

--- Returns text associated with a guild bank tab. Only returns valid data after QueryGuildBankText() has been called to retrieve the text from the server and the following GUILDBANK_UPDATE_TEXT event has fired.
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@return string text Info text provided for the tab
function GetGuildBankText(tab) end

--- Returns information about a transaction in the log for a guild bank tab. Only returns valid information following the GUILDBANKLOG_UPDATE event which fires after calling QueryGuildBankLog() .
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param index number Index of a log entry (between 1 and GetNumGuildBankTransactions(tab) )
---@return any type Type of transaction ( string ) deposit move repair withdraw
---@return string name Name of the guild member responsible for the transaction
---@return string itemLink A hyperlink for the item involved in the transaction
---@return number count Number of stacked items involved in the transaction
---@return number tab1 Index of the source tab, if the item was moved between tabs
---@return number tab2 Index of the destination tab, if the item was moved between tabs
---@return number year Number of years since the event occurred
---@return number month Number of months since the event occurred
---@return number day Number of days since the event occurred
---@return number hour Number of hours since the event occurred
function GetGuildBankTransaction(tab, index) end

--- This function or event no longer exists in version 5.0.4 of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@return number goldWithdrawLimit Amount of money the guild rank is allowed to withdraw from the guild bank per day (in copper), or -1 if the guild rank has unlimited withdrawal privileges
function GetGuildBankWithdrawLimit() end

--- Returns the amount of money the player is allowed to withdraw from the guild bank per day
---@return number withdrawLimit Amount of money the player is allowed to withdraw from the guild bank per day (in copper), or -1 if the player has unlimited withdrawal privileges
function GetGuildBankWithdrawMoney() end

--- Returns the number of transactions in the guild bank money log
---@return number numTransactions Number of transactions in the money log
function GetNumGuildBankMoneyTransactions() end

--- Returns the number of purchased tabs in the guild bank. Returns valid information even if the player is not interacting with a guild bank vault.
---@return number numTabs Number of active tabs in the guild bank
function GetNumGuildBankTabs() end

--- Returns the number of entries in a guild bank tab's transaction log. Only returns valid information following the GUILDBANKLOG_UPDATE event which fires after calling QueryGuildBankLog() .
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@return number numTransactions Number of transactions in the tab's log
function GetNumGuildBankTransactions(tab) end

--- Requests the item transaction log for a guild bank tab from the server. Fires the GUILDBANKLOG_UPDATE event when transaction log information becomes available.
--- Flags: server
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
function QueryGuildBankLog(tab) end

--- Requests information about the contents of a guild bank tab from the server. Fires the GUILDBANKBAGSLOTS_CHANGED event when information about the tab's contents becomes available.
--- Flags: server
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
function QueryGuildBankTab(tab) end

--- Requests guild bank tab info text from the server. The text is not returned immediately; the GUILDBANK_UPDATE_TEXT event fires when text is available for retrieval by the GetGuildBankText() function.
--- Flags: server
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
function QueryGuildBankText(tab) end

--- Selects a tab in the guild bank
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
function SetCurrentGuildBankTab(tab) end

--- Sets the name and icon for a guild bank tab
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param name string New name for the tab
---@param iconIndex number Index of an icon for the tab (between 1 and GetNumMacroItemIcons() )
function SetGuildBankTabInfo(tab, name, iconIndex) end

--- Changes guild bank tab permissions for the guild rank being edited
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param permission any Index of a permission to edit ( number ) 1 - View tab 2 - Deposit items
---@param enabled boolean True to allow permission for the action to the guild rank; false to deny
function SetGuildBankTabPermissions(tab, permission, enabled) end

--- Sets the number of item withdrawals allowed per day for the guild rank being edited
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/SetGuildBankTabWithdraw
function SetGuildBankTabWithdraw() end

--- Sets the info text for a guild bank tab
---@param tab number Index of a guild bank tab (between 1 and GetNumGuildBankTabs() )
---@param text string New info text for the tab
function SetGuildBankText(tab, text) end

--- Sets the maximum amount of money withdrawals per day allowed for the guild rank being edited
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/SetGuildBankWithdrawLimit
function SetGuildBankWithdrawLimit() end

--- Attempts to withdraw money from the guild bank. Causes a PLAYER_MONEY event to fire, indicating the amount withdrawn has been added to the player's total (see GetMoney() ). Causes an error or system message if amount exceeds the amount of money in the guild bank or the player's allowed daily withdrawal amount.
--- Flags: confirmation
---@param amount number Amount of money to withdraw (in copper)
function WithdrawGuildBankMoney(amount) end
