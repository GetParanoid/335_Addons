# GP_Lib API Reference

All functions are methods on the global `GP_Lib` table.

---

## Window

### `GP_Lib:CreateWindow(title, width, height)`

Creates and returns a draggable, dialog-style config window. Hidden by default.

| Parameter | Type | Description |
|---|---|---|
| `title` | string | Text shown in the title bar |
| `width` | number | Window width in pixels (default 500) |
| `height` | number | Window height in pixels (default 400) |

**Returns:** `Frame` — the window frame.

Widgets are placed relative to the **content area**, which begins just below the title bar. `x=0, y=0` is the top-left corner of that area.

**Lifecycle:** When the window opens (`OnShow`), every widget reloads its value from its `getter`. When **Save** is clicked, every widget commits its pending value via its `setter`, then the window closes. **Cancel** / **×** closes without saving.

```lua
local win = GP_Lib:CreateWindow("My Addon Settings", 500, 400)
win:Show()    -- open
win:Hide()    -- close
win:IsShown() -- boolean
```

---

## Labels

### `GP_Lib:AddHeader(win, text, x, y)`

Large bold section heading. Not interactive; does not participate in Save / refresh.

### `GP_Lib:AddLabel(win, text, x, y)`

Small normal-weight label. Not interactive; does not participate in Save / refresh.

| Parameter | Type | Description |
|---|---|---|
| `win` | Frame | Window returned by `CreateWindow` |
| `text` | string | Label text |
| `x` | number | Pixels from the left of the content area |
| `y` | number | Pixels from the top of the content area |

**Returns:** `FontString`

---

## Widgets

All widgets register themselves with the window automatically. No manual wiring needed.

### `GP_Lib:AddCheckbox(win, label, x, y, getter, setter)`

| Parameter | Type | Description |
|---|---|---|
| `label` | string | Text shown to the right of the checkbox |
| `getter` | `function() -> bool` | Returns the current saved value |
| `setter` | `function(bool)` | Called with the new value on Save |

**Returns:** `CheckButton`

---

### `GP_Lib:AddSlider(win, fmt, x, y, min, max, step, getter, setter)`

Horizontal slider. The title label above it updates live as the user drags.

| Parameter | Type | Description |
|---|---|---|
| `fmt` | string | `string.format` pattern for the title, receives the current value — e.g. `"Font Size: %d"` |
| `min` | number | Minimum value |
| `max` | number | Maximum value |
| `step` | number | Snap increment |
| `getter` | `function() -> number` | Returns the current saved value |
| `setter` | `function(number)` | Called with the new value on Save |

**Returns:** `Slider`

---

### `GP_Lib:AddDropdown(win, label, x, y, options, getter, setter)`

| Parameter | Type | Description |
|---|---|---|
| `label` | string or `nil` | Text shown above the menu; pass `nil` for no label |
| `options` | `{string, ...}` | Ordered list of option strings |
| `getter` | `function() -> string` | Returns the currently selected option |
| `setter` | `function(string)` | Called with the selected option on Save |

**Returns:** `Frame` (the UIDropDownMenu frame)

---

### `GP_Lib:AddEditBox(win, label, x, y, width, getter, setter)`

Single-line text / number input. Press **Enter** to confirm, **Escape** to revert.

| Parameter | Type | Description |
|---|---|---|
| `label` | string or `nil` | Text shown above the box; pass `nil` for no label |
| `width` | number | Box width in pixels |
| `getter` | `function() -> string` | Returns the current saved value (converted to string automatically) |
| `setter` | `function(string)` | Called with the raw string on Save — validate / convert inside |

**Returns:** `EditBox`

---

## Tooltip

### `GP_Lib:SetTooltip(widget, text)`

Attaches a `GameTooltip` that appears when the player hovers over the widget.

| Parameter | Type | Description |
|---|---|---|
| `widget` | Frame | Any frame returned by an `AddXxx` function |
| `text` | string | Tooltip body text (auto-wrapped) |

