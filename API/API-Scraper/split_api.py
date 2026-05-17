"""
split_api.py

Splits API/global.lua into per-section subdirectories under API/.

Each section is delimited by:
    --==============================
    -- <Name> functions
    --==============================

Output layout:
    API/
        global.lua          (unchanged master file)
        Achievement/
            achievement.lua
        Action/
            action.lua
        ...
"""

import os
import re

GLOBAL_LUA = os.path.join(os.path.dirname(__file__), "API", "../global.lua")
API_DIR    = os.path.join(os.path.dirname(__file__), "../")

SECTION_BORDER = "--=============================="


def to_pascal(text: str) -> str:
    """'Battle.net' -> 'BattleNet', 'Addon-related' -> 'AddonRelated'"""
    text = re.sub(r"[^a-zA-Z0-9 ]", " ", text)
    return "".join(word.capitalize() for word in text.split())


def to_camel(text: str) -> str:
    pascal = to_pascal(text)
    return pascal[0].lower() + pascal[1:] if pascal else pascal


def parse_sections(lines: list[str]):
    """
    Return a list of (section_title, [lines]) tuples.
    The first entry (title=None) holds the file header before any section.
    """
    sections = []
    current_title = None
    current_lines: list[str] = []

    i = 0
    while i < len(lines):
        line = lines[i]

        # Detect the triple-line section header pattern
        if (
            line.rstrip() == SECTION_BORDER
            and i + 2 < len(lines)
            and lines[i + 2].rstrip() == SECTION_BORDER
        ):
            title_line = lines[i + 1].strip()
            m = re.match(r"^-- (.+?) functions\s*$", title_line, re.IGNORECASE)
            if m:
                # Save whatever we've collected so far
                sections.append((current_title, current_lines))
                current_title = m.group(1)
                current_lines = [lines[i], lines[i + 1], lines[i + 2]]
                i += 3
                continue

        current_lines.append(line)
        i += 1

    # Flush the last section
    if current_lines:
        sections.append((current_title, current_lines))

    return sections


def write_section(title: str, lines: list[str]):
    folder_name = to_pascal(title)
    file_name   = to_camel(title) + ".lua"
    folder_path = os.path.join(API_DIR, folder_name)
    file_path   = os.path.join(folder_path, file_name)

    os.makedirs(folder_path, exist_ok=True)

    # Strip leading blank lines, keep a single trailing newline
    content = "".join(lines).strip("\n") + "\n"

    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)

    return file_path


def main():
    with open(GLOBAL_LUA, "r", encoding="utf-8") as f:
        lines = f.readlines()

    sections = parse_sections(lines)

    created = []
    for title, section_lines in sections:
        if title is None:
            # File header — skip (already lives in global.lua)
            continue
        if not section_lines:
            continue
        path = write_section(title, section_lines)
        created.append((title, path))

    print(f"Split {len(created)} sections:")
    for title, path in created:
        rel = os.path.relpath(path, os.path.dirname(__file__))
        print(f"  [{title}] -> {rel}")


if __name__ == "__main__":
    main()
