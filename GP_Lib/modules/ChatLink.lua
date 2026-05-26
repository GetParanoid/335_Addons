--[[
GP_Lib :: modules/ChatLink.lua
Clickable custom hyperlinks for chat output.

Requires GP_Lib.lua (loaded first by the toc).

Two link kinds are supported:

    GP_Lib.ChatLink:Url(displayText, url)
        Returns a chat-printable string. When the user clicks the rendered
        link, a small popup appears with the URL pre-selected in an EditBox
        (user hits Ctrl+C to copy).

    GP_Lib.ChatLink:Action(key, displayText)
        Returns a chat-printable string. When the user clicks it, the
        callback registered via :RegisterAction(key, fn) is invoked.

    GP_Lib.ChatLink:RegisterAction(key, fn)
        Registers a callback for action-type links. The callback receives
        no arguments; capture context in a closure.

Custom link wire format:  |Hgplib:url:<url>|h[text]|h
                          |Hgplib:act:<key>|h[text]|h

The module hooks the global SetItemRef once at load. Unknown link types
(non-"gplib:") fall through to the original handler unchanged.
--]]

local CL = {
    actions = {},  -- key -> fn
}
GP_Lib.ChatLink = CL


-- Link construction -------------------------------------------------------

local LINK_COLOR = "ff33d6ff"  -- AARRGGBB; light cyan, visibly link-like

local function wrap(token, displayText)
    return "|c" .. LINK_COLOR
        .. "|H" .. token .. "|h[" .. (displayText or token) .. "]|h|r"
end

--- Build a clickable URL chat string.
---@param displayText string  Text shown to the user inside the brackets
---@param url string          URL to display in the copy popup when clicked
---@return string chatString  Ready to pass to DEFAULT_CHAT_FRAME:AddMessage
function CL:Url(displayText, url)
    return wrap("gplib:url:" .. (url or ""), displayText)
end

--- Build an action-type clickable chat string. Pair with :RegisterAction.
---@param key string          Identifier matching a registered action
---@param displayText string  Text shown to the user inside the brackets
---@return string chatString
function CL:Action(key, displayText)
    return wrap("gplib:act:" .. (key or ""), displayText)
end

--- Register a callback for an action-type link.
---@param key string
---@param fn function
function CL:RegisterAction(key, fn)
    self.actions[key] = fn
end


-- Copy popup --------------------------------------------------------------

local POPUP_WIDTH    = 540
local EDITBOX_WIDTH  = 500

StaticPopupDialogs["GP_LIB_CHATLINK_COPY"] = {
    text         = "Press Ctrl+C to copy:",
    button1      = OKAY,
    hasEditBox   = true,
    editBoxWidth = EDITBOX_WIDTH,
    timeout      = 0,
    whileDead    = true,
    hideOnEscape = true,
    OnShow = function(self, data)
        self:SetWidth(POPUP_WIDTH)  -- StaticPopup template ships at ~320; widen it
        local eb = self.editBox or _G[self:GetName() .. "EditBox"]
        if eb then
            eb:SetWidth(EDITBOX_WIDTH)
            eb:SetText(data or "")
            eb:HighlightText()
            eb:SetFocus()
        end
    end,
    EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
    EditBoxOnEnterPressed  = function(self) self:GetParent():Hide() end,
    EditBoxOnTextChanged   = function(self)
        -- Keep the URL fixed; restore if the user tries to edit it.
        if self._gplibUrl and self:GetText() ~= self._gplibUrl then
            self:SetText(self._gplibUrl)
            self:HighlightText()
        end
    end,
}

local function showCopyPopup(url)
    local dialog = StaticPopup_Show("GP_LIB_CHATLINK_COPY", nil, nil, url)
    if dialog then
        dialog:SetWidth(POPUP_WIDTH)
        local eb = dialog.editBox or _G[dialog:GetName() .. "EditBox"]
        if eb then
            eb._gplibUrl = url
            eb:SetWidth(EDITBOX_WIDTH)
            eb:SetText(url)
            eb:HighlightText()
            eb:SetFocus()
        end
    end
end


-- SetItemRef hook ---------------------------------------------------------
-- Intercepts clicks on "gplib:" links; everything else passes through.

local origSetItemRef = SetItemRef

function SetItemRef(link, text, button, chatFrame)
    if type(link) == "string" and string.sub(link, 1, 6) == "gplib:" then
        local kind = string.sub(link, 7, 9)        -- "url" or "act"
        local data = string.sub(link, 11)          -- everything after "gplib:xxx:"
        if kind == "url" then
            showCopyPopup(data)
        elseif kind == "act" then
            local fn = CL.actions[data]
            if fn then fn() end
        end
        return
    end
    return origSetItemRef(link, text, button, chatFrame)
end
