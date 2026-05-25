--[[
LuaBugViewer :: modules/Viewer.lua
The error viewer window. Lazy-built on first :Show().

Layout:
  +------------------------------------------------------+
  |  LuaBugViewer  [X]                                   |
  +--------------------+---------------------------------+
  |  ScrollList of     |  Header: first line + count     |
  |  captured errors   |  --- Stack Trace ---            |
  |                    |  (CopyableText)                 |
  |                    |  --- Locals ---                 |
  |                    |  (CopyableText)                 |
  +--------------------+---------------------------------+
  |                          [Clear]  [Copy All]         |
  +------------------------------------------------------+
--]]

local LBV = LuaBugViewer

local M = {}
LBV.modules.Viewer = M


local FRAME_WIDTH  = 760
local FRAME_HEIGHT = 480
local LIST_WIDTH   = 260


local function FormatRowLabel(entry)
    local firstLine = string.match(entry.message, "^([^\n]*)") or entry.message
    local ts = date("%H:%M:%S", entry.time)
    local mult = entry.count > 1 and string.format(" |cffff8888x%d|r", entry.count) or ""
    -- Keep the row short; the full message lives in the detail pane.
    if string.len(firstLine) > 60 then
        firstLine = string.sub(firstLine, 1, 57) .. "..."
    end
    return string.format("|cff888888[%s]|r%s  %s", ts, mult, firstLine)
end


local function BuildFrame(self)
    local f = CreateFrame("Frame", "LuaBugViewerFrame", UIParent)
    f:SetWidth(FRAME_WIDTH)
    f:SetHeight(FRAME_HEIGHT)
    f:SetPoint("CENTER")
    f:SetFrameStrata("DIALOG")
    f:SetMovable(true)
    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile     = true,
        tileSize = 32,
        edgeSize = 32,
        insets   = { left = 11, right = 12, top = 12, bottom = 11 },
    })

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", f, "TOP", 0, -12)
    title:SetText("LuaBugViewer")

    -- Drag handle (title bar)
    local drag = CreateFrame("Frame", nil, f)
    drag:SetPoint("TOPLEFT",  f, "TOPLEFT",  4,   -4)
    drag:SetPoint("TOPRIGHT", f, "TOPRIGHT", -26, -4)
    drag:SetHeight(28)
    drag:EnableMouse(true)
    drag:RegisterForDrag("LeftButton")
    drag:SetScript("OnDragStart", function() f:StartMoving() end)
    drag:SetScript("OnDragStop",  function() f:StopMovingOrSizing() end)

    -- Close
    local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", 4, 4)
    closeBtn:SetScript("OnClick", function() f:Hide() end)

    -- Top divider
    local div1 = f:CreateTexture(nil, "ARTWORK")
    div1:SetTexture(0.4, 0.4, 0.4, 1)
    div1:SetHeight(1)
    div1:SetPoint("TOPLEFT",  f, "TOPLEFT",  14, -34)
    div1:SetPoint("TOPRIGHT", f, "TOPRIGHT", -14, -34)

    -- Bottom divider (above buttons)
    local div2 = f:CreateTexture(nil, "ARTWORK")
    div2:SetTexture(0.4, 0.4, 0.4, 1)
    div2:SetHeight(1)
    div2:SetPoint("BOTTOMLEFT",  f, "BOTTOMLEFT",  14, 42)
    div2:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -14, 42)

    -- Vertical divider between list and detail panes
    local div3 = f:CreateTexture(nil, "ARTWORK")
    div3:SetTexture(0.4, 0.4, 0.4, 1)
    div3:SetWidth(1)
    div3:SetPoint("TOPLEFT",    f, "TOPLEFT",    14 + LIST_WIDTH + 6, -38)
    div3:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 14 + LIST_WIDTH + 6,  44)

    -- Left: scroll list of errors
    local list = GP_Lib:CreateScrollList(f, {
        width          = LIST_WIDTH,
        height         = FRAME_HEIGHT - 90,
        rowHeight      = 18,
        buildRow = function(row)
            local fs = row:CreateFontString(nil, "ARTWORK", "GameFontNormal")
            fs:SetPoint("LEFT",  row, "LEFT",  4, 0)
            fs:SetPoint("RIGHT", row, "RIGHT", -4, 0)
            fs:SetJustifyH("LEFT")
            row._label = fs
        end,
        updateRow = function(row, dataIndex, entry)
            row._label:SetText(FormatRowLabel(entry))
        end,
        onRowClick = function(dataIndex, entry)
            M:ShowError(entry)
        end,
    })
    list:SetPoint("TOPLEFT", f, "TOPLEFT", 14, -38)
    self._list = list

    -- Right: detail pane container
    local rightX  = 14 + LIST_WIDTH + 14
    local rightW  = FRAME_WIDTH - rightX - 14

    local headerFS = f:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    headerFS:SetPoint("TOPLEFT", f, "TOPLEFT", rightX, -42)
    headerFS:SetWidth(rightW)
    headerFS:SetJustifyH("LEFT")
    headerFS:SetText("Select an error from the list.")
    self._header = headerFS

    local stackLabel = f:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    stackLabel:SetPoint("TOPLEFT", f, "TOPLEFT", rightX, -80)
    stackLabel:SetText("|cffaaaaaaStack trace|r")

    local stackBox = GP_Lib:CreateCopyableText(f, {
        width  = rightW,
        height = 200,
    })
    stackBox:SetPoint("TOPLEFT", f, "TOPLEFT", rightX, -94)
    self._stackBox = stackBox

    local localsLabel = f:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    localsLabel:SetPoint("TOPLEFT", f, "TOPLEFT", rightX, -304)
    localsLabel:SetText("|cffaaaaaaLocals|r")

    local localsBox = GP_Lib:CreateCopyableText(f, {
        width  = rightW,
        height = 120,
    })
    localsBox:SetPoint("TOPLEFT", f, "TOPLEFT", rightX, -318)
    self._localsBox = localsBox

    -- Buttons
    local clearBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    clearBtn:SetWidth(90); clearBtn:SetHeight(22)
    clearBtn:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 14, 12)
    clearBtn:SetText("Clear")
    clearBtn:SetScript("OnClick", function()
        LBV.modules.SessionLog:Clear()
        M:Refresh()
        M:ShowError(nil)
    end)

    local copyBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    copyBtn:SetWidth(110); copyBtn:SetHeight(22)
    copyBtn:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -14, 12)
    copyBtn:SetText("Select All")
    copyBtn:SetScript("OnClick", function()
        if self._stackBox then self._stackBox:HighlightText() end
    end)

    f:Hide()
    self._frame = f
