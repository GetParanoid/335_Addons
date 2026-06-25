# WhatCanICraft

A profession helper for WoW 3.3.5  that lists every recipe you can craft right now using reagents in both your bags and bank (or either or), when it's open.

## What it does

When you open any profession window (Alchemy, Cooking, Blacksmithing, ...), a small panel appears next to it listing every recipe you have enough reagents for, sorted by how many of each you can make.

- Counts reagents from your **bags**, plus the **bank** when it's open.
- Works for any tradeskill.
- **Left-click** a row to jump to that recipe in the profession window.
- **Right-click** a row (with the bank open) to pull all matching reagent stacks from the bank into your bags, so you can craft without manually shuffling items.
- **Hover a row** and click the small **x** at its right edge to hide a recipe you never craft.
- Window is movable; position is saved between sessions.

## Filtering

Don't want to see a recipe (e.g. *Endless Mana Potion*) cluttering the list? Hover its
row and click the **x** to hide it. Don't want the panel to appear for a profession at
all (e.g. Enchanting)? Disable it per-profession in the settings window.

Open the settings with **`/wcic settings`**:

- **Disabled Professions** — lists every WoW profession (all enabled by default). Click
  one to toggle whether the panel auto-shows for it. Disabled professions never auto-show,
  but you can still force the panel open for the current one with bare `/wcic`.
- **Hidden Recipes** — every recipe you've hidden. Click one to unhide it.

Both lists are account-wide and persist between sessions. Changes apply immediately.

## Slash commands

| Command | Action |
|---|---|
| `/wcic` | Toggle the results window (only works while a profession window is open) |
| `/wcic settings` | Open the settings window (manage hidden recipes & disabled professions) |

## Download

**[Download WhatCanICraft.zip](https://github.com/GetParanoid/335_Addons/releases/download/latest/WhatCanICraft.zip)** - includes GP_Lib

## Installation

Extract the zip into `Interface/AddOns/`. Both `WhatCanICraft/` and `GP_Lib/` are inside - drop them both in. WhatCanICraft will not load without GP_Lib.
