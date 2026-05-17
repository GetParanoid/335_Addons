--==============================
-- Secure execution utility functions
--==============================

--- Returns whether the user interface is protected due to combat. Non-Blizzard code is allowed to perform certain UI actions (such as changing secure template attributes or moving/showing/hiding secure frames) only if the player is not in combat; this function can be used to determine whether such actions are currently available.
---@return any inLockdown 1 if the user interface is protected due to combat; otherwise nil
function InCombatLockdown() end

--- Causes the current execution path to continue outside the secure environment. Meaningless when called from outside of the secure environment.
function forceinsecure() end

--- Add a function to be called after execution of a secure function. Allows one to "post-hook" a secure function without tainting the original.
---@param table table A table object that contains the function to be hooked
---@param function string The name of the function to be hooked
---@param hookfunc function The function to be called each time the original function is called
function hooksecurefunc(table, function, hookfunc) end

--- Returns whether the current execution path is secure. Meaningless when called from outside of the secure environment: always returns nil in such situations.
---@return any secure 1 if the current execution path is secure; otherwise nil
function issecure() end

--- Calls a function without tainting the execution path. Meaningless when called from outside of the secure environment.
---@param function function Function to be called
function securecall(function) end
