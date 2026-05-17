--==============================
-- Item functions
--==============================

--- Confirms enchanting an item (when the item will become soulbound as a result). Usable following the BIND_ENCHANT event which fires upon attempting to perform an enchantment that would cause the target item to become soulbound.
--- Flags: confirmation
function BindEnchant() end

--- Confirms using an item, if using the item causes it to become soulbound. Usable in response to the USE_BIND_CONFIRM which fires when the player attempts to use a "Bind on Use" item.
--- Flags: confirmation
function ConfirmBindOnUse() end

--- Confirms taking an action which renders a looted Bind on Pickup item non-tradeable. A Bind on Pickup item looted by the player can be traded to other characters who were originally eligible to loot it, but only within a limited time after looting. This period can be ended prematurely if the player attempts certain actions (such as enchanting the item).
--- Flags: confirmation
---@param id number Number identifying the item (as provided by the END_BOUND_TRADEABLE event)
function EndBoundTradeable(id) end

--- Confirms taking an action which renders a purchased item non-refundable. Items bought with alternate currency (honor points, arena points, or special items such as Emblems of Heroism and Dalaran Cooking Awards) can be returned to a vendor for a full refund, but only within a limited time after the original purchase. This period can be ended prematurely if the player attempts certain actions (such as enchanting the item).
--- Flags: confirmation
---@param id number Number identifying the item (as provided by the END_REFUND event)
function EndRefund(id) end

--- Returns cooldown information about an arbitrary item
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the item is ready
---@return number duration The length of the cooldown, or 0 if the item is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the item is ready.)
function GetItemCooldown(itemID, itemName, itemLink) end

--- Returns information about how many of a given item the player has or on remaining item charges.
---@param itemId number An item id
---@param itemName string An item name
---@param itemLink string An item link
---@param includeBank boolean true to include items in the bank in the returned count, otherwise false
---@param includeCharges boolean true to count charges for applicable items, otherwise false
---@return number itemCount The number of the given item the player has in possession (possibly including items in the bank), or the total number of charges on those items
function GetItemCount(itemId, itemName, itemLink, includeBank, includeCharges) end

--- Returns the path to an icon texture for the item. Unlike GetItemInfo , this function always returns icons for valid items, even if the item is not in the client's cache.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return string texture Path to an icon texture for the item
function GetItemIcon(itemID, itemName, itemLink) end

--- Returns information about an item, by name, link or id. Only returns information for items in the WoW client's local cache; returns nil for items the client has not seen.
---@param itemID number An item's ID
---@param itemName string An item's name.  This value will only work if the player has the item in their bags.
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return string name Name of the item
---@return string link A hyperlink for the item
---@return number quality Quality (rarity) level of the item.
---@return number iLevel Internal level of the item;
---@return number reqLevel Minimum character level required to use or equip the item
---@return string class Localized name of the item's class/type (as in the list returned by GetAuctionItemClasses() )
---@return string subclass Localized name of the item's subclass/subtype (as in the list returned by GetAuctionItemSubClasses() )
---@return number maxStack Maximum stack size for the item (i.e. largest number of items that can be held in a single bag slot)
---@return string equipSlot Non-localized token identifying the inventory type of the item (as in the list returned by GetAuctionItemInvTypes() ); name of a global variable containing the localized name of the inventory type
---@return string texture Path to an icon texture for the item
---@return number vendorPrice Price an NPC vendor will pay to buy the item from the player.  This value was added in patch 3.2.
function GetItemInfo(itemID, itemName, itemLink) end

--- Returns color values for use in displaying items of a given quality. Color components are floating-point values between 0 (no component) and 1 (full intensity of the component).
---@param quality number An numeric item quality (rarity) value
---@return number redComponent Red component of the color
---@return number greenComponent Green component of the color
---@return number blueComponent Blue component of the color
---@return string hexColor Color value of a colorString for formatting text with the color
function GetItemQualityColor(quality) end

--- Returns information about the spell cast by an item's "Use:" effect
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return string name Name of the spell
---@return string rank Secondary text associated with the spell (often a rank, e.g. "Rank 7"); or the empty string ( "" ) if not applicable
function GetItemSpell(itemID, itemName, itemLink) end