Works on all widget types. For dropdowns, the inner button is also covered automatically so hovering anywhere over the control shows the tip.

```lua
local cb = GP_Lib:AddCheckbox(win, "Enable thing", 16, 16, getter, setter)
GP_Lib:SetTooltip(cb, "Enables the thing when checked.")
```

---

## Bar

### `GP_Lib:CreateBar(parent, width, height)`

Creates and returns a styled horizontal progress bar.

| Parameter | Type | Description |
|---|---|---|
| `parent` | Frame | Parent frame (e.g. `UIParent`) |
| `width` | number | Initial width in pixels |
| `height` | number | Initial height in pixels |

**Returns:** `Frame` — the bar frame, with the extra methods below added to it.

The bar has a dark backdrop and a thin border. All standard `Frame` methods (`SetPoint`, `SetAlpha`, `SetScale`, `Show`, `Hide`, `SetMovable`, etc.) work normally. Three extra methods are added:

#### `:SetValue(v)`

Sets the fill fraction. `v` is clamped to `[0, 1]`. `0` = empty, `1` = full.

#### `:SetColor(r, g, b [, a])`

Sets the fill colour. `a` defaults to `1`.

#### `:SetFillDirection(direction)`

Controls which edge the bar fills from.

| Value | Behaviour |
|---|---|
| `"LEFT"` (default) | Fill grows rightward from the left edge |
| `"RIGHT"` | Fill grows leftward from the right edge |

#### `:SetBorderColor(r, g, b [, a])`

Sets the border colour. `a` defaults to `1`.

```lua
local bar = GP_Lib:CreateBar(UIParent, 200, 12)
bar:SetPoint("CENTER", UIParent, "CENTER", 0, -200)
bar:SetColor(1, 0.8, 0)          -- golden fill
bar:SetFillDirection("LEFT")
bar:SetValue(0.6)                 -- 60 % full
bar:Show()

-- update every frame
bar:SetScript("OnUpdate", function(_, elapsed)
    -- frac = remaining / total
    bar:SetValue(frac)
end)
```

---

## Widget lifecycle summary

| Event | When | What happens |
|---|---|---|
| Window opens | `OnShow` | All widgets call their `getter` and display the current value |
| User edits | — | Each widget tracks a local `pending` value; the saved DB is untouched |
| Save clicked | `OnClick` | All widgets call their `setter` with the pending value, then the window hides |
| Cancel / × | `OnClick` | Window hides; pending values are discarded (reloaded from `getter` next open) |

---

## Table utilities

Defined in `GP_Lib.lua`. Used as plain functions (not methods).

### `GP_Lib.DeepCopy(t)`

Recursive deep copy of a table. Non-table values are returned unchanged. Does not handle metatables or cyclic references.

### `GP_Lib.ApplyDefaults(tbl, defaults)`

Fills missing entries in `tbl` from `defaults`. Nested tables are merged recursively; missing nested tables are deep-copied (so callers never share references with the defaults).

```lua
local DEFAULTS = { fontSize = 12, broadcast = { party = true, raid = false } }
MyAddonDB = MyAddonDB or {}
GP_Lib.ApplyDefaults(MyAddonDB, DEFAULTS)
```

---

## Inventory

Container scanning across bags, bank, and keyring. Bank slots are only readable while the bank window is open (`BANKFRAME_OPENED` / `BANKFRAME_CLOSED`).

All scan functions accept an `opts` table:

| Key | Default | Description |
|---|---|---|
| `bags` | `true` | Bags `0`–`4` (backpack + 4 equipped bags) |
| `bank` | `false` | Bank slots `-1` (main bank) and `5`–`11` (bank bags) |
| `keyring` | `false` | Keyring bag `-2` (legacy; harmless when empty) |

When `opts` is omitted, only bags are scanned.

