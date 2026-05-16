# OutOfMana

A simple Out of Mana announcer addon for WoW 3.3.5 (Wrath of the Lich King).

## What it does

Watches your mana and announces when it drops past key thresholds:

- **30%** — `--- LOW ON MANA ---`
- **15%** — `--- CRITICAL LOW MANA ---`
- **5%**  — `--- OUT OF MANA ---`

Each alert shows as a large on-screen message and, in configured instance types (5-man dungeons by default), is also broadcast to chat so your group knows you're running dry.

## Configuration

Edit the `SETTINGS` block at the top of `OutOfMana.lua` to change:

- Chat channel (`SAY`, `PARTY`, `RAID`, ...)
- Thresholds and messages
- Which instance types broadcast to chat

## Installation

Drop the `OutOfMana` folder into `Interface/AddOns/`.
