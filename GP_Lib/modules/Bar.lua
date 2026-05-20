--[[
GP_Lib :: modules/Bar.lua
Horizontal progress-bar widget.

Provides:
    GP_Lib:CreateBar
--]]


--- Creates a styled horizontal progress bar.
---
--- The bar has a darkened backdrop, a thin border, and a single fill texture
--- that grows inward from one edge.  All standard Frame methods work normally;
--- the extra methods below are added to the returned frame.
---
--- Parameters:
---   parent  — parent frame (e.g. UIParent)
---   width   — initial width in pixels
---   height  — initial height in pixels
---
--- Returns the bar frame.  Extra methods on the returned frame:
---   :SetValue(v)              — fill fraction; v is clamped to [0, 1]
---   :SetColor(r, g, b [,a])  — fill colour; a defaults to 1
---   :SetFillDirection(dir)   — "LEFT" (default) grows rightward; "RIGHT" grows leftward
---   :SetBorderColor(r,g,b[,a]) — border colour; a defaults to 1
function GP_Lib:CreateBar(parent, width, height)
    local INSET = 2

    local frame = CreateFrame("Frame", GP_Lib.UniqueName("GP_Bar"), parent)
    frame:SetWidth(width)
    frame:SetHeight(height)
    frame:SetBackdrop({
        bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile     = true,
        tileSize = 8,
        edgeSize = 8,
        insets   = { left = INSET, right = INSET, top = INSET, bottom = INSET },
    })
    frame:SetBackdropColor(0, 0, 0, 0.8)
    frame:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)

    local fill = frame:CreateTexture(nil, "ARTWORK")
    fill:SetTexture(1, 1, 1, 1)
    fill:Hide()

    local value = 0
    local dir   = "LEFT"

    local function Redraw()
        local w = (frame:GetWidth() - INSET * 2) * value
        if w < 0.5 then fill:Hide(); return end
        fill:Show()
        fill:SetWidth(w)
        fill:ClearAllPoints()
        if dir == "RIGHT" then
            fill:SetPoint("TOPRIGHT",    frame, "TOPRIGHT",    -INSET, -INSET)
            fill:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -INSET,  INSET)
        else
            fill:SetPoint("TOPLEFT",    frame, "TOPLEFT",    INSET, -INSET)
            fill:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", INSET,  INSET)
        end
    end

    --- Sets the fill fraction (0 = empty, 1 = full). Clamped to [0, 1].
    function frame:SetValue(v)
        value = v < 0 and 0 or v > 1 and 1 or v
        Redraw()
    end

    --- Sets the fill colour. Alpha defaults to 1.
    function frame:SetColor(r, g, b, a)
        fill:SetVertexColor(r, g, b, a or 1)
    end

    --- Sets the fill direction: "LEFT" (grows rightward) or "RIGHT" (grows leftward).
    function frame:SetFillDirection(direction)
        dir = direction == "RIGHT" and "RIGHT" or "LEFT"
        Redraw()
    end

    --- Sets the border colour. Alpha defaults to 1.
    function frame:SetBorderColor(r, g, b, a)
        frame:SetBackdropBorderColor(r, g, b, a or 1)
    end

    return frame
end
