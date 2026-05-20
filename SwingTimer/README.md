# SwingTimer

A melee swing timer bar for WoW 3.3.5a. Displays a draggable progress bar that tracks your auto-attack cooldown so you can time on-next-attack abilities precisely.

## Download

**[Download SwingTimer.zip](https://github.com/GetParanoid/335_Addons/releases/download/latest/SwingTimer.zip)** - includes GP_Lib

## What it does

- Progress bar depletes (or fills) in sync with your main-hand swing speed
- Resets automatically on each auto-attack, Heroic Strike, Cleave, Slam, Raptor Strike, and Maul
- Adjusts in real time when haste auras are gained or lost
- Shortens timer on successful dodge (40% reduction, matching the game mechanic)
- Hides when out of combat and not actively swinging

## Commands

| Command | Action |
|---|---|
| `/st config` | Open the settings window |
| `/st move` | Toggle drag mode - bar stays visible so you can reposition it |
| `/st reset` | Reset bar to default position (center, 250px below screen center) |
| `/st light` | White bar |
| `/st dark` | Grey bar |
| `/st class` | Bar coloured by your class |

## Configuration

`/st config` opens a settings window with:

- **Theme** - `light`, `dark`, or `class`
- **Direction** - `LEFT` (bar depletes right-to-left) or `RIGHT` (left-to-right)
- **Mode** - `remaining` (full → empty) or `elapsed` (empty → full)
- **Width / Height** - bar dimensions in pixels
- **Alpha** - bar transparency

Settings persist across sessions via `SwingTimer_Settings`.

## Installation

Extract the zip into `Interface/AddOns/`. Both `SwingTimer/` and `GP_Lib/` are inside - drop them both in. SwingTimer will not load without GP_Lib.
