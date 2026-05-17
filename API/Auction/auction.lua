--==============================
-- Auction functions
--==============================

--- Returns the deposit amount for the item currently being set up for auction. Only returns useful information once an item has been placed in the Create Auction UI's "auction item" slot (see ClickAuctionSellItemButton() ).
---@param runTime any Run time of the proposed auction ( number ) 720 - 12 hours 1440 - 24 hours 2880 - 48 hours
---@return number deposit Amount of the deposit (in copper)
function CalculateAuctionDeposit(runTime) end

--- Returns whether one of the player's auctions can be canceled. Generally, non-cancelable auctions are those which have completed but for which payment has not yet been delivered.
---@param index number Index of an auction in the "owner" listing
---@return any canCancel 1 if the auction can be canceled; otherwise nil
function CanCancelAuction(index) end

--- Returns whether the player can perform an auction house query. All auction query types are throttled, preventing abuse of the server by clients sending too many queries in short succession. Normal queries can be sent once every few seconds; mass queries return all results in the auction house instead of one "page" at a time, and can only be sent once every several minutes.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@return any canQuery 1 if the player can submit an auction query; otherwise nil
---@return any canMassQuery 1 if the player can submit a mass auction query; otherwise nil
function CanSendAuctionQuery(list) end

--- Cancels an auction created by the player. When canceling an auction, the deposit amount is not refunded.
--- Flags: confirmation
---@param index number Index of an auction in the "owner" listing
function CancelAuction(index) end

--- Picks up an item from or puts an item into the "Create Auction" slot. If the cursor is empty and the slot contains an item, that item is put onto the cursor. If the cursor contains an item and the slot is empty, the item is placed into the slot. If both the cursor and the slot contain items, the contents of the cursor and the slot are exchanged.
function ClickAuctionSellItemButton() end

--- Ends interaction with the Auction House UI. Causes the AUCTION_HOUSE_CLOSED event to fire, indicating that Auction-related APIs may be unavailable or no longer return valid data.
function CloseAuctionHouse() end

