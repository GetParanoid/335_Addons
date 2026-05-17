--==============================
-- Item Text functions
--==============================

--- Ends interaction with a text object or item. Causes the ITEM_TEXT_CLOSED event to fire, indicating that ItemText APIs are no longer valid.
function CloseItemText() end

--- Returns the original author of the currently viewed text item. Used for mail messages sent by other players; when the player makes a permanent copy of a letter and reads it from inventory, the default UI uses this function to display a signature (e.g. "From, Leeroy") at the end of the message text.
---@return string creator Creator of the text item, or nil if not available
function ItemTextGetCreator() end

--- Returns the name of the currently viewed text item. Used for readable world objects (plaques, books on tables, etc) and readable inventory items (looted books/parchments/scrolls/etc, saved copies of mail messages). For saved mail messages the name returned is always "Plain Letter" (or localized equivalent); the message subject is lost when saving a copy.
---@return string text Name of the text item
function ItemTextGetItem() end

--- Returns display style information for the currently viewed text item. The value returned can be used to look up background textures and text colors for display:
---@return any material String identifying a display style for the current text item, or nil for the default style ( string ) Bronze - Colored metallic background Marble - Light stone background Parchment - Yellowed parchment background (default) Silver - Gray metallic background Stone - Dark stone background
function ItemTextGetMaterial() end

--- Returns the current page number in the currently viewed text item
---@return number page Number of the currently displayed page
function ItemTextGetPage() end

--- Returns the text of the currently viewed text item. Used for readable world objects (plaques, books on tables, etc) and readable inventory items (looted books/parchments/scrolls/etc, saved copies of mail messages). Returns valid data only between the ITEM_TEXT_BEGIN and ITEM_TEXT_CLOSED events, with the ITEM_TEXT_READY event indicating when new text is available (as when changing pages).
---@return string text Text to be displayed for the current page of the currently viewed text item
function ItemTextGetText() end

--- Returns whether the currently viewed text item has additional pages
---@return any next 1 if the currently viewed text item has one or more pages beyond the current page; otherwise nil
function ItemTextHasNextPage() end

--- Moves to the next page in the currently viewed text item. The ITEM_TEXT_READY event fires when text for the next page becomes available. Does nothing if already viewing the last page of text.
function ItemTextNextPage() end

--- Moves to the previous page in the currently viewed text item. The ITEM_TEXT_READY event fires when text for the previous page becomes available. Does nothing if already viewing the first page of text.
function ItemTextPrevPage() end
