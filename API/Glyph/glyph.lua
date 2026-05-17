--==============================
-- Glyph functions
--==============================

--- Gets a hyperlink for the contents of a glyph socket.
---@param socket number Which glyph socket to query (between 1 and NUM_GLYPH_SLOTS )
---@param talentGroup any Which set of glyphs to query, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return string link A hyperlink for the glyph socket's contents, or "" if the socket is empty
function GetGlyphLink(socket, talentGroup) end

--- Returns information about a glyph socket and its contents.
---@param socket number Which glyph socket to query (between 1 and NUM_GLYPH_SLOTS )
---@param talentGroup any Which set of glyphs to query, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return boolean enabled True if the socket can be given a glyph at the player's current level; false if the socket is locked
---@return number glyphType 1 for minor glyph sockets, 2 for major glyph sockets, 3 for prime glyph sockets
---@return number glyphTooltipIndex Index to be used with GLYPH_SLOT_TOOLTIP# for the overlay
---@return number glyphSpell Spell ID of the spell that inscribed a glyph into the socket, or nil if the socket is empty
---@return string icon Path to a texture for the glyph inscribed into the socket, or nil if the socket is empty
function GetGlyphSocketInfo(socket, talentGroup) end

--- Currently unused. Use the constant NUM_GLYPH_SLOTS instead.
--- Flags: deprecated
function GetNumGlyphSockets() end

--- Returns whether a socket is eligible for the glyph currently awaiting a target.
---@param socket number Which glyph socket to query (between 1 and NUM_GLYPH_SLOTS )
---@return any match 1 if the glyph awaiting a target fits the given socket; nil if it doesn't fit or if no glyph is awaiting a target
function GlyphMatchesSocket(socket) end

--- Applies the glyph currently awaiting a target to a socket. Only valid during glyph application: when the player has activated the glyph item but before she has chosen the glyph slot to put it in (i.e. the glowing hand cursor is showing).
--- Flags: confirmation
---@param socket number Which glyph socket to apply the glyph to (between 1 and NUM_GLYPH_SLOTS )
function PlaceGlyphInSocket(socket) end

--- Removes the glyph from a socket
--- Flags: confirmation
---@param socket number Which glyph socket to query (between 1 and NUM_GLYPH_SLOTS )
function RemoveGlyphFromSocket(socket) end

--- Returns whether the spell currently awaiting a target requires a glyph slot to be chosen.
---@return any canTarget 1 if the spell can target glyph slots
function SpellCanTargetGlyph() end
