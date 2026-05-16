--[[
OutOfMana - a simple Out of Mana announcer addon for WoW 3.3.5 (Wrath).

GitHub: https://github.com/GetParanoid/335_Addons

Settings are managed through the in-game config panel:
  Interface > AddOns > OutOfMana   (or type /oom)
--]]


-- CONSTANTS (not user-configurable) ------------------------------------------

local FONT_PATH  = "Interface\\AddOns\\OutOfMana\\Fonts\\ARIALN.ttf"
local FRAME_COLOR = {0, 0, 0, 0}
local FONT_COLOR  = {1, 1, 1, 1}


-- DEFAULTS --------------------------------------------------------------------

local DEFAULTS = {
    chatChannel     = "SAY",
    messageDuration = 3,
    fontSize        = 96,
    thresholds = {
        { pct = 0.30, msg = "--- LOW ON MANA ---"       },
        { pct = 0.15, msg = "--- CRITICAL LOW MANA ---" },
        { pct = 0.05, msg = "--- OUT OF MANA ---"       },
    },
    broadcastIn = {
        none  = false,
        party = true,
        raid  = false,
        arena = false,
        pvp   = false,
    },
}

local function DeepCopy(orig)
    local copy = {}
    for k, v in pairs(orig) do
        copy[k] = type(v) == "table" and DeepCopy(v) or v
    end
    return copy
end

local function ApplyDefaults(tbl, defaults)
    for k, v in pairs(defaults) do
        if tbl[k] == nil then
            tbl[k] = type(v) == "table" and DeepCopy(v) or v
        elseif type(v) == "table" and type(tbl[k]) == "table" then
            ApplyDefaults(tbl[k], v)
        end
    end
end


-- STATE -----------------------------------------------------------------------

local instanceType  = "none"
local lastTriggered = 0
local messageFrame


-- UI --------------------------------------------------------------------------

local function CreateMessageFrame()
    local f = CreateFrame("Frame", "OutOfMana_MessageFrame", UIParent)
    f:SetWidth(400)
    f:SetHeight(100)
    f:SetPoint("CENTER", 0, 200)

    local bg = f:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(f)
    bg:SetTexture(unpack(FRAME_COLOR))

    local text = f:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    text:SetFont(FONT_PATH, OutOfManaDB.fontSize, "OUTLINE")
    text:SetTextColor(unpack(FONT_COLOR))
    text:SetAllPoints(f)
    f.text = text

    f:Hide()
    f:SetScript("OnUpdate", function(self)
        if GetTime() >= self.hideAt then self:Hide() end
    end)
    f.hideAt = 0
    return f
end

local function ShowMessage(msg)
    if not messageFrame then
        messageFrame = CreateMessageFrame()
    end
    messageFrame.text:SetText(msg)
    messageFrame.hideAt = GetTime() + OutOfManaDB.messageDuration
    messageFrame:Show()
end

-- Called by the config panel after font size changes are committed.
function OutOfMana_RefreshFrame()
    if messageFrame then
        messageFrame.text:SetFont(FONT_PATH, OutOfManaDB.fontSize, "OUTLINE")
    end
end


-- LOGIC -----------------------------------------------------------------------

local function OnManaChanged()
    if UnitPowerType("player") ~= 0 then return end

    local max = UnitManaMax("player")
    if max == 0 then return end
    local pct = UnitMana("player") / max

    local tripped = 0
    for i, t in ipairs(OutOfManaDB.thresholds) do
        if pct <= t.pct then tripped = i end
    end

    if tripped > lastTriggered then
        local entry = OutOfManaDB.thresholds[tripped]
        ShowMessage(entry.msg)
        if OutOfManaDB.broadcastIn[instanceType] then
            SendChatMessage(entry.msg, OutOfManaDB.chatChannel)
        end
    end

    lastTriggered = tripped
end


-- EVENTS ----------------------------------------------------------------------

local OutOfMana = CreateFrame("Frame")
OutOfMana:RegisterEvent("PLAYER_LOGIN")
OutOfMana:RegisterEvent("PLAYER_ENTERING_WORLD")
OutOfMana:RegisterEvent("UNIT_MANA")
OutOfMana:RegisterEvent("UNIT_MAXMANA")
OutOfMana:RegisterEvent("UNIT_DISPLAYPOWER")

OutOfMana:SetScript("OnEvent", function(self, event, unit)
    if event == "PLAYER_LOGIN" then
        OutOfManaDB = OutOfManaDB or {}
        ApplyDefaults(OutOfManaDB, DEFAULTS)

        local title = GetAddOnMetadata("OutOfMana", "Title") or "OutOfMana"
        DEFAULT_CHAT_FRAME:AddMessage(title .. " - |cFF00FF00Successfully loaded!|r  ( /oom )")

    elseif event == "PLAYER_ENTERING_WORLD" then
        local _, iType = IsInInstance()
        instanceType = iType or "none"
        lastTriggered = 0

    elseif unit == "player" then
        OnManaChanged()
    end
end)
