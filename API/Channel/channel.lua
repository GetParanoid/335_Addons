--==============================
-- Channel functions
--==============================

--- Adds a chat channel to the saved list of those displayed in a chat window. Used by the default UI's function ChatFrame_AddChannel() which manages the set of channel messages shown in a displayed ChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param channel number Name of a chat channel
---@return number zoneChannel 0 for non-zone channels, otherwise a numeric index specific to that channel
function AddChatWindowChannel(index, channel) end

--- Bans a character from a chat channel. Has no effect unless the player is a moderator of the given channel
---@param channel string Name of the channel
---@param fullname string Name of the character to be banned
function ChannelBan(channel, fullname) end

--- Invites a character to join a chat channel
---@param channel string Name of a channel
---@param name string Name of a character to invite
function ChannelInvite(channel, name) end

--- Removes a player from the channel. Has no effect unless the player is a moderator of the given channel
---@param channel string Name of the channel
---@param fullname string Name of the character to kick
function ChannelKick(channel, fullname) end

--- Grants a character moderator status in a chat channel. Has no effect unless the player is the owner of the given channel
---@param channel string Name of the channel
---@param fullname string Name of the character to promote to moderator
function ChannelModerator(channel, fullname) end

--- Grants a character ability to speak in a moderated chat channel
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param name string Name of a character to mute
function ChannelMute(channelName, channelId, name) end

--- Silences a character for chat and voice on a channel
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param unit string Unit to silence
---@param name string Name of a character to silence
function ChannelSilenceAll(channelName, channelId, unit, name) end

--- Silences the given character for voice chat on the channel. Only a raid/party/battleground leader or assistant can silence a player.
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param unit string Unit to silence
---@param name string Name of a character to silence
function ChannelSilenceVoice(channelName, channelId, unit, name) end

--- Enables or disables printing of join/leave announcements for a channel
---@param channel string Name of the channel for which to enable or disable announcements
function ChannelToggleAnnouncements(channel) end

--- Unsilences a character for chat and voice on a channel
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param unit string Unit to unsilence
---@param name string Name of a character to unsilence
function ChannelUnSilenceAll(channelName, channelId, unit, name) end

--- Unsilences a character on a chat channel
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param unit string Unit to unsilence
---@param name string Name of a character to unsilence
function ChannelUnSilenceVoice(channelName, channelId, unit, name) end

--- Lifts the ban preventing a character from joining a chat channel. Has no effect unless the player is a moderator of the given channel
---@param channel string Name of the channel
---@param fullname string Name of the character to for which to lift the ban
function ChannelUnban(channel, fullname) end

--- Revokes moderator status from a character on a chat channel. Has no effect unless the player is the owner of the given channel
---@param channel string Name of the channel
---@param fullname string Name of the character to demote from moderator
function ChannelUnmoderator(channel, fullname) end

--- Removes a character's ability to speak in a moderated chat channel
---@param channelName string Name of a channel
---@param channelId number Index of a channel
---@param name string Name of a character to unmute
function ChannelUnmute(channelName, channelId, name) end

--- Disables voice chat in a channel
---@param channel string Name of a channel
---@param channelIndex number Index of a channel
function ChannelVoiceOff(channel, channelIndex) end

--- Enables voice chat in a channel
---@param channel string Name of a channel
---@param channelIndex number Index of a channel
function ChannelVoiceOn(channel, channelIndex) end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function ClearChannelWatch() end

--- Collapses a group header in the chat channel listing
---@param index number Index of a header in the display channel list (between 1 and GetNumDisplayChannels() )
function CollapseChannelHeader(index) end

--- Declines an invitation to a chat channel. Usable in response to the CHANNEL_INVITE_REQUEST event which fires when the player is invited to join a chat channel.
---@param channel string Name of a chat channel
function DeclineInvite(channel) end

--- Requests information from the server about a channel's owner. Fires the CHANNEL_OWNER event indicating the name of the channel owner.
--- Flags: server
---@param channel string Name of a channel
---@param channelIndex number Index of a channel
function DisplayChannelOwner(channel, channelIndex) end

--- Disables voice in a channel specified by its position in the channel list display
---@param index number Index of a channel in the channel list display (between 1 and GetNumDisplayChannels() )
function DisplayChannelVoiceOff(index) end

--- Enables voice in a channel specified by its position in the channel list display
---@param index number Index of a channel in the channel list display (between 1 and GetNumDisplayChannels() )
function DisplayChannelVoiceOn(index) end

--- Returns the available server channel names
function EnumerateServerChannels() end

--- Expands a group header in the chat channel listing
---@param index number Index of a header in the display channel list (between 1 and GetNumDisplayChannels() )
function ExpandChannelHeader(index) end

--- Returns the currently active voice channel
---@return number index Index of the active voice channel in the chat display window (between 1 and GetNumDisplayChannels() ), or nil if no channel is active
function GetActiveVoiceChannel() end

--- Returns information about an entry in the channel list display
---@param index number Index of an entry in the channel list display (between 1 and GetNumDisplayChannels() )
---@return string name Name of the channel or header
---@return any header 1 if the entry is a group header; otherwise nil
---@return any collapsed 1 if the entry is a collapsed group header; otherwise nil
---@return number channelNumber Number identifying the channel (as returned by GetChannelList() and used by SendChatMessage() and other channel functions)
---@return number count Number of characters in the channel
---@return any active 1 if the channel is currently active; otherwise nil. (Used for special server channels, e.g. "Trade" and "LookingForGroup", which can only be used under certain conditions)
---@return any category Category to which the chat channel belongs ( string ) CHANNEL_CATEGORY_CUSTOM - Custom channels created by players CHANNEL_CATEGORY_GROUP - Group channels (party, raid, battleground) CHANNEL_CATEGORY_WORLD - World channels
---@return any voiceEnabled 1 if voice chat is enabled for the channel; otherwise nil
---@return any voiceActive 1 if voice chat is active for the channel; otherwise nil
function GetChannelDisplayInfo(index) end

