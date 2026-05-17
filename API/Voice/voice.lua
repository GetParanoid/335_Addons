--==============================
-- Voice functions
--==============================

--- Adds a character to the muted list for voice chat. The Muted list acts for voice chat as the Ignore list does for text chat: muted characters will never be heard regardless of which voice channels they join the player in.
---@param name string Name of a character to add to the mute list
function AddMute(name) end

--- Adds or removes a character from the voice mute list. Adds the character to the list if he/she is not already on it; removes the character if already on the list.
---@param unit string A unit to mute
---@param name string Name of a character to mute
function AddOrDelMute(unit, name) end

--- Removes a character from the muted list for voice chat. The Muted list acts for voice chat as the Ignore list does for text chat: muted characters will never be heard regardless of which voice channels they join the player in.
---@param name string Name of a character to remove from the mute list
function DelMute(name) end

--- Returns the number of characters on the player's mute list
---@return number numMuted The number of characters on the player's mute list
function GetNumMutes() end

--- Returns the number of members in a voice channel
---@param sessionId number Index of a voice session (between 1 and GetNumVoiceSessions() )
---@return number numMembers Number of members in the voice channel
function GetNumVoiceSessionMembersBySessionID(sessionId) end

--- Returns the number of available voice channels. Returns 0 if voice chat is disabled.
---@return number count Number of available voice sessions
function GetNumVoiceSessions() end

--- Returns the index of the selected entry in the Muted list. Mute list selection is only used for display purposes in the default UI and has no effect on other API functions.
---@return number selectedMute Index of the selected entry in the mute listing (between 1 and GetNumMutes() ), or 0 if no entry is selected
function GetSelectedMute() end

--- Returns an identifier for the active voice session
---@return number id Index of the active voice session (between 1 and GetNumVoiceSessions() ), or nil if no session is active
function GetVoiceCurrentSessionID() end

--- Returns information about a voice session
---@param session number Index of a voice session (between 1 and GetNumVoiceSessions() )
---@return string name Name of the voice session (channel)
---@return any active 1 if the session is the active voice channel; otherwise nil
function GetVoiceSessionInfo(session) end

--- Returns information about a member of a voice channel
---@param session number Index of a voice session (between 1 and GetNumVoiceSessions() )
---@param index number Index of a member in the voice session (between 1 and GetNumVoiceSessionMembersBySessionID(session) )
---@return string name Name of the member
---@return any voiceActive 1 if the member has enabled voice chat; otherwise nil
---@return any sessionActive 1 if the channel is the member's active voice channel; otherwise nil
---@return any muted 1 if the member is on the player's muted list; otherwise nil
---@return any squelched 1 if the member was silenced by the channel moderator; otherwise nil
function GetVoiceSessionMemberInfoBySessionID(session, index) end

--- Returns whether a character has voice chat enabled
---@param unit any The unitid to query
---@param name string The name of the player to query
---@param channel string Channel to query for voice status.
---@return any status 1 if voice is enabled; otherwise nil
function GetVoiceStatus(unit, name, channel) end

--- Returns whether the player is allowed to enable the voice chat feature
---@return any isAllowed 1 if voice chat is allowed; otherwise nil
function IsVoiceChatAllowed() end

--- Returns whether voice chat is supported by the realm server
function IsVoiceChatAllowedByServer() end

--- Returns whether the voice chat system is enabled
---@return any isEnabled 1 if the voice chat system is enabled; otherwise nil
function IsVoiceChatEnabled() end

--- Selects an entry in the Muted list. Mute list selection is only used for display purposes in the default UI and has no effect on other API functions.
---@param index number Index of an entry in the mute listing (between 1 and GetNumMutes() )
function SetSelectedMute(index) end

--- Returns whether a character is silenced on a voice channel
---@param name string Name of a character
---@param channel string Name of a chat channel
---@return any silenced 1 if the unit is silenced on the given channel; otherwise nil
function UnitIsSilenced(name, channel) end

--- Returns whether a unit is currently speaking in voice chat. Despite the "unit" name, this function only accepts player names, not unitID s.
---@param unit string Name of a character in the player's current voice channel
---@return any state 1 if the unit is currently speaking in voice chat; otherwise nil
function UnitIsTalking(unit) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function VoiceChat_ActivatePrimaryCaptureCallback() end

--- Returns the current volume level of the microphone signal
---@return number volume The current volume level of the microphone signal
function VoiceChat_GetCurrentMicrophoneSignalLevel() end

--- Returns whether the Microphone Test recording is playing
---@param isPlaying number 1 if the loopback sound is currently being played; otherwise nil
function VoiceChat_IsPlayingLoopbackSound(isPlaying) end

--- Returns whether a Microphone Test is recording
---@return number isRecording 1 if the player is recording a voice sample, otherwise 0
function VoiceChat_IsRecordingLoopbackSound() end

--- Plays back the Microphone Test recording
function VoiceChat_PlayLoopbackSound() end

--- Begins recording a Microphone Test
---@param seconds number The amount of time to record (in seconds)
function VoiceChat_RecordLoopbackSound(seconds) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function VoiceChat_StartCapture() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function VoiceChat_StopCapture() end

--- Stops playing the Microphone Test recording
function VoiceChat_StopPlayingLoopbackSound() end

--- Stops recording a Microphone Test
function VoiceChat_StopRecordingLoopbackSound() end

--- Returns whether the voice chat system cannot be enabled. Voice chat may be disabled if the underlying hardware does not support it or if multiple instances of World of Warcraft are running on the same hardware.
---@return any isDisabled 1 if the voice system is disabled; otherwise nil
function VoiceIsDisabledByClient() end

--- Used internally to start talking, when push-to-talk is active in voice chat.
--- Flags: deprecated
function VoicePushToTalkStart() end

--- Used internally to stop talking, when push-to-talk is active in voice chat
--- Flags: deprecated
function VoicePushToTalkStop() end
