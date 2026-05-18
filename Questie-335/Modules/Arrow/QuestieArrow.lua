--[[
    Direction arrow HUD ported from QuestHelper (originally from TomTom).
    Auto-tracks the nearest incomplete quest objective spawn.
    No external addon required.
--]]

---@class QuestieArrow
local QuestieArrow = QuestieLoader:CreateModule("QuestieArrow")

---@type QuestiePlayer
local QuestiePlayer = QuestieLoader:ImportModule("QuestiePlayer")
---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")
---@type QuestieMap
local QuestieMap = QuestieLoader:ImportModule("QuestieMap")
---@type ZoneDB
local ZoneDB = QuestieLoader:ImportModule("ZoneDB")

local HBD = QuestieCompat.HBD or LibStub("HereBeDragonsQuestie-2.0")

local ADDON_PATH = "Interface\\AddOns\\Questie-335\\Modules\\Arrow\\"
local SCAN_INTERVAL = 0.5

-- ======================= Color gradient =======================
-- Ported verbatim from QuestHelper/arrow.lua (originally from TomTom).
-- perc=0 → red (behind), perc=0.5 → yellow (side), perc=1 → green (ahead)

local function ColorGradient(perc, ...)
    local num = select("#", ...)
    if perc == 1 then
        return select(num - 2, ...), select(num - 1, ...), select(num, ...)
    end
    num = num / 3
    local segment, relperc = math.modf(perc * (num - 1))
    local r1, g1, b1 = select((segment * 3) + 1, ...), select((segment * 3) + 2, ...), select((segment * 3) + 3, ...)
    local r2, g2, b2 = select((segment * 3) + 4, ...), select((segment * 3) + 5, ...), select((segment * 3) + 6, ...)
    if not r2 or not g2 or not b2 then
        return r1, g1, b1
    end
    return r1 + (r2 - r1) * relperc, g1 + (g2 - g1) * relperc, b1 + (b2 - b1) * relperc
end

-- ======================= Frame =======================

local wayframe = CreateFrame("Button", "QuestieArrowFrame", UIParent)
wayframe:SetPoint("CENTER", -300, 300)
wayframe:EnableMouse(true)
wayframe:SetMovable(true)
wayframe:SetUserPlaced(true)
wayframe:Hide()
wayframe:RegisterForDrag("LeftButton")
wayframe:SetScript("OnDragStart", function(self)
    if not Questie.db.profile.arrowLocked then self:StartMoving() end
end)
wayframe:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

local titleframe = CreateFrame("Frame", nil, wayframe)
wayframe.title  = titleframe:CreateFontString("OVERLAY", nil, "GameFontNormalSmall")
wayframe.status = titleframe:CreateFontString("OVERLAY", nil, "GameFontNormalSmall")
wayframe.title:SetPoint("TOP", wayframe, "BOTTOM", 0, 0)
wayframe.status:SetPoint("TOP", wayframe.title, "BOTTOM", 0, 0)

local defaultFontName, defaultFontSize, defaultFontFlags = wayframe.title:GetFont()
do
    local r, g, b, a = wayframe.status:GetTextColor()
    wayframe.status:SetTextColor(r - 0.2, g - 0.2, b - 0.2, a)
end

wayframe.arrow = wayframe:CreateTexture("OVERLAY")
wayframe.arrow:SetTexture(ADDON_PATH .. "arrow_image")
wayframe.arrow:SetAllPoints()

local arrow  = wayframe.arrow
local status = wayframe.status

-- ======================= State =======================

local active_point   = {}   -- {wx, wy, inst} cached world coords of current target
local showDownArrow  = false
local scanThrottle   = 0

-- ======================= Scale =======================

local function SetArrowScale(scale)
    scale = scale or (Questie.db and Questie.db.profile.arrowScale) or 1.0
    if not showDownArrow then
        wayframe:SetHeight(42 * scale)
        wayframe:SetWidth(56 * scale)
    else
        local s = scale * 0.8
        wayframe:SetHeight(70 * s)
        wayframe:SetWidth(53 * s)
    end
end

local function SetTextScale(scale)
    scale = scale or (Questie.db and Questie.db.profile.arrowTextScale) or 1.0
    wayframe.title:SetFont(defaultFontName, defaultFontSize * scale, defaultFontFlags)
    wayframe.status:SetFont(defaultFontName, defaultFontSize * scale, defaultFontFlags)
end

-- ======================= Target scan =======================
-- Runs every SCAN_INTERVAL seconds. Finds the nearest incomplete quest objective
-- across all active quests, caches its world coordinates in active_point.

