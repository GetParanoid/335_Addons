--==============================
-- NPC "Gossip" Dialog functions
--==============================

--- Ends an NPC "gossip" interaction. Causes the GOSSIP_CLOSED event to fire, indicating that Gossip APIs may no longer have effects or return valid data.
function CloseGossip() end

--- Returns a list of quests which can be turned in to the current Gossip NPC. These quests are displayed with a question mark icon in the default UI's GossipFrame.
---@return string name Name of the quest
---@return number level Suggested character level for attempting the quest
---@return any isTrivial 1 if the quest is considered "trivial" at the player's level (rewards no XP); otherwise nil
function GetGossipActiveQuests() end

--- Returns a list of quests available from the current Gossip NPC. For quests which can be turned in to the NPC, see GetGossipActiveQuests() .
---@return string name Name of the quest
---@return number level Suggested character level for attempting the quest
---@return any isTrivial 1 if the quest is considered "trivial" at the player's level (rewards no XP); otherwise nil
---@return any isDaily 1 if the quest may be repeated only once per day; otherwise nil
---@return any isRepeatable 1 if the quest may be repeated at any time; otherwise nil
function GetGossipAvailableQuests() end

--- Returns a list of interaction options for the Gossip NPC
---@return string text Text to be displayed for the gossip option
---@return any gossipType Non-localized string indicating the type of gossip option ( string ) Banker - Begin a Bank interaction BattleMaster - Queue for a battleground instance Binder - Set the player's Hearthstone location Gossip - Talk to the NPC Tabard - Begin a Tabard design interaction Taxi - Begin a Taxi (flight master) interaction Trainer - Begin a Trainer interaction Vendor - Begin a Merchant interaction
function GetGossipOptions() end

--- Returns greeting or other text to be displayed in an NPC dialog
---@return string text Text to be displayed for the NPC conversation
function GetGossipText() end

--- Returns the number of quests which can be turned in to the current Gossip NPC. These quests are displayed with a question mark icon in the default UI's GossipFrame.
---@return number num Number of quests which can be turned in to the current Gossip NPC
function GetNumGossipActiveQuests() end

--- Returns the number of quests available from the current Gossip NPC. These quests are displayed with an exclamation mark icon in the default UI's GossipFrame.
---@return number num Number of quests available from the current Gossip NPC
function GetNumGossipAvailableQuests() end

--- Returns the number of non-quest dialog options for the current Gossip NPC. Used by the default UI to skip greeting gossip for NPCs which provide only a greeting and one gossip option leading to the NPC's main interaction type (e.g. flight masters, merchants).
---@return number numOptions Number of options available from the current Gossip NPC
function GetNumGossipOptions() end

--- Chooses a quest which can be turned in to the current Gossip NPC. Causes the QUEST_PROGRESS event to fire, in which it is determined whether the player can complete the quest.
---@param index number Index of a quest which can be turned in to the current Gossip NPC (between 1 and GetNumGossipActiveQuests() )
function SelectGossipActiveQuest(index) end

--- Chooses a quest available from the current Gossip NPC. Usable after a QUEST_GREETING event. Causes the QUEST_DETAIL event to fire, in which the questgiver presents the player with the details of a quest and the option to accept or decline.
---@param index number Index of a quest available from the current Gossip NPC (between 1 and GetNumGossipAvailableQuests() )
function SelectGossipAvailableQuest(index) end

--- Chooses and activates an NPC dialog option. Results may vary according to the gossip option chosen; may end the gossip (firing a GOSSIP_CLOSED event) and start another interaction (firing a MERCHANT_SHOW , TRAINER_SHOW , TAXIMAP_OPENED , or similar event) or may continue the gossip with new text and new options (firing another GOSSIP_SHOW event).
---@param index number The option in the NPC gossip window to select, from 1 to GetNumGossipOptions()
---@param text string Text to include when confirming the selection
---@param confirm boolean true to confirm the selection; false or omitted otherwise
function SelectGossipOption(index, text, confirm) end
