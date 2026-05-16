--[[
GP_Lib :: modules/UI.lua
Custom config window and widget helpers.

Requires GP_Lib.lua (loaded first by the toc).

Provides:
    GP_Lib:CreateWindow   -- draggable config window
    GP_Lib:AddHeader      -- section heading
    GP_Lib:AddLabel       -- small text label
    GP_Lib:AddCheckbox    -- toggle checkbox
    GP_Lib:AddSlider      -- value slider
    GP_Lib:AddDropdown    -- option dropdown
    GP_Lib:AddEditBox     -- text / number input
    GP_Lib:SetTooltip     -- hover tooltip on any widget
--]]

local UniqueName = GP_Lib.UniqueName


-- Window ----------------------------------------------------------------------

-- Creates a draggable config window. Toggle with win:Show() / win:Hide().
-- Widgets placed inside participate in the Save / refresh lifecycle automatically.
function GP_Lib:CreateWindow(title, width, height)
    width  = width  or 500
    height = height or 400

    local f = CreateFrame("Frame", UniqueName("GP_Win"), UIParent)
    f:SetWidth(width)
    f:SetHeight(height)
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
    local titleFS = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    titleFS:SetPoint("TOP", f, "TOP", 0, -10)
    titleFS:SetText(title)

    -- Title divider
    local div1 = f:CreateTexture(nil, "ARTWORK")
    div1:SetTexture(0.4, 0.4, 0.4, 1)
    div1:SetHeight(1)
    div1:SetPoint("TOPLEFT",  f, "TOPLEFT",  14, -32)
    div1:SetPoint("TOPRIGHT", f, "TOPRIGHT", -14, -32)

    -- Drag handle (title bar area only, excludes close button)
    local drag = CreateFrame("Frame", nil, f)
    drag:SetPoint("TOPLEFT",  f, "TOPLEFT",  4,   -4)
    drag:SetPoint("TOPRIGHT", f, "TOPRIGHT", -26, -4)
    drag:SetHeight(28)
    drag:EnableMouse(true)
    drag:RegisterForDrag("LeftButton")
    drag:SetScript("OnDragStart", function() f:StartMoving() end)
    drag:SetScript("OnDragStop",  function() f:StopMovingOrSizing() end)

    -- Close button
    local closeBtn = CreateFrame("Button", UniqueName("GP_X"), f, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", 4, 4)
    closeBtn:SetScript("OnClick", function() f:Hide() end)

    -- Content sub-frame (widgets anchor here; x=0,y=0 is just below the title bar)
    local content = CreateFrame("Frame", nil, f)
    content:SetPoint("TOPLEFT",     f, "TOPLEFT",     12, -36)
    content:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -12, 44)
    f._content = content
    f._widgets = {}

    -- Button divider
    local div2 = f:CreateTexture(nil, "ARTWORK")
    div2:SetTexture(0.4, 0.4, 0.4, 1)
    div2:SetHeight(1)
    div2:SetPoint("BOTTOMLEFT",  f, "BOTTOMLEFT",  14, 42)
    div2:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -14, 42)

    -- Save button — commits all pending values then closes
    local saveBtn = CreateFrame("Button", UniqueName("GP_Save"), f, "UIPanelButtonTemplate")
    saveBtn:SetWidth(90)
    saveBtn:SetHeight(22)
    saveBtn:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -14, 11)
    saveBtn:SetText("Save")
    saveBtn:SetScript("OnClick", function()
        for _, w in ipairs(f._widgets) do
            if w.OnSave then w:OnSave() end
        end
        f:Hide()
    end)

    -- Cancel button — closes without saving (next open reloads from getters)
    local cancelBtn = CreateFrame("Button", UniqueName("GP_Cancel"), f, "UIPanelButtonTemplate")
    cancelBtn:SetWidth(90)
    cancelBtn:SetHeight(22)
    cancelBtn:SetPoint("RIGHT", saveBtn, "LEFT", -6, 0)
    cancelBtn:SetText("Cancel")
    cancelBtn:SetScript("OnClick", function() f:Hide() end)

    -- Reload widget values from getters every time the window is opened
    f:SetScript("OnShow", function(self)
        for _, w in ipairs(self._widgets) do
            if w.OnRefresh then w:OnRefresh() end
        end
    end)

    f:Hide()
    return f
end


-- Labels ----------------------------------------------------------------------

function GP_Lib:AddHeader(win, text, x, y)
    local a  = win._content
    local fs = a:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    fs:SetPoint("TOPLEFT", a, "TOPLEFT", x, -y)
    fs:SetText(text)
    return fs
end

function GP_Lib:AddLabel(win, text, x, y)
    local a  = win._content
    local fs = a:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    fs:SetPoint("TOPLEFT", a, "TOPLEFT", x, -y)
    fs:SetText(text)
    return fs
end


-- Checkbox --------------------------------------------------------------------

-- getter() -> bool   setter(bool)
function GP_Lib:AddCheckbox(win, label, x, y, getter, setter)
    local a  = win._content
    local cb = CreateFrame("CheckButton", UniqueName("GP_CB"), a,
                           "InterfaceOptionsCheckButtonTemplate")
    cb:SetPoint("TOPLEFT", a, "TOPLEFT", x, -y)
    _G[cb:GetName() .. "Text"]:SetText(label)

    local pending

    local function Refresh()
        pending = getter()
        cb:SetChecked(pending)
    end
    Refresh()

    cb:SetScript("OnClick", function(self)
        pending = self:GetChecked() and true or false
    end)

    cb.OnSave    = function() setter(pending) end
    cb.OnRefresh = function() Refresh() end

    table.insert(win._widgets, cb)
    return cb
