--==============================
-- Blizzard internal functions
--==============================

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function AppendToFile() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CreateMiniWorldMapArrowFrame() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function CreateWorldMapArrowFrame() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function DeleteFile() end

--- Detects the presence of a "WoW" compatible multi-button mouse. This function is used by the default user interface to enable or disable the configuration option for a many buttoned WoW mouse.  If the mouse is not found, the WOW_MOUSE_NOT_FOUND event will fire.
function DetectWowMouse() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GMRequestPlayerInfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GetDebugStats() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GetDebugZoneMap() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GetGMStatus() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function GetMapDebugObjectInfo() end

--- This is a Blizzard internal function internal
--- Flags: internal
function GetNumMapDebugObjects() end

--- This is a Blizzard internal function internal
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetTexLodBias
function GetTexLodBias() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function HasDebugZoneMap() end

--- This is a Blizzard internal function internal
--- Flags: internal
function IsDebugBuild() end

--- This is a Blizzard internal function internal
--- Flags: internal
function PlayDance() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function PositionMiniWorldMapArrowFrame() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function PositionWorldMapArrowFrame() end

--- This is a Blizzard internal function internal
--- Flags: internal
function ReadFile() end

--- This is a Blizzard internal function internal
--- Flags: internal
function ResetPerformanceValues() end

--- This is a Blizzard internal function internal
--- Flags: internal
function SetChannelWatch() end

--- This is a Blizzard internal function internal
--- Flags: internal
function SetConsoleKey() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function SetLayoutMode() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function ShowWorldMapArrowFrame() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal, protected
function TargetDirectionEnemy() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal, protected
function TargetDirectionFinished() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal, protected
function TargetDirectionFriend() end

--- This is a Blizzard internal function internal
--- Flags: internal
function TeleportToDebugObject() end

--- This is a Blizzard internal function internal
--- Flags: internal
function ToggleCollision() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function ToggleCollisionDisplay() end

--- This is a Blizzard internal function internal
--- Flags: internal
function TogglePerformanceDisplay() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function TogglePerformancePause() end

--- This is a Blizzard internal function internal
--- Flags: internal
function TogglePerformanceValues() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function TogglePlayerBounds() end

--- This is a Blizzard internal function internal
--- Flags: internal
function TogglePortals() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function ToggleTris() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function UpdateWorldMapArrowFrames() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function debugbreak() end

--- This is a Blizzard internal function internal
--- Flags: internal
function debugdump() end

--- This is a Blizzard internal function internal
--- Flags: internal
function debuginfo() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function debugload() end

--- This is a Blizzard internal function internal
--- Flags: internal
function debugprint() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: internal
function debugtimestamp() end

--- Creates a zero-length userdata with an optional metatable.. newproxy is a experimental, undocumented and unsupported function in the Lua base library. It can be used to create a zero-length userdata, with a optional proxy.
---@param boolean boolean Controls if the returned userdata should have a metatable or not.
---@param userdata any Needs to be a proxy. The metatable will be shared between the proxies.
---@return any userdata A zero-length user-data object.
function newproxy(boolean, userdata) end