--- Returns the list of the channels the player has joined
---@return number index Index of the channel
---@return string channel Name of the channel
function GetChannelList() end

--- Returns information about a chat channel
---@param channelIndex number A channel ID
---@param channelName string A channel name
---@return number channel ID of the channel
---@return string channelName Name of the channel
---@return number instanceID The channel's instance ID, or 0 if there are not separate instances of the channel.
function GetChannelName(channelIndex, channelName) end

--- Returns information about a character in a chat channel in the channel list display
---@param index number Index of a channel in the channel list display (between 1 and GetNumDisplayChannels() )
---@param rosterIndex number Index of a participant in the channel (between 1 and count , where count = select(5, GetChannelDisplayInfo (index) )
---@return string name Name of the character
---@return any owner 1 if the character is the channel owner; otherwise nil
---@return any moderator 1 if the character is a channel moderator; otherwise nil
---@return any muted 1 if the character is muted; otherwise nil
---@return any active 1 if the character is currently speaking in the channel; otherwise nil
---@return any enabled 1 if the character has voice chat active for the channel; otherwise nil
function GetChannelRosterInfo(index, rosterIndex) end

--- Returns the saved list of channels to which a chat window is subscribed
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@return string channelName Name of the channel
---@return number channelId Numeric id for the channel
function GetChatWindowChannels(index) end

--- Returns the number of members in a chat channel
---@param id number Numeric identifier of a chat channel
---@return number numMembers Number of characters in the channel
function GetNumChannelMembers(id) end

--- Returns the number of entries in the channel list display
---@return number channelCount Number of channels and group headers to be displayed in the channel list
function GetNumDisplayChannels() end

--- Returns the selected channel in the channel list display
---@return number index Index of the selected channel in the display channel list (between 1 and GetNumDisplayChannels() )
function GetSelectedDisplayChannel() end

--- Returns whether the player is a moderator of the selected channel in the channel list display
---@return any isModerator 1 if the player is a moderator of the selected channel; otherwise nil
function IsDisplayChannelModerator() end

--- Returns whether the player is the owner of the selected channel in the channel list display
---@return any isOwner 1 if the player is the owner of the selected channel; otherwise nil
function IsDisplayChannelOwner() end

--- Returns whether a character is silenced on a chat channel
---@param name string Name of a character
---@param channel string Name of a chat channel
---@return any isSilenced 1 if the character is silenced on the given channel; otherwise nil
function IsSilenced(name, channel) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function JoinChannelByName() end

--- Joins a channel, saving associated chat window settings
---@param name string Name of the channel to join
---@param password string Password to use when joining
---@param chatFrameIndex number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS ) in which to subscribe to the channel
---@param enableVoice boolean True to enable voice in the channel; otherwise false
---@return number zoneChannel 0 for non-zone channels, otherwise a numeric index specific to that channel
---@return string channelName Display name of the channel, if the channel was a zone channel
function JoinPermanentChannel(name, password, chatFrameIndex, enableVoice) end

--- Joins a channel, but does not save associated chat window settings
---@param channel string Name of a channel to join
function JoinTemporaryChannel(channel) end

--- Leaves a chat channel
---@param name string Name of a chat channel to leave
function LeaveChannelByName(name) end

--- Requests the list of participants in a chat channel. Fires the CHAT_MSG_CHANNEL_LIST event listing the names of all characters in the channel.
--- Flags: server
---@param channel string Name of a channel
---@param channelIndex number Index of a channel
function ListChannelByName(channel, channelIndex) end

--- Requests a list of channels joined by the player. Fires the CHAT_MSG_CHANNEL_LIST event listing the names and indices of all channels joined by the player.
--- Flags: server
function ListChannels() end

--- Removes a channel from a chat window's list of saved channel subscriptions. Used by the default UI's function ChatFrame_RemoveChannel() which manages the set of channel messages shown in a displayed ChatFrame.
---@param index number Index of a chat frame (between 1 and NUM_CHAT_WINDOWS )
---@param channel string Name of the channel to remove
function RemoveChatWindowChannel(index, channel) end

--- Sets the currently active voice channel
---@param index number Index of a channel in the chat display window (between 1 and GetNumDisplayChannels() )
function SetActiveVoiceChannel(index) end

--- Sets the currently active voice chat channel
---@param session number Index of a voice session (between 1 and GetNumVoiceSessions() )
function SetActiveVoiceChannelBySessionID(session) end

--- Gives channel ownership to another character. Has no effect unless the player is the owner of the given channel.
---@param channel string Name of the channel
---@param fullname string Name of the character to make the new owner
function SetChannelOwner(channel, fullname) end

--- Sets a password on a custom chat channel
---@param channel string Name of the channel
---@param password string Password to set for the channel
function SetChannelPassword(channel, password) end

--- Selects a channel in the channel list display
---@param index number Index of a channel in the channel list display (between 1 and GetNumDisplayChannels() )
function SetSelectedDisplayChannel(index) end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function SilenceMember() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function UnSilenceMember() end
