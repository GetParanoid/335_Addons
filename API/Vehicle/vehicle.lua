--==============================
-- Vehicle functions
--==============================

--- Returns whether the player can eject the occupant of a seat in the player's vehicle
---@param seat number Index of a seat in the player's vehicle
---@return boolean canEject True if the player can eject the seat's occupant; false if the player cannot eject the occupant or if the seat is empty
function CanEjectPassengerFromSeat(seat) end

--- Returns whether the player is in a vehicle. Used in the default UI to determine whether to show the "Leave Vehicle" button while controlling siege vehicles, turrets, and certain special mounts and quest entities.
---@return any canExit 1 if the player is in a vehicle and can exit; otherwise nil
function CanExitVehicle() end

--- Returns whether the player can change vehicle seats. Tells you if the player can switch seats in general, whereas UnitVehicleSeatInfo () tells you if the player can switch into a specific seat.
---@return boolean canSwitch Can the player change vehicle seats
function CanSwitchVehicleSeat() end

--- Returns whether the player is in a vehicle with multiple seats
---@return any canSwitch 1 if the player can switch seats; otherwise nil
function CanSwitchVehicleSeats() end

--- Sets the main unit for display of floating combat text.
---@param unit any Unit to show main combat text for
function CombatTextSetActiveUnit(unit) end

--- Ejects the occupant of a seat in the player's vehicle
---@param seat number Index of a seat in the player's vehicle
function EjectPassengerFromSeat(seat) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function IsUsingVehicleControls() end

--- Returns whether the player is controlling a vehicle weapon with adjustable aim angle
---@return any hasAngleControl 1 if the player is controlling a vehicle weapon with adjustable aim angle; otherwise nil
function IsVehicleAimAngleAdjustable() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function IsVehicleAimPowerAdjustable() end

--- Returns whether a unit is controlling a vehicle
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return boolean isControlling True if the unit is controlling a vehicle; otherwise false
function UnitControllingVehicle(unit, name) end

--- Returns whether a unit is controlling a vehicle or vehicle weapon. Used in the default UI to show the vehicle's health and power status bars in place of the controlling unit's. Returns false for passengers riding in but not controlling part of a vehicle; to find out whether a unit is riding in a vehicle, use UnitInVehicle . Also note that in some vehicles the player can command a vehicle weapon (e.g. gun turret) without controlling the vehicle itself; to find out whether a unit is controlling a vehicle, use UnitControllingVehicle .
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return boolean hasVehicle True if the unit is controlling a vehicle or vehicle weapon; otherwise false
function UnitHasVehicleUI(unit, name) end

--- Returns whether a unit is in a vehicle. A unit can be riding in a vehicle without controlling it: to test whether a unit is controlling a vehicle, use UnitControllingVehicle or UnitHasVehicleUI .
---@param unit string A unit to query
---@param name string The name of a unit to query; only valid for player , pet , and party/raid members
---@return any inVehicle 1 if the unit is in a vehicle; otherwise nil
function UnitInVehicle(unit, name) end

--- Returns whether a unit controls a vehicle
---@return boolean isInControl True if the unit controls a vehicle
function UnitInVehicleControlSeat() end

--- Moves the player to another seat within his current vehicle
---@param unit string Unit to move (only valid for player )
---@param seat number Index of a seat to switch to
function UnitSwitchToVehicleSeat(unit, seat) end

--- Returns the number of seats in a unit's vehicle. Note: returns 0 for multi-passenger mounts even thought multiple seats are available.
---@param unit string A unit to query
---@return number numSeats Number of seats in the unit's vehicle
function UnitVehicleSeatCount(unit) end

--- Returns information about seats in a vehicle. Note: multi-passenger mounts appear as vehicles for passengers but not for the owner; seat information applies only to the passenger seats.
---@param unit string A unit to query
---@param seat number Index of a seat in the unit's vehicle
---@return any controlType Type of control for the seat ( string ) Child - Unit in this seat controls part of the vehicle but not its movement (e.g. a gun turret) None - Unit in this seat has no control over the vehicle Root - Unit in this seat controls the movement of the vehicle
---@return string occupantName Name of the unit in the seat, or nil if the seat is empty
---@return string occupantRealm Home realm of the unit in the seat; nil if the seat is empty or its occupant is from the same realm as the player
---@return boolean canEject True if the vehicle's driver can eject the occupant of the seat
---@return boolean canSwitchSeats True if the player can switch to this seat.
function UnitVehicleSeatInfo(unit, seat) end

--- Returns the style of vehicle UI to display for a unit
---@param unit string A unit to query
---@param name string Name of a unit to query; only valid for player , pet , and party/raid members
---@return any skin Token identifying the style of vehicle UI to display for the unit ( string ) Mechanical - Used for mechanical vehicles Natural - Used for creature mounts
function UnitVehicleSkin(unit, name) end

--- Adjusts vehicle aim downward by a specified amount
---@param amount number Angle by which to adjust aim (in radians)
function VehicleAimDecrement(amount) end

--- Starts adjusting vehicle aim downward
--- Flags: protected
function VehicleAimDownStart() end

--- Stops adjusting vehicle aim downward
--- Flags: protected
function VehicleAimDownStop() end

--- Returns the aim angle of a vehicle weapon. The returned value is in radians, with positive values indicating upward angle, negative values indicating downward angle, and 0 indicating straight ahead.
---@return number angle Vertical angle of vehicle weapon aim (in radians)
function VehicleAimGetAngle() end

--- Returns the aim angle of a vehicle weapon relative to its minimum angle
function VehicleAimGetNormAngle() end

--- This is a Blizzard internal function internal
--- Flags: internal
function VehicleAimGetNormPower() end

--- Adjusts vehicle aim upward by a specified amount
---@param amount number Angle by which to adjust aim (in radians)
function VehicleAimIncrement(amount) end

--- Attempts to set a vehicle weapon's aim angle to a specific value. Causes aim angle to transition smoothly from the current value to the requested value (or to the closest allowed value to the requested value if it is beyond the vehicle's limits).
---@param amount number New aim angle (in radians)
function VehicleAimRequestAngle(amount) end

--- Attempts to set a vehicle weapon's aim angle to a specific value relative to its minimum value. Causes aim angle to transition smoothly from the current value to the requested value (or to the closest allowed value to the requested value if it is beyond the vehicle's limits).
---@param amount number New aim angle (in radians)
function VehicleAimRequestNormAngle(amount) end

--- This is a Blizzard internal function internal
--- Flags: internal
function VehicleAimSetNormPower() end

--- Starts adjusting vehicle aim upward
--- Flags: protected
function VehicleAimUpStart() end

--- Stops adjusting vehicle aim upward
--- Flags: protected
function VehicleAimUpStop() end

--- Zooms the player's view in while in a vehicle
function VehicleCameraZoomIn() end

--- Zooms the player's view out while in a vehicle
function VehicleCameraZoomOut() end

--- Removes the player from the current vehicle. Does nothing if the player is not in a vehicle.
function VehicleExit() end

--- Moves the player from his current seat in a vehicle to the next sequentially numbered seat. If the player is in the highest-numbered seat, cycles around to the lowest-numbered seat.
function VehicleNextSeat() end

--- Moves the player from his current seat in a vehicle to the previous sequentially numbered seat. If the player is in the lowest-numbered seat, cycles around to the highest-numbered seat.
function VehiclePrevSeat() end
