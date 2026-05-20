--[[
SwingTimer
Ported to WoW 3.3.5a; modernised by GetParanoid.

Tracks the player's melee swing timer and displays a progress bar that
depletes (or fills) between each auto-attack.

SavedVariables: SwingTimer_Settings
Dependencies:   GP_Lib
--]]


-- ─────────────────────────────────────────────────────────────────────────────
-- Saved settings
--
-- Populated by WoW before the file runs; MergeDefaults() fills missing keys.
--
-- Fields:
--   theme     (string)  "light" | "dark" | "class"
--   direction (string)  "LEFT"  | "RIGHT"   — which edge the bar fills from
--   mode      (string)  "remaining" | "elapsed" — what the fill represents
--   width     (number)  bar width in pixels
--   height    (number)  bar height in pixels
--   alpha     (number)  bar alpha [0, 1]
--   scale     (number)  bar scale
-- ─────────────────────────────────────────────────────────────────────────────

SwingTimer_Settings = SwingTimer_Settings or {}


-- ─────────────────────────────────────────────────────────────────────────────
-- Private state
-- ─────────────────────────────────────────────────────────────────────────────

--- Spells that replace (or fire alongside) an auto-attack, resetting the timer.
local COMBAT_SPELLS = {
    ["Heroic Strike"] = true,
    ["Cleave"]        = true,
    ["Slam"]          = true,
    ["Raptor Strike"] = true,
    ["Maul"]          = true,
}

--- Class bar colours (mirrors RAID_CLASS_COLORS, defined locally to avoid globals).
local CLASS_COLORS = {
    WARRIOR     = { r = 0.78, g = 0.61, b = 0.43 },
    PALADIN     = { r = 0.96, g = 0.55, b = 0.73 },
    HUNTER      = { r = 0.67, g = 0.83, b = 0.45 },
    ROGUE       = { r = 1.00, g = 0.96, b = 0.41 },
    PRIEST      = { r = 1.00, g = 1.00, b = 1.00 },
    DEATHKNIGHT = { r = 0.77, g = 0.12, b = 0.23 },
    SHAMAN      = { r = 0.00, g = 0.44, b = 0.87 },
    MAGE        = { r = 0.41, g = 0.80, b = 0.94 },
    WARLOCK     = { r = 0.58, g = 0.51, b = 0.79 },
    DRUID       = { r = 1.00, g = 0.49, b = 0.04 },
}

--- Applied to SwingTimer_Settings on first load for any missing key.
local DEFAULTS = {
    theme     = "light",
    direction = "LEFT",
    mode      = "remaining",
    width     = 200,
    height    = 10,
    alpha     = 1.0,
    scale     = 1.0,
}

local bar         -- GP_Lib:CreateBar frame (created in BuildBar)
local settingsWin -- GP_Lib:CreateWindow frame (lazy-created on first /st config)

local timer     = 0.0  -- seconds until next swing
local inCombat  = false
local movable   = false
local weapon    = nil   -- cached MainHand item link
local prevSpeed = 0.0   -- last known weapon speed (for aura adjustments)


-- ─────────────────────────────────────────────────────────────────────────────
-- Pure helpers
-- ─────────────────────────────────────────────────────────────────────────────

--- Returns the bar fill colour (r, g, b) for the current theme setting.
local function GetColor()
    local theme = SwingTimer_Settings.theme
    if theme == "class" then
        local _, class = UnitClass("player")
        local c = CLASS_COLORS[class] or CLASS_COLORS.WARRIOR
        return c.r, c.g, c.b
    elseif theme == "dark" then
        return 0.5, 0.5, 0.5
    end
    return 1, 1, 1  -- "light" default
end

--- Returns the player's current main-hand swing speed in seconds.
--- Also syncs prevSpeed so AdjustForAura has a reference point.
local function GetWeaponSpeed()
    local speed = UnitAttackSpeed("player")
    prevSpeed = speed
    return speed
end

