--[[
WhatCanICraft - lists recipes you can craft from items in your bags (and bank,
when the bank is open) using the currently open Tradeskill UI.

GitHub: https://github.com/GetParanoid/335_Addons

Slash: /wcic   - toggles the results window manually
--]]


-- CONSTANTS -------------------------------------------------------------------

local MAX_ROWS   = 22
local ROW_HEIGHT = 20

-- Every tradeskill that opens a TradeSkill window in 3.3.5. Used to pre-populate
-- the settings list so a profession can be disabled before it's ever opened.
-- Names match GetTradeSkillLine() on an enUS client; any other names the client
-- actually reports are merged in at runtime from WhatCanICraftDB.seenProfessions.
local PROFESSIONS = {
    "Alchemy", "Blacksmithing", "Cooking", "Enchanting", "Engineering",
    "First Aid", "Inscription", "Jewelcrafting", "Leatherworking",
    "Mining", "Tailoring",
}


-- DEFAULTS --------------------------------------------------------------------

local DEFAULTS = {
    hidden              = {},  -- [recipeName] = true   recipes to omit from the list
    disabledProfessions = {},  -- [profName]   = true   professions to not auto-show for
    seenProfessions     = {},  -- [profName]   = true   professions opened (fills config)
}


-- STATE -----------------------------------------------------------------------

local tradeOpen          = false
local bankOpen           = false
local scanning           = false  -- guard against re-entrant Scan via cascading events
local filtersInitialized = false  -- one-shot ClearFilters per tradeskill-window open
local resultFrame
local currentResults     = {}


-- RECIPE SCAN -----------------------------------------------------------------

-- Clear tradeskill filters and expand all headers so every recipe is
-- visible. Called once per tradeskill-window open; we never touch filters
-- again after that, so the default UI's selection state stays put.
local function ClearFilters()
    SetTradeSkillItemNameFilter("")
    SetTradeSkillItemLevelFilter(0, 0)              -- 0,0 = no level filter on 3.3.5
    SetTradeSkillSubClassFilter(0, 1, 1)            -- enable "All" exclusively
    SetTradeSkillInvSlotFilter(0, 1, 1)

    -- Expand any collapsed headers (iterate backwards: indices shift on expand).
    local i = GetNumTradeSkills()
    while i > 0 do
        local _, skillType, _, isExpanded = GetTradeSkillInfo(i)
        if skillType == "header" and not isExpanded then
            ExpandTradeSkillSubClass(i)
        end
        i = i - 1
    end
end

