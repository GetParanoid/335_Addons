--==============================
-- Camera functions
--==============================

--- Begins camera movement or selection (equivalent to left-clicking in the 3-D world). After calling this function (i.e. while the left mouse button is held), cursor movement rotates the camera. Final results vary by context and are determined when calling CameraOrSelectOrMoveStop() (i.e. releasing the left mouse button).
--- Flags: protected
function CameraOrSelectOrMoveStart() end

--- Ends action initiated by CameraOrSelectOrMoveStart . After calling this function (i.e. releasing the left mouse button), camera movement stops and normal cursor movement resumes. If the cursor has not moved significantly since calling CameraOrSelectOrMoveStart() (i.e. pressing the left mouse button) and is over a unit, that unit becomes the player's target; if the cursor has not moved significantly and is not over a unit, clears the player's target unless the "Sticky Targeting" option is enabled (i.e. the "deselectOnClick" CVar is 0).
--- Flags: protected
---@param isSticky any If 1, the camera will remain static until cancelled. Otherwise, the camera will pan back to be directly behind the character
function CameraOrSelectOrMoveStop(isSticky) end

--- Zooms the camera in by a specified distance.
---@param distance number The distance to zoom in
function CameraZoomIn(distance) end

--- Zooms the camera out by a specified distance.
---@param distance number The distance to zoom out
function CameraZoomOut(distance) end

--- Rotates the camera around the player
---@param degrees number The number of degrees to rotate; positive for counter-clockwise, negative for clockwise.
function FlipCameraYaw(degrees) end

--- Returns whether mouselook mode is active
---@return boolean isLooking True if mouselook mode is active; otherwise false
function IsMouselooking() end

--- Enables mouselook mode, in which cursor movement rotates the camera
function MouselookStart() end

--- Disables mouselook mode
function MouselookStop() end

--- Begins orbiting the camera downward (to look upward)
function MoveViewDownStart() end

--- Ends camera movement initiated by MoveViewDownStart
function MoveViewDownStop() end

--- Begins zooming the camera inward (towards/through the player character)
function MoveViewInStart() end

--- Ends camera movement initiated by MoveViewInStart
function MoveViewInStop() end

--- Begins orbiting the camera around the player character to the left. "Left" here is relative to the player's facing; i.e. the camera orbits clockwise if looking down. Moving the camera to the left causes it to look towards the character's right.
function MoveViewLeftStart() end

--- Ends camera movement initiated by MoveViewLeftStart
function MoveViewLeftStop() end

--- Begins zooming the camera outward (away from the player character)
function MoveViewOutStart() end

--- Ends camera movement initiated by MoveViewOutStart
function MoveViewOutStop() end

--- Begins orbiting the camera around the player character to the right. "Right" here is relative to the player's facing; i.e. the camera orbits counter--clockwise if looking down. Moving the camera to the right causes it to look towards the character's left.
function MoveViewRightStart() end

--- Ends camera movement initiated by MoveViewRightStart
function MoveViewRightStop() end

--- Begins orbiting the camera upward (to look down)
function MoveViewUpStart() end

--- Ends camera movement initiated by MoveViewUpStart
function MoveViewUpStop() end

--- Moves the camera to the next predefined setting. There are five "slots" for saved camera settings, indexed 1-5. These views can be set and accessed directly using SaveView() and SetView() , and cycled through using NextView() and PrevView() .
function NextView() end

--- Moves the camera to the previous predefined setting. There are five "slots" for saved camera settings, indexed 1-5. These views can be set and accessed directly using SaveView() and SetView() , and cycled through using NextView() and PrevView() .
function PrevView() end

--- Resets a saved camera setting to default values. There are five "slots" for saved camera settings, indexed 1-5. These views can be set and accessed directly using SaveView() and SetView() , and cycled through using NextView() and PrevView() .
---@param index number Index of a saved camera setting (between 1 and 5)
function ResetView(index) end

--- Saves the current camera settings. There are five "slots" for saved camera settings, indexed 1-5. These views can be set and accessed directly using SaveView() and SetView() , and cycled through using NextView() and PrevView() .
---@param index number Index of a saved camera setting (between 1 and 5)
function SaveView(index) end

--- Moves the camera to a saved camera setting. There are five "slots" for saved camera settings, indexed 1-5. These views can be set and accessed directly using SaveView() and SetView() , and cycled through using NextView() and PrevView() .
---@param index number Index of a saved camera setting (between 1 and 5)
function SetView(index) end
