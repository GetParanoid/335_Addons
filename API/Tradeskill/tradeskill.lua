--==============================
-- Tradeskill functions
--==============================

--- Ends interaction with the Trade Skill UI. Fires the TRADE_SKILL_CLOSE event, indicating that TradeSkill APIs may no longer have effects or return valid data.
function CloseTradeSkill() end

--- Collapses a group header in the trade skill listing. Causes an error if index does not refer to a header.
---@param index number Index of a header in the trade skill list (between 1 and GetNumTradeSkills() )
function CollapseTradeSkillSubClass(index) end

--- Performs a trade skill recipe
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@param repeat number Number of times to repeat the recipe
function DoTradeSkill(index, repeat) end

--- Expands a group header in the trade skill listing. Causes an error if index does not refer to a header.
---@param index number Index of a header in the trade skill list (between 1 and GetNumTradeSkills() )
function ExpandTradeSkillSubClass(index) end

--- Returns the index of the first non-header in the trade skill listing
---@return number index Index of the first trade skill recipe (as opposed to group headers)
function GetFirstTradeSkill() end

--- Returns the number of entries in the trade skill listing. Entries include both group headers and individual trade skill recipes. Reflects the list as it should currently be displayed, not necessarily the complete list -- if headers are collapsed or a filter is enabled, a smaller number will be returned.
---@return number numSkills Number of headers and recipes to display in the trade skill list
function GetNumTradeSkills() end

--- Returns the time remaining on a trade skill recipe's cooldown
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return number cooldown Time remaining before the recipe can be performed again (in seconds), or nil if the recipe is currently available or has no cooldown
function GetTradeSkillCooldown(index) end

--- Returns descriptive text for a tradeskill recipe. Most recipes that create items don't provide descriptive text; it's more often used for enchants and special recipes such as inscription or alchemy research.
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string description Descriptive text for the tradeskill recipe, or nil if no text is associated with the recipe
function GetTradeSkillDescription(index) end

--- Returns the icon for a trade skill recipe. For recipes which create an item, this is generally the icon of the item created; for other recipes (such as enchants and alchemy/inscription research) a generic icon is used.
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string texturePath Path to an icon texture for the recipe
function GetTradeSkillIcon(index) end

