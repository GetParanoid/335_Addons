--==============================
-- Hyperlink functions
--==============================

--- Returns a hyperlink for an item recently sold to a vendor and available to be repurchased
---@param index number Index of an item in the buyback listing (between 1 and GetNumBuybackItems() )
---@return string link A hyperlink for the item
function GetBuybackItemLink(index) end

--- Returns a hyperlink for a permanently socketed gem. If the given socket contains a permanently socketed gem, returns an item link for that gem (even if a new gem has been dropped in the socket to overwrite the existing gem, but has not yet been confirmed). If the socket is empty, returns nil .
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
---@return string link A hyperlink for the socketed gem
function GetExistingSocketLink(index) end

--- Returns a hyperlink for an item attached to a mail in the player's inbox
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
---@param attachmentIndex number Index of an attachment to the mail (between 1 and ATTACHMENTS_MAX_RECEIVE )
---@return string itemlink A hyperlink for the attachment item
function GetInboxItemLink(mailID, attachmentIndex) end

--- Returns an item link for an equipped item
---@param unit string A unit to query; only valid for 'player' or the unit currently being inspected
---@param slot number An inventory slot number, as can be obtained from GetInventorySlotInfo
---@return string link An item link for the given item
function GetInventoryItemLink(unit, slot) end

--- Returns information about gems socketed in an item
---@param itemID number An item's ID
---@param itemName string An item's name
---@param itemLink string An item's hyperlink, or any string containing the itemString portion of an item link
---@param index number Index of a socket on the item
---@return string name Name of the gem in the socket
---@return string link A hyperlink for the gem in the socket
function GetItemGem(itemID, itemName, itemLink, index) end

--- Returns a hyperlink for an item currently up for loot rolling
---@param id number Index of an item currently up for loot rolling (as provided in the START_LOOT_ROLL event)
---@return string link A hyperlink for the loot roll item
function GetLootRollItemLink(id) end

--- Returns a hyperlink for an item available as loot. Returns nil if the loot slot is empty or contains money.
---@param slot number Index of a loot slot (between 1 and GetNumLootItems() )
---@return string link A hyperlink for the item
function GetLootSlotLink(slot) end

--- Returns information about the item used by a macro. If a macro contains conditional, random, or sequence commands, this function returns the item which would currently be used if the macro were run.
---@param index number Index of a macro
---@param name string Name of a macro
---@return string name Name of the item
---@return string link A hyperlink for the item
function GetMacroItem(index, name) end

--- Returns a hyperlink for an item available for purchase from a vendor
---@param index number Index of an item in the vendor's listing (between 1 and GetMerchantNumItems() )
---@return string link A hyperlink for the item
function GetMerchantItemLink(index) end

--- Returns a hyperlink for a gem added to a socket. If the given socket contains a new gem (one that has been placed in the UI, but not yet confirmed for permanently socketing into the item), returns an item link for that gem. If the socket is empty or has a permanently socketed gem but no new gem, returns nil .
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
---@return string link A hyperlink for the gem added to the socket
function GetNewSocketLink(index) end

--- Returns a hyperlink for an item in a questgiver dialog. Only valid when the questgiver UI is showing the accept/decline, progress, or completion stages of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED , QUEST_PROGRESS and QUEST_FINISHED , or QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return nil or a value from the most recently displayed quest.
---@param itemType any Token identifying one of the possible sets of items ( string ) choice - Items from which the player may choose a reward required - Items required to complete the quest reward - Items given as reward for the quest
---@param index number Index of an item in the set (between 1 and GetNumQuestChoices() , GetNumQuestItems() , or GetNumQuestRewards() , according to itemType )
---@return string link A hyperlink for the item
function GetQuestItemLink(itemType, index) end

--- Returns a hyperlink for an entry in the player's quest log
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
---@return string link A hyperlink for the quest
function GetQuestLink(questIndex) end

--- Returns a hyperlink for an item related to the selected quest in the quest log
---@param itemType any Token identifying one of the possible sets of items ( string ) choice - Items from which the player may choose a reward reward - Items always given as reward for the quest
---@param index number Index of an item in the set (between 1 and GetNumQuestLogChoices() or GetNumQuestLogRewards() , according to itemType )
function GetQuestLogItemLink(itemType, index) end

--- Returns a hyperlink for an item attached to the outgoing message
---@param slot number Index of an outgoing attachment slot (between 1 and ATTACHMENTS_MAX_SEND )
---@return string itemlink A hyperlink for the attachment item
function GetSendMailItemLink(slot) end

--- Returns a hyperlink for a spell
---@param index number Index of a spell in the spellbook
---@param bookType any Type of spellbook ( string ) pet - The pet's spellbook spell - The player's spellbook
---@param name string Name of a spell, optionally including secondary text (e.g. "Mana Burn" to find the player's highest rank, or "Mana Burn(Rank 2)" -- no space before the parenthesis -- for a specific rank)
---@param id number Numeric ID of a spell
---@return string link A hyperlink for the spell
---@return string tradeLink A hyperlink representing the player's list of trade skill recipes, if the spell is a trade skill (i.e. if "casting" the spell opens a trade skill window)
function GetSpellLink(index, bookType, name, id) end

--- Returns a hyperlink for a talent
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param talentIndex number Index of a talent option (between 1 and GetNumTalents() )
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return string link A hyperlink representing the talent and the number of points spent in it
function GetTalentLink(tabIndex, talentIndex, inspect, pet, talentGroup) end

--- Returns a hyperlink for an item offered for trade by the player
---@param index number Index of an item offered for trade by the player (between 1 and MAX_TRADE_ITEMS )
---@return string link A hyperlink for the item
function GetTradePlayerItemLink(index) end

--- Returns a hyperlink for the item created by a tradeskill recipe. The tooltip produced when resolving the link describes only the item created by the recipe. For a link which describes the recipe itself (its reagents and description), see GetTradeSkillRecipeLink() .
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string link A hyperlink for the item created by the recipe
function GetTradeSkillItemLink(index) end

--- Returns a hyperlink to the player's list of recipes for the current trade skill
---@return string link A hyperlink other players can resolve to see the player's full list of tradeskill recipes
function GetTradeSkillListLink() end

--- Returns a hyperlink for a reagent in a tradeskill recipe
---@param skillIndex number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@param reagentIndex number Index of a reagent in the recipe (between 1 and GetTradeSkillNumReagents() )
---@return string link A hyperlink for the reagent item
function GetTradeSkillReagentItemLink(skillIndex, reagentIndex) end

--- Returns hyperlink for a tradeskill recipe. The tooltip produced when resolving the link describes the recipe itself -- its reagents and (if present) description -- in addition to (if applicable) the item created. For a link which only describes the created item, see GetTradeSkillItemLink() .
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string link A hyperlink for the trade skill recipe
function GetTradeSkillRecipeLink(index) end

--- Returns a hyperlink for an item offered for trade by the target
---@param index number Index of an item offered for trade by the target (between 1 and MAX_TRADE_ITEMS )
---@return string link A hyperlink for the item
function GetTradeTargetItemLink(index) end

--- Returns a hyperlink for the item associated with a trainer service. Currently only returns item links for trainer services which teach trade skill recipes which produce items; does not return spell or recipe links.
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string link A hyperlink for the item associated with a trainer service
function GetTrainerServiceItemLink(index) end
