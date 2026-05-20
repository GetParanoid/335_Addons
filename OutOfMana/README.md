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

- **Chat Channel** - where warnings are broadcast (`SAY`, `PARTY`, `RAID`, ...)
- **Message Duration** - how long the on-screen alert stays visible
- **Font Size** - size of the on-screen text
- **Broadcast In** - toggle chat broadcasts per instance type (open world, dungeon, raid, arena, battleground)
- **Mana Thresholds** - percentage triggers and custom messages for all three alerts

## Download

**[Download OutOfMana.zip](https://github.com/GetParanoid/335_Addons/releases/download/latest/OutOfMana.zip)** - includes GP_Lib

## Installation

Extract the zip into `Interface/AddOns/`. Both `OutOfMana/` and `GP_Lib/` are inside - drop them both in. OutOfMana will not load without GP_Lib.
