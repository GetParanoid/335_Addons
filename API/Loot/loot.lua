--==============================
-- Loot functions
--==============================

--- Ends interaction with a lootable corpse or object. Causes the LOOT_CLOSED event to fire, indicating that Loot APIs may no longer have effects or return valid data.
function CloseLoot() end

--- Confirms the player's intent regarding an item up for loot rolling. Usable after the CONFIRM_LOOT_ROLL event fires, warning that an item binds on pickup.
--- Flags: confirmation
---@param id number Index of an item currently up for loot rolling (as provided in the START_LOOT_ROLL event)
---@param rollType any Type of roll action to perform ( number ) 0 - Pass (declines the loot) 1 - Roll "need" (wins if highest roll) 2 - Roll "greed"
function ConfirmLootRoll(id, rollType) end

--- Confirms picking up an item available as loot. Usable after the LOOT_BIND_CONFIRM event fires, warning that an item binds on pickup.
--- Flags: confirmation
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
function ConfirmLootSlot(slot) end

--- Returns information about the current loot method in a party or raid. Only returns useful information if the player is in a party or raid.
---@return any method Current loot method ( string ) freeforall - Free for All - any group member can take any loot at any time group - Group Loot - like Round Robin, but items above a quality threshold are rolled on master - Master Looter - like Round Robin, but items above a quality threshold are left for a designated loot master to needbeforegreed - Need before Greed - like Group Loot, but members automatically pass on items roundrobin - Round Robin - group members take turns being able to loot
---@return number partyMaster Numeric portion of the party unitID of the loot master (e.g. if 2 , the loot master's unitID is party2 ); nil if not using the Master Looter method or if the player is in a raid whose loot master is not in the player's subgroup.  If the player is the master looter, this value will return 0.
---@return number raidMaster Numeric portion of the raid unitID of the loot master (e.g. if 17 , the loot master's unitID is raid17 ); nil if not using the Master Looter method or not in a raid group
function GetLootMethod() end

--- Returns information about an item currently up for loot rolling
---@param id number Index of an item currently up for loot rolling (as provided in the START_LOOT_ROLL event)
---@return string texture Path to an icon texture for the item
---@return string name Name of the item
---@return number count Number of stacked items
---@return number quality Quality (rarity) of the item.
---@return any bindOnPickUp 1 if the item is bind on pickup; otherwise nil
function GetLootRollItemInfo(id) end

--- Returns the amount of time remaining before loot rolling for an item expires. When the time expires, all group members who have not yet chosen to roll Need or Greed automatically pass, random roll results are produced for those who chose to roll, and the server declares a winner and awards the item.
---@param id number Index of an item currently up for loot rolling (as provided in the START_LOOT_ROLL event)
---@return number timeLeft Amount of time remaining before loot rolling for the item expires (in milliseconds)
function GetLootRollTimeLeft(id) end

--- Returns a hyperlink for an item available as loot
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
---@return string texture Path to an icon texture for the item or amount of money
---@return string item Name of the item, or description of the amount of money
---@return number quantity Number of stacked items, or 0 for money
---@return number quality Quality (rarity) of the item
---@return any locked 1 if the item is locked (preventing the player from looting it); otherwise nil
function GetLootSlotInfo(slot) end

--- Returns the threshold used for Master Looter, Group Loot, and Need Before Greed loot methods. Items above the threshold quality will trigger the special behavior of the current loot method: for Group Loot and Need Before Greed, rolling will automatically begin once a group member loots the corpse or object holding the item; for Master Loot, the item will be invisible to all but the loot master tasked with assigning the loot.
---@return number threshold Minimum item quality to trigger the loot method
function GetLootThreshold() end

--- Returns information about a given loot candidate. Used in the default UI to build the popup menu used in master loot assignment. Only valid if the player is the master looter.
---@param index number Index of a member of the party or raid ( not equivalent to the numeric part of a party or raid unitID )
---@return string candidate Name of the candidate
function GetMasterLootCandidate(index) end

--- Returns the number of items available to be looted
---@return number numItems Number of the items available to be looted
function GetNumLootItems() end

--- Returns whether the player has opted out of loot rolls. When opting out, no prompt will be shown for loot which ordinarily would prompt the player to roll (need/greed) or pass; the loot rolling process will continue for other group members as if the player had chosen to pass on every roll.
---@return any isOptOut 1 if the has opted out of loot rolls; otherwise nil
function GetOptOutOfLoot() end

--- Awards a loot item to a group member. Has no effect if the player is not the loot master or if no loot or candidate matching the given parameters exists.
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
---@param index number Index of a loot candidate (see GetMasterLootCandidate() )
function GiveMasterLoot(slot, index) end

--- Returns whether the currently displayed loot came from fishing. Used in the default UI to play a fishing sound effect and change the appearance of the loot window.
---@return any isFishing 1 if the currently displayed loot is fishing loot; otherwise nil
function IsFishingLoot() end

--- Attempts to pick up an item available as loot. If the item in the loot slot binds on pickup, the LOOT_BIND_CONFIRM event fires, indicating that ConfirmLootSlot(slot) must be called in order to actually loot the item. Please note: if you call this while processing a LOOT_OPENED event and it is the last item to be looted from the corpse, can cause LOOT_CLOSED to fire and be processed before your LOOT_OPENED event handler completes.
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
function LootSlot(slot) end

--- Returns whether a loot slot contains money
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
---@return any isCoin 1 if the loot slot contains money; otherwise nil
function LootSlotIsCoin(slot) end

--- Returns whether a loot slot contains an item
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
---@return any isItem 1 if the loot slot contains an item; otherwise nil
function LootSlotIsItem(slot) end

--- Register the player's intent regarding an item up for loot rolling. Rolls are not actually performed until all eligible group members have registered their intent or the time period for rolling expires.
---@param id number Index of an item currently up for loot rolling (as provided in the START_LOOT_ROLL event)
---@param rollType any Type of roll action to perform ( number ) 0 - Pass (declines the loot) 1 - Roll "need" (wins if highest roll) 2 - Roll "greed" (wins if highest roll and no other member rolls "need") 3 - Disenchant
function RollOnLoot(id, rollType) end

--- Sets the loot method for a party or raid group. Has no effect if the player is not the party or raid leader.
---@param method any Method to use for loot distribution ( string ) freeforall - Free for All - any group member can take any loot at any time group - Group Loot - like Round Robin, but items above a quality threshold are rolled on master - Master Looter - like Round Robin, but items above a quality threshold are left for a designated loot master to needbeforegreed - Need before Greed - like Group Loot, but members automatically pass on items roundrobin - Round Robin - group members take turns being able to loot
---@param master string Name or unitID of the master looter
function SetLootMethod(method, master) end

--- Sets a Texture object to show the appropriate portrait image when looting. Normally, the loot portrait image is the same as that of the creature being looted. Not used in the default UI -- a generic image for all loot is used instead.
---@param texture table A Texture object
function SetLootPortrait(texture) end

--- Sets the threshold used for Master Looter, Group Loot, and Need Before Greed loot methods. Has no effect if the player is not the party or raid leader.
---@param threshold number Minimum item quality to trigger the loot method
function SetLootThreshold(threshold) end

--- Changes the player's preference to opt out of loot rolls. When opting out, no prompt will be shown for loot which ordinarily would prompt the player to roll (need/greed) or pass; the loot rolling process will continue for other group members as if the player had chosen to pass on every roll.
---@param enable boolean True to opt out of loot, false to participate in loot rolls
function SetOptOutOfLoot(enable) end
