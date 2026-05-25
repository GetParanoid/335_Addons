--[[
GP_Lib :: modules/ScrollList.lua
Virtualised scrollable list widget with row recycling.

Requires GP_Lib.lua (loaded first by the toc).

Provides:
    GP_Lib:CreateScrollList(parent, opts) -> list

opts:
    width, height        -- frame size in pixels
    rowHeight            -- pixel height per row (default 18)
    numVisibleRows       -- how many rows to instantiate (default ceil(height/rowHeight))
    buildRow(rowFrame)   -- one-time widget setup; attach widgets to rowFrame
    updateRow(rowFrame, dataIndex, dataEntry)
                         -- bind data to widgets each time a row is reused
    onRowClick(dataIndex, dataEntry, rowFrame)
                         -- optional click handler

Methods on the returned list:
    list:SetData(tbl)          -- replace data and refresh
    list:Refresh()             -- repaint rows from current scroll offset
    list:GetSelectedIndex()    -- last clicked dataIndex, or nil
    list:SetSelectedIndex(i)   -- highlight a row manually
--]]

local UniqueName = GP_Lib.UniqueName


function GP_Lib:CreateScrollList(parent, opts)
    opts             = opts or {}
    local width      = opts.width or 240
    local height     = opts.height or 300
    local rowHeight  = opts.rowHeight or 18
    local visibleN   = opts.numVisibleRows or math.floor(height / rowHeight)
    local buildRow   = opts.buildRow
    local updateRow  = opts.updateRow
    local onRowClick = opts.onRowClick

    local list = CreateFrame("Frame", UniqueName("GP_SList"), parent)
    list:SetWidth(width)
    list:SetHeight(height)

    list._data           = {}
    list._offset         = 0
    list._selectedIndex  = nil
    list._rows           = {}
    list._rowHeight      = rowHeight
    list._visibleN       = visibleN

    -- Slider on the right edge
    local sliderWidth = 16
    local sliderName  = UniqueName("GP_SListSlider")
    local slider = CreateFrame("Slider", sliderName, list, "OptionsSliderTemplate")
    slider:SetWidth(sliderWidth)
    slider:SetHeight(height - 28)
    slider:SetPoint("TOPRIGHT", list, "TOPRIGHT", 0, -8)
    slider:SetOrientation("VERTICAL")
    slider:SetMinMaxValues(0, 0)
    slider:SetValueStep(1)
    slider:SetValue(0)
    -- Hide the default low/high/value labels — they clutter a list widget
    if _G[sliderName .. "Low"]  then _G[sliderName .. "Low"]:SetText("")  end
    if _G[sliderName .. "High"] then _G[sliderName .. "High"]:SetText("") end
    if _G[sliderName .. "Text"] then _G[sliderName .. "Text"]:SetText("") end
    list._slider = slider

    -- Row container (everything left of the slider)
    local rowArea = CreateFrame("Frame", nil, list)
    rowArea:SetPoint("TOPLEFT",     list, "TOPLEFT",     0, 0)
    rowArea:SetPoint("BOTTOMRIGHT", list, "BOTTOMRIGHT", -(sliderWidth + 4), 0)
    rowArea:EnableMouseWheel(true)
    list._rowArea = rowArea

    -- Build the visible row pool
    for i = 1, visibleN do
        local row = CreateFrame("Button", UniqueName("GP_SListRow"), rowArea)
        row:SetHeight(rowHeight)
        row:SetPoint("TOPLEFT",  rowArea, "TOPLEFT",  0, -(i - 1) * rowHeight)
        row:SetPoint("TOPRIGHT", rowArea, "TOPRIGHT", 0, -(i - 1) * rowHeight)

        -- Selection highlight
        local hl = row:CreateTexture(nil, "BACKGROUND")
        hl:SetAllPoints(row)
        hl:SetTexture(0.25, 0.5, 0.9, 0.4)
        hl:Hide()
        row._highlight = hl

        -- Hover highlight
        row:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

        row._index = nil
        row:SetScript("OnClick", function(self)
            if not self._index then return end
            list._selectedIndex = self._index
            list:Refresh()
            if onRowClick then
                onRowClick(self._index, list._data[self._index], self)
            end
        end)

        if buildRow then buildRow(row) end
        list._rows[i] = row
    end

    local function ClampOffset()
        local maxOffset = math.max(0, #list._data - visibleN)
        if list._offset < 0         then list._offset = 0         end
        if list._offset > maxOffset then list._offset = maxOffset end
        slider:SetMinMaxValues(0, maxOffset)
    end

    function list:Refresh()
        ClampOffset()
        for i = 1, visibleN do
            local row       = self._rows[i]
            local dataIndex = self._offset + i
            local entry     = self._data[dataIndex]
            if entry then
                row._index = dataIndex
                row:Show()
                if self._selectedIndex == dataIndex then
                    row._highlight:Show()
                else
                    row._highlight:Hide()
                end
                if updateRow then updateRow(row, dataIndex, entry) end
            else
                row._index = nil
                row:Hide()
            end
        end
    end

    function list:SetData(tbl)
        self._data = tbl or {}
        if self._selectedIndex and self._selectedIndex > #self._data then
            self._selectedIndex = nil
        end
        self:Refresh()
    end

    function list:GetSelectedIndex() return self._selectedIndex end

    function list:SetSelectedIndex(i)
        self._selectedIndex = i
        self:Refresh()
    end

    -- Slider drives offset
    local suppress = false
    slider:SetScript("OnValueChanged", function(self, value)
        if suppress then return end
        list._offset = math.floor(value + 0.5)
        list:Refresh()
    end)

    -- Mouse wheel scrolls the row area
    rowArea:SetScript("OnMouseWheel", function(self, delta)
        list._offset = list._offset - delta
        suppress = true
        ClampOffset()
        slider:SetValue(list._offset)
        suppress = false
        list:Refresh()
    end)

    list:Refresh()
    return list
end
