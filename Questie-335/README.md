# Questie-335

## Download

**[Download Questie-335.zip](https://github.com/GetParanoid/335_Addons/releases/download/latest/Questie-335.zip)**

## What's different in this fork

### Built-in direction arrow
The quest direction arrow is ported directly from QuestHelper and integrated into Questie. **No TomTom required.** The arrow points toward your active quest objective and updates as you move. Right-click a tracked quest in the tracker to point the arrow at it, or shift+left-click a map icon.

### Carbonite compatibility
Questie previously broke Carbonite's map and minimap when both were loaded. This fork patches the conflict so both addons can run simultaneously.

### Quest item chat links
Quest items are linked in chat announcements the same way quest names are, making it easy to inspect required items directly from chat.

## Features

### Quest map icons
Shows icons on the world map and minimap for quest givers, turn-ins, and objectives. Hover for tooltips; hold Shift for extended info including XP reward.

### Quest tracker
- Automatically tracks quests on accept
- Shows up to 20 quests (vs. the default 5)
- Left-click a quest to open the quest log
- Right-click for options: focus quest, set arrow direction

### Quest communication
- See party members' quest progress on tooltips
- Announce objective progress, completion, accept, and abandon to chat

### Journey log
Records the steps of your levelling journey. Open with `/questie journey` or left-click the minimap button → "My Journey".

### Quests by Zone / Faction
Lists all available and completed quests per zone or faction. Left-click the minimap button and select the tab, or type `/questie journey`.

### Search
Full-text search across Questie's quest database. Left-click the minimap button → "Advanced Search".

### Waypoint lines
Shows pathing lines for quest givers that wander. Shift+left-click any map icon to place a waypoint arrow.

## Installation

1. Extract `Questie-335.zip` into `Interface/AddOns/`

## Commands

| Command | Action |
|---|---|
| `/questie` | Open configuration |
| `/questie journey` | Open Journey / Zone / Search window |
| `/console scriptErrors 1` | Enable Lua error display (useful for bug reports) |

## Compatibility

- WoW client: 3.3.5a
- Works alongside Carbonite
