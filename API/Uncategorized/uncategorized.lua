--==============================
-- Uncategorized functions
--==============================

--- Accepts a LFG dungeon invite.
function AcceptProposal() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNAcceptFriendInvite() end

--- Returns whether or not the player is connected to Battle.net
---@return boolean isOnline true if the player is connected to Battle.net; otherwise false
function BNConnected() end

--- Create a conversation between you and two friends
---@param presenceID_1 number The presenceID of your first friend
---@param presenceID_2 number The presenceID of your second friend
---@return boolean result ASSUMPTION: If creation conversation was successful or not
function BNCreateConversation(presenceID_1, presenceID_2) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNDeclineFriendInvite() end

--- Returns whether or not RealID services are disabled
---@return boolean isEnabled true if RealID is enabled; otherwise false
function BNFeaturesEnabled() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNFeaturesEnabledAndConnected() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetBlockedInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetBlockedToonInfo() end

--- Returns information about an existing battle.net conversation
---@param channel number ID of channel you want to check
---@return string type Seems to be 'conversation' if the conversation exists, nil if not
function BNGetConversationInfo(channel) end

--- Returns information about a member of a battle.net conversation
---@param channel number The index of the channel you want member info for
---@param memberIndex number The index of the member you want info for
---@return number presenceID This number seems to be the same as the presence ID of the RealID friend
---@return number unknown Unknown (ID?)
---@return string displayName The name that gets displayed with chat messages. Real name for friends, charname for FoF
function BNGetConversationMemberInfo(channel, memberIndex) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetCustomMessageTable() end

--- Returns information about the specified friend of a RealID friend
---@param presenceID number presenceID for the RealID friend for whom you are requesting friend info
---@param mutual boolean Should the list include mutual friends (i.e. people who you and the person referenced by presenceID are both friends with).
---@param non boolean mutual - Should the list include non-mutual friends.
---@param index number The index of the entry in the list to retrieve (1 to BNGetNumFOF(...))
---@return number presenceID a unique numeric identifier for this friend for this session
---@return string givenName a |K Escape Sequence representing the friend's first/given name
---@return string surname a |K Escape Sequence representing the friend's Surname/Family name
---@return boolean isFriend true if this person is a direct friend of yours, false otherwise
function BNGetFOFInfo(presenceID, mutual, non, index) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetFriendInviteInfo() end

--- Returns the maximum number of realID friends you can have in one conversation
---@return number count The max number of players that can be in one conversation
function BNGetMaxPlayersInConversation() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetNumBlocked() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetNumBlockedToons() end

--- Returns the number of members in a battle.net conversation
---@param channel number The index of the conversation to get member count for
---@return number memberCount Number of members in the conversation you asked for. 0 for non-existing conversations
function BNGetNumConversationMembers(channel) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetNumFOF() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetNumFriendInvites() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetSelectedBlock() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNGetSelectedToonBlock() end

--- Invite a friend into an existing conversation
---@param channel number The ID of the conversation to invite to
---@param presenceID number The presenceID of the friend to invite
function BNInviteToConversation(channel, presenceID) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNIsBlocked() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNIsFriend() end

--- Returns whether or not the presence ID is the one of the player
---@param presenceID number
---@return boolean isSelf true if the presence ID is the one of the player; false otherwise
function BNIsSelf(presenceID) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNIsToonBlocked() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNLeaveConversation() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNListConversation() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNRemoveFriend() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNReportFriendInvite() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNReportPlayer() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNRequestFOFInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSendConversationMessage() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSendFriendInvite() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSendFriendInviteByID() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSendWhisper() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetAFK() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetBlocked() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetDND() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetFocus() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetSelectedBlock() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetSelectedFriend() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetSelectedToonBlock() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BNSetToonBlocked() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BattlefieldMgrEntryInviteResponse() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BattlefieldMgrExitRequest() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BattlefieldMgrQueueInviteResponse() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function BattlefieldMgrQueueRequest() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CalendarContextInviteTentative() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CalendarEventTentative() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CalendarGetDayEventSequenceInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CanChangePlayerDifficulty() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CanMapChangeDifficulty() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CanPartyLFGBackfill() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CanResetTutorials() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CancelSell() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CannotBeResurrected() end

--- This function is not yet documented
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/ChangePlayerDifficulty
function ChangePlayerDifficulty() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function ClearAllLFGDungeons() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function ClearLFGDungeon() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function CompleteLFGRoleCheck() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function DungeonUsesTerrainMap() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function FindSpellBookSlotByID() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function ForceGossip() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GMReportLag() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetAllowLowLevelRaid() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetAutoCompletePresenceID() end

