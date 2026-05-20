# GP_Lib

Shared utility library for WoW 3.3.5.

## What it currently provides

- **Custom config windows** - draggable, dialog-style frames with Save / Cancel buttons
- **Widget helpers** - checkbox, slider, dropdown, edit box - all with automatic Save / refresh lifecycle
- **Tooltips** - one-line hover descriptions on any widget

## Download

**[Download GP_Lib.zip](https://github.com/GetParanoid/335_Addons/releases/download/latest/GP_Lib.zip)**

Note: addons that depend on GP_Lib (OutOfMana, SwingTimer) already bundle it in their own zip - you only need this if you want GP_Lib standalone.

## Installation

Drop the `GP_Lib` folder into `Interface/AddOns/`. Addons that depend on it declare:

```
## Dependencies: GP_Lib
```

in their `.toc` file, and WoW loads GP_Lib first automatically.

## File layout

| File | Purpose |
|---|---|
| `GP_Lib.lua` | Bootstrap - initialises the `GP_Lib` table and shared utilities |
| `modules/UI.lua` | Config window and all widget helpers |

New modules (e.g. `modules/DB.lua`, `modules/Events.lua`) follow the same pattern: create the file in `modules/`, add it to the toc after `GP_Lib.lua`.

## Quick example

```lua
local win = GP_Lib:CreateWindow("My Settings", 400, 300)

GP_Lib:AddCheckbox(win, "Enable feature", 16, 16,
    function()  return MyDB.enabled end,
    function(v) MyDB.enabled = v    end)

-- /myslash toggles the window
SLASH_MYADDON1 = "/myslash"
SlashCmdList["MYADDON"] = function()
    if win:IsShown() then win:Hide() else win:Show() end
end
```

See [API.md](docs/API.md) for the full reference.