local function FindNearestObjective()
    local playerWX, playerWY, playerInst = HBD:GetPlayerWorldPosition()
    if not playerWX then
        active_point.wx = nil
        return
    end

    local bestDist = math.huge
    local bestWX, bestWY, bestTitle

    for questId in pairs(QuestiePlayer.currentQuestlog) do
        local quest = QuestieDB.GetQuest(questId)
        if quest then
            local spawn, zone, name = QuestieMap:GetNearestQuestSpawn(quest)
            if spawn and zone then
                local uiMapId = ZoneDB:GetUiMapIdByAreaId(zone)
                if uiMapId then
                    local wx, wy, inst = HBD:GetWorldCoordinatesFromZone(spawn[1] / 100.0, spawn[2] / 100.0, uiMapId)
                    if wx and inst == playerInst then
                        local dist = HBD:GetWorldDistance(playerInst, playerWX, playerWY, wx, wy)
                        if dist and dist < bestDist then
                            bestDist = dist
                            bestWX, bestWY = wx, wy
                            bestTitle = name or ""
                        end
                    end
                end
            end
        end
    end

    if bestWX then
        active_point.wx    = bestWX
        active_point.wy    = bestWY
        active_point.inst  = playerInst
        wayframe.title:SetText(bestTitle)
    else
        active_point.wx = nil
    end
end

-- ======================= OnUpdate =======================

local OnUpdate = function(self, elapsed)
    if not (Questie.db and Questie.db.profile.arrow) then
        wayframe:Hide()
        return
    end

    scanThrottle = scanThrottle + (elapsed or 0)
    if scanThrottle >= SCAN_INTERVAL then
        scanThrottle = 0
        FindNearestObjective()
    end

    if not active_point.wx then
        wayframe:Hide()
        return
    end

    local playerWX, playerWY, playerInst = HBD:GetPlayerWorldPosition()
    if not playerWX or playerInst ~= active_point.inst then
        wayframe:Hide()
        return
    end

    wayframe:Show()

    local dist, dx, dy = HBD:GetWorldDistance(playerInst, playerWX, playerWY, active_point.wx, active_point.wy)

    if dist then
        status:SetText(string.format("%d yd", math.floor(0.5 + dist)))
    else
        status:SetText("")
    end

    -- Arrival animation (within 10 yards)
    if dist and dist <= 10 then
        if not showDownArrow then
            showDownArrow = true
            SetArrowScale()
            arrow:SetTexture(ADDON_PATH .. "arrow_image_down")
            arrow:SetVertexColor(0, 1, 0)
        end
        local cell   = math.floor(mod(GetTime() * 20, 55))
        local column = cell % 9
        local row    = floor(cell / 9)
        arrow:SetTexCoord(
            (column * 53) / 512, ((column + 1) * 53) / 512,
            (row * 70) / 512,    ((row + 1) * 70) / 512)
    else
        if showDownArrow then
            showDownArrow = false
            SetArrowScale()
            arrow:SetTexture(ADDON_PATH .. "arrow_image")
        end

        if dx and dy then
            -- WoW's atan2 returns degrees; convert to radians then subtract player facing.
            local angle = atan2(dx, dy) / 360 * (math.pi * 2)
            angle = angle - GetPlayerFacing()

            local perc = math.abs((math.pi - math.abs(angle)) / math.pi)
            if perc > 1 then perc = 2 - perc end

            local r, g, b = ColorGradient(perc, 1, 0, 0, 1, 1, 0, 0, 1, 0)
            arrow:SetVertexColor(r, g, b)

            -- Select one of 108 frames from the sprite sheet (9 cols x 12 rows, 56x42 px each)
            local cell   = floor(angle / (math.pi * 2) * 108 + 0.5) % 108
            local column = cell % 9
            local row    = floor(cell / 9)
            arrow:SetTexCoord(
                (column * 56) / 512, ((column + 1) * 56) / 512,
                (row * 42) / 512,    ((row + 1) * 42) / 512)
        end
    end
end

-- ======================= Driver frame =======================
-- Separate frame so OnUpdate fires every frame regardless of wayframe visibility.

local driverFrame = CreateFrame("Frame")
driverFrame:SetScript("OnUpdate", OnUpdate)
driverFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
driverFrame:SetScript("OnEvent", function()
    scanThrottle = SCAN_INTERVAL  -- force immediate rescan on zone change
end)

-- ======================= Public API =======================

function QuestieArrow:Initialize()
    SetArrowScale()
    SetTextScale()
end
