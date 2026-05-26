--[[
GP_Lib :: modules/LoadedAnnounce.lua
Grouped "AddOns loaded" chat announcer.

Requires GP_Lib.lua (loaded first by the toc).
Integrates with GP_Lib.VersionCheck if available (auto-registers each addon
so the user gets an "Update available" chat line when a newer peer is seen).

Each consumer addon calls:

    GP_Lib.LoadedAnnounce:Register("OutOfMana", "/oom")

The module debounces registrations and emits a single chat message once the
burst settles (default 2s after the last Register call), e.g.:

    [ GP ] AddOns Loaded:
      - LuaBugViewer v1.0 (/lbv)
      - OutOfMana v1.1.0 (/oom)
      - WhatCanICraft v0.1.0 (/wcic)

If VersionCheck later discovers a newer remote version of any registered addon,
a separate line is printed:

    [ GP ] Update available: LuaBugViewer v1.1 (you have v1.0)

Late-registering addons (LoadOnDemand etc.) get their own grouped message via
the same debounce, so a single addon loaded an hour later still prints cleanly.
--]]

local PREFIX           = "|cFFFFFFFF[ |r|cFFFFFFFFGP|r|cFFFFFFFF ]|r "
local LOADED_HEADER    = PREFIX .. "|cFF00FF00AddOns Loaded:|r"
local FLUSH_DEBOUNCE   = 2  -- seconds of quiet after the last Register call
local UPDATE_URL       = "https://github.com/GetParanoid/335_Addons/releases/tag/latest"


local LA = {
    pending     = {},  -- list of { name, slash, version } not yet printed
    announced   = {},  -- addonName -> true (already in a printed batch)
    flushAt     = nil, -- elapsed timestamp at which to flush, or nil
    debug       = false,
}
GP_Lib.LoadedAnnounce = LA

local function dprint(msg)
    if LA.debug then
        DEFAULT_CHAT_FRAME:AddMessage("|cFFAAAAAA[GPLib debug]|r " .. tostring(msg))
    end
end


-- OnUpdate ticker (no C_Timer on 3.3.5) -----------------------------------

local ticker = CreateFrame("Frame")
local elapsed = 0

ticker:SetScript("OnUpdate", function(_, delta)
    elapsed = elapsed + delta
    if LA.flushAt and elapsed >= LA.flushAt then
        LA.flushAt = nil
        LA:Flush()
    end
end)


-- Printing ----------------------------------------------------------------

local function chat(msg)
    DEFAULT_CHAT_FRAME:AddMessage(msg)
end

local function formatEntry(entry)
    local line = "  - " .. entry.name
    if entry.version and entry.version ~= "" then
        line = line .. " v" .. entry.version
    end
    if entry.slash and entry.slash ~= "" then
        line = line .. "  (" .. entry.slash .. ")"
    end
    return line
end

local function sortByName(a, b) return a.name < b.name end