```lua
-- Default: bags only.
local have = GP_Lib:ScanContainers()

-- Bags + bank (bank must be open).
local have = GP_Lib:ScanContainers({ bank = true })

-- Bank only (skip bags). Useful for "what's in storage?" views.
local stored = GP_Lib:ScanContainers({ bags = false, bank = true })

-- Everything we can read, including the legacy keyring.
local everything = GP_Lib:ScanContainers({ bank = true, keyring = true })

-- Same opts table is accepted by every Inventory function.
local stack = GP_Lib:CountItem(2589, { bank = true })       -- Linen Cloth, bags + bank
local bag, slot = GP_Lib:FindItem(6948, { bags = false, bank = true })  -- Hearthstone in bank
```

### `GP_Lib:LinkToItemID(link)`

Parses the itemID from any string containing an itemString (e.g. a full hyperlink). Returns `number` or `nil`.

### `GP_Lib:ForEachItem(fn, opts)`

Iterates every occupied slot in the requested containers, calling `fn(bag, slot, itemID, count)` for each. If `fn` returns `true`, iteration stops early.

```lua
GP_Lib:ForEachItem(function(bag, slot, id, count)
    print(id, "x", count, "in", bag, slot)
end, { bags = true, bank = true })
```

### `GP_Lib:ScanContainers(opts)`

Returns `{ [itemID] = totalCount }` summed across the requested containers.

```lua
local have = GP_Lib:ScanContainers({ bags = true, bank = true })
print("Linen Cloth:", have[2589] or 0)
```

### `GP_Lib:CountItem(itemID, opts)`

Total count of one itemID across the requested containers.

### `GP_Lib:FindItem(itemID, opts)`

Returns `(bag, slot)` of the first slot containing the given itemID, or `nil` if not found. Useful for "where is X?" lookups.

```lua
local bag, slot = GP_Lib:FindItem(6948)   -- Hearthstone
if bag then UseContainerItem(bag, slot) end
```

### Constants

| Name | Value | Notes |
|---|---|---|
| `GP_Lib.BAG_IDS` | `{ 0, 1, 2, 3, 4 }` | Backpack + 4 equipped bags |
| `GP_Lib.BANK_IDS` | `{ -1, 5, 6, 7, 8, 9, 10, 11 }` | Only readable while bank is open |
| `GP_Lib.KEYRING_IDS` | `{ -2 }` | Removed in patch 4.0 |

---

## ScrollList

### `GP_Lib:CreateScrollList(parent, opts)`

Virtualised scrollable list widget with row recycling. Only `numVisibleRows` row frames are created — they're reused as the user scrolls.

| `opts` Key | Default | Description |
|---|---|---|
| `width` | `240` | Frame width in pixels |
| `height` | `300` | Frame height in pixels |
| `rowHeight` | `18` | Pixel height per row |
| `numVisibleRows` | `floor(height/rowHeight)` | How many row frames to instantiate |
| `buildRow` | `nil` | `function(rowFrame)` — one-time widget setup; attach FontStrings/textures to `rowFrame` |
| `updateRow` | `nil` | `function(rowFrame, dataIndex, dataEntry)` — bind data to widgets each time a row is reused |
| `onRowClick` | `nil` | `function(dataIndex, dataEntry, rowFrame)` — optional click handler |

**Returns:** `Frame` with the methods below.

| Method | Description |
|---|---|
| `:SetData(tbl)` | Replace the backing data and refresh |
| `:Refresh()` | Repaint rows from the current scroll offset |
| `:GetSelectedIndex()` | Last clicked dataIndex, or `nil` |
| `:SetSelectedIndex(i)` | Highlight a row manually |

```lua
local list = GP_Lib:CreateScrollList(parent, {
    width = 240, height = 300, rowHeight = 18,
    buildRow = function(row)
        row.text = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        row.text:SetPoint("LEFT", row, "LEFT", 4, 0)
    end,
    updateRow = function(row, i, entry)
        row.text:SetText(entry.name)
    end,
    onRowClick = function(i, entry) print("clicked", entry.name) end,
})
list:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, -10)
list:SetData({ { name = "Alpha" }, { name = "Beta" }, { name = "Gamma" } })
```

