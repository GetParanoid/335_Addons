--==============================
-- Cursor functions
--==============================

--- Adds the money currently on the cursor to the trade window
function AddTradeMoney() end

--- Equips the item on the cursor. The item is automatically equipped in the first available slot in which it fits. To equip an item in a specific slot, see EquipCursorItem() .
function AutoEquipCursorItem() end

--- Clears any contents attached to the cursor. If the cursor contains an item picked up from inventory (equipment slots) or a container, the item returns to its point of origin and the inventory or container slot is unlocked. (To destroy an item, see DeleteCursorItem() ).
function ClearCursor() end

--- Picks up an item from or puts an item into an attachment slot for sending mail. If the cursor is empty and the mail attachment slot contains an item, that item is put onto the cursor. If the cursor contains an item and the slot is empty, the item is placed into the slot. If both the cursor and the slot contain items, the contents of the cursor and the mail attachment slot are exchanged.
---@param index number Index of a mail attachment slot (between 1 and ATTACHMENTS_MAX_SEND )
---@param autoReturn boolean True to automatically return the item in the given attachment slot to the player's bags; false or omitted to put the item on the cursor
function ClickSendMailItemButton(index, autoReturn) end

--- Picks up or places a gem in the Item Socketing UI. If the Item Socketing UI is open and the cursor contains a socketable gem, places the gem into socket index . If the cursor does not hold an item and socket index is not locked, picks up the gem in that socket.
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
function ClickSocketButton(index) end

--- Interacts with an item in a slot offered for trade by the target. Only meaningful when used with the last (7th) trade slot: if an enchantment-type spell is currently awaiting a target (i.e. the glowing hand cursor is showing), targets the item in the given trade slot for the enchantment. (The enchantment to be applied then shows for both parties in the trade, but is not actually performed until both parties accept the trade.)
---@param index number Index of an item slot on the target's side of the trade window (between 1 and MAX_TRADE_ITEMS )
function ClickTargetTradeButton(index) end

--- Picks up an item from or puts an item in a slot offered for trade by the player
---@param index number The index of the trade button window to click
function ClickTradeButton(index) end

--- Returns whether the item on the cursor can be equipped in an inventory slot. Returns nil if the cursor is empty or contains something other than an item.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return any canBePlaced 1 if the item on the cursor can be equipped in the given slot; otherwise nil
function CursorCanGoInSlot(slot) end

--- Returns whether an item is on the cursor. See GetCursorInfo() for more detailed information.
---@return any hasItem 1 if the cursor is currently holding an item; otherwise nil
function CursorHasItem() end

--- Returns whether a macro is on the cursor. See GetCursorInfo() for more detailed information.
---@return any hasMacro 1 if the cursor is currently holding a macro; otherwise nil
function CursorHasMacro() end

--- Returns whether an amount of the player's money is on the cursor. Returns nil if the cursor holds guild bank money. See GetCursorInfo() for more detailed information.
---@return any hasMoney 1 if the cursor is currently holding an amount of the player's money; otherwise nil
function CursorHasMoney() end

--- Returns whether a spell is on the cursor. See GetCursorInfo() for more detailed information.
---@return any hasSpell 1 if the cursor is currently holding a spell; otherwise nil
function CursorHasSpell() end

--- Destroys the item on the cursor. Used in the default UI when accepting the confirmation prompt that appears when dragging and dropping an item to an empty area of the screen.
--- Flags: confirmation
function DeleteCursorItem() end

--- Drops any money currently on the cursor, returning it to where it was taken from
function DropCursorMoney() end

--- "Gives" the item on the cursor to another unit; results vary by context. If the unit is a friendly player, adds the item to the trade window (opening it if necessary, and placing it in the first available trade slot or the "will not be traded" slot depending on whether the item is soulbound). If the unit is the player's pet and the player is a Hunter, attempts to feed the item to the pet (since this casts the Feed Pet spell, in this case this action is protected and can only be called by the Blizzard user interface). For other units, nothing happens and the item remains on the cursor.
---@param unit string A unit to receive the item
---@param name string Name of a unit to receive the item; only valid for player , pet , and party/raid members
function DropItemOnUnit(unit, name) end

--- Puts the item on the cursor into a specific equipment slot. If the item on the cursor can be equipped but does not fit in the given slot, the item is automatically equipped in the first available slot in which it fits (as with AutoEquipCursorItem() ). Thus, this function is most useful when dealing with items which can be equipped in more than one slot: containers, rings, trinkets, and (for dual-wielding characters) one-handed weapons.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function EquipCursorItem(slot) end

--- Returns information about the contents of the cursor
---@return any type Type of data attached to the cursor ( string ) companion equipmentset guildbankmoney item macro merchant money spell
---@return number data Identifier for the data on the cursor; varies by type: ( value ) companion - Index of the companion in the non-combat pet or mount list ( number ) equipmentset - Name of the equipment set ( string ) guildbankmoney - Amount of the money from the guild bank (in copper) ( number ) item - Numeric identifier for the item ( number , itemID ) macro - Index of the macro in the macro listing ( number , macroID ) merchant - Index of the item in the vendor's listings ( number ) money - Amount of the player's money (in copper) ( number ) spell - Index of the spell in the player's spellbook
---@return any subType Secondary identifier for the data on the cursor; used only for certain types: ( string ) companion - "CRITTER" or "MOUNT" , indicating whether the returned data is an index in the non-combat pet or mount list item - A complete hyperlink for the item spell - "spell" or "pet" , indicating whether the returned data is an index in the player's or pet's spellbook
function GetCursorInfo() end

--- Returns the amount of money currently on the cursor
---@return number cursorMoney Amount of money currently on the cursor (in copper)
function GetCursorMoney() end

