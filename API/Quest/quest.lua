--==============================
-- Quest functions
--==============================

--- Confirms abandoning a quest. Use SetAbandonQuest() first to select the quest to abandon.
--- Flags: confirmation
function AbandonQuest() end

--- Accepts the quest offered by a questgiver
function AcceptQuest() end

--- Ends interaction with a questgiver. Fires the QUEST_FINISHED event, indicating that questgiver-related APIs may no longer have effects or return valid data.
function CloseQuest() end

--- Collapses a header in the quest log
---@param questIndex number Index of a header in the quest log (between 1 and GetNumQuestLogEntries() ), or 0 to collapse all headers
function CollapseQuestHeader(questIndex) end

--- Begins turning in a quest to a questgiver. Usable following the QUEST_PROGRESS event in which it is determined whether the player can complete the quest.
function CompleteQuest() end

--- Accepts a quest started by another group member. Usable following the QUEST_ACCEPT_CONFIRM event which fires when another member of the player's party or raid starts certain quests (e.g. escort quests).
function ConfirmAcceptQuest() end

--- Declines a quest.. Usable following the QUEST_DETAIL event in which the questgiver presents the player with the details of a quest and the option to accept or decline.
function DeclineQuest() end

--- Expands a quest header in the quest log
---@param questIndex number Index of a header in the quest log (between 1 and GetNumQuestLogEntries() ), or 0 to expand all headers
function ExpandQuestHeader(questIndex) end

--- Returns information about items that would be destroyed by abandoning a quest. Usable after calling SetAbandonQuest() but before calling AbandonQuest() .
---@return string items A string listing any items that would be destroyed
function GetAbandonQuestItems() end

--- Returns the name of the quest being abandoned. Usable after calling SetAbandonQuest() but before calling AbandonQuest() .
---@return string name Name of the quest being abandoned
function GetAbandonQuestName() end

--- Returns the level of a quest which can be turned in to the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@param index number Index of a quest which can be turned in to the current Quest NPC (between 1 and GetNumActiveQuests() )
---@return number level Recommended character level for attempting the quest
function GetActiveLevel(index) end

--- Returns the name of a quest which can be turned in to the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@param index number Index of a quest which can be turned in to the current Quest NPC (between 1 and GetNumActiveQuests() )
---@return string title Title of the quest
function GetActiveTitle(index) end

--- Returns the level of a quest available from the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@param index number Index of a quest available from the current Quest NPC (between 1 and GetNumAvailableQuests() )
---@return number level Recommended character level for attempting the quest
function GetAvailableLevel(index) end

--- Returns the name of a quest available from the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@param index number Index of a quest available from the current Quest NPC (between 1 and GetNumAvailableQuests() )
---@return string title Title of the quest
function GetAvailableTitle(index) end

--- Returns the number of daily quests the player has completed today. The daily quest period resets at or around 3:00 AM server time on most realms.
---@return number dailyQuestsComplete Number of daily quests completed in the current period
function GetDailyQuestsCompleted() end

--- Returns the greeting text displayed for quest NPCs with multiple quests. Not used often; most quest NPCs offering multiple quests (and/or other options) use the Gossip functions to provide a greeting (see GetGossipText() ).
---@return string greetingText Text to be displayed before choosing from among the NPC's multiple quests
function GetGreetingText() end

--- Returns the maximum number of daily quests that can be completed each day.
---@return number max The maximum number of daily quests that can be completed each day
function GetMaxDailyQuests() end

--- Returns the number of quests which can be turned in to the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@return number numActiveQuests Number of quests which can be turned in to the current Quest NPC
function GetNumActiveQuests() end

--- Returns the number quests available from the current Quest NPC. Only returns valid information after a QUEST_GREETING event.
---@return number numAvailableQuests Number of quests available from the current Quest NPC
function GetNumAvailableQuests() end

--- Returns the number of available quest rewards from which the player must choose one upon completing the quest presented by a questgiver. Only valid during the accept/decline or completion stages of a quest dialog (following the QUEST_DETAIL or QUEST_COMPLETE events); otherwise may return 0 or a value from the most recently displayed quest.
---@return number numQuestChoices Number of available quest rewards from which the player must choose one upon completing the quest
function GetNumQuestChoices() end