Mouse wheel and the right-edge slider both scroll the list. A selection highlight tints the currently-selected row; a hover highlight is applied automatically.

---

## CopyableText

### `GP_Lib:CreateCopyableText(parent, opts)`

Multi-line read-only text region the user can select and copy with `Ctrl+C`. Useful for displaying log output, traceback dumps, or any block of text the user might want to paste elsewhere.

| `opts` Key | Default | Description |
|---|---|---|
| `width` | `400` | Frame width in pixels |
| `height` | `200` | Frame height in pixels |
| `font` | `"Fonts\FRIZQT__.TTF"` | Font path |
| `fontSize` | `11` | Font size |

**Returns:** `Frame` (the wrapper) with the methods below. Anchor it with `:SetPoint` like any other widget.

| Method | Description |
|---|---|
| `:SetText(s)` | Replace the displayed text |
| `:GetText()` | Returns the current text |
| `:HighlightText()` | Focus the box and select all (so the user can `Ctrl+C` immediately) |
| `:ClearFocus()` | Releases focus |

Typed input is silently discarded — the underlying EditBox restores the stored text on every change, so the region behaves as read-only while still allowing selection.

```lua
local box = GP_Lib:CreateCopyableText(win, { width = 460, height = 240 })
box:SetPoint("TOPLEFT", win, "TOPLEFT", 10, -40)
box:SetText(longErrorTraceback)
box:HighlightText()
```

---

## Toast

### `GP_Lib:ShowToast(text, opts)`

Transient on-screen notification. Toasts stack upward from the bottom-right of the screen; old toasts slide down into the slot vacated by a finishing toast so the order stays stable.

| `opts` Key | Default | Description |
|---|---|---|
| `duration` | `4` | Seconds before fade-out begins |
| `fadeTime` | `1` | Seconds of fade-out |
| `onClick` | `nil` | `function(toast)` — called when the toast is clicked (the toast is removed afterward) |

**Returns:** `Button` — the toast frame.

```lua
GP_Lib:ShowToast("Loot saved to log.")

GP_Lib:ShowToast("Update available — click to view", {
    duration = 8,
    onClick  = function() print("user clicked the toast") end,
})
```

---

## GameMenu

### `GP_Lib:HookGameMenuButton(label, onClick)`

Adds a button to the in-game ESC (Game) menu. The button inherits `GameMenuButtonTemplate` so it matches the rest of the menu. Multiple registrations stack vertically; the menu is automatically resized to fit them.

| Parameter | Type | Description |
|---|---|---|
| `label` | string | Button text |
| `onClick` | `function(button)` | Called when the button is clicked. The menu is hidden before `onClick` runs. |

**Returns:** `Button`

```lua
GP_Lib:HookGameMenuButton("My Addon Settings", function()
    MyAddonSettingsFrame:Show()
end)
```

Internally the module hooks `GameMenuFrame:OnShow` and re-anchors the extra buttons each time the menu opens, so layout survives whatever other addons do to the menu on the fly.

---

## ChatLink

Clickable custom hyperlinks for chat output. Two link kinds are supported: a **URL** link (clicking pops up a copy dialog with the URL pre-selected) and an **Action** link (clicking invokes a registered callback).

The module hooks `SetItemRef` once at load. Unknown link types fall through to the original handler unchanged.

### `GP_Lib.ChatLink:Url(displayText, url)`

Build a chat-printable string. When the user clicks the rendered link, a popup appears with `url` pre-selected in an EditBox so they can hit `Ctrl+C` to copy.

| Parameter | Type | Description |
|---|---|---|
| `displayText` | string | Text shown inside the brackets in chat |
| `url` | string | URL to display in the copy popup |

**Returns:** `string` — pass to `DEFAULT_CHAT_FRAME:AddMessage`.

### `GP_Lib.ChatLink:Action(key, displayText)`

Build an action-type clickable chat string. Pair with `:RegisterAction`.

