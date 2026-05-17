--==============================
-- Class resource functions
--==============================

--- Destroys a specific totem (or ghoul). Totem functions are also used for ghouls summoned by a Death Knight's Raise Dead ability (if the ghoul is not made a controllable pet by the Master of Ghouls talent).
---@param slot any Which totem to destroy ( number ) 1 - Fire (or Death Knight's ghoul) 2 - Earth 3 - Water 4 - Air
function DestroyTotem(slot) end

--- Returns cooldown information about one of the player's rune resources. Note the placement of runes 3-4 (normally Unholy) and 5-6 (normally Frost) are reversed in the default UI. Also note the behavior of returned values differs slightly from most other GetXYZCooldown-style functions.
---@param slot any Index of a rune slot, as positioned in the default UI: ( number ) 1 - Leftmost 2 - Second from left 3 - Fifth from left (second from right) 4 - Sixth from left (rightmost) 5 - Third from left 6 - Fourth from left
---@return number start The value of GetTime() at the moment the cooldown began, or 0 if the rune is ready
---@return number duration The length of the cooldown (regardless of whether the rune is currently cooling down)
---@return boolean runeReady True if the rune can be used; false if the rune is cooling down
function GetRuneCooldown(slot) end

--- Returns the number of available rune resources in one of the player's rune slots. Returns 1 if a rune is ready and 0 if a rune is on cooldown.
---@param slot any Index of a rune slot, as positioned in the default UI: ( number ) 1 - Leftmost 2 - Second from left 3 - Fifth from left (second from right) 4 - Sixth from left (rightmost) 5 - Third from left 6 - Fourth from left
---@return number count Number of available runes in the slot
function GetRuneCount(slot) end

--- Returns the type of one of the player's rune resources. Note the placement of runes 3-4 (normally Unholy) and 5-6 (normally Frost) are reversed in the default UI.
---@param slot any Index of a rune slot, as positioned in the default UI: ( number ) 1 - Leftmost 2 - Second from left 3 - Fifth from left (second from right) 4 - Sixth from left (rightmost) 5 - Third from left 6 - Fourth from left
---@return any runeType Type of the rune ( number ) 1 - Blood rune 2 - Unholy rune 3 - Frost rune 4 - Death rune
function GetRuneType(slot) end

--- Returns information on a currently active totem (or ghoul). Totem functions are also used for ghouls summoned by a Death Knight's Raise Dead ability (if the ghoul is not made a controllable pet by the Master of Ghouls talent).
---@param slot any Which totem to query ( number ) 1 - Fire (or Death Knight's ghoul) 2 - Earth 3 - Water 4 - Air
---@return boolean haveTotem True if a totem of the given type is active
---@return string name The name of the totem
---@return number startTime The value of GetTime() when the totem was created
---@return number duration The total duration the totem will last (in seconds)
---@return string icon Path to a texture to use as the totem's icon
function GetTotemInfo(slot) end

--- Returns the time remaining before a totem (or ghoul) automatically disappears.
---@param slot any Which totem to query ( number ) 1 - Fire (or Death Knight's ghoul) 2 - Earth 3 - Water 4 - Air
---@return number seconds Time remaining before the totem/ghoul is automatically destroyed
function GetTotemTimeLeft(slot) end

--- Targets one of the player's totems (or a Death Knight's ghoul). Totem functions are also used for ghouls summoned by a Death Knight's Raise Dead ability (if the ghoul is not made a controllable pet by the Master of Ghouls talent).
--- Flags: protected
---@param slot any Which totem to target ( number ) 1 - Fire (or Death Knight's ghoul) 2 - Earth 3 - Water 4 - Air
function TargetTotem(slot) end