local function ComputeCraftable(have)
    local results = {}
    local n = GetNumTradeSkills()
    for i = 1, n do
        local name, skillType = GetTradeSkillInfo(i)
        if name and skillType and skillType ~= "header"
           and not WhatCanICraftDB.hidden[name] then
            local numReagents = GetTradeSkillNumReagents(i)
            local maxCraftable
            local reagentIDs = {}
            for r = 1, numReagents do
                local _, _, needed = GetTradeSkillReagentInfo(i, r)
                local rid = GP_Lib:LinkToItemID(GetTradeSkillReagentItemLink(i, r))
                if rid then reagentIDs[#reagentIDs + 1] = rid end
                local haveCount = (rid and have[rid]) or 0
                local possible = (needed and needed > 0) and math.floor(haveCount / needed) or 0
                if not maxCraftable or possible < maxCraftable then
                    maxCraftable = possible
                end
            end
            if maxCraftable and maxCraftable > 0 then
                results[#results + 1] = {
                    name     = name,
                    count    = maxCraftable,
                    index    = i,
                    reagents = reagentIDs,
                }
            end
        end
    end
    table.sort(results, function(a, b)
        if a.count ~= b.count then return a.count > b.count end
        return a.name < b.name
    end)
    return results
end


-- UI --------------------------------------------------------------------------

-- Forward declarations (defined later, referenced by UI callbacks below).
local Render      -- referenced inside CreateResultFrame's scroll handler
local Scan        -- referenced by the per-row hide button and config window
local Hide        -- referenced by the config window
local ShowConfig  -- the settings window, defined after the driver

-- Hide a recipe from the list and re-scan so it disappears immediately.
local function HideRecipe(recipeName)
    if not recipeName then return end
    WhatCanICraftDB.hidden[recipeName] = true
    DEFAULT_CHAT_FRAME:AddMessage(string.format(
        "|cFF11A6ECWhatCanICraft|r: hid %s |cFF808080(unhide via /wcic settings)|r", recipeName))
    Scan()
end

local function ClickRow(recipeName)
    if not tradeOpen or not recipeName then return end
    local n = GetNumTradeSkills()
    for i = 1, n do
        local name, skillType = GetTradeSkillInfo(i)
        if name == recipeName and skillType ~= "header" then
            -- SelectTradeSkill alone only sets the internal index; the
            -- default UI's detail pane is only refreshed when its own
            -- helper runs. Replicate what a click on a default recipe
            -- button does so the right-hand pane actually updates.
            if TradeSkillFrame_SetSelection then
                TradeSkillFrame_SetSelection(i)
            else
                SelectTradeSkill(i)
            end
            if TradeSkillFrame_Update then
                TradeSkillFrame_Update()
            end
            return
        end
    end
end

local function PullReagents(recipeName, reagentIDs)
    if not bankOpen then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF11A6ECWhatCanICraft|r: open the bank to pull reagents.")
        return
    end
    if not reagentIDs or #reagentIDs == 0 then return end

    local wanted = {}
    for _, id in ipairs(reagentIDs) do wanted[id] = true end

    local moved = 0
    for _, bag in ipairs(GP_Lib.BANK_IDS) do
        local slots = GetContainerNumSlots(bag)
        if slots then
            for slot = 1, slots do
                local id = GetContainerItemID(bag, slot)
                if id and wanted[id] then
                    UseContainerItem(bag, slot)
                    moved = moved + 1
                end
            end
        end
    end

    if moved > 0 then
        DEFAULT_CHAT_FRAME:AddMessage(string.format(
            "|cFF11A6ECWhatCanICraft|r: pulled %d reagent stack(s) for %s.", moved, recipeName or "?"))
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFF11A6ECWhatCanICraft|r: no matching reagents in bank.")
    end
end

local function CreateResultFrame()
    local f = CreateFrame("Frame", "WhatCanICraft_Frame", UIParent)
    f:SetWidth(300)
    f:SetHeight(44 + MAX_ROWS * ROW_HEIGHT + 14)
    f:SetFrameStrata("HIGH")
    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 },
    })
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetClampedToScreen(true)
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, relPoint, x, y = self:GetPoint(1)
        WhatCanICraftDB.point = { point, "UIParent", relPoint, x, y }
    end)

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", 0, -14)
    title:SetText("What Can I Craft")
    f.title = title

    local subtitle = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOP", title, "BOTTOM", 0, -2)
    subtitle:SetTextColor(0.7, 0.7, 0.7)
    f.subtitle = subtitle

    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -4, -4)

    local scroll = CreateFrame("ScrollFrame", "WhatCanICraft_Scroll", f, "FauxScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 22, -44)
    scroll:SetPoint("BOTTOMRIGHT", -38, 14)
    scroll:SetScript("OnVerticalScroll", function(self, offset)
        FauxScrollFrame_OnVerticalScroll(self, offset, ROW_HEIGHT, function()
            Render(currentResults)
        end)
    end)
    f.scroll = scroll

    f.rows = {}
    for i = 1, MAX_ROWS do
        local row = CreateFrame("Button", nil, f)
        row:SetHeight(ROW_HEIGHT)
        row:SetPoint("TOPLEFT", scroll, "TOPLEFT", 0, -((i - 1) * ROW_HEIGHT))
        row:SetPoint("RIGHT", scroll, "RIGHT", 0, 0)
        row:RegisterForClicks("LeftButtonUp", "RightButtonUp")

        local hl = row:CreateTexture(nil, "HIGHLIGHT")
        hl:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
        hl:SetBlendMode("ADD")
        hl:SetAllPoints(row)

        local text = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        text:SetPoint("TOPLEFT", row, "TOPLEFT", 0, 0)
        text:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -16, 0)  -- reserve room for the "x"
        text:SetJustifyH("LEFT")
        text:SetJustifyV("MIDDLE")
        row.text = text

        -- Per-row hide button: a small "x" shown only while the row is hovered.
        local hide = CreateFrame("Button", nil, row)
        hide:SetWidth(16)
        hide:SetHeight(16)
        hide:SetPoint("RIGHT", row, "RIGHT", 0, 0)
        hide:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
        hide:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
        hide:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
        hide:Hide()
        hide:SetScript("OnClick", function(self)
            HideRecipe(self:GetParent().recipeName)
        end)
        -- Keep the "x" visible while hovering either the row or the button itself.
        local function ShowHide() if row.recipeName then hide:Show() end end
        local function MaybeHide()
            if not (row:IsMouseOver() or hide:IsMouseOver()) then hide:Hide() end
        end
        row:HookScript("OnEnter", ShowHide)
        row:HookScript("OnLeave", MaybeHide)
        hide:SetScript("OnEnter", ShowHide)
        hide:SetScript("OnLeave", MaybeHide)
        row.hideBtn = hide

        row:SetScript("OnClick", function(self, button)
            if button == "RightButton" then
                PullReagents(self.recipeName, self.reagents)
            else
                ClickRow(self.recipeName)
            end
        end)

        f.rows[i] = row
    end

    return f