end


-- Slider ----------------------------------------------------------------------

-- fmt    : format string for the title label, receives the current value
--          e.g. "Font Size: %d"
-- getter() -> number   setter(number)
function GP_Lib:AddSlider(win, fmt, x, y, min, max, step, getter, setter)
    local a    = win._content
    local name = UniqueName("GP_SL")

    local slider = CreateFrame("Slider", name, a, "OptionsSliderTemplate")
    slider:SetPoint("TOPLEFT", a, "TOPLEFT", x, -y)
    slider:SetWidth(200)
    slider:SetMinMaxValues(min, max)
    slider:SetValueStep(step)

    _G[name .. "Low"]:SetText(tostring(min))
    _G[name .. "High"]:SetText(tostring(max))

    local pending
    local suppress = false

    local function Refresh()
        pending = getter()
        suppress = true
        slider:SetValue(pending)
        suppress = false
        _G[name .. "Text"]:SetText(string.format(fmt, pending))
    end
    Refresh()

    slider:SetScript("OnValueChanged", function(self, value)
        if suppress then return end
        pending = value
        _G[name .. "Text"]:SetText(string.format(fmt, value))
    end)

    slider.OnSave    = function() setter(pending) end
    slider.OnRefresh = function() Refresh() end

    table.insert(win._widgets, slider)
    return slider
end


-- Dropdown --------------------------------------------------------------------

-- options : ordered array of strings shown in the menu
-- getter() -> string   setter(string)
function GP_Lib:AddDropdown(win, label, x, y, options, getter, setter)
    local a = win._content

    if label then
        local fs = a:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        fs:SetPoint("TOPLEFT", a, "TOPLEFT", x, -y)
        fs:SetText(label)
    end

    local name = UniqueName("GP_DD")
    local dd   = CreateFrame("Frame", name, a, "UIDropDownMenuTemplate")
    -- UIDropDownMenuTemplate has ~16 px of internal left padding
    dd:SetPoint("TOPLEFT", a, "TOPLEFT", x - 16, -(y + 18))
    UIDropDownMenu_SetWidth(dd, 150)

    local pending

    local function UpdateText()
        UIDropDownMenu_SetText(dd, pending)
    end

    UIDropDownMenu_Initialize(dd, function()
        for _, opt in ipairs(options) do
            local info   = UIDropDownMenu_CreateInfo()
            info.text    = opt
            info.value   = opt
            info.checked = (pending == opt)
            info.func    = function(btn)
                pending = btn.value
                UpdateText()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)

    local function Refresh()
        pending = getter()
        UpdateText()
    end
    Refresh()

    local widget = {}
    widget.OnSave    = function() setter(pending) end
    widget.OnRefresh = function() Refresh() end

    table.insert(win._widgets, widget)
    return dd
end


-- EditBox ---------------------------------------------------------------------

-- label  : string shown above the box, or nil for no label
-- getter() -> string   setter(string)
function GP_Lib:AddEditBox(win, label, x, y, width, getter, setter)
    local a    = win._content
    local boxY = y

    if label then
        local fs = a:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        fs:SetPoint("TOPLEFT", a, "TOPLEFT", x, -y)
        fs:SetText(label)
        boxY = y + 18
    end

    local eb = CreateFrame("EditBox", UniqueName("GP_EB"), a)
    eb:SetPoint("TOPLEFT", a, "TOPLEFT", x, -boxY)
    eb:SetWidth(width or 200)
    eb:SetHeight(20)
    eb:SetAutoFocus(false)
    eb:SetFont("Fonts\\FRIZQT__.TTF", 11, "")
    eb:SetTextColor(1, 1, 1, 1)
    eb:SetBackdrop({
        bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile     = true,
        tileSize = 8,
        edgeSize = 8,
        insets   = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    eb:SetBackdropColor(0.05, 0.05, 0.05, 1)
    eb:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)

    local pending
    local suppress = false

    local function Refresh()
        pending = tostring(getter())
        suppress = true
        eb:SetText(pending)
        suppress = false
    end

    eb:SetScript("OnTextChanged", function(self)
        if suppress then return end
        pending = self:GetText()
    end)

    eb:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
        Refresh()
    end)

    eb:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)

    eb.OnSave    = function() setter(pending) end
    eb.OnRefresh = function() Refresh() end

    Refresh()

    table.insert(win._widgets, eb)
    return eb
end


-- Tooltip ---------------------------------------------------------------------

-- Attaches a GameTooltip to any widget frame returned by the Add* functions.
-- For dropdowns the inner button is also covered since it intercepts mouse events.
function GP_Lib:SetTooltip(widget, text)
    local function Attach(f)
        f:EnableMouse(true)
        f:SetScript("OnEnter", function(frame)
            GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
            GameTooltip:SetText(text, 1, 1, 1, 1, true)
            GameTooltip:Show()
        end)
        f:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end

    Attach(widget)

    if widget.GetName and widget:GetName() then
        local btn = _G[widget:GetName() .. "Button"]
        if btn then Attach(btn) end
    end
end
