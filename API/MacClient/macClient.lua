--==============================
-- Mac client functions
--==============================

--- Cancels video recording and compression. If a recording is in progress, recording is stopped and the results discarded. If compression is in progress, compression is stopped and the uncompressed portion of the movie is deleted.
function MovieRecording_Cancel() end

--- Returns the data rate required for a given set of video recording parameters. The value returned is a prediction of the rate at which data will be written to the hard drive while recording -- if the hardware cannot support this data rate, game performance may suffer and recording may stop.
---@param width number Width of the output video (in pixels)
---@param framerate number Number of video frames to be recorded per second
---@param sound number 1 if game audio is to be captured with video; otherwise 0
---@return string dataRate Summary of the data rate (e.g. "438.297 KB/s", "11.132 MB/s")
function MovieRecording_DataRate(width, framerate, sound) end

--- Deletes an uncompressed movie
---@param filename string Path to an uncompressed movie (as provided in the MOVIE_UNCOMPRESSED_MOVIE event)
function MovieRecording_DeleteMovie(filename) end

--- Returns the aspect ratio of the game display. Used in the default UI to calculate dimensions for scaling captured video to predetermined widths.
---@return number ratio Ratio of the game display's width to its height
function MovieRecording_GetAspectRatio() end

--- Returns a path to the movie currently being recorded or compressed. If no movie is being recorded or compressed, returns either the empty string ( "" ) or the path of the last movie recorded/compressed.
---@return string path Path to the movie currently being recorded or compressed, relative to the folder containing the World of Warcraft app
function MovieRecording_GetMovieFullPath() end

--- Returns information about movie compression progress
---@return boolean recovering True if a previous compression was interrupted (e.g. due to WoW being crashing or being forced to quit), indicating that recovery is being attempted on the file; otherwise false
---@return number progress Progress of the movie compression process (0 = just started, 1 = finished)
function MovieRecording_GetProgress() end

--- Returns the amount of time since video recording was last started. Used in the default UI to show the length of the recording in progress when mousing over the recording indicator on the minimap.
---@return string time Amount of time since video recording was last started (HH:MM:SS)
function MovieRecording_GetTime() end

--- Returns the current width of the game display. Used in the default UI to allow the current screen resolution (or an integral factor thereof) to be selected as the video recording resolution.
---@return number width Width of the game display
function MovieRecording_GetViewportWidth() end

--- Returns whether a video codec is supported on the current system
---@param codecID any Four-byte identifier of a QuickTime codec ( number ) 1635148593 - H.264 - supported natively by Apple devices like the iPod, iPhone and AppleTV; best ratio quality/size but slowest to compress 1768124260 - Apple Intermediate Codec - fastest to compress, but exclusive to Mac OS X 1835692129 - Motion JPEG - faster to compress than H.264 but it will generate a bigger file 1836070006 - MPEG-4 - supported by many digital cameras and iMovie
---@return boolean isSupported true if the codec is supported on the current system, otherwise false
function MovieRecording_IsCodecSupported(codecID) end

--- Returns whether a movie file is currently being compressed
---@return boolean isCompressing true if the client is currently compressing a recording; otherwise false
function MovieRecording_IsCompressing() end

--- Returns whether the current system supports recording the mouse cursor in movies
---@return boolean isSupported True if the cursor recording option should be enabled; otherwise false
function MovieRecording_IsCursorRecordingSupported() end

--- Returns whether movie recording is currently in progress
---@return any isRecording 1 if the client is currently recording, otherwise nil
function MovieRecording_IsRecording() end

--- Returns whether movie recording is supported on the current system
---@return boolean isSupported true if the client supports video recording; otherwise nil
function MovieRecording_IsSupported() end

--- Returns the maximum length of recorded video for a given set of video recording parameters. The value returned reflects both the data rate associated with the given parameters and the amount of space remaining on the hard drive.
---@param width number Width of the output video (in pixels)
---@param framerate number Number of video frames to be recorded per second
---@param sound number 1 if game audio is to be captured with video; otherwise 0
---@return string time Maximum length of recorded video (HH:MM:SS)
function MovieRecording_MaxLength(width, framerate, sound) end

--- Queues an uncompressed movie for compression. If there are no items currently in the queue the movie will begin compressing immediately.
---@param filename string Path to an uncompressed movie (as provided in the MOVIE_UNCOMPRESSED_MOVIE event)
function MovieRecording_QueueMovieToCompress(filename) end

--- Enables or disables a search for uncompressed movies. After calling this function with true , a MOVIE_UNCOMPRESSED_MOVIE fires for the first uncompressed movie found (causing the default UI to prompt the user to choose whether to compress, ignore, or delete the movie). Calling this function with false ignores the movie, causing the search to continue (firing a MOVIE_UNCOMPRESSED_MOVIE event for the next uncompressed movie found, and so forth).
---@param enable boolean True to begin searching for uncompressed movies, false to ignore a movie for compression
function MovieRecording_SearchUncompressedMovie(enable) end

--- Begins or ends video recording. Used by the MOVIE_RECORDING_STARTSTOP key binding.
function MovieRecording_Toggle() end

--- Enables or disables inclusion of UI elements in a video recording. Equivalent to the MovieRecordingGUI CVar, but provided as a convenience for the MOVIE_RECORDING_GUI so UI recording can be turned on or off while a movie is recording.
function MovieRecording_ToggleGUI() end

--- Causes iTunes to return to the previous track played. Used by the iTunes Remote key bindings only available on the Mac OS X WoW client. Only has effect while the iTunes application is open.
--- Flags: protected
function MusicPlayer_BackTrack() end

--- Causes iTunes to play the next track in sequence. Used by the iTunes Remote key bindings only available on the Mac OS X WoW client. Only has effect while the iTunes application is open.
--- Flags: protected
function MusicPlayer_NextTrack() end

--- Causes iTunes to start or pause playback. Used by the iTunes Remote key bindings only available on the Mac OS X WoW client. Only has effect while the iTunes application is open.
--- Flags: protected
function MusicPlayer_PlayPause() end

--- Causes iTunes to lower its playback volume. Affects the iTunes volume setting only, not the overall system volume or any of WoW's volume settings.
--- Flags: protected
function MusicPlayer_VolumeDown() end

--- Causes iTunes to raise its playback volume. Affects the iTunes volume setting only, not the overall system volume or any of WoW's volume settings.
--- Flags: protected
function MusicPlayer_VolumeUp() end
