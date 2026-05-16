--[[
OutOfMana_Config.lua
Builds the OutOfMana config window using GP_Lib and wires up /oom.
Deferred to PLAYER_LOGIN so OutOfManaDB is guaranteed to be initialised.
--]]

local CHANNELS = { "SAY", "YELL", "PARTY", "RAID", "GUILD", "OFFICER" }

local BROADCAST_OPTS = {
    { key = "none",  label = "Open World"    },
    { key = "party", label = "Party (5-man)" },
    { key = "raid",  label = "Raid"          },
    { key = "arena", label = "Arena"         },
    { key = "pvp",   label = "Battleground"  },
}

local BROADCAST_TIPS = {
    none  = "Broadcast mana warnings to chat when in the open world.",
    party = "Broadcast mana warnings to chat in 5-man dungeons.",
    raid  = "Broadcast mana warnings to chat in raid instances.",
    arena = "Broadcast mana warnings to chat in arenas.",
    pvp   = "Broadcast mana warnings to chat in battlegrounds.",
}

local configWin

local function BuildWindow()
    local DB  = OutOfManaDB
    local win = GP_Lib:CreateWindow("OutOfMana Settings", 580, 480)
    configWin = win

    -- ── Row 1: Chat Channel (left) │ Message Duration (right) ────────────────
    local ddChan = GP_Lib:AddDropdown(win, "Chat Channel", 16, 16,
        CHANNELS,
        function()  return DB.chatChannel end,
        function(v) DB.chatChannel = v    end)
    GP_Lib:SetTooltip(ddChan,
        "Which chat channel mana warnings are sent to. " ..
        "Only broadcasts when the current instance type is enabled below.")

    local slDur = GP_Lib:AddSlider(win, "Message Duration: %ds", 300, 30,
        1, 10, 1,
        function()  return DB.messageDuration end,
        function(v) DB.messageDuration = v    end)
    GP_Lib:SetTooltip(slDur, "How many seconds the on-screen mana warning stays visible.")

    -- ── Row 2: Font Size ──────────────────────────────────────────────────────
    local slFont = GP_Lib:AddSlider(win, "Font Size: %d", 16, 100,
        24, 128, 2,
        function()  return DB.fontSize end,
        function(v)
            DB.fontSize = v
            OutOfMana_RefreshFrame()
        end)
    GP_Lib:SetTooltip(slFont,
        "Size of the on-screen mana warning text. Applied immediately when you click Save.")

    -- ── Broadcast In ──────────────────────────────────────────────────────────
    GP_Lib:AddHeader(win, "Broadcast In", 16, 160)

    for i, opt in ipairs(BROADCAST_OPTS) do
        local col = (i - 1) % 3
        local row = math.floor((i - 1) / 3)
        local k   = opt.key
        local cb  = GP_Lib:AddCheckbox(win, opt.label,
            16 + col * 185, 188 + row * 28,
            function()  return DB.broadcastIn[k] end,
            function(v) DB.broadcastIn[k] = v    end)
        GP_Lib:SetTooltip(cb, BROADCAST_TIPS[k])
    end

    -- ── Mana Thresholds ───────────────────────────────────────────────────────
    GP_Lib:AddHeader(win, "Mana Thresholds", 16, 258)
    GP_Lib:AddLabel(win, "  %", 16, 284)
    GP_Lib:AddLabel(win, "Message", 74, 284)

    for i = 1, 3 do
        local y = 300 + (i - 1) * 34

        local ebPct = GP_Lib:AddEditBox(win, nil, 16, y, 44,
            function()  return math.floor(DB.thresholds[i].pct * 100) end,
            function(v)
                local n = tonumber(v)
                if n then DB.thresholds[i].pct = n / 100 end
            end)
        GP_Lib:SetTooltip(ebPct,
            "Mana percentage that triggers this warning (1-100). " ..
            "Thresholds fire once when crossed and reset when mana recovers.")

        local ebMsg = GP_Lib:AddEditBox(win, nil, 74, y, 458,
            function()  return DB.thresholds[i].msg end,
            function(v) DB.thresholds[i].msg = v    end)
        GP_Lib:SetTooltip(ebMsg,
            "Text shown on screen and sent to the chat channel when this threshold is crossed.")
    end
end

-- Slash command ---------------------------------------------------------------

SLASH_OUTOFMANA1 = "/oom"
SlashCmdList["OUTOFMANA"] = function()
    if not configWin then return end
    if configWin:IsShown() then
        configWin:Hide()
    else
        configWin:Show()
    end
end

-- Defer build until OutOfManaDB is ready --------------------------------------

local loader = CreateFrame("Frame")
loader:RegisterEvent("PLAYER_LOGIN")
loader:SetScript("OnEvent", function(self)
    BuildWindow()
    self:UnregisterEvent("PLAYER_LOGIN")
end)
