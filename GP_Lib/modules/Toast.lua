--[[
GP_Lib :: modules/Toast.lua
Transient on-screen notification.

Requires GP_Lib.lua (loaded first by the toc).

Provides:
    GP_Lib:ShowToast(text, opts)

opts:
    duration  -- seconds before fade-out begins (default 4)
    fadeTime  -- seconds of fade-out (default 1)
    onClick   -- optional callback when the toast is clicked

Toasts stack upward from the bottom-right of the screen. Old toasts slide down
into the slot vacated by a finishing toast so the order stays stable.
--]]

local UniqueName = GP_Lib.UniqueName

local active = {}       -- ordered list of currently-visible toasts, bottom first
local SLOT_WIDTH  = 260
local SLOT_HEIGHT = 38
local SLOT_GAP    = 4


local function Relayout()
    for i, toast in ipairs(active) do
        toast:ClearAllPoints()
        toast:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT",
                       -20, 120 + (i - 1) * (SLOT_HEIGHT + SLOT_GAP))
    end
end


local function Remove(toast)
    for i, t in ipairs(active) do
        if t == toast then
            table.remove(active, i)
            break
        end
    end
    toast:Hide()
    Relayout()
end


function GP_Lib:ShowToast(text, opts)
    opts          = opts or {}
    local duration = opts.duration or 4
    local fadeTime = opts.fadeTime or 1
    local onClick  = opts.onClick

    local toast = CreateFrame("Button", UniqueName("GP_Toast"), UIParent)
    toast:SetWidth(SLOT_WIDTH)
    toast:SetHeight(SLOT_HEIGHT)
    toast:SetFrameStrata("DIALOG")
    toast:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile     = true,
        tileSize = 16,
        edgeSize = 12,
        insets   = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    toast:SetBackdropColor(0, 0, 0, 0.85)
    toast:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)

    local fs = toast:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    fs:SetPoint("LEFT",  toast, "LEFT",  10, 0)
    fs:SetPoint("RIGHT", toast, "RIGHT", -10, 0)
    fs:SetJustifyH("LEFT")
    fs:SetText(text or "")

    toast:SetScript("OnClick", function(self)
        if onClick then onClick(self) end
        Remove(self)
    end)

    table.insert(active, 1, toast)
    Relayout()
    toast:SetAlpha(1)
    toast:Show()

    -- Schedule fade-out via an OnUpdate ticker (no C_Timer in 3.3.5).
    local elapsed = 0
    toast:SetScript("OnUpdate", function(self, delta)
        elapsed = elapsed + delta
        if elapsed >= duration then
            self:SetScript("OnUpdate", nil)
            UIFrameFadeOut(self, fadeTime, 1, 0)
            -- Schedule removal once the fade finishes.
            local rest = 0
            self:SetScript("OnUpdate", function(s, d)
                rest = rest + d
                if rest >= fadeTime then
                    s:SetScript("OnUpdate", nil)
                    Remove(s)
                end
            end)
        end
    end)

    return toast
end
