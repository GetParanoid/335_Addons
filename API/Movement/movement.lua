--==============================
-- Movement functions
--==============================

--- Stops movement initiated by JumpOrAscendStart . Used by the JUMP binding, which also controls ascent when swimming or flying. Has no meaningful effect if called while jumping (in which case movement is generally stopped by hitting the ground).
--- Flags: protected
function AscendStop() end

--- Stops movement initiated by SitStandOrDescendStart . Used by the SITORSTAND binding, which also controls descent when swimming or flying. Has no meaningful effect if called while sitting/standing.
--- Flags: protected
function DescendStop() end

--- Causes the player character to automatically follow another unit. Only friendly player units can be followed.
---@param unit string A unit to follow
---@param name string Name of a unit to follow
---@param strict boolean True if only an exact match for the given name should be allowed; false to allow partial matches
function FollowUnit(unit, name, strict) end

--- Interacts with (as with right-clicking on) a unit
--- Flags: protected
---@param unit any The unit to interact with
function InteractUnit(unit) end

--- Causes the player character to jump (or begins ascent if swimming or flying). Used by the JUMP binding, which also controls ascent when swimming or flying.
--- Flags: protected
function JumpOrAscendStart() end

--- Begins moving the player character forward while steering via mouse movement. After calling this function, the player character begins moving forward while cursor movement rotates (or steers) the character, altering yaw (facing) and/or pitch (vertical movement angle) as well as camera position.
--- Flags: protected
function MoveAndSteerStart() end

--- Ends movement initiated by MoveAndSteerStart . After calling this function, forward movement and character steering stops and normal cursor movement resumes.
--- Flags: protected
function MoveAndSteerStop() end

--- Begins moving the player character backward. Used by the MOVEBACKWARD binding.
--- Flags: protected
function MoveBackwardStart() end

--- Ends movement initiated by MoveBackwardStart
--- Flags: protected
function MoveBackwardStop() end

--- Begins moving the player character forward. Used by the MOVEFORWARD binding.
--- Flags: protected
function MoveForwardStart() end

--- Ends movement initiated by MoveForwardStart
--- Flags: protected
function MoveForwardStop() end

--- Begins adjusting the player character's angle of vertical movement downward. Affects only the angle or slope of movement for swimming or flying; has no immediately visible effect if the player is not moving, but alters the trajectory followed as soon as the player begins moving. Continuously adjusts pitch until the minimum angle is reached or PitchDownStop() is called.
--- Flags: protected
function PitchDownStart() end

--- Ends movement initiated by PitchDownStart
--- Flags: protected
function PitchDownStop() end

--- Begins adjusting the player character's angle of vertical movement upward. Affects only the angle or slope of movement for swimming or flying; has no immediately visible effect if the player is not moving, but alters the trajectory followed as soon as the player begins moving. Continuously adjusts pitch until the maximum angle is reached or PitchUpStop() is called.
--- Flags: protected
function PitchUpStart() end

--- Ends movement initiated by PitchUpStart
--- Flags: protected
function PitchUpStop() end

--- Causes the player character to sit down if standing and vice versa (or begins descent if swimming or flying). Used by the SITORSTAND binding, which also controls descent when swimming or flying.
--- Flags: protected
function SitStandOrDescendStart() end

--- Begins moving the player character sideways to his or her left
--- Flags: protected
function StrafeLeftStart() end

--- Ends movement initiated by StrafeLeftStart
--- Flags: protected
function StrafeLeftStop() end

--- Begins moving the player character sideways to his or her right
--- Flags: protected
function StrafeRightStart() end

--- Ends movement initiated by StrafeRightStart
--- Flags: protected
function StrafeRightStop() end

--- Starts or stops the player character automatically moving forward
--- Flags: protected
function ToggleAutoRun() end

--- Switches the character's ground movement mode between running and walking. If running, switches to walking, and vice versa. Has no effect on swimming or flying speed.
--- Flags: protected
function ToggleRun() end

--- Begins turning the player character to the left. "Left" here is relative to the player's facing; i.e. if looking down at the character from above, he or she turns counter-clockwise.
--- Flags: protected
function TurnLeftStart() end

--- Ends movement initiated by TurnLeftStart
--- Flags: protected
function TurnLeftStop() end

--- Begins character steering or interaction (equivalent to right-clicking in the 3-D world). After calling this function (i.e. while the right mouse button is held), cursor movement rotates (or steers) the player character, altering yaw (facing) and/or pitch (vertical movement angle) as well as camera position. Final results vary by context and are determined when calling TurnOrActionStop() (i.e. releasing the right mouse button).
--- Flags: protected
function TurnOrActionStart() end

--- Ends action initiated by TurnOrActionStart . After calling this function (i.e. releasing the right mouse button), character steering stops and normal cursor movement resumes. If the cursor has not moved significantly since calling TurnOrActionStart() (i.e. pressing the right mouse button), results vary by context:
--- Flags: protected
function TurnOrActionStop() end

--- Begins turning the player character to the right. "Right" here is relative to the player's facing; i.e. if looking down at the character from above, he or she turns clockwise.
--- Flags: protected
function TurnRightStart() end

--- Ends movement initiated by TurnRightStart
--- Flags: protected
function TurnRightStop() end



--==============================
-- Multi-cast actions
--==============================

--- Sets a multi-cast action slot to a given spell. This function is used to set up the multi-cast action slots, such as the totem bar that was introduced with WoW 3.2.  The player is able to customize three different sets of totems that can then be cast with a single click.
---@param action number The multi-cast action slot to set
---@param spell number The numeric spellId to set to the given action slot
function SetMultiCastSpell(action, spell) end
