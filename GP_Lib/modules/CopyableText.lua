--[[
GP_Lib :: modules/CopyableText.lua
Multi-line read-only text region the user can select and copy with Ctrl+C.

Requires GP_Lib.lua (loaded first by the toc).

Provides:
    GP_Lib:CreateCopyableText(parent, opts) -> wrapper

opts:
    width, height   -- size in pixels (defaults 400 x 200)
    font            -- font path (default "Fonts\FRIZQT__.TTF")
    fontSize        -- font size  (default 11)

Methods on the returned wrapper:
    wrapper:SetText(s)
    wrapper:GetText()
    wrapper:HighlightText()   -- selects all (so user can Ctrl+C)
    wrapper:ClearFocus()

The wrapper is a frame; anchor it with :SetPoint like any other widget.
--]]

local UniqueName = GP_Lib.UniqueName


function GP_Lib:CreateCopyableText(parent, opts)
    opts         = opts or {}
    local width  = opts.width or 400
    local height = opts.height or 200
    local font   = opts.font or "Fonts\\FRIZQT__.TTF"
    local size   = opts.fontSize or 11

    local wrapper = CreateFrame("Frame", UniqueName("GP_CTextWrap"), parent)
    wrapper:SetWidth(width)
    wrapper:SetHeight(height)
    wrapper:SetBackdrop({
        bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile     = true,
        tileSize = 8,
        edgeSize = 8,
        insets   = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    wrapper:SetBackdropColor(0.05, 0.05, 0.05, 1)
    wrapper:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)

    local scroll = CreateFrame("ScrollFrame", UniqueName("GP_CTextScroll"), wrapper,
                               "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT",     wrapper, "TOPLEFT",      6, -6)
    scroll:SetPoint("BOTTOMRIGHT", wrapper, "BOTTOMRIGHT", -26, 6)

    local eb = CreateFrame("EditBox", UniqueName("GP_CTextEB"), scroll)
    eb:SetMultiLine(true)
    eb:SetAutoFocus(false)
    eb:SetFontObject(ChatFontNormal)
    eb:SetFont(font, size, "")
    eb:SetTextColor(1, 1, 1, 1)
    eb:SetWidth(width - 32)
    eb:SetHeight(height - 12)
    eb:EnableMouse(true)
    eb:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    eb:SetScript("OnEnterPressed",  function(self) self:ClearFocus() end)
    -- Read-only: keep cursor visible for selection, but ignore typed input by
    -- restoring our stored text on every change.
    eb._readOnly = true
    eb:SetScript("OnTextChanged", function(self, userInput)
        if self._readOnly and userInput and self._storedText then
            self:SetText(self._storedText)
            self:HighlightText(0, 0)
        end
    end)

    scroll:SetScrollChild(eb)

    function wrapper:SetText(s)
        s = s or ""
        eb._storedText = s
        eb._readOnly = false  -- avoid the OnTextChanged guard during programmatic set
        eb:SetText(s)
        eb._readOnly = true
        eb:HighlightText(0, 0)
        eb:SetCursorPosition(0)
    end

    function wrapper:GetText() return eb:GetText() end

    function wrapper:HighlightText()
        eb:SetFocus()
        eb:HighlightText()
    end

    function wrapper:ClearFocus() eb:ClearFocus() end

    wrapper._editBox = eb
    return wrapper
end