--- Returns information about a trade skill header or recipe
---@param index number Index of an entry in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string skillName Name of the entry
---@return any skillType Indicates whether the entry is a header or recipe and difficulty of recipes ( string ) easy - Low chance for the player to gain skill by performing the recipe (displayed as green in the default UI header - This entry is a header and not an actual trade skill recipe medium - Moderate chance for the player to gain skill by performing the recipe (displayed as yellow in the default UI optimal - High chance for the player to gain skill by performing the recipe (displayed as orange in the default UI trivial - No chance for the player to gain skill by performing the recipe (displayed as gray in the default UI
---@return number numAvailable Number of times the player can repeat the recipe given available reagents
---@return any isExpanded 1 if the entry is a header and is expanded; otherwise nil
---@return any serviceType Indicates what type of service the recipe provides (items, enhancements,...) ( string ) Emboss - Applies an emboss (letherworkers) Embrodier - Applies an embroider (tailors) Enchant - Applies an enchant (enchanters) Engrave - Engraves a rune (runeforging) Inscribe - Puts an inscription (scribers) Modify - Puts a socket (blacksmiths) Tinker - Puts a device like webbing or flexweave (engineers) nil - Produces an item
function GetTradeSkillInfo(index) end

--- Returns whether the trade skill listing is filtered by a given item equipment slot
---@param index number Index of an item equipment slot (in the list returned by GetTradeSkillInvSlots() ), or 0 for the "All" filter
---@return any enabled 1 if the filter is enabled; otherwise nil
function GetTradeSkillInvSlotFilter(index) end

--- Returns a list of recipe equipment slots for the current trade skill. These inventory types correspond to those of the items produced (see GetItemInfo() and GetAuctionItemInvTypes() ) and can be used to filter the recipe list.
function GetTradeSkillInvSlots() end

--- Returns the current settings for filtering the trade skill listing by required level of items produced
---@return number minLevel Lowest required level of items to show in the filtered list
---@return number maxLevel Highest required level of items to show in the filtered list
function GetTradeSkillItemLevelFilter() end

--- Returns the current search text for filtering the trade skill listing by name
---@return string text Text to search for in recipe names, produced item names or descriptions, or reagents; nil if no search filter is in use
function GetTradeSkillItemNameFilter() end

--- Returns information about the current trade skill
---@return string tradeskillName Name of the trade skill, or "UNKNOWN" if no trade skill window is open
---@return number rank The character's current rank in the trade skill
---@return number maxLevel The character's current maximum rank in the trade skill (e.g. 300 for a character of Artisan status)
function GetTradeSkillLine() end

--- Returns the number of items created when performing a tradeskill recipe
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return number minMade Minimum number of items created when performing the recipe
---@return number maxMade Maximum number of items created when performing the recipe
function GetTradeSkillNumMade(index) end

--- Returns the number of different reagents required for a trade skill recipe
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return number numReagents Number of different reagents required for the recipe
function GetTradeSkillNumReagents(index) end

--- Returns information about a reagent in a trade skill recipe
---@param skillIndex number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@param reagentIndex number Index of a reagent in the recipe (between 1 and GetTradeSkillNumReagents() )
---@return string reagentName Name of the reagent
---@return string reagentTexture Path to an icon texture for the reagent
---@return number reagentCount Quantity of the reagent required to perform the recipe
---@return number playerReagentCount Quantity of the reagent in the player's possession
function GetTradeSkillReagentInfo(skillIndex, reagentIndex) end

--- Returns the index of the currently selected trade skill recipe. Selection in the recipe list is used only for display in the default UI and has no effect on other Trade Skill APIs.
---@return number index Index of the selected recipe in the trade skill list (between 1 and GetNumTradeSkills() )
function GetTradeSkillSelectionIndex() end

--- Returns whether the trade skill listing is filtered by a given item subclass
---@param index number Index of an item subclass (in the list returned by GetTradeSkillSubClasses() ), or 0 for the "All" filter
---@return any enabled 1 if the filter is enabled; otherwise nil
function GetTradeSkillSubClassFilter(index) end

--- Returns a list of recipe subclasses for the current trade skill. These subclasses correspond to those of the items produced (see GetItemInfo() and GetAuctionItemSubClasses() ) and can be used to filter the recipe list.
function GetTradeSkillSubClasses() end

--- Returns a list of required tools for a trade skill recipe. A tool may be an item (e.g. Blacksmith Hammer , Virtuoso Inking Set ) the player must possess, or a description of a generic (e.g. near an Anvil, in a Moonwell) or specific (e.g. Netherstorm, Emerald Dragonshrine) location to which the player must travel in order to perform the recipe. The hasTool return is only valid for the former.
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
---@return string toolName Name of the required tool
---@return any hasTool 1 if the tool is an item in the player's possession; otherwise nil
function GetTradeSkillTools(index) end

--- Returns the number of times the trade skill recipe currently being performed will repeat. Returns 1 if a recipe is not being performed; after DoTradeSkill() is called, returns the number of repetitions queued (which decrements as each repetition is finished).
---@return number repeatCount Number of times the current recipe will repeat
function GetTradeskillRepeatCount() end

--- Returns whether the TradeSkill UI is showing another player's skill
---@return any isLinked 1 if the TradeSkill APIs currently reflect another character's tradeskill; nil if showing the player's tradeskill or if no skill is shown
---@return string name If showing another character's skill, the name of that character
function IsTradeSkillLinked() end

--- Selects a recipe in the trade skill listing. Selection in the recipe list is used only for display in the default UI and has no effect on other Trade Skill APIs.
---@param index number Index of a recipe in the trade skill list (between 1 and GetNumTradeSkills() )
function SelectTradeSkill(index) end

--- Filters the trade skill listing by equipment slot of items produced
---@param index number Index of an item equipment slot (in the list returned by GetTradeSkillInvSlots() ), or 0 for no filter
---@param enable number 1 to show recipes matching inventory type index in the filtered list; 0 to hide them
---@param exclusive any 1 to disable other subclass filters when enabling this one; otherwise nil
function SetTradeSkillInvSlotFilter(index, enable, exclusive) end

--- Filters the trade skill listing by required level of items produced
---@param minLevel number Lowest required level of items to show in the filtered list
---@param maxLevel number Highest required level of items to show in the filtered list
function SetTradeSkillItemLevelFilter(minLevel, maxLevel) end

--- Filters the trade skill listing by name of recipe, item produced, or reagents. Uses a substring (not exact-match) search: e.g. for a Scribe, the search string "doc" might filter the list to show only Certificate of Ownership because it matches the word "documentation" in that item's tooltip; a search for "stam" will match all items providing a Stamina bonus.
---@param text string Text to search for in recipe names, produced item names or descriptions, or reagents
function SetTradeSkillItemNameFilter(text) end

--- Filters the trade skill listing by subclass of items produced
---@param index number Index of an item subclass (in the list returned by GetTradeSkillSubClasses() ), or 0 for no filter
---@param enable number 1 to show recipes matching subclass index in the filtered list; 0 to hide them
---@param exclusive any 1 to disable other subclass filters when enabling this one; otherwise nil
function SetTradeSkillSubClassFilter(index, enable, exclusive) end

--- Cancels repetition of a trade skill recipe. If a recipe is currently being performed, it will continue, but further scheduled repetitions will be canceled.
function StopTradeSkillRepeat() end

--- Filters the trade skill listing by whether the player currently has enough reagents for each recipe
---@param filter boolean True to filter the recipe listing to show only recipes for which the player currently has enough reagents; false to show all recipes
function TradeSkillOnlyShowMakeable(filter) end

--- Filters the trade skill listing by whether the player can gain skill ranks from each recipe. The default UI does not provide controls for this filter, but it can nonetheless be used to alter the contents of the trade skill recipe listing.
---@param filter boolean True to filter the recipe listing to show only recipes which the player can gain skill ranks by performing; false to show all recipes
function TradeSkillOnlyShowSkillUps(filter) end