--- Returns the deposit rate for the current auction house. Obsolete (returns different values for faction and neutral auction houses, but these values do not describe the ratio of auction deposit to an item's vendor buy or sell price); use CalculateAuctionDeposit() instead.
--- Flags: deprecated
---@return number rate The current auction house deposit rate
function GetAuctionHouseDepositRate() end

--- Returns a list of the inventory subtypes for a given auction house item subclass. Inventory types are the second level of hierarchy seen when browsing item classes (categories) and subclasses at the Auction House: Head , Neck , Shirt , et al for Miscellaneous ; Head , Shoulder , Chest , Wrist , et al for Cloth ; etc.
---@param classIndex number Index of an item class (in the list returned by GetAuctionItemClasses() ); currently, inventory types are only applicable in class 2 (armor)
---@param subClassIndex any Index of an item subclass (in the list returned by GetAuctionItemSubClasses(classIndex) ); currently, inventory types are only applicable in the armor subclasses listed below: ( number ) 1 - Miscellaneous 2 - Cloth 3 - Leather 4 - Mail 5 - Plate
---@return string token Name of a global variable containing the localized name of the inventory type (e.g. INVTYPE_FINGER )
---@return any display 1 if the inventory type should be displayed; otherwise nil (used in the default auction UI to hide subclass/invType combinations that don't exist in the game; e.g. Plate/Back, Leather/Trinket, etc)
function GetAuctionInvTypes(classIndex, subClassIndex) end

--- Returns a list of localized item class (category) names. Item classes are the first level of hierarchy seen when browsing at the Auction House: Weapon , Armor , Container , Consumable , etc.
function GetAuctionItemClasses() end

--- Returns information about an auction listing
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of an auction in the listing
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number count Number of items in the stack
---@return number quality The quality (rarity) level of the item
---@return any canUse 1 if the player character can use or equip the item; otherwise nil
---@return number level Required character level to use or equip the item
---@return number minBid Minimum cost to bid on the item (in copper)
---@return number minIncrement Minimum bid increment to become the highest bidder on the item (in copper)
---@return number buyoutPrice Buyout price of the auction (in copper)
---@return number bidAmount Current highest bid on the item (in copper); 0 if no bids have been placed
---@return any highestBidder 1 if the player is currently the highest bidder; otherwise nil
---@return string owner Name of the character who placed the auction
---@return number sold 1 if the auction has sold (and payment is awaiting delivery; applies only to owner auctions); otherwise nil
function GetAuctionItemInfo(list, index) end

--- Returns a hyperlink for an item in an auction listing
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of an auction in the listing
---@return string link A hyperlink for the item
function GetAuctionItemLink(list, index) end

--- Returns a list of localized subclass names for a given item class. Item subclasses are the second level of hierarchy seen when browsing item classes (categories) at the Auction House: One-Handed Axes , Two-Handed Axes , Bows , Guns , et al for Weapon ; Cloth , Leather , Plate , Shields , et al for Armor ; Food & Drink , Potion , Elixir et al for Consumable ; Red , Blue , Yellow , et al for Gem ; etc.
---@param classIndex number Index of an item class (in the list returned by GetAuctionItemClasses() )
function GetAuctionItemSubClasses(classIndex) end

--- Returns the time remaining before an auction listing expires
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of an auction in the listing
---@return any duration General indication of the amount of time remaining on the auction ( number ) 1 - Short (less than 30 minutes) 2 - Medium (30 minutes to 2 hours) 3 - Long (2 hours to 12 hours) 4 - Very Long
function GetAuctionItemTimeLeft(list, index) end

--- Returns information about the item currently being set up for auction. Only returns useful information once an item has been placed in the Create Auction UI's "auction item" slot (see ClickAuctionSellItemButton() ).
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number count Number of items in the stack
---@return number quality Quality (rarity) level of the item
---@return any canUse 1 if the player character can use or equip the item; otherwise nil
---@return number price Price to sell the item to a vendor (in copper)
function GetAuctionSellItemInfo() end

--- Returns the current sort settings for auction data. The index argument describes priority order for sort criteria: e.g. if GetAuctionSort("list",1) returns quality and GetAuctionSort("list",2) returns level,1 , items are sorted first by itemQuality and items with the same quality are sorted by required level.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of a sorting priority
---@return string criterion Non-localized string naming the criterion (or column in the default UI) by which listings are sorted
---@return any reverse 1 if listings are sorted in reverse order; otherwise nil. "Reverse" here is relative to the default order, not to absolute value: e.g. the default order for quality is descending (Epic, Rare, Uncommon, etc), but the default order for level is ascending (1-80)
function GetAuctionSort(list, index) end

--- Requests data from the server for the list of auctions bid on by the player. The AUCTION_BIDDER_LIST_UPDATE event fires if new data is available; listing information can then be retrieved using GetAuctionItemInfo() or other Auction APIs.
--- Flags: server
function GetBidderAuctionItems() end

--- Returns auction house invoice information for a mail message
---@param index number Index of the mail message in the inbox (between 1 and GetInboxNumItems() )
---@return any invoiceType Type of invoice ( string ) buyer - An invoice for an item the player won seller - An invoice for an item the player sold seller_temp_invoice - A temporary invoice for an item sold by the player but for which payment has not yet been delivered
---@return string itemName Name of the item
---@return string playerName Name of the player who bought or sold the item
---@return number bid Amount of the winning bid or buyout
---@return number buyout Amount of buyout (if the auction was bought out)
---@return number deposit Amount of money paid in deposit
---@return number consignment Amount withheld from the deposit by the auction house as charge for running the auction
---@return number moneyDelay Delay for delivery of payment on a temporary invoice (in minutes; generally 60)
---@return number etaHour Hour portion (on a 24-hour clock) of the estimated time for delivery of payment on a temporary invoice
---@return number etaMin Minute portion of the estimated time for delivery of payment on a temporary invoice
function GetInboxInvoiceInfo(index) end

--- Returns the number of auction items in a listing
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@return number numBatchAuctions Number of auctions in the current page of the listing
---@return number totalAuctions Total number of auctions available for the listing
function GetNumAuctionItems(list) end

--- Requests data from the server for the list of auctions created by the player. The AUCTION_OWNED_LIST_UPDATE event fires if new data is available; listing information can then be retrieved using GetAuctionItemInfo() or other Auction APIs.
--- Flags: server
function GetOwnerAuctionItems() end

--- Returns the index of the currently selected item in an auction listing. Auction selection is used only for display and internal recordkeeping in the default UI; it has no direct effect on other Auction APIs.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@return number index Index of the currently selected auction item
function GetSelectedAuctionItem(list) end

--- Returns whether a sort criterion is applied in reverse order. No longer used in the default UI; see GetAuctionSort() instead.
--- Flags: deprecated
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param sort string A sort criterion
---@return any isReversed 1 if the criterion is applied in reverse order; otherwise nil
---@return any isSorted 1 if the criterion is currently used for the given listing; otherwise nil
function IsAuctionSortReversed(list, sort) end

--- Places a bid on (or buys out) an auction item. Attempting to bid an amount equal to or greater than the auction's buyout price will buy out the auction (spending only the exact buyout price) instead of placing a bid.
--- Flags: confirmation
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of an auction in the listing
---@param bid number Amount to bid (in copper)
function PlaceAuctionBid(list, index, bid) end

--- Requests data from the server for the list of auctions meeting given search criteria. If any search criterion is omitted or nil , the search will include all possible values for that criterion.
--- Flags: server
---@param name string Full or partial item name to limit search results; will match any item whose name contains this string
---@param minLevel number Maximum required character level of items to limit search results
---@param maxLevel number Maximum required character level of items to limit search results
---@param invTypeIndex number Index of an item inventory type to limit search results (note that GetAuctionInvTypes(classIndex, subClassIndex) returns a list of token, display pairs for each inventory type; thus, to convert a token index from that list for use here, divide by 2 and round up)
---@param classIndex number Index of an item class to limit search results (in the list returned by GetAuctionItemClasses() )
---@param subClassIndex number Index of an item subclass to limit search results (in the list returned by GetAuctionItemSubClasses(classIndex) )
---@param page number Which "page" of search results to list, if more than NUM_AUCTION_ITEMS_PER_PAGE (50) auctions are available; nil to query the first (or only) page
---@param isUsable boolean True to limit search results to only items which can be used or equipped by the player character; otherwise false
---@param minQuality any Minimum quality (rarity) level of items to limit search results
---@param getAll boolean True to perform a mass query (returning all listings at once); false to perform a normal query (returning a large number of listings in "pages" of NUM_AUCTION_ITEMS_PER_PAGE [50] at a time)
function QueryAuctionItems(name, minLevel, maxLevel, invTypeIndex, classIndex, subClassIndex, page, isUsable, minQuality, getAll) end

--- Selects an item in an auction listing. Auction selection is used only for display and internal recordkeeping in the default UI; it has no direct effect on other Auction APIs.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param index number Index of an auction in the listing
function SetSelectedAuctionItem(list, index) end

--- Applies a set of auction listing sort criteria set via SortAuctionSetSort . Sort criteria are applied server-side, affecting not only the order of items within one "page" of listings but the order in which items are collected into pages.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
function SortAuctionApplySort(list) end

--- Clears any current sorting rules for an auction house listing
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
function SortAuctionClearSort(list) end

--- Sorts the auction house listing. No longer used in the default UI; see SortAuctionClearSort() , SortAuctionSetSort() , and SortAuctionApplySort() instead.
--- Flags: deprecated
---@param type any The type of auction listing to sort ( string ) bidder - Auctions the player has bid on list - Standard auction house listing owner - Auctions the player has placed
---@param sort any Criterion for sorting the list ( string ) bid - Amount of the current or minimum bid on the item buyout - Buyout price of the item duration - Time remaining before the auction expires level - Required character level to use or equip the item minbidbuyout - Buyout price, or minimum bid if no buyout price is available name - Name of the item quality - itemQuality of the item quantity - Number of stacked items in the auction seller - Name of the character who created of the auction (or in the owner listing, the current high bidder) status - Status of the auction
function SortAuctionItems(type, sort) end

--- Builds a list of sort criteria for auction listings. Has no effect until SortAuctionApplySort(type) is called; thus, this function can be called repeatedly to build a complex set of sort criteria. Sort criteria are applied server-side, affecting not only the order of items within one "page" of listings but the order in which items are collected into pages.
---@param list any Type of auction listing ( string ) bidder - Auctions the player has bid on list - Auctions the player can browse and bid on or buy out owner - Auctions the player placed
---@param sort any Criterion to add to the sort ( string ) bid - Amount of the current or minimum bid on the item buyout - Buyout price of the item duration - Time remaining before the auction expires level - Required character level to use or equip the item minbidbuyout - Buyout price, or minimum bid if no buyout price is available name - Name of the item quality - itemQuality of the item quantity - Number of stacked items in the auction seller - Name of the character who created of the auction (or in the owner listing, the current high bidder) status - Status of the auction
---@param reversed boolean True to sort in reverse order; otherwise false. "Reverse" here is relative to the default order, not to absolute value: e.g. the default order for quality is descending (Epic, Rare, Uncommon, etc), but the default order for level is ascending (1-80)
function SortAuctionSetSort(list, sort, reversed) end

--- Creates an auction for the item currently in the "auction item" slot. Has no effect unless an item has been placed in the Create Auction UI's "auction item" slot (see ClickAuctionSellItemButton() ). With patch 3.3.3 the runTime arg was changed from minutes to an index and the stackSize/numStacks args were added for batch posting.
---@param minBid number Minimum bid for the auction (in copper)
---@param buyoutPrice number Buyout price for the auction (in copper)
---@param runTime any Run time until the auction expires (an index indicating number of hours) ( number ) 1 - 12 hours 2 - 24 hours 3 - 48 hours
---@param stackSize number Number of items to post in each auction
---@param numStacks number Number of auctions (stacks) to post
function StartAuction(minBid, buyoutPrice, runTime, stackSize, numStacks) end