--- Returns the flags of an available quest during an NPC dialog
---@param availableIndex number Number of an available quest in the dialog frame; 1.. GetNumAvailableQuests()
---@return boolean isTrivial True if the quest is trivial (gray), false otherwise.
---@return boolean isDaily True if the quest is daily, false otherwise.
---@return boolean isRepeatable True if the quest is repeatable, false otherwise.
function GetAvailableQuestInfo(availableIndex) end

--- Returns what roles the player is able to queue into the LFD system as
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetAvailableRoles
function GetAvailableRoles() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetChatWindowSavedDimensions() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetChatWindowSavedPosition() end

--- Returns quest information about an item in the player's bags
---@param container number Index of one of the player's bags or other containers
---@param slot number Index of an item slot within the container
---@return boolean isQuest true if the item is a quest item, nil otherwise.
---@return number questId ID of the quest started by the item, nil if the item does not start a quest.
---@return any isActive 1 if the quest started by the item is in the player's quest log, nil otherwise.
function GetContainerItemQuestInfo(container, slot) end

--- Returns information about a faction or header listing. Returns information about a faction regardless of whether the faction is known to the player (indeed, even for factions only available to the opposing alliance); see GetFactionInfo for information about factions listed in the player's Reputation UI.
---@param factionID number Unique numeric identifier for a faction
---@return string name Name of the faction
---@return string description Brief description of the faction, as displayed in the default UI's detail window for a selected faction
---@return any standingID Current standing with the given faction ( number , standingID ) 1 - Hated 2 - Hostile 3 - Unfriendly 4 - Neutral 5 - Friendly 6 - Honored 7 - Revered 8 - Exalted
---@return number barMin The minimum value of the reputation bar at the given standing
---@return number barMax The maximum value of the reputation bar at the given standing
---@return number barValue The player's current reputation with the faction
---@return any atWarWith 1 if the player is at war with the given faction, otherwise nil
---@return any canToggleAtWar 1 if the player can declare war with the given faction, otherwise nil
---@return any isHeader 1 if the index refers to a faction group header
---@return any isCollapsed 1 if the index refers to a faction group header and currently collapsed
---@return any hasRep 1 if the index refers to a faction group header whose reputation value should be displayed
---@return any isWatched 1 if the faction is currently being watched (i.e. displayed above the experience bar)
---@return any isChild 1 if the index refers to a faction sub-group header within another group, or to an individual faction within a sub-group
function GetFactionInfoByID(factionID) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetInstanceLockTimeRemainingEncounter() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDChoiceCollapseState() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDChoiceEnabledState() end

--- This function is not yet documented
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetLFDChoiceInfo
function GetLFDChoiceInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDChoiceLockedState() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDChoiceOrder() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDLockInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFDLockPlayerCount() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGBootProposal() end