--- Returns the number of different items required to complete the quest presented by a questgiver. Usable following the QUEST_PROGRESS event in which it is determined whether the player can complete the quest.
---@return number numRequiredItems Number of different items required to complete the quest
function GetNumQuestItems() end

--- Returns the number of quest objectives for a quest in the player's quest log
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() ); if omitted, defaults to the selected quest
---@return number numObjectives Number of trackable objectives for the quest
function GetNumQuestLeaderBoards(questIndex) end

--- Returns the number of available item reward choices for the selected quest in the quest log. This function refers to quest rewards for which the player is allowed to choose one item from among several; for items always awarded upon quest completion, see GetNumQuestLogRewards .
---@return number numChoices Number of items among which a reward can be chosen for completing the quest
function GetNumQuestLogChoices() end

--- Returns the number of quests and headers in the quest log
---@return number numEntries Total number of entries (quests and headers)
---@return number numQuests Number of quests only
function GetNumQuestLogEntries() end

--- Returns the number of item rewards for the selected quest in the quest log. This function refers to items always awarded upon quest completion; for quest rewards for which the player is allowed to choose one item from among several, see GetNumQuestLogChoices .
---@return number numRewards Number of rewards for completing the quest
function GetNumQuestLogRewards() end

--- Returns the number of different items always awarded upon completing the quest presented by a questgiver. Only valid during the accept/decline or completion stages of a quest dialog (following the QUEST_DETAIL or QUEST_COMPLETE events); otherwise may return 0 or a value from the most recently displayed quest.
---@return number numQuestRewards Number of different items always awarded upon completing the quest
function GetNumQuestRewards() end