--- Returns a summary of the difference in stat bonuses between two items. Keys in the table returned are the names of global variables containing the localized names of the stats (e.g. _G["ITEM_MOD_SPIRIT_SHORT"] = "Spirit" , _G["ITEM_MOD_HIT_RATING_SHORT"] = "Hit Rating" ).
---@param item1Link string An item's hyperlink, or any string containing the itemString portion of an item link
---@param item2Link string Another item's hyperlink, or any string containing the itemString portion of an item link
---@param returnTable table Reference to a table to be filled with return values
---@return table statTable A table listing the difference in stat bonuses provided by the items (i.e. if item1Link is equipped, what changes to the player's stats would occur if it is replaced by item2Link )
function GetItemStatDelta(item1Link, item2Link, returnTable) end

--- Returns a summary of an item's stat bonuses. Keys in the table returned are the names of global variables containing the localized names of the stats (e.g. _G["ITEM_MOD_SPIRIT_SHORT"] = "Spirit" , _G["ITEM_MOD_HIT_RATING_SHORT"] = "Hit Rating" ).
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@param returnTable table Reference to a table to be filled with return values
---@return table statTable A table listing the stat bonuses provided by the item
function GetItemStats(itemLink, returnTable) end

--- Returns information about uniqueness restrictions for equipping an item.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's link
---@return number uniqueFamily The family of items with special uniqueness restrictions to which the item belongs
---@return number maxEquipped The maximum number of items under this restriction that can be equipped
function GetItemUniqueness(itemID, itemName, itemLink) end

--- Returns whether an item is consumable. Indicates whether the item is destroyed upon use, not necessarily whether it belongs to the "Consumable" type/class.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any consumable 1 if the item is consumable; otherwise nil
function IsConsumableItem(itemID, itemName, itemLink) end

--- Returns whether an item is being used
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isItem 1 if the item's "Use:" action is currently being cast, is waiting for the user to choose a target, or is otherwise in progress; otherwise nil
function IsCurrentItem(itemID, itemName, itemLink) end

--- Returns whether an item's appearance can be previewed using the Dressing Room feature
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isDressable 1 if the item's appearance can be previewed using the Dressing Room feature; otherwise nil
function IsDressableItem(itemID, itemName, itemLink) end

--- Returns whether an item can be equipped. Indicates whether an item is capable of being equipped on a character, not necessarily whether the player character is able to wear it.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isEquippable 1 if the item can be equipped, otherwise nil
function IsEquippableItem(itemID, itemName, itemLink) end

--- Returns whether an item can be used against hostile units. Harmful items include grenades and various quest items ("Use this to zap 30 murlocs!").
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isHarmful 1 if the item can be used against hostile units; otherwise nil
function IsHarmfulItem(itemID, itemName, itemLink) end

--- Returns whether an item can be used on the player or friendly units. Helpful items include potions, scrolls, food and drink.
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any isHarmful 1 if the item can be used on the player or friendly units; otherwise nil
function IsHelpfulItem(itemID, itemName, itemLink) end

--- Returns whether the player is in range to use an item on a unit
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@param unit string A unit on which to use the item
---@return any inRange 1 if the player is near enough to use the item on the unit; 0 if not in range; nil if the unit is not a valid target for the item
function IsItemInRange(itemID, itemName, itemLink, unit) end

--- Returns whether an item can currently be used. Does not account for item cooldowns (see GetItemCooldown() -- returns 1 if other conditions allow for using the item (e.g. if the item can only be used while outdoors).
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's link
---@return any isUsable 1 if the item is usable; otherwise nil
---@return any notEnoughMana 1 if the player lacks the resources (e.g. mana, energy, runes) to use the item; otherwise nil
function IsUsableItem(itemID, itemName, itemLink) end

--- Returns whether an item has a range limitation for its use. For example, Mistletoe can only be used on another character within a given range of the player, but a Hearthstone has no target and thus no range restriction. Returns nil for items which have a range restriction but are area-targeted and not unit-targeted (e.g. grenades).
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@return any hasRange 1 if the item has an effective range; otherwise nil.
function ItemHasRange(itemID, itemName, itemLink) end

--- Confirms replacing an existing enchantment. Usable in response to the REPLACE_ENCHANT event which fires when the player attempts to apply a temporary or permanent enchantment to an item which already has one.
--- Flags: confirmation
function ReplaceEnchant() end

--- Returns whether the spell currently awaiting a target requires an item to be chosen. Only applies when the player has attempted to cast a spell but the spell requires a target before it can begin casting (i.e. the glowing hand cursor is showing).
---@return any canTarget 1 if the spell can target an item; otherwise nil
function SpellCanTargetItem() end

--- Casts the spell currently awaiting a target on an item. Usable when the player has attempted to cast a spell (e.g. an Enchanting recipe or the "Use:" effect of a sharpening stone or fishing lure) but the spell requires a target before it can begin casting (i.e. the glowing hand cursor is showing).
--- Flags: protected
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
function SpellTargetItem(itemID, itemName, itemLink) end

--- Uses an arbitrary item (optionally on a specified unit) protected
--- Flags: protected
---@param name string The name of the item to use
---@param target any The unit to use as the target of the item, if applicable
function UseItemByName(name, target) end