--- Shifts the remaining timer when a haste aura is gained or lost, preserving
--- the fraction of the swing already completed.
local function AdjustForAura()
    local newSpeed = UnitAttackSpeed("player")
    if newSpeed ~= prevSpeed and timer > 0 then
        timer = timer - (prevSpeed - newSpeed)
        if timer < 0 then timer = 0 end
    end
    prevSpeed = newSpeed
end

--- Returns true when the timer is near zero — close enough that an incoming
--- combat-log event should be treated as a fresh swing, not a delayed echo.
local function ShouldResetTimer()
    local speed = GetWeaponSpeed()
    if speed == 0 then return false end
    return (timer / speed) < 0.04
end

--- Starts a new swing cycle at full weapon speed and shows the bar.
local function ResetTimer()
    timer = GetWeaponSpeed()
    bar:Show()
end

--- Caches the player's current main-hand item link.
local function CacheWeapon()
    weapon = GetInventoryItemLink("player", GetInventorySlotInfo("MainHandSlot"))
end

--- Redraws the bar to reflect the current timer value.
--- Hides the bar automatically when out of combat and the swing is not active.
local function UpdateBar()
    local speed = GetWeaponSpeed()

    if timer <= 0 then
        bar:SetValue(0)
        if not inCombat and not movable then bar:Hide() end
        return
    end

    local frac = speed > 0 and (timer / speed) or 0
    if SwingTimer_Settings.mode == "elapsed" then frac = 1 - frac end
    bar:SetValue(frac)
end

--- Applies all visual settings (colour, size, direction, alpha, scale) to the bar.
--- Does not move the bar — position is managed by SetUserPlaced / drag.
local function ApplySettings()
    local s = SwingTimer_Settings
    bar:SetWidth(s.width)
    bar:SetHeight(s.height)
    bar:SetAlpha(s.alpha)
    bar:SetScale(s.scale)
    bar:SetColor(GetColor())
    bar:SetFillDirection(s.direction)
end

--- Merges DEFAULTS into SwingTimer_Settings for any key that is missing.
local function MergeDefaults()
    for k, v in pairs(DEFAULTS) do
        if SwingTimer_Settings[k] == nil then
            SwingTimer_Settings[k] = v
        end
    end
end


-- ─────────────────────────────────────────────────────────────────────────────
-- Settings window  (lazy — built once on first /st config)
-- ─────────────────────────────────────────────────────────────────────────────

--- Builds the GP_Lib config window the first time it is needed.
local function EnsureSettingsWindow()
    if settingsWin then return end

    settingsWin = GP_Lib:CreateWindow("SwingTimer Settings", 420, 400)

    GP_Lib:AddHeader(settingsWin, "Appearance", 16, 16)

    GP_Lib:AddDropdown(settingsWin, "Theme", 16, 50,
        { "light", "dark", "class" },
        function() return SwingTimer_Settings.theme end,
        function(v) SwingTimer_Settings.theme = v; bar:SetColor(GetColor()) end)

    GP_Lib:SetTooltip(
        GP_Lib:AddDropdown(settingsWin, "Direction", 200, 50,
            { "LEFT", "RIGHT" },
            function() return SwingTimer_Settings.direction end,
            function(v) SwingTimer_Settings.direction = v; bar:SetFillDirection(v) end),
        "LEFT: bar depletes from the right edge.\nRIGHT: bar depletes from the left edge.")

    GP_Lib:AddDropdown(settingsWin, "Mode", 16, 110,
        { "remaining", "elapsed" },
        function() return SwingTimer_Settings.mode end,
        function(v) SwingTimer_Settings.mode = v end)

    GP_Lib:AddHeader(settingsWin, "Size & opacity", 16, 158)

    GP_Lib:AddSlider(settingsWin, "Width: %d px", 16, 190,
        80, 400, 10,
        function() return SwingTimer_Settings.width end,
        function(v) SwingTimer_Settings.width = v; bar:SetWidth(v) end)

    GP_Lib:AddSlider(settingsWin, "Height: %d px", 16, 235,
        6, 40, 2,
        function() return SwingTimer_Settings.height end,
        function(v) SwingTimer_Settings.height = v; bar:SetHeight(v) end)

    GP_Lib:AddSlider(settingsWin, "Alpha: %.0f%%", 16, 280,
        10, 100, 5,
        function() return floor(SwingTimer_Settings.alpha * 100 + 0.5) end,
        function(v) SwingTimer_Settings.alpha = v / 100; bar:SetAlpha(v / 100) end)