--- Returns a summary of objectives for the quest offered by a questgiver. Only valid when the questgiver UI is showing the accept/decline stage of a quest dialog (between the QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return the empty string or a value from the most recently displayed quest.
---@return string questObjective The objective text for the currently displayed quest
function GetObjectiveText() end

--- Returns the quest progress text presented by a questgiver. Only valid when the questgiver UI is showing the progress stage of a quest dialog (between the QUEST_PROGRESS and QUEST_FINISHED events); otherwise may return the empty string or a value from the most recently displayed quest.
---@return string text Progress text for the quest
function GetProgressText() end

--- Returns background display style information for a questgiver dialog. The value returned can be used to look up background textures and text colors for display:
---@return any material String identifying a display style for the questgiver dialog, or nil for the default style ( string ) Bronze - Colored metallic background Marble - Light stone background Parchment - Yellowed parchment background (default) Silver - Gray metallic background Stone - Dark stone background
function GetQuestBackgroundMaterial() end

--- Returns a table of color values indicating the difficulty of a quest's level as compared to the player's
--- Flags: blizzardui
---@param level number Level for which to compare difficulty
---@return table color A table containing color values (keyed r , g , and b ) representing the difficulty of a quest at the input level as compared to the player's
function GetQuestDifficultyColor(level) end

--- Returns the level range in which a quest below the player's level still rewards XP. If a quest's level is up to range levels below the player's level, the quest is considered easy but still rewards experience points upon completion; these quests are colored green in the default UI's quest log. (Quests more than range levels below the player's are colored gray in the default UI and reward no XP.)
---@return number range Maximum difference between player level and a lower quest level for a quest to reward experience
function GetQuestGreenRange() end

--- Returns the quest log index of a timed quest's timer
---@param index number Index of a timer (in the list returned by GetQuestTimers() )
---@return number questIndex Index of the quest in the quest log (between 1 and GetNumQuestLogEntries() )
function GetQuestIndexForTimer(index) end

--- Returns information about items in a questgiver dialog. Only valid when the questgiver UI is showing the accept/decline, progress, or completion stages of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED , QUEST_PROGRESS and QUEST_FINISHED , or QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return empty values or those from the most recently displayed quest.
---@param type any Which of the possible sets of items to query ( string ) choice - Items from which the player may choose a reward required - Items required to complete the quest reward - Items given as reward for the quest
---@param index number Which item to query (from 1 to GetNumQuestChoices(), GetNumQuestItems(), or GetNumQuestRewards(), depending on the value of the itemType argument)
---@return string name The name of the item
---@return string texture Path to a texture for the item's icon
---@return number numItems Number of the item required or rewarded
---@return any quality The quality of the item ( number ) 0 - Poor 1 - Common 2 - Uncommon 3 - Rare 4 - Epic 5 - Legendary 6 - Artifact
---@return any isUsable 1 if the player can currently use/equip the item; otherwise nil
function GetQuestItemInfo(type, index) end

--- Returns information about available item rewards for the selected quest in the quest log. This function refers to quest rewards for which the player is allowed to choose one item from among several; for items always awarded upon quest completion, see GetQuestLogRewardInfo .
---@param index number Index of a quest reward choice (between 1 and GetNumQuestLogChoices())
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number numItems Number of items in the stack
---@return number quality Quality of the item
---@return any isUsable 1 if the player can use or equip the item; otherwise nil
function GetQuestLogChoiceInfo(index) end

--- Returns the completion text for the selected quest in the quest log. Completion text usually includes instructions on to whom and where to hand in the quest once it has been completed. Example: "Return to William Pestle at Goldshire in Elwynn Forest."
---@return string completionText Completion instructions for the quest
function GetQuestLogCompletionText() end

--- Returns the suggested group size for the selected quest in the quest log
---@return number suggestedGroup Recommended number of players in a group attempting the quest
function GetQuestLogGroupNum() end

--- Returns information about objectives for a quest in the quest log
---@param objective number Index of a quest objective (between 1 and GetNumQuestLeaderBoards() )
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() ); if omitted, defaults to the selected quest
---@return string text Text of the objective (e.g. "Gingerbread Cookie: 0/5")
---@return any type Type of objective ( string ) event - Requires completion of a scripted event item - Requires collecting a number of items monster - Requires slaying a number of NPCs object - Requires interacting with a world object reputation - Requires attaining a certain level of reputation with a faction
---@return any finished 1 if the objective is complete; otherwise nil
function GetQuestLogLeaderBoard(objective, questIndex) end

--- Return whether the selected quest in the quest log can be shared to party members
---@return any shareable 1 if the quest is shareable; otherwise nil
function GetQuestLogPushable() end

--- Returns the description and objective text for the selected quest in the quest log
---@return string questDescription Full description of the quest (as seen in the NPC dialog when accepting the quest)
---@return string questObjectives A (generally) brief summary of quest objectives
function GetQuestLogQuestText() end

--- Returns the honor reward for the selected quest in the quest log
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetQuestLogRewardHonor
function GetQuestLogRewardHonor() end

--- Returns information about item rewards for the selected quest in the quest log. This function refers to items always awarded upon quest completion; for quest rewards for which the player is allowed to choose one item from among several, see GetQuestLogChoiceInfo .
---@param index number Index of a quest reward (between 1 and GetNumQuestLogRewards())
---@return string name Name of the item
---@return string texture Path to an icon texture for the item
---@return number numItems Number of items in the stack
---@return number quality Quality of the item
---@return any isUsable 1 if the player can use or equip the item; otherwise nil
function GetQuestLogRewardInfo(index) end

--- Returns information about the spell reward for the selected quest in the quest log. If both isTradeskillSpell and isSpellLearned are nil , the reward is a spell cast upon the player.
---@return string texture Path to the spell's icon texture
---@return string name Name of the spell
---@return any isTradeskillSpell 1 if the spell is a tradeskill recipe; otherwise nil
---@return any isSpellLearned 1 if the reward teaches the player a new spell; otherwise nil
function GetQuestLogRewardSpell() end

--- Returns the talent point reward for the selected quest in the quest log. Returns 0 for quests which do not award talent points.
---@return number talents Number of talent points to be awarded upon completing the quest
function GetQuestLogRewardTalents() end

--- Returns the index of the selected quest in the quest log
---@return number questIndex Index of the selected quest in the quest log (between 1 and GetNumQuestLogEntries() )
function GetQuestLogSelection() end

--- Returns a hyperlink for a spell in the selected quest in the quest log
---@return string link A hyperlink for the spell or tradeskill recipe
function GetQuestLogSpellLink() end

--- Returns time remaining for the selected quest in the quest log. If the selected quest is not timed, returns nil.
---@return number questTimer The amount of time left to complete the quest
function GetQuestLogTimeLeft() end

--- Returns information about an entry in the player's quest log
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
---@return string questLogTitleText Title of the quest
---@return number level Recommended character level for attempting the quest
---@return any questTag Localized tag describing the type of quest ( string ) Dungeon - Dungeon or instance quest Elite - Elite quest Group - Group quest Heroic - Heroic quest PVP - PVP specific quest Raid - Raid quest nil - Standard quest
---@return number suggestedGroup For some group quests, the recommended number of group members for attempting the quest
---@return any isHeader 1 if the entry is a group header; nil if the entry is a quest
---@return any isCollapsed 1 if the entry is a collapsed header; otherwise nil
---@return any isComplete Whether the quest is complete ( number ) -1 - The quest was failed 1 - The quest was completed nil - The quest has yet to reach a conclusion
---@return any isDaily 1 if the quest is a daily quest; otherwise nil
---@return number questID The quest's questID.
function GetQuestLogTitle(questIndex) end

--- Returns the amount of money required to complete the quest presented by a questgiver. Usable following the QUEST_PROGRESS event in which it is determined whether the player can complete the quest.
---@return number money Amount of money required to complete the quest (in copper)
function GetQuestMoneyToGet() end

--- Returns the amount of time remaining until the daily quest period resets
---@return number time Amount of time remaining until the daily quest period resets (in seconds)
function GetQuestResetTime() end

--- Finishes turning in a quest to a questgiver, selecting an item reward if applicable. Usable following the QUEST_COMPLETE event in which the questgiver presents the player with rewards.
---@param choice number Index of a quest reward choice (between 1 and GetNumQuestChoices() ), or nil if the quest does not offer a choice of item rewards
function GetQuestReward(choice) end

--- Returns a hyperlink for a spell in a questgiver dialog. Only valid when the questgiver UI is showing the accept/decline, progress, or completion stages of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED , QUEST_PROGRESS and QUEST_FINISHED , or QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return empty values or those from the most recently displayed quest.
---@return string link A hyperlink for the spell or tradeskill recipe
function GetQuestSpellLink() end

--- Returns the text for the quest offered by a questgiver. Only valid when the questgiver UI is showing the accept/decline stage of a quest dialog (between the QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return the empty string or a value from the most recently displayed quest.
---@return string text The text for the currently displayed quest
function GetQuestText() end

--- Returns a list of the times remaining for any active timed quests
function GetQuestTimers() end

--- Gets a table containing the quests the player has completed. This function will only return data after QueryQuestsCompleted() has been called and the QUEST_QUERY_COMPLETE event has fired.  The keys in the returned table are the numeric questIds, with a value of true for each set key.
---@param questTbl table A table that will be wiped and filled with the quest data
---@return table completedQuests A hash table containing a list of the questIds the player has completed.
function GetQuestsCompleted(questTbl) end

--- Returns the amount of honor points awarded when completing a quest.
---@return number honor The honor points to be awarded
function GetRewardHonor() end

--- Returns the amount of money awarded when completing a quest.
---@return number money The amount of money to be awarded (in copper)
function GetRewardMoney() end

--- Returns information about a spell awarded when completing a quest. Only valid when the questgiver UI is showing the accept/decline or completion stages of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED events, or between the QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return zero or values from the most recently displayed quest.
---@return string texture Path to the spell's icon texture
---@return string name Name of the spell
---@return any isTradeskillSpell 1 if the spell is a tradeskill recipe; otherwise nil
---@return any isSpellLearned 1 if the reward teaches the player a new spell; otherwise nil
function GetRewardSpell() end

--- Returns the talent points awarded when completing a quest. Only valid when the questgiver UI is showing the accept/decline or completion stages of a quest dialog (between the QUEST_DETAIL and QUEST_FINISHED events, or between the QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return zero or a value from the most recently displayed quest.
---@return number talents The talent points to be awarded
function GetRewardTalents() end

--- Returns questgiver dialog to be displayed when completing a quest. Only valid when the questgiver UI is showing the completion stage of a quest dialog (between the QUEST_COMPLETE and QUEST_FINISHED events); otherwise may return the empty string or a value from the most recently displayed quest.
---@return string text Text to be displayed for the quest completion dialog
function GetRewardText() end

--- Returns the title awarded when completing a quest.
---@return string title The title to be awarded, or nil if the quest does not reward a title
function GetRewardTitle() end

--- Returns the suggested group size for attempting the quest currently offered by a questgiver. Usable following the QUEST_DETAIL event in which the questgiver presents the player with the details of a quest and the option to accept or decline.
---@return number suggestedGroup Suggested group size for attempting the quest currently offered by a questgiver
function GetSuggestedGroupNum() end

--- Returns the title text for the quest presented by a questgiver. Only valid following the QUEST_DETAIL , QUEST_PROGRESS , or QUEST_COMPLETE events; otherwise may return nil or a value from the most recently displayed quest.
---@return string text Title text for the quest
function GetTitleText() end

--- Returns whether a quest which can be turned in to the current Quest NPC is trivial at the player's level. Only returns valid information after a QUEST_GREETING event. Used in the default UI to display "(low level)" when listing the quest.
---@param index number Index of a quest which can be turned in to the current Quest NPC (between 1 and GetNumActiveQuests() )
---@return any trivial 1 if the quest is trivial at the player's level; otherwise nil
function IsActiveQuestTrivial(index) end

--- Returns whether a quest available from the current Quest NPC is trivial at the player's level. Only returns valid information after a QUEST_GREETING event. Used in the default UI to display "(low level)" when listing the quest.
---@param index number Index of a quest available from the current Quest NPC (between 1 and GetNumAvailableQuests() )
---@return any trivial 1 if the quest is trivial at the player's level; otherwise nil
function IsAvailableQuestTrivial(index) end

--- Returns whether the player has failed the selected quest in the quest log
---@return any isFailed 1 if the player has failed the quest; otherwise nil
function IsCurrentQuestFailed() end

--- Returns whether the player can complete the quest presented by a questgiver
---@return any isCompletable 1 if the player currently meets the requirements (e.g. number of items collected) complete the quest; otherwise nil
function IsQuestCompletable() end

--- Checks if a specified unit is on a quest from the players quest log.
---@param index number The quest index to query.
---@param unit string The name of the unit to query.
---@return any state 1 if the unit is on that quest, nil otherwise
function IsUnitOnQuest(index, unit) end

--- Queries the server for the player's completed quest information. This function is throttled by the server and can currently only be called every 15 minutes.  This function will return immediately, and the QUEST_QUERY_COMPLETE will fire when the information is available from the server.  At that point, it can be obtained using the GetQuestsCompleted function.
--- Flags: server
function QueryQuestsCompleted() end

--- Causes the default UI to display an error message indicating that the player must choose a reward to complete the quest presented by a questgiver. Fires a UI_ERROR_MESSAGE event containing a localized message identified by the global variable ERR_QUEST_MUST_CHOOSE . Choose wisely.
function QuestChooseRewardError() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestGetAutoAccept() end

--- Shares a quest with other group members
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() ); if omitted, defaults to the selected quest
function QuestLogPushQuest(questIndex) end

--- Selects a quest which can be turned in to the current Quest NPC. Usable after a QUEST_GREETING event. Causes the QUEST_PROGRESS event to fire, in which it is determined whether the player can complete the quest.
---@param index number Index of a quest which can be turned in to the current Quest NPC (between 1 and GetNumActiveQuests() )
function SelectActiveQuest(index) end

--- Chooses a quest available from the current Quest NPC. Causes the QUEST_DETAIL event to fire, in which the questgiver presents the player with the details of a quest and the option to accept or decline.
---@param index number Index of a quest available from the current Quest NPC (between 1 and GetNumAvailableQuests() )
function SelectAvailableQuest(index) end

--- Selects a quest from the quest log. The selected quest is used by other functions which do not take a quest index as argument (e.g. GetQuestLogQuestText() ).
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
function SelectQuestLogEntry(questIndex) end

--- Begins the process of abandoning a quest in the player's quest log. To finish abandoning the quest, call AbandonQuest() .
---@param questIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
function SetAbandonQuest(questIndex) end