function LA:Flush()
    if #self.pending == 0 then return end

    dprint("Flushing " .. #self.pending .. " pending registration(s)")
    table.sort(self.pending, sortByName)

    -- Single addon: keep a compact one-liner that matches the old per-addon
    -- format, so a lone late-loader doesn't print a two-line block.
    if #self.pending == 1 then
        local e = self.pending[1]
        local line = PREFIX .. e.name
        if e.version and e.version ~= "" then line = line .. " v" .. e.version end
        line = line .. " - |cFF00FF00Successfully loaded!|r"
        if e.slash and e.slash ~= "" then line = line .. "  (" .. e.slash .. ")" end
        chat(line)
    else
        chat(LOADED_HEADER)
        for _, entry in ipairs(self.pending) do
            chat(formatEntry(entry))
        end
    end

    self.pending = {}
end


-- VersionCheck bridge -----------------------------------------------------

local function onNewerVersion(addonName, localVer, remoteVer)
    local msg = PREFIX .. "|cFFFFFF00Update available:|r " .. addonName
        .. " v" .. remoteVer .. " (you have v" .. localVer .. ")"
    if GP_Lib.ChatLink then
        msg = msg .. "  " .. GP_Lib.ChatLink:Url("Get update", UPDATE_URL)
    end
    chat(msg)
end


-- Public API --------------------------------------------------------------

--- Register an addon for the grouped loaded-announce message.
--- Reads the addon's version from its TOC ("## Version:") via GetAddOnMetadata,
--- and auto-registers with GP_Lib.VersionCheck (if loaded) so the user is told
--- in chat when a peer reports a newer version.
---@param addonName string  Folder name of the addon (matches its TOC filename)
---@param slashCmd  string|nil  Optional slash command to show in parens, e.g. "/oom"
function LA:Register(addonName, slashCmd)
    if self.announced[addonName] then return end
    self.announced[addonName] = true

    local version = GetAddOnMetadata(addonName, "Version") or ""
    self.pending[#self.pending + 1] = {
        name    = addonName,
        slash   = slashCmd,
        version = version,
    }
    self.flushAt = elapsed + FLUSH_DEBOUNCE
    dprint("Registered " .. addonName .. " v" .. version
        .. (slashCmd and ("  (" .. slashCmd .. ")") or "")
        .. "; flush in " .. FLUSH_DEBOUNCE .. "s")

    if GP_Lib.VersionCheck then
        GP_Lib.VersionCheck:Register(addonName, {
            onNewerVersion = onNewerVersion,
        })
    end
end


-- Debug / test helpers ----------------------------------------------------

--- Fire the "update available" path for a registered addon as if a peer had
--- reported a newer version. Useful for verifying the chat line and clickable
--- link without needing a guildmate on a newer release.
---@param addonName string|nil  Addon to test; defaults to all registered addons
---@param fakeVer   string|nil  Pretend remote version; defaults to local + ".99"
function LA:Test(addonName, fakeVer)
    local function fire(name)
        local localVer = GetAddOnMetadata(name, "Version") or "0"
        local remoteVer = fakeVer or (localVer .. ".99")
        dprint("Simulating update: " .. name .. " " .. localVer .. " -> " .. remoteVer)
        onNewerVersion(name, localVer, remoteVer)
    end

    if addonName then
        if not self.announced[addonName] then
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF6666[GPLib]|r Not registered: " .. addonName)
            return
        end
        fire(addonName)
    else
        for name in pairs(self.announced) do fire(name) end
    end
end


-- Slash command -----------------------------------------------------------

SLASH_GPLIB1 = "/gplib"
SlashCmdList["GPLIB"] = function(input)
    input = input or ""
    local cmd, rest = input:match("^%s*(%S*)%s*(.-)%s*$")
    cmd = (cmd or ""):lower()

    if cmd == "debug" then
        LA.debug = not LA.debug
        DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00[GPLib]|r debug " .. (LA.debug and "ON" or "OFF"))

    elseif cmd == "test" then
        LA:Test(rest ~= "" and rest or nil)

    elseif cmd == "flush" then
        LA.flushAt = nil
        LA:Flush()

    elseif cmd == "list" then
        DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00[GPLib]|r registered addons:")
        for name in pairs(LA.announced) do
            local v = GetAddOnMetadata(name, "Version") or "?"
            DEFAULT_CHAT_FRAME:AddMessage("  - " .. name .. " v" .. v)
        end

    else
        DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00[GPLib]|r usage:")
        DEFAULT_CHAT_FRAME:AddMessage("  /gplib test [AddonName]  - simulate an 'update available' notice")
        DEFAULT_CHAT_FRAME:AddMessage("  /gplib debug             - toggle verbose logging")
        DEFAULT_CHAT_FRAME:AddMessage("  /gplib flush             - flush pending loaded-announce now")
        DEFAULT_CHAT_FRAME:AddMessage("  /gplib list              - list registered addons")
    end
end
