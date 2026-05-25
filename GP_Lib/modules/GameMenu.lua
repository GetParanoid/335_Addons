--[[
GP_Lib :: modules/GameMenu.lua
Adds buttons to the ESC (Game) menu.

Requires GP_Lib.lua (loaded first by the toc).

Provides:
    GP_Lib:HookGameMenuButton(label, onClick) -> button

The returned button inherits GameMenuButtonTemplate so it matches the rest of
the menu. Multiple registrations stack vertically below the existing buttons.

Internally we hook GameMenuFrame:OnShow so that each time the menu opens the
extra buttons are re-anchored beneath the last native button and the frame is
resized to accommodate them. This survives any layout changes other AddOns
make on the fly.
--]]

local UniqueName = GP_Lib.UniqueName

-- All buttons registered through this helper, in registration order.
local registered = {}
local hooked     = false
local SPACING    = 1   -- pixels between stacked buttons


-- Returns the GameMenuButton* that should sit directly above our extra buttons.
-- We anchor to GameMenuButtonContinue when present (above the Logout/Quit pair),
-- otherwise fall back to GameMenuButtonOptions. Both exist in 3.3.5 FrameXML.
local function GetAnchorButton()
    return GameMenuButtonContinue
        or GameMenuButtonMacros
        or GameMenuButtonOptions
end


local function RelayoutMenu()
    local anchor = GetAnchorButton()
    if not anchor or not GameMenuFrame then return end

    local prev = anchor
    local addedHeight = 0
    for _, btn in ipairs(registered) do
        btn:ClearAllPoints()
        btn:SetPoint("TOP", prev, "BOTTOM", 0, -SPACING)
        btn:SetWidth(anchor:GetWidth())
        btn:SetHeight(anchor:GetHeight())
        btn:Show()
        addedHeight = addedHeight + btn:GetHeight() + SPACING
        prev = btn
    end

    -- Grow the menu so logout/exit aren't overlapped.
    if not GameMenuFrame._gpLibBaseHeight then
        GameMenuFrame._gpLibBaseHeight = GameMenuFrame:GetHeight()
    end
    GameMenuFrame:SetHeight(GameMenuFrame._gpLibBaseHeight + addedHeight)
end


local function EnsureHook()
    if hooked or not GameMenuFrame then return end
    GameMenuFrame:HookScript("OnShow", RelayoutMenu)
    hooked = true
end


function GP_Lib:HookGameMenuButton(label, onClick)
    local btn = CreateFrame("Button", UniqueName("GP_GMBtn"), GameMenuFrame,
                            "GameMenuButtonTemplate")
    btn:SetText(label)
    btn:SetScript("OnClick", function(self)
        HideUIPanel(GameMenuFrame)
        if onClick then onClick(self) end
    end)

    table.insert(registered, btn)
    EnsureHook()
    -- If the menu is open right now (e.g. addon loaded mid-session), refresh.
    if GameMenuFrame and GameMenuFrame:IsShown() then RelayoutMenu() end
    return btn
end