end


function M:Init()
    -- Frame is built lazily on first Show.
    LBV:On("OnNewError",       function() if self._frame and self._frame:IsShown() then self:Refresh() end end)
    LBV:On("OnDuplicateError", function() if self._frame and self._frame:IsShown() then self:Refresh() end end)
    LBV:On("OnLogCleared",     function() if self._frame and self._frame:IsShown() then self:Refresh() end end)
end


function M:Show()
    if not self._frame then BuildFrame(self) end
    self._frame:Show()
    self:Refresh()
end


function M:Hide()
    if self._frame then self._frame:Hide() end
end


function M:Toggle()
    if self._frame and self._frame:IsShown() then
        self:Hide()
    else
        self:Show()
    end
end


function M:IsShown()
    return self._frame and self._frame:IsShown()
end


function M:Refresh()
    if not self._frame then return end
    local errors = LBV.modules.SessionLog:GetAll()
    self._list:SetData(errors)
end


function M:ShowError(entry)
    if not self._frame then return end
    if not entry then
        self._header:SetText("Select an error from the list.")
        self._stackBox:SetText("")
        self._localsBox:SetText("")
        return
    end
    local headerText = string.format("|cffffd200%s|r\n%s",
        date("%Y-%m-%d %H:%M:%S", entry.time),
        entry.message)
    self._header:SetText(headerText)
    self._stackBox:SetText(entry.stack or "")
    self._localsBox:SetText(entry.locals or "")
end
