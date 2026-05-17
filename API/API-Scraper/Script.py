#!/usr/bin/env python3
"""
Generates global.lua (EmmyLua/LuaLS annotations) for WoW WotLK-era API
by scraping ONLY the archived wowprogramming docs:
- api_categories index
- each linked /docs/api/<FunctionName> page

Source index:
https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api_categories
"""

from __future__ import annotations

import re
import time
from dataclasses import dataclass
from typing import List, Tuple, Optional
from urllib.parse import urljoin

import requests
from bs4 import BeautifulSoup, Tag

CATEGORIES_URL = "https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api_categories"
REQUEST_DELAY = 0.25
TIMEOUT = 30

session = requests.Session()
session.headers.update({
    "User-Agent": "Mozilla/5.0 (compatible; global-lua-generator/1.0; +https://web.archive.org/)"
})


@dataclass
class ApiEntry:
    name: str
    url: str
    category: str
    short_desc: str
    flags: List[str]


def fetch(url: str) -> str:
    r = session.get(url, timeout=TIMEOUT)
    r.raise_for_status()
    time.sleep(REQUEST_DELAY)
    return r.text


def print_progress(i: int, total: int, prefix: str = "Progress") -> None:
    pct = (i / total) * 100 if total else 100.0
    bar_len = 30
    filled = int(bar_len * pct / 100)
    bar = "█" * filled + "░" * (bar_len - filled)
    print(f"\r{prefix}: {pct:6.2f}% [{bar}] {i}/{total}", end="", flush=True)


def normalize_type(t: str) -> str:
    s = (t or "").strip().lower()
    if "string" in s:
        return "string"
    if any(x in s for x in ["number", "numeric", "int", "float"]):
        return "number"
    if any(x in s for x in ["boolean", "bool"]):
        return "boolean"
    if "table" in s:
        return "table"
    if any(x in s for x in ["function", "closure"]):
        return "function"
    if s == "nil":
        return "nil"
    return "any"


def parse_categories(html: str) -> List[ApiEntry]:
    soup = BeautifulSoup(html, "lxml")
    entries: List[ApiEntry] = []

    current_category: Optional[str] = None
    for el in soup.find_all(["h3", "li"]):
        if el.name == "h3":
            title = el.get_text(" ", strip=True)
            if title:
                current_category = title
            continue

        if el.name != "li":
            continue

        a = el.find("a", href=True)
        if not a:
            continue

        name = a.get_text(strip=True)
        href = a["href"]
        if "/docs/api/" not in href:
            continue

        url = urljoin(CATEGORIES_URL, href)

        text = el.get_text(" ", strip=True)
        short_desc = text.split(" - ", 1)[1].strip() if " - " in text else ""

        flags: List[str] = []
        # nested flags appear as sub-bullets (e.g. deprecated, protected, nocombat)
        for sub in el.find_all("li"):
            t = sub.get_text(" ", strip=True).lower()
            for key in ["deprecated", "protected", "nocombat", "server", "internal", "blizzardui", "confirmation"]:
                if key in t and key not in flags:
                    flags.append(key)

        entries.append(ApiEntry(
            name=name,
            url=url,
            category=current_category or "Uncategorized functions",
            short_desc=short_desc,
            flags=flags
        ))

    # de-dup by name
    seen = set()
    uniq: List[ApiEntry] = []
    for e in entries:
        if e.name in seen:
            continue
        seen.add(e.name)
        uniq.append(e)
    return uniq


def find_ul_after_label(soup: BeautifulSoup, label: str) -> Optional[Tag]:
    node = soup.find(string=re.compile(rf"^\s*{re.escape(label)}\s*$", re.I))
    if not node:
        return None
    return node.parent.find_next("ul")


def parse_sig_returns(soup: BeautifulSoup) -> List[str]:
    node = soup.find(string=re.compile(r"^\s*Signature:\s*$", re.I))
    if not node:
        return []

    scan = node.parent.find_all_next(string=True, limit=80)
    sigline = None
    for s in scan:
        t = str(s)
        if "`" in t and "(" in t and ("=" in t or " =" in t):
            sigline = t
            break
    if not sigline:
        return []

    raw = sigline.replace("`", "")
    raw = re.sub(r"\s+", " ", raw).strip()
    if "=" not in raw:
        return []

    left = raw.split("=", 1)[0].strip().strip(",")
    return [x.strip().strip(",") for x in left.split(",") if x.strip()]