end


-- ─────────────────────────────────────────────────────────────────────────────
-- Bar frame
-- ─────────────────────────────────────────────────────────────────────────────

--- Builds the timer bar.  Called once after settings are merged.
local function BuildBar()
    local s = SwingTimer_Settings

    bar = GP_Lib:CreateBar(UIParent, s.width, s.height)
    bar:SetPoint("CENTER", UIParent, "CENTER", 0, -250)
    bar:SetMovable(true)
    bar:SetClampedToScreen(true)
    bar:SetUserPlaced(true)
    bar:EnableMouse(true)
    bar:RegisterForDrag("LeftButton")
    bar:Hide()

    bar:SetScript("OnDragStart", function(self)
        if movable then self:StartMoving() end
    end)
    bar:SetScript("OnDragStop", function(self)
        if movable then self:StopMovingOrSizing() end
    end)
    bar:SetScript("OnUpdate", function(_, elapsed)
        if timer > 0 then
            timer = timer - elapsed
            if timer < 0 then timer = 0 end
        end
        UpdateBar()
    end)

    ApplySettings()
end


-- ─────────────────────────────────────────────────────────────────────────────
-- Event handling
-- ─────────────────────────────────────────────────────────────────────────────

local eventFrame = CreateFrame("Frame", "SwingTimerEventFrame", UIParent)

eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
eventFrame:RegisterEvent("UNIT_INVENTORY_CHANGED")
eventFrame:RegisterEvent("UNIT_AURA")
eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

eventFrame:SetScript("OnEvent", function(_, event, ...)
    -- ── Initialise ──────────────────────────────────────────────────────────
    if event == "ADDON_LOADED" then
        if (...) ~= "SwingTimer" then return end
        MergeDefaults()
        BuildBar()
        SLASH_SWINGTIMER1 = "/swingtimer"
        SLASH_SWINGTIMER2 = "/st"
        SlashCmdList["SWINGTIMER"] = SwingTimer_commands
        DEFAULT_CHAT_FRAME:AddMessage("SwingTimer loaded.  Type /st for commands.")
        eventFrame:UnregisterEvent("ADDON_LOADED")

    -- ── Zone / login ────────────────────────────────────────────────────────
    elseif event == "PLAYER_ENTERING_WORLD" then
        CacheWeapon()
        ApplySettings()

    -- ── Combat state ────────────────────────────────────────────────────────
    elseif event == "PLAYER_REGEN_DISABLED" then
        inCombat = true

    elseif event == "PLAYER_REGEN_ENABLED" then
        inCombat = false
        UpdateBar()

    -- ── Weapon swap ─────────────────────────────────────────────────────────
    elseif event == "UNIT_INVENTORY_CHANGED" then
        local unit = ...
        if unit == "player" then
            local old = weapon
            CacheWeapon()
            if inCombat and old ~= weapon then ResetTimer() end
        end

    -- ── Haste aura gained / lost ────────────────────────────────────────────
    elseif event == "UNIT_AURA" then
        local unit = ...
        if unit == "player" then AdjustForAura() end

    -- ── Melee events ────────────────────────────────────────────────────────
    --
    -- Combat log layout (3.3.5a):
    --   1:timestamp  2:subevent  3:srcGUID  4:srcName  5:srcFlags
    --   6:dstGUID    7:dstName   8:dstFlags [spell-specific args...]
    --
    -- SWING_MISSED  arg9 : missType
    -- SPELL_DAMAGE  arg9 : spellId   arg10: spellName  arg11: spellSchool ...
    -- SPELL_MISSED  arg9 : spellId   arg10: spellName  arg11: spellSchool  arg12: missType
    --
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        -- Layout: timestamp, subevent, srcGUID, srcName, srcFlags,
        --         dstGUID,   dstName,  dstFlags, [a9, a10, ...]
        -- SWING_MISSED  a9 = missType
        -- SPELL_DAMAGE  a9 = spellId,  a10 = spellName
        -- SPELL_MISSED  a9 = spellId,  a10 = spellName
        local _, subevent, srcGUID, _, _, dstGUID, _, _, a9, a10 = ...
        local playerGUID = UnitGUID("player")

        if subevent == "SWING_DAMAGE" or subevent == "SWING_MISSED" then
            if srcGUID == playerGUID then
                -- Player's auto-attack resolved — start the next cycle.
                if ShouldResetTimer() then ResetTimer() end

            elseif dstGUID == playerGUID and subevent == "SWING_MISSED" then
                -- Enemy swing dodged by the player — shorten the player's timer.
                if a9 == "DODGE" then
                    local speed   = GetWeaponSpeed()
                    local minimum = speed * 0.20
                    if timer > minimum then
                        local reduced = timer - speed * 0.40
                        timer = reduced < minimum and minimum or reduced
                    end
                end
            end

        elseif subevent == "SPELL_DAMAGE" or subevent == "SPELL_MISSED" then
            -- On-next-attack abilities that consume (and reset) the swing.
            if srcGUID == playerGUID and COMBAT_SPELLS[a10] then
                ResetTimer()
            end
        end
    end
end)


