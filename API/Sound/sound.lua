--==============================
-- Sound functions
--==============================

--- Plays an audio file as background music. Any other background music that is currently playing will be faded out as the new music begins; if the Sound_ZoneMusicNoDelay is set, music will loop continuously until StopMusic() is called.
---@param musicfile string Path to a music file
function PlayMusic(musicfile) end

--- Plays one of WoW's built-in sound effects. Only supports sounds found in the Sound\Interface directory within WoW's MPQ files; to play other built-in sounds or sounds in an addon directory, use PlaySoundFile() .
---@param sound string Name of a built-in sound effect
function PlaySound(sound) end

--- Plays an audio file at a given path. For a shorter way to specify one of WoW's built-in UI sound effects, see PlaySound() .
---@param soundFile string A path to the sound file to be played
function PlaySoundFile(soundFile) end

--- Returns the name of the given chat system sound input driver
---@param index number The desired index
function Sound_ChatSystem_GetInputDriverNameByIndex(index) end

--- Returns the number of chat system sound input drivers
function Sound_ChatSystem_GetNumInputDrivers() end

--- Returns the number of chat system sound output drivers
function Sound_ChatSystem_GetNumOutputDrivers() end

--- Returns the name of the given chat system sound output driver
---@param index number The desired index
function Sound_ChatSystem_GetOutputDriverNameByIndex(index) end

--- Returns the name of the given game sound input driver
---@param index number The desired index
function Sound_GameSystem_GetInputDriverNameByIndex(index) end

--- Returns the number of game sound input drivers
function Sound_GameSystem_GetNumInputDrivers() end

--- Returns the number of game sound output drivers
function Sound_GameSystem_GetNumOutputDrivers() end

--- Returns the name of the given game sound output driver
---@param index number The desired index
function Sound_GameSystem_GetOutputDriverNameByIndex(index) end

--- Restarts the game's sound systems
function Sound_GameSystem_RestartSoundSystem() end

--- Stops currently playing in-game music
function StopMusic() end

--- Returns the name of an audio input device for voice chat
---@param deviceIndex number Index of the device (between 1 and Sound_ChatSystem_GetNumInputDrivers() )
---@return string deviceName Name of the device
function VoiceEnumerateCaptureDevices(deviceIndex) end

--- Returns the name of an audio output device for voice chat
---@param deviceIndex number Index of the device (between 1 and Sound_ChatSystem_GetNumOutputDrivers() )
---@return string device Name of the device
function VoiceEnumerateOutputDevices(deviceIndex) end

--- Returns the index of the current voice capture device
---@return number index Index of the current voice capture device (between 1 and Sound_ChatSystem_GetNumInputDrivers() )
function VoiceGetCurrentCaptureDevice() end

--- Returns the index of the current voice output device
---@return number index Index of the current voice output device (between 1 and Sound_ChatSystem_GetNumOutputDrivers() )
function VoiceGetCurrentOutputDevice() end

--- Selects an audio input device for voice chat
---@param deviceName string Name of an audio input device, as returned from VoiceEnumerateCaptureDevices()
function VoiceSelectCaptureDevice(deviceName) end

--- Selects an audio output device for voice chat
---@param deviceName string Name of an audio output device, as returned from VoiceEnumerateOutputDevices()
function VoiceSelectOutputDevice(deviceName) end