--- Returns the absolute position of the mouse cursor
---@return number cursorX Scale-independent X coordinate of the cursor's current position
---@return number cursorY Scale-independent Y coordinate of the cursor's current position
function GetCursorPosition() end

--- Returns the frame that is currently under the mouse, and has mouse input enabled.
---@return table frame The frame that currently has the mouse focus
function GetMouseFocus() end

--- Returns the cursor to normal mode after use of ShowRepairCursor()
function HideRepairCursor() end

--- Returns whether the item repair cursor mode is currently active. Repair mode is entered by calling ShowRepairCursor() and exited by calling HideRepairCursor() ; while in repair mode, calling PickupContainerItem() or PickupInventoryItem() will attempt to repair the item (and deduct the cost of such from the player's savings) instead of putting it on the cursor.
---@return any inRepair 1 if repair mode is currently active; otherwise nil
function InRepairMode() end

--- Picks up an item from or puts an item into the guild bank. If the cursor is empty and the referenced guild bank slot contains an item, that item is put onto the cursor. If the cursor contains an item and the slot is empty, the item is placed into the slot. If both the cursor and the slot contain items, the contents of the cursor and the guild bank slot are exchanged.
---@param tab number Index of a guild bank tab
---@param slot number Index of an item slot in the guild bank tab
function PickupGuildBankItem(tab, slot) end

--- Puts money from the guild bank onto the cursor. Money is not actually withdrawn from the guild bank; in the default UI, when the cursor "puts" the money into one of the player's bags, it calls WithdrawGuildBankMoney() .
---@param amount number Amount of money to pick up (in copper)
function PickupGuildBankMoney(amount) end

--- Picks up an item from or puts an item into an equipment slot. If the cursor is empty and the referenced inventory slot contains an item, that item is put onto the cursor. If the cursor contains an item (which can be equipped in the slot) and the slot is empty, the item is placed into the slot. If both the cursor and the slot contain items, the contents of the cursor and the inventory slot are exchanged.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function PickupInventoryItem(slot) end

--- Puts an arbitrary item onto the cursor. Puts an item onto the cursor regardless of its location (equipped, bags, bank or not even in the player's possession); can be used to put an item into an action slot (see PlaceAction() ) even if the player does not currently hold the item. Since the item is not picked up from a specific location, this function cannot be used to move an item to another bag, trade it to another player, attach it to a mail message, destroyed, etc.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
function PickupItem(itemID, itemName, itemLink) end

--- Puts a macro onto the cursor
---@param index number Index of a macro
---@param name string Name of a macro
function PickupMacro(index, name) end

--- Puts an item available for purchase from a vendor onto the cursor
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
function PickupMerchantItem(index) end

--- Puts an amount of the player's money onto the cursor. Money is not immediately deducted from the player's total savings (though it appears such on the default UI's money displays, which generally show GetMoney() - GetCursorMoney() ).
---@param amount number Amount of money to put on the cursor (in copper)
function PickupPlayerMoney(amount) end

--- Puts a spell from the player's or pet's spellbook onto the cursor
---@param id number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
function PickupSpell(id, bookType) end

--- Puts a pet from the stables onto the cursor. Use with ClickStablePet to move pets between stabled and active status.
---@param index any Index of a stable slot ( number ) 0 - Active pet 1 to NUM_PET_STABLE_SLOTS - A stable slot
function PickupStablePet(index) end

--- Puts money offered by the player for trade onto the cursor. Money put onto the cursor is subtracted from the amount offered for trade (see GetPlayerTradeMoney() ).
---@param amount number Amount of money to take from the trade window (in copper)
function PickupTradeMoney(amount) end

--- Returns the cursor to its normal appearance (the glove pointer) and behavior. Has effect after the cursor image/mode has been changed via SetCursor() , ShowContainerSellCursor() , or similar. Has no immediately visible effect if the cursor is holding an item, spell, or other data.
function ResetCursor() end

--- Changes the mouse cursor image. Changes only the appearance of the mouse cursor, not its behavior (and has no effect if the cursor is holding an item, spell, or other data). Passing nil will revert the cursor to its default image.
---@param cursor string Path to a texture to use as the cursor image (must be 32x32 pixels) or one of the built-in cursor tokens.  Valid cursor tokens can be found in the example code.
function SetCursor(cursor) end

--- Changes the cursor to prepare for repurchasing an item recently sold to a vendor. Only changes the cursor image and mode if the given index contains an item.
---@param index number Index of an item in the buyback listing (between 1 and GetNumBuybackItems() )
function ShowBuybackSellCursor(index) end

--- Changes the cursor to prepare for selling an item in the player's bags to a vendor. Only changes the cursor image and mode if the given container and slot contain an item.
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
function ShowContainerSellCursor(container, slot) end

--- Changes the cursor to prepare for selling an equipped item to a vendor. Only changes the cursor image and mode if the given slot contains an item.
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
function ShowInventorySellCursor(slot) end

--- Changes the cursor to prepare for buying an item from a vendor. Only changes the cursor image and mode if the given index contains an item.
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
function ShowMerchantSellCursor(index) end

--- Puts the cursor in item repair mode. Unlike most other cursor functions, this functions changes the behavior as well as the appearance of the mouse cursor: while repair mode is active, calling PickupContainerItem() or PickupInventoryItem() will attempt to repair the item (and deduct the cost of such from the player's savings) instead of putting it on the cursor.
function ShowRepairCursor() end

--- Picks up only part of a stack of items from the guild bank. Has no effect if the given amount is greater than the number of items stacked in the slot.
---@param tab number Index of a guild bank tab
---@param slot number Index of an item slot in the guild bank tab
---@param amount number Number of items from the stack to pick up
function SplitGuildBankItem(tab, slot, amount) end