end

local function ApplyPosition(f)
    f:ClearAllPoints()
    local p = WhatCanICraftDB.point
    if p then
        f:SetPoint(p[1], p[2] or "UIParent", p[3], p[4], p[5])
    elseif TradeSkillFrame then
        f:SetPoint("TOPLEFT", TradeSkillFrame, "TOPRIGHT", -34, -12)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", 360, 0)
    end
end

Render = function(results, tradeName)
    if not resultFrame then
        resultFrame = CreateResultFrame()
        ApplyPosition(resultFrame)
    end

    currentResults = results or currentResults or {}

    if tradeName then
        if bankOpen then
            resultFrame.subtitle:SetText(tradeName .. "  (bags + bank)")
        else
            resultFrame.subtitle:SetText(tradeName .. "  (bags only)")
        end
    end

    local total  = #currentResults
    FauxScrollFrame_Update(resultFrame.scroll, total, MAX_ROWS, ROW_HEIGHT)
    local offset = FauxScrollFrame_GetOffset(resultFrame.scroll)

    for i = 1, MAX_ROWS do
        local row = resultFrame.rows[i]
        local r = currentResults[i + offset]
        if r then
            row.recipeName = r.name
            row.reagents   = r.reagents
            row.text:SetText(string.format("|cFFFFD100%dx|r  %s", r.count, r.name))
            row:Show()
        else
            row.recipeName = nil
            row.reagents   = nil
            row.text:SetText("")
            row:Hide()
        end
    end

    resultFrame:Show()
end


-- DRIVER ----------------------------------------------------------------------

Scan = function()
    if not tradeOpen or scanning then return end
    scanning = true

    if not filtersInitialized then
        ClearFilters()
        filtersInitialized = true
    end

    local have    = GP_Lib:ScanContainers({ bags = true, bank = bankOpen })
    local results = ComputeCraftable(have)
    local skill   = GetTradeSkillLine()

    scanning = false

    Render(results, skill)
end

Hide = function()
    if resultFrame then resultFrame:Hide() end
end


-- EVENTS ----------------------------------------------------------------------

local addon = CreateFrame("Frame")
addon:RegisterEvent("PLAYER_LOGIN")
addon:RegisterEvent("TRADE_SKILL_SHOW")
addon:RegisterEvent("TRADE_SKILL_CLOSE")
addon:RegisterEvent("BANKFRAME_OPENED")
addon:RegisterEvent("BANKFRAME_CLOSED")
addon:RegisterEvent("BAG_UPDATE")
addon:RegisterEvent("PLAYERBANKSLOTS_CHANGED")

addon:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        WhatCanICraftDB = WhatCanICraftDB or {}
        GP_Lib.ApplyDefaults(WhatCanICraftDB, DEFAULTS)

        if GP_Lib.LoadedAnnounce then
            GP_Lib.LoadedAnnounce:Register("WhatCanICraft", "/wcic")
        end

    elseif event == "TRADE_SKILL_SHOW" then
        tradeOpen = true
        local prof = GetTradeSkillLine()
        if prof and prof ~= "UNKNOWN" then
            WhatCanICraftDB.seenProfessions[prof] = true
        end
        if prof and WhatCanICraftDB.disabledProfessions[prof] then
            Hide()  -- auto-show suppressed for this profession (still toggleable via /wcic)
        else
            Scan()
        end

    elseif event == "TRADE_SKILL_CLOSE" then
        tradeOpen = false
        filtersInitialized = false
        Hide()

    elseif event == "BANKFRAME_OPENED" then
        bankOpen = true
        if tradeOpen then Scan() end

    elseif event == "BANKFRAME_CLOSED" then
        bankOpen = false
        if tradeOpen then Scan() end

    elseif event == "BAG_UPDATE" or event == "PLAYERBANKSLOTS_CHANGED" then
        if tradeOpen then Scan() end
    end