-- ─────────────────────────────────────────────────────────────────────────────
-- Slash commands
-- ─────────────────────────────────────────────────────────────────────────────

--- Handles /st and /swingtimer.
---
--- Subcommands:
---   config          — toggle the settings window
---   move            — toggle drag mode (bar stays visible while dragging)
---   reset           — reset bar position to the default centre-bottom anchor
---   light|dark|class — quick theme shortcut
---   (anything else) — print help
function SwingTimer_commands(msg)
    msg = strlower(msg or "")

    if msg == "config" then
        EnsureSettingsWindow()
        if settingsWin:IsShown() then settingsWin:Hide() else settingsWin:Show() end

    elseif msg == "move" then
        movable = not movable
        if movable then
            bar:Show()
            DEFAULT_CHAT_FRAME:AddMessage("SwingTimer: drag mode ON — /st move to lock")
        else
            if not inCombat and timer <= 0 then bar:Hide() end
            DEFAULT_CHAT_FRAME:AddMessage("SwingTimer: drag mode OFF")
        end

    elseif msg == "reset" then
        bar:SetUserPlaced(false)
        bar:ClearAllPoints()
        bar:SetPoint("CENTER", UIParent, "CENTER", 0, -250)
        bar:SetUserPlaced(true)
        DEFAULT_CHAT_FRAME:AddMessage("SwingTimer: position reset")

    elseif msg == "light" or msg == "dark" or msg == "class" then
        SwingTimer_Settings.theme = msg
        bar:SetColor(GetColor())
        DEFAULT_CHAT_FRAME:AddMessage("SwingTimer: theme → " .. msg)

    else
        local c = "|cffffff00"
        local r = "|r"
        DEFAULT_CHAT_FRAME:AddMessage("SwingTimer commands:")
        DEFAULT_CHAT_FRAME:AddMessage(c .. "  /st config" .. r .. "           — settings window")
        DEFAULT_CHAT_FRAME:AddMessage(c .. "  /st move" .. r .. "             — toggle drag mode")
        DEFAULT_CHAT_FRAME:AddMessage(c .. "  /st reset" .. r .. "            — reset position")
        DEFAULT_CHAT_FRAME:AddMessage(c .. "  /st light|dark|class" .. r .. " — quick theme")
    end
end
