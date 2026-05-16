# OutOfMana

A simple Out of Mana announcer addon for WoW 3.3.5 (Wrath of the Lich King).

## What it does

Watches your mana and fires an alert each time it crosses a threshold. Each alert shows as a large on-screen message and can optionally broadcast to chat so your group knows you're running dry.

Default thresholds:

| % | Message |
|---|---------|
| 30% | `--- LOW ON MANA ---` |
| 15% | `--- CRITICAL LOW MANA ---` |
| 5%  | `--- OUT OF MANA ---` |

## Configuration

Type `/oom` in-game to open the settings window. Everything is configurable without touching any files:

- **Chat Channel** — where warnings are broadcast (`SAY`, `PARTY`, `RAID`, ...)
- **Message Duration** — how long the on-screen alert stays visible
- **Font Size** — size of the on-screen text
- **Broadcast In** — toggle chat broadcasts per instance type (open world, dungeon, raid, arena, battleground)
- **Mana Thresholds** — percentage triggers and custom messages for all three alerts

## Installation

1. Install **GP_Lib** — drop the `GP_Lib` folder into `Interface/AddOns/`
2. Install **OutOfMana** — drop the `OutOfMana` folder into `Interface/AddOns/`

GP_Lib is a shared library used by my addons. OutOfMana will not load without it.