| Parameter | Type | Description |
|---|---|---|
| `key` | string | Identifier matching a registered action |
| `displayText` | string | Text shown inside the brackets in chat |

**Returns:** `string`

### `GP_Lib.ChatLink:RegisterAction(key, fn)`

Registers a callback for action-type links. `fn` receives no arguments — capture context in a closure.

```lua
DEFAULT_CHAT_FRAME:AddMessage(
    "Update available  " ..
    GP_Lib.ChatLink:Url("Get update", "https://example.com/releases")
)

GP_Lib.ChatLink:RegisterAction("open-settings", function()
    MyAddonSettingsFrame:Show()
end)
DEFAULT_CHAT_FRAME:AddMessage(
    GP_Lib.ChatLink:Action("open-settings", "Open settings")
)
```

---

## VersionCheck

Peer-to-peer version discovery for my addons. Transport is `SendAddonMessage` with prefix `GPLVC1`, scoped to `GUILD` / `PARTY` / `RAID` / `BATTLEGROUND`. Addon messages are invisible to non-addon users and don't consume a chat-channel slot.

Version strings are read from each addon's TOC via `GetAddOnMetadata(name, "Version")`. Players only pass the folder name.

### `GP_Lib.VersionCheck:Register(addonName, opts)`

| Parameter | Type | Description |
|---|---|---|
| `addonName` | string | Folder name of the addon (matches its TOC filename) |
| `opts.onNewerVersion` | `function(addon, localVer, remoteVer, sender)` | Called once per session per `(addon, remoteVer)` pair when a peer reports a newer version |

```lua
GP_Lib.VersionCheck:Register("LuaBugViewer", {
    onNewerVersion = function(addonName, localVer, remoteVer)
        GP_Lib:ShowToast(addonName .. " " .. remoteVer .. " is available")
    end,
})
```

### `GP_Lib.VersionCheck:GetVersions(addonName)`

Returns `(localVer, remoteVer)` for a registered addon. `remoteVer` is the highest version observed from peers this session, or `nil` if none has been seen. Useful for slash commands like `/lbv version`.

---

## LoadedAnnounce

Grouped "AddOns loaded" chat announcer. Each addon registers itself; the module debounces registrations (default 2s after the last call) and emits a single chat message listing all of them. Late-registering addons (LoadOnDemand etc.) get their own grouped message via the same debounce.

If `GP_Lib.VersionCheck` is loaded, registered addons are auto-registered with it, so the user sees an "Update available" chat line (with a clickable `ChatLink` URL) when a peer reports a newer version.

### `GP_Lib.LoadedAnnounce:Register(addonName, slashCmd)`

| Parameter | Type | Description |
|---|---|---|
| `addonName` | string | Folder name of the addon (matches its TOC filename) |
| `slashCmd` | string\|nil | Optional slash command to show in parens, e.g. `"/oom"` |

The addon's version is read from its TOC via `GetAddOnMetadata`. Calling `Register` twice for the same addon is a no-op.

```lua
GP_Lib.LoadedAnnounce:Register("OutOfMana", "/oom")
```

Sample output for a multi-addon session:

```
[ GP ] AddOns Loaded:
  - LuaBugViewer v1.0  (/lbv)
  - OutOfMana v1.1.0   (/oom)
  - WhatCanICraft v0.1.0  (/wcic)
```

### Slash commands

The module installs `/gplib`:

| Command | Description |
|---|---|
| `/gplib test [AddonName]` | Simulate an "update available" notice — fires the VersionCheck path with a fake remote version, useful for verifying the chat line and clickable link |
| `/gplib debug` | Toggle verbose logging |
| `/gplib flush` | Flush pending loaded-announce now (skip the debounce) |
| `/gplib list` | List registered addons |

---

## Adding a new module

1. Create `modules/MyModule.lua`
2. Add `modules\MyModule.lua` to `GP_Lib.toc` after `GP_Lib.lua`
3. Use `local UniqueName = GP_Lib.UniqueName` at the top if you need named frames