--- Returns the various rewards for a completed LFG dungeon
---@return string name Name of the instance
---@return number typeID Type of the dungeon (TYPEID DUNGEON, TYPEID HEROIC DIFFICULTY, TYPEID RANDOM_DUNGEON)
---@return string textureFilename Filename of the instance icon (to be used with 'Interface/LFGFrame/LFGIcon-'
---@return number moneyBase Base amount of money (moneyAmount = moneyBase + moneyVar * numStrangers)
---@return number moneyVar Money reward coefficient
---@return number experienceBase Base amount of experience (experienceGained = experienceBase + experienceVar * numStrangers)
---@return number experienceVar Experience reward coefficient
---@return number numStrangers Amount of pickups in the group
---@return number numRewards Amount of actual dungeon rewards (currency or item)
function GetLFGCompletionReward() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGCompletionRewardItem() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGDeserterExpiration() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGDungeonInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGDungeonRewardInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGDungeonRewardLink() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGDungeonRewards() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGInfoLocal() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGInfoServer() end

--- Returns info about the currently pending LFD operation
function GetLFGProposal() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGProposalEncounter() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGProposalMember() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGQueueStats() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGQueuedList() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGRandomCooldownExpiration() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGRandomDungeonInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGRoleUpdate() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGRoleUpdateMember() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFGRoleUpdateSlot() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLFRChoiceOrder() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetLastQueueStatusIndex() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetMultiCastBarOffset() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetMultiCastTotemSpells() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetNextCompleatedTutorial() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetNumQuestItemDrops() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetNumQuestLogRewardFactions() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetNumRandomDungeons() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetPartyLFGBackfillInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetPetSpellBonusDamage() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetPrevCompleatedTutorial() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestLogItemDrop() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestLogRewardArenaPoints() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestLogRewardFactionInfo() end

--- Returns the experience reward at the player's level for the selected quest in the quest log
---@return number experience Amount of experience rewarded for completing the quest
function GetQuestLogRewardXP() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestPOILeaderBoard() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestSortIndex() end

--- Returns the quest watch (objective tracker) index of a quest in the quest log
---@param questLogIndex number Index of a quest in the quest log (between 1 and GetNumQuestLogEntries() )
---@return number questWatchIndex Index of a quest in the list of quests on the objectives tracker (between 1 and GetNumQuestWatches() )
function GetQuestWatchIndex(questLogIndex) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetQuestWorldMapAreaID() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetRaidDifficulty() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetRandomBGHonorCurrencyBonuses() end

--- Returns the dungeonID of the random dungeon group that provides the best loot for the player.. The dungeonID that is returned refers to an integer found in LFGDungeons.dbc. This function is normally used only for initialization of the LFGQueueFrame in FrameXML LFDFrame.lua. You can programatically join the suggested queue for a random dungeon for which your character is eligible.
function GetRandomDungeonBestChoice() end

--- Returns the amount of arena points awarded when completing a quest.
---@return number arenaPoints The arena points to be awarded
function GetRewardArenaPoints() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetVehicleUIIndicator() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function GetVehicleUIIndicatorSeat() end

--- Checks if the player has completed at least 1 achievement. Used to determine whether or not the achievements frame should be loaded, and if the Achievements button on the micro menu should be enabled or not.
---@return boolean state 1 if the player has completed at least one achievement, nil otherwise.
function HasCompletedAnyAchievement() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function HasLFGRestrictions() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsBNLogin() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsInLFGDungeon() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsLFGDungeonJoinable() end

--- Returns whether the player is currently listed in the Raid Browser
---@return boolean listedInLFR true if the player is listed in the raid browser; otherwise false
function IsListedInLFR() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsPartyLFG() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsPetAttackAction() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsTutorialFlagged() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function IsZoomOutAvailable() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function JoinLFG() end

--- Leave the LFG queue.
function LeaveLFG() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function PartyLFGStartBackfill() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function ProcessQuestLogRewardFactions() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestIsDaily() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestIsWeekly() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestMapUpdateAllQuests() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestPOIGetIconInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestPOIGetQuestIDByIndex() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestPOIGetQuestIDByVisibleIndex() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function QuestPOIUpdateIcons() end

--- This function is not yet documented
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/QuestPOIUpdateTexture
function QuestPOIUpdateTexture() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function RefreshLFGList() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function RegisterStaticConstants() end

--- Rejects a LFG dungeon invite.
function RejectProposal() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function RequestLFDPartyLockInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function RequestLFDPlayerLockInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function RespondMailLockSendItem() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGGetEncounterResults() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGGetJoinedID() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGGetNumResults() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGGetPartyResults() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGGetResults() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGJoin() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGLeave() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SearchLFGSort() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SendSystemMessage() end

--- Enabling this if your character is below level 10 will allow you to join a raid group.
---@param enable boolean 1 to enable low level raids for this character, nil otherwise.
function SetAllowLowLevelRaid(enable) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetAuctionsTabShowing() end

--- Sets whether the player names should be colored by class for a given chat type
---@param chatType string The chatType that is being set. This value of this is the same as the index of the global ChatTypeInfo table.
---@param colorByName boolean Whether or not names should be colored by class for the given chat type.
function SetChatColorNameByClass(chatType, colorByName) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetChatWindowSavedDimensions() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetChatWindowSavedPosition() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetLFGBootVote() end

--- Sets a flag indicating that the player would like to join a given dungeon/queue. This function simply indicates that the player would like to join a given dungeon or queue. Joining the queue is accomplished using the JoinLFG() function. Clearing the dungeons that have been flagged is accomplished using the ClearAllLFGDungeons function.
---@param queueIndex number A numeric identifier for the dungeon/queue being joined. For random queues this can be obtained using /dump LFDQueueFrame.type
function SetLFGDungeon(queueIndex) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetLFGDungeonEnabled() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetLFGHeaderCollapsed() end

--- Sets the map based on a specified ID. For example, if you are an Undead character in the starting area, which is map ID 21, you can open your map and run SetMapByID(22) to change it to Western Plaguelands. In fact, you can run that anywhere If you are a fresh undead in tirisfal glades(MapAreaID:21), you get your map out, then you use SetMapByID(22) it will change to WPL
---@param id number The unique numeric map ID, can be obtained from GetCurrentMapAreaID()
function SetMapByID(id) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetPOIIconOverlapDistance() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetPOIIconOverlapPushDistance() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SetSavedInstanceExtend() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function ShiftQuestWatches() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function SortBGList() end

--- Sorts the quests listed in the watch frame based on the set criteria
---@return boolean changed true if the quest watches were re-ordered during the sort, otherwise false
function SortQuestWatches() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_Clear() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_FinishCountdown() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_IsPlaying() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_Pause() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_Play() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function Stopwatch_StartCountdown() end

--- Toggles visibility of the StopwatchFrame
function Stopwatch_Toggle() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function TriggerTutorial() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function UnitGroupRolesAssigned() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function UnitHasLFGDeserter() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function UnitHasLFGRandomCooldown() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
function debughook() end