end)


-- CONFIG ----------------------------------------------------------------------

local configWin  -- built lazily on first /wcic config

-- Sorted array of { name = key } from a [key]=true set, optionally filtered.
local function SortedEntries(set)
    local out = {}
    for key in pairs(set) do out[#out + 1] = { name = key } end
    table.sort(out, function(a, b) return a.name < b.name end)
    return out
end

-- All known professions plus any the client actually reported, deduped + sorted.
-- Pre-seeding the full list lets a profession be disabled before it's ever opened.
local function ProfessionEntries()
    local seen = {}
    for _, name in ipairs(PROFESSIONS)             do seen[name] = true end
    for name   in pairs(WhatCanICraftDB.seenProfessions) do seen[name] = true end
    return SortedEntries(seen)
end

local function BuildConfigWindow()
    local win = GP_Lib:CreateWindow("WhatCanICraft Settings", 480, 440)

    GP_Lib:AddHeader(win, "Disabled Professions", 8, 4)
    GP_Lib:AddLabel(win, "Click to toggle auto-show", 8, 30)
    GP_Lib:AddHeader(win, "Hidden Recipes", 248, 4)
    GP_Lib:AddLabel(win, "Click to unhide", 248, 30)

    local function MakeRow(row)
        row.text = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        row.text:SetPoint("LEFT", row, "LEFT", 4, 0)
        row.text:SetPoint("RIGHT", row, "RIGHT", -4, 0)
        row.text:SetJustifyH("LEFT")
    end

    local profList = GP_Lib:CreateScrollList(win._content, {
        width = 210, height = 300, rowHeight = 18,
        buildRow  = MakeRow,
        updateRow = function(row, _, entry)
            if WhatCanICraftDB.disabledProfessions[entry.name] then
                row.text:SetText("|cFF808080" .. entry.name .. "  (hidden)|r")
            else
                row.text:SetText(entry.name)
            end
        end,
        onRowClick = function(_, entry)
            local p = entry.name
            WhatCanICraftDB.disabledProfessions[p] = not WhatCanICraftDB.disabledProfessions[p]
                                                     and true or nil
            win._profList:Refresh()
            -- Reflect the change live if this is the profession open right now.
            if tradeOpen and GetTradeSkillLine() == p then
                if WhatCanICraftDB.disabledProfessions[p] then Hide() else Scan() end
            end
        end,
    })
    profList:SetPoint("TOPLEFT", win._content, "TOPLEFT", 8, -52)
    win._profList = profList

    local hiddenList = GP_Lib:CreateScrollList(win._content, {
        width = 210, height = 300, rowHeight = 18,
        buildRow  = MakeRow,
        updateRow = function(row, _, entry) row.text:SetText(entry.name) end,
        onRowClick = function(_, entry)
            WhatCanICraftDB.hidden[entry.name] = nil
            win._hiddenList:SetData(SortedEntries(WhatCanICraftDB.hidden))
            if tradeOpen then Scan() end  -- it may reappear in the panel
        end,
    })
    hiddenList:SetPoint("TOPLEFT", win._content, "TOPLEFT", 248, -52)
    win._hiddenList = hiddenList

    -- Repopulate both lists from the DB every time the window opens.
    win:HookScript("OnShow", function(self)
        self._profList:SetData(ProfessionEntries())
        self._hiddenList:SetData(SortedEntries(WhatCanICraftDB.hidden))
    end)

    return win
end

ShowConfig = function()
    if not configWin then configWin = BuildConfigWindow() end
    if configWin:IsShown() then configWin:Hide() else configWin:Show() end
end


-- SLASH -----------------------------------------------------------------------

SLASH_WHATCANICRAFT1 = "/wcic"
SlashCmdList["WHATCANICRAFT"] = function(msg)
    local arg = (msg or ""):lower():match("^%s*(%S*)")
    if arg == "config" or arg == "options" or arg == "settings" then
        ShowConfig()
        return
    end

    if not tradeOpen then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF11A6ECWhatCanICraft|r: open a tradeskill window first.  Use |cFFFFD100/wcic settings|r for settings.")
        return
    end
    if resultFrame and resultFrame:IsShown() then
        resultFrame:Hide()
    else
        Scan()
    end
end