def parse_args_or_returns(ul: Optional[Tag]) -> List[Tuple[str, str, str]]:
    out: List[Tuple[str, str, str]] = []
    if not ul:
        return out

    for li in ul.find_all("li", recursive=False):
        txt = li.get_text(" ", strip=True)

        # Format often like: `unit` - Description (string, unitID)
        m = re.match(r"^`?([\w\d_]+)`?\s*-\s*(.+)$", txt)
        if not m:
            continue

        name = m.group(1)
        rest = m.group(2)

        # Type usually appears as the last (...) group
        type_m = re.search(r"\(([^()]+)\)\s*$", rest)
        lua_type = "any"
        desc = rest
        if type_m:
            type_blob = type_m.group(1)
            first = type_blob.split(",")[0].strip()
            lua_type = normalize_type(first)
            desc = rest[:type_m.start()].strip()

        out.append((name, lua_type, desc))
    return out


def parse_description(soup: BeautifulSoup, fallback: str) -> str:
    content = soup.find("div", {"id": "content"})
    if content:
        p = content.find("p")
        if p:
            t = p.get_text(" ", strip=True)
            if t and "Signature" not in t:
                return t
    return fallback or ""


def emit_function(entry: ApiEntry) -> str:
    html = fetch(entry.url)
    soup = BeautifulSoup(html, "lxml")

    desc = parse_description(soup, entry.short_desc).replace("`", "'").strip()

    args_ul = find_ul_after_label(soup, "Arguments:")
    rets_ul = find_ul_after_label(soup, "Returns:")

    params = parse_args_or_returns(args_ul)
    returns = parse_args_or_returns(rets_ul)

    sig_ret_names = parse_sig_returns(soup)
    if returns and sig_ret_names and len(sig_ret_names) == len(returns):
        returns = [(sig_ret_names[i], returns[i][1], returns[i][2]) for i in range(len(returns))]
    elif (not returns) and sig_ret_names:
        returns = [(n, "any", "") for n in sig_ret_names]

    lines: List[str] = []
    if desc:
        lines.append(f"--- {desc}")
    if entry.flags:
        lines.append(f"--- Flags: {', '.join(entry.flags)}")

    for (pname, ptype, pdesc) in params:
        pdesc = (pdesc or "").replace("`", "'").strip()
        if pdesc:
            lines.append(f"---@param {pname} {ptype} {pdesc}")
        else:
            lines.append(f"---@param {pname} {ptype}")

    for (rname, rtype, rdesc) in returns:
        rdesc = (rdesc or "").replace("`", "'").strip()
        if rdesc:
            lines.append(f"---@return {rtype} {rname} {rdesc}")
        elif rname:
            lines.append(f"---@return {rtype} {rname}")
        else:
            lines.append(f"---@return {rtype}")

    param_list = ", ".join([p[0] for p in params])
    lines.append(f"function {entry.name}({param_list}) end")
    lines.append("")  # <-- blank line after each function stub
    return "\n".join(lines) + "\n"


def main() -> int:
    print("Fetching category index...")
    index_html = fetch(CATEGORIES_URL)
    entries = parse_categories(index_html)
    total = len(entries)
    print(f"Found {total} API entries. Generating stubs...\n")

    out: List[str] = []
    out.append("-- GENERATED from archived wowprogramming.com docs (Wayback)\n")
    out.append("-- Index: " + CATEGORIES_URL + "\n\n")

    current_cat = None
    for i, e in enumerate(entries, 1):
        if e.category != current_cat:
            current_cat = e.category
            out.append(("\n\n--==============================\n"
                        f"-- {current_cat}\n"
                        "--==============================\n\n"))

        try:
            out.append(emit_function(e))
        except Exception:
            out.append(f"--- {e.short_desc}\n")
            out.append(f"--- NOTE: parse failed for {e.url}\n")
            out.append(f"function {e.name}() end\n\n")

        print_progress(i, total, prefix="Generating")

    print()  # newline after progress bar

    with open("global.lua", "w", encoding="utf-8") as f:
        f.write("".join(out))

    print("Wrote global.lua")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())