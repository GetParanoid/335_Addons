--==============================
-- Objectives tracking functions
--==============================

--- Adds a quest to the objectives tracker
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
function AddQuestWatch(questIndex) end

--- Returns the number of quests included in the objectives tracker
---@return number numWatches Number of quests from the quest log currently marked for watching
function GetNumQuestWatches() end

--- Returns the quest log index of a quest in the objectives tracker
---@param index number Index of a quest in the list of quests on the objectives tracker (between 1 and GetNumQuestWatches() )
---@return number questIndex Index of the quest in the quest log (between 1 and GetNumQuestLogEntries() )
function GetQuestIndexForWatch(index) end

--- Returns cooldown information about an item associated with a current quest. Available for a number of quests which involve using an item (i.e. "Use the MacGuffin to summon and defeat the boss", "Use this saw to fell 12 trees", etc.)
---@param questIndex number Index of a quest log entry with an associated usable item (between 1 and GetNumQuestLogEntries() )
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the item is ready
---@return number duration The length of the cooldown, or 0 if the item is ready
---@return number enable 1 if a Cooldown UI element should be used to display the cooldown, otherwise 0. (Does not always correlate with whether the item is ready.)
function GetQuestLogSpecialItemCooldown(questIndex) end

--- Returns information about a usable item associated with a current quest. Available for a number of quests which involve using an item (i.e. "Use the MacGuffin to summon and defeat the boss", "Use this saw to fell 12 trees", etc.)
---@param questIndex number Index of a quest log entry with an associated usable item (between 1 and GetNumQuestLogEntries() )
---@return string link A hyperlink for the item
---@return string icon Path to an icon texture for the item
---@return number charges Number of times the item can be used, or 0 if no limit
function GetQuestLogSpecialItemInfo(questIndex) end

--- Returns whether the player's target is in range for using an item associated with a current quest. Available for a number of quests which involve using an item (i.e. "Use the MacGuffin to summon and defeat the boss", "Use this saw to fell 12 trees", etc.)
---@param questIndex number Index of a quest log entry with an associated usable item (between 1 and GetNumQuestLogEntries() )
---@return number inRange 1 if the player is close enough to the target to use the item; 0 if the target is out of range; nil if the quest item does not require a target
function IsQuestLogSpecialItemInRange(questIndex) end

--- Returns whether a quest from the quest log is listed in the objectives tracker
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
---@return any isWatched 1 if the quest is being watched; otherwise nil
function IsQuestWatched(questIndex) end

--- Removes a quest from the objectives tracker
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
function RemoveQuestWatch(questIndex) end

--- Uses the item associated with a current quest. Available for a number of quests which involve using an item (i.e. "Use the MacGuffin to summon and defeat the boss", "Use this saw to fell 12 trees", etc.)
--- Flags: protected
---@param questIndex number Index of a quest log entry with an associated usable item (between 1 and GetNumQuestLogEntries() )
function UseQuestLogSpecialItem(questIndex) end
