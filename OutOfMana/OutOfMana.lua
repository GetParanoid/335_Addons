--[[
OutOfMana - a simple Out of Mana announcer addon for WoW 3.3.5 (Wrath).

GitHub: https://github.com/GetParanoid/335_Addons
--]]


-- SETTINGS ----------------------------------------------------------------
local CHAT_CHANNEL     = "SAY"     -- "SAY", "PARTY", "RAID", "YELL", etc.
local MESSAGE_DURATION = 3         -- seconds to display the on-screen message
local FONT_SIZE        = 96
local FONT_PATH        = "Interface\\AddOns\\OutOfMana\\Fonts\\ARIALN.ttf"
local FRAME_COLOR      = {0, 0, 0, 0}
local FONT_COLOR       = {1, 1, 1, 1}

-- Thresholds checked in order (highest first). When mana drops across one,
-- its message fires once until mana recovers above it.
local THRESHOLDS = {
    { pct = 0.30, msg = "--- LOW ON MANA ---"       },
    { pct = 0.15, msg = "--- CRITICAL LOW MANA ---" },
    { pct = 0.05, msg = "--- OUT OF MANA ---"       },
}

-- Instance types where messages should also be broadcast to chat.
-- Outside these contexts the on-screen message still shows, but nothing is sent.
local BROADCAST_IN = {
    none  = false, -- open world
    party = true,  -- 5-man dungeons
    raid  = false, -- raids
    arena = false, -- arenas
    pvp   = false, -- battlegrounds
}


-- STATE -------------------------------------------------------------------
local instanceType   = "none"
local lastTriggered  = 0  -- index of the deepest threshold currently tripped
local messageFrame
local hideAt         = 0


-- UI ----------------------------------------------------------------------
local function CreateMessageFrame()
    local f = CreateFrame("Frame", "OutOfMana_MessageFrame", UIParent)
    f:SetWidth(400)
    f:SetHeight(100)
    f:SetPoint("CENTER", 0, 200)

    local bg = f:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(f)
    bg:SetTexture(unpack(FRAME_COLOR))

    local text = f:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    text:SetFont(FONT_PATH, FONT_SIZE, "OUTLINE")
    text:SetTextColor(unpack(FONT_COLOR))
    text:SetAllPoints(f)
    f.text = text

    f:Hide()
    f:SetScript("OnUpdate", function(self)
        if GetTime() >= hideAt then
            self:Hide()
        end
    end)
    return f
end

local function ShowMessage(msg)
    if not messageFrame then
        messageFrame = CreateMessageFrame()
    end
    messageFrame.text:SetText(msg)
    hideAt = GetTime() + MESSAGE_DURATION
    messageFrame:Show()
end


-- LOGIC -------------------------------------------------------------------
local function OnManaChanged()
    if UnitPowerType("player") ~= 0 then return end

    local max = UnitManaMax("player")
    if max == 0 then return end
    local pct = UnitMana("player") / max

    -- Find the deepest threshold currently tripped.
    local tripped = 0
    for i, t in ipairs(THRESHOLDS) do
        if pct <= t.pct then tripped = i end
    end

    if tripped > lastTriggered then
        local entry = THRESHOLDS[tripped]
        ShowMessage(entry.msg)
        if BROADCAST_IN[instanceType] then
            SendChatMessage(entry.msg, CHAT_CHANNEL)
        end
    end

    lastTriggered = tripped
end


-- EVENTS ------------------------------------------------------------------
local OutOfMana = CreateFrame("Frame")
OutOfMana:RegisterEvent("PLAYER_LOGIN")
OutOfMana:RegisterEvent("PLAYER_ENTERING_WORLD")
OutOfMana:RegisterEvent("UNIT_MANA")
OutOfMana:RegisterEvent("UNIT_MAXMANA")
OutOfMana:RegisterEvent("UNIT_DISPLAYPOWER")

OutOfMana:SetScript("OnEvent", function(self, event, unit)
    if event == "PLAYER_LOGIN" then
        local title = GetAddOnMetadata("OutOfMana", "Title") or "OutOfMana"
        local notes = GetAddOnMetadata("OutOfMana", "Notes") or ""
        DEFAULT_CHAT_FRAME:AddMessage(title .. " - |cFF00FF00Successfully loaded!|r")
        if notes ~= "" then
            DEFAULT_CHAT_FRAME:AddMessage(notes)
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        local _, iType = IsInInstance()
        instanceType = iType or "none"
        lastTriggered = 0
    elseif unit == "player" then
        OnManaChanged()
    end
end)
