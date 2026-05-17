--==============================
-- Container functions
--==============================

--- Returns the inventoryID corresponding to a given containerID
---@param container number Index of one of the player's bags or other containers
---@return number inventoryID Identifier for the container usable with Inventory APIs
function ContainerIDToInventoryID(container) end

--- Sells an item purchased with alternate currency back to a vendor. Items bought with alternate currency (honor points, arena points, or special items such as Emblems of Heroism and Dalaran Cooking Awards) can be returned to a vendor for a full refund, but only within a limited time after the original purchase.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
function ContainerRefundItemPurchase(container, slot) end

--- Returns the name of one of the player's bags. Returns nil for the bank and keyring, for bank bags while the player is not at the bank, and for empty bag or bank bag slots.
---@param container number Index of one of the player's bags or other containers
---@return string name Name of the container
function GetBagName(container) end

--- Returns a list of open slots in a container. The optional argument returnTable allows for performance optimization in cases where this function is expected to be called repeatedly. Rather than creating new tables each time the function is called (eventually requiring garbage collection), an existing table can be recycled. (Note, however, that this function does not clear the table's contents; use wipe() first to guarantee consistent results.)
---@param container number Index of one of the player's bags or other containers
---@param returnTable table Reference to a table to be filled with return values
---@return table slotTable A table listing the indices of open slots in the given container
function GetContainerFreeSlots(container, returnTable) end

--- Returns cooldown information about an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the item is ready
---@return number duration The length of the cooldown, or 0 if the item is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the item is ready.)
function GetContainerItemCooldown(container, slot) end

--- Returns durability status for an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return number durability The item's current durability
---@return number max The item's maximum durability
function GetContainerItemDurability(container, slot) end

--- Returns the gems socketed in an item in the player's bags. The IDs returned refer to the gems themselves (not the enchantments they provide), and thus can be passed to GetItemInfo() to get a gem's name, quality, icon, etc.
---@param container any The index of the container
---@param slot number The slot within the given container; slots are numbered left-to-right, top-to-bottom, starting with the leftmost slot on the top row
---@return any gem1 Item ID of the first gem socketed in the item
---@return any gem2 Item ID of the second gem socketed in the item
---@return any gem3 Item ID of the third gem socketed in the item
function GetContainerItemGems(container, slot) end

--- Returns the item ID of an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return any id Numeric ID of the item in the given slot
function GetContainerItemID(container, slot) end

--- Returns information about an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return string texture Path to the icon texture for the item
---@return number count Number of items in the slot
---@return any locked 1 if the item is locked; otherwise nil. Items become locked while being moved, split, or placed into other UI elements (such as the mail, trade, and auction windows).
---@return number quality Quality (or rarity) of the item
---@return any readable 1 if the item is readable; otherwise nil. This value is used by the default UI to show a special cursor over items such as books and scrolls which can be read by right-clicking.
---@return any lootable 1 if the item is a temporary container containing items that can be looted; otherwise nil. Examples include the Bag of Fishing Treasures and Small Spice Bag rewarded by daily quests, lockboxes (once unlocked), and the trunks occasionally found while fishing.
---@return any link A hyperlink for the item
function GetContainerItemInfo(container, slot) end

--- Returns a hyperlink for an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return string link A hyperlink for the item
function GetContainerItemLink(container, slot) end

--- Returns information about alternate currencies refunded for returning an item to vendors.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@param IsEquipped boolean wheather to get an equipped item info
---@return number money Amount of copper to be refunded
---@return number itemCount Number of different item currencies to be refunded (e.g. the price a PvP mount is in 3 currencies, as it requires multiple battlegrounds' Marks of Honor)
---@return number refundSec Seconds remaining until this item is no longer eligible to be returned for a refund
---@return number currecycount Amount of currency to be refunded
---@return number hasEnchants weather the item is enchanted
function GetContainerItemPurchaseInfo(container, slot, IsEquipped) end

--- Returns information about a specific currency refunded for returning an item to vendors. See GetContainerItemPurchaseInfo for more information about alternate currency refunds.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@param index number Index of the currency type; between 1 and itemCount , where itemCount is the 4th return from GetContainerItemPurchaseInfo() for the same container and slot
---@return string texture Path to an icon texture for the currency item
---@return number quantity Quantity of the currency item to be refunded
---@return any link Hyperlink for the currency item
function GetContainerItemPurchaseItem(container, slot, index) end

--- Returns the number of free slots in a container and the types of items it can hold
---@param container number Index of one of the player's bags or other containers
---@return number freeSlots Number of empty slots in the bag
---@return number bagType Bitwise OR of the item families that can be put into the container; see GetItemFamily for details
function GetContainerNumFreeSlots(container) end

--- Returns the number of slots in one of the player's bags
---@param container number Index of one of the player's bags or other containers
---@return number numSlots Number of item slots in the container
function GetContainerNumSlots(container) end

--- Returns information about special bag types that can hold a given item. The meaning of bagType varies depending on the item:
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any bagType Bitwise OR of bag type flags: ( number , bitfield ) 0x0001 - Quiver 0x0002 - Ammo Pouch 0x0004 - Soul Bag 0x0008 - Leatherworking Bag 0x0010 - Inscription Bag 0x0020 - Herb Bag 0x0040 - Enchanting Bag 0x0080 - Engineering Bag 0x0100 - Keyring 0x0200 - Gem Bag 0x0400 - Mining Bag 0x0800 - Unused 0x1000 - Vanity Pets
function GetItemFamily(itemID, itemName, itemLink) end

--- Puts an equipped container onto the cursor
---@param slot number An inventory slot containing a bag (see GetInventorySlotInfo() , ContainerIDToInventoryID() )
function PickupBagFromSlot(slot) end

--- Picks up an item from or puts an item into a slot in one of the player's bags or other containers. If the cursor is empty and the referenced container slot contains an item, that item is put onto the cursor. If the cursor contains an item and the slot is empty, the item is placed into the slot. If both the cursor and the slot contain items, the contents of the cursor and the container slot are exchanged.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
function PickupContainerItem(container, slot) end

--- Puts the item on the cursor into the player's backpack. The item will be placed in the lowest numbered slot ( containerSlotID ) in the player's backpack.
---@return any hadItem 1 if the cursor had a item; otherwise nil
function PutItemInBackpack() end

--- Puts the item on the cursor into one of the player's bags or other containers. The item will be placed in the lowest numbered slot ( containerSlotID ) in the container.
---@param container number Index of one of the player's bags or other containers
---@return any hadItem 1 if the cursor had a item; otherwise nil
function PutItemInBag(container) end

--- Sets a Texture object to display the icon of one of the player's bags. Adapts the square item icon texture to fit within the circular "portrait" frames used in many default UI elements.
---@param texture table A Texture object
---@param container number Index of one of the player's bags or other containers
function SetBagPortraitTexture(texture, container) end

--- Opens an item from the player's bags for socketing
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
function SocketContainerItem(container, slot) end

--- Picks up only part of a stack of items from one of the player's bags or other containers. Has no effect if the given amount is greater than the number of items stacked in the slot.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@param amount number Number of items from the stack to pick up
function SplitContainerItem(container, slot, amount) end

--- Activate (as with right-clicking) an item in one of the player's bags. Has the same effect as right-clicking an item in the default UI; therefore, results may vary by context. In cases of conflict, conditions listed first override those below:
--- Flags: protected
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@param target string A unit to be used as target for the action
function UseContainerItem(container, slot, target) end
