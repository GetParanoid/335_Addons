# LuaBugViewer

A modern, modular Lua error catcher for WoW 3.3.5a. Captures errors as they happen and shows them in a clean viewer window, with full copy-paste support so you can paste a clean stack trace.

A drop-in replacement for BugGrabber + BugSack, with no Ace3 / LibStub / LibDataBroker dependencies.

## Download

**[Download LuaBugViewer.zip](https://github.com/GetParanoid/335_Addons/releases/download/latest/LuaBugViewer.zip)** - includes GP_Lib

## What it does

- Captures every Lua error via a properly chained `seterrorhandler` - Blizzard's default error popup (and anything else hooked in) still runs
- Also captures `ADDON_ACTION_BLOCKED` and `ADDON_ACTION_FORBIDDEN` events
- Deduplicates repeats: identical errors show as a single row with an `xN` counter
- Throttles runaway error loops: pauses capture for 60s after more than 20 errors/sec
- One-line yellow chat notification per *new* error (duplicates stay quiet)
- "Lua Errors" button on the ESC (Game) menu with an unread-count badge
- Two-pane viewer: error list on the left, full stack trace and locals on the right - both panes are selectable for Ctrl+C copy

## Commands

| Command | Action |
|---|---|
| `/lbv` (or `/bug`) | Toggle the viewer window |
| `/lbv clear` | Wipe the current session's error log |
| `/lbv count` | Print the number of captured errors |
| `/lbv chat` | Toggle the chat-message notification |
| `/lbv testerror` | Fire an intentional error to confirm capture works |
| `/lbv help` | List the available subcommands |

## How errors are stored

Errors live **in memory for the current session only** - they're not persisted to SavedVariables and `/reload` wipes the log. This keeps the SavedVariables file tiny and avoids the bloat that haunted long-running BugSack databases. Only your settings (chat-notification toggle, throttle limits, max stored count) persist across sessions in `LuaBugViewerDB`.

The log is capped at 100 errors by default; oldest entries drop off as new ones arrive.

## Configuration

Settings live in the `LuaBugViewerDB` SavedVariable. Defaults:

| Key | Default | Meaning |
|---|---|---|
| `notifyInChat` | `true` | Print a yellow `[LBV]` line on every new error |
| `throttleRate` | `20` | Errors per second that triggers a capture pause |
| `throttleCooldown` | `60` | Seconds capture stays paused after a burst |
| `maxStored` | `100` | Hard cap on the session log; oldest are dropped |

## Module layout

| File | Purpose |
|---|---|
| `Core.lua` | Bootstrap, defaults, tiny pub/sub event bus |
| `modules/SessionLog.lua` | In-memory error store with dedup |
| `modules/ErrorHandler.lua` | `seterrorhandler` chain, recursion guard, throttle |
| `modules/Notifier.lua` | Chat-frame notification on new errors |
| `modules/Viewer.lua` | The two-pane viewer window |
| `modules/EscMenuEntry.lua` | ESC-menu button + unread-count badge |
| `modules/SlashCommand.lua` | `/lbv` and `/bug` handlers |

## Installation

Extract the zip into `Interface/AddOns/`. Both `LuaBugViewer/` and `GP_Lib/` are inside - drop them both in. LuaBugViewer will not load without GP_Lib.
