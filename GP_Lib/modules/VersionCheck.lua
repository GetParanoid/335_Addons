--[[
GP_Lib :: modules/VersionCheck.lua
Peer-to-peer version discovery for addons.

Requires GP_Lib.lua (loaded first by the toc).

Transport: SendAddonMessage with prefix "GPLVC1", scoped to GUILD / PARTY /
RAID / BATTLEGROUND.

Usage from addons:

    GP_Lib.VersionCheck:Register("LuaBugViewer", {
        onNewerVersion = function(addonName, localVer, remoteVer, sender)
            GP_Lib:ShowToast(addonName .. " " .. remoteVer .. " is available")
        end,
    })

Version strings are read from each addon's TOC via GetAddOnMetadata(name, "Version")
so you do not need to pass anything beyond the addon folder name.
--]]

local PREFIX_NAME  = "GPLVC1"   -- SendAddonMessage prefix; receivers filter on it
local CMD_HELLO    = "H"        -- "I am running <addon> at <version>"

-- Pacing knobs. SendAddonMessage shares the ~10 msg/sec global chat throttle.
local INITIAL_ANNOUNCE_DELAY  = 10   -- seconds after login before first broadcast
local PER_MSG_GAP             = 2    -- seconds between successive sends
local REBROADCAST_DEBOUNCE    = 3    -- coalesce roster-change re-announces

-- Field caps and per-sender rate limit
local MAX_ADDON_NAME          = 64
local MAX_VERSION             = 32
local PER_SENDER_COOLDOWN     = 60     -- seconds between accepted HELLOs from same sender/addon
local SENDER_TABLE_PRUNE_AT   = 500    -- prune cooldown table once it exceeds this many entries
local PER_ADDON_NOTIFY_COOLDOWN = 1800 -- seconds; max one onNewerVersion fire per addon regardless of sender


local VC = {
    registered      = {},  -- addonName -> { localVer, onNewerVersion }
    seen            = {},  -- addonName -> highest remote version string observed
    lastFromSender  = {},  -- "sender\taddonName" -> elapsed of last accepted msg
    lastNotifiedAt  = {},  -- addonName -> elapsed of last onNewerVersion fire
    started         = false,
}
GP_Lib.VersionCheck = VC


-- Validation --------------------------------------------------------------

local function isValidAddonName(s)
    return type(s) == "string"
        and #s > 0 and #s <= MAX_ADDON_NAME
        and string.find(s, "^[%w_%-]+$") ~= nil
end

local function isValidVersion(s)
    return type(s) == "string"
        and #s > 0 and #s <= MAX_VERSION
        and string.find(s, "^[%w%.%-_]+$") ~= nil
end


-- Version compare ---------------------------------------------------------
-- Splits on non-digits, compares numerically component-by-component.
-- Returns -1 if a < b, 0 if equal, 1 if a > b.

local function parseVersion(v)
    local parts = {}
    if type(v) ~= "string" then return parts end
    for n in string.gmatch(v, "(%d+)") do
        parts[#parts + 1] = tonumber(n)
    end
    return parts
end

local function compareVersions(a, b)
    local pa, pb = parseVersion(a), parseVersion(b)
    local n = math.max(#pa, #pb)
    for i = 1, n do
        local x, y = pa[i] or 0, pb[i] or 0
        if x < y then return -1 end
        if x > y then return  1 end
    end
    return 0
end


-- Wire format -------------------------------------------------------------
-- Prefix "GPLVC1", message "H:AddonName:Version".

local function encode(cmd, addonName, version)
    return cmd .. ":" .. addonName .. ":" .. (version or "")
end

local function decode(message)
    if type(message) ~= "string" then return nil end
    local _, _, cmd, addonName, version = string.find(message, "^([^:]+):([^:]+):(.+)$")
    return cmd, addonName, version
end


-- OnUpdate ticker (no C_Timer on 3.3.5) -----------------------------------
-- One shared frame drives delayed work: initial announce + debounced flush.

local ticker  = CreateFrame("Frame")
local pending = {}  -- list of { atSeconds = number, fn = function }
local elapsed = 0

local pendingScopes = {}  -- set: scope -> true (queued for next flush)
local flushAt       = nil
local lastGroupSize = 0   -- for "only re-announce when group GREW" check

local function schedule(delay, fn)
    pending[#pending + 1] = { atSeconds = elapsed + delay, fn = fn }
end


-- Sender cooldown table maintenance ---------------------------------------

local function pruneSenderTable()
    local cutoff = elapsed - PER_SENDER_COOLDOWN
    for k, t in pairs(VC.lastFromSender) do
        if t < cutoff then VC.lastFromSender[k] = nil end
    end
end

local function countSenderTable()
    local n = 0
    for _ in pairs(VC.lastFromSender) do n = n + 1 end
    return n
end


-- Inbound handling --------------------------------------------------------

local function handleIncoming(message, sender)
    if type(message) ~= "string" or type(sender) ~= "string" or sender == "" then return end

    -- Ignore our own broadcasts (sender may carry "-Realm" on cross-realm BGs)
    local me = UnitName("player")
    if me and (sender == me or string.find(sender, "^" .. me .. "%-") ~= nil) then return end

    local cmd, addonName, remoteVer = decode(message)
    if cmd ~= CMD_HELLO then return end
    if not isValidAddonName(addonName) then return end
    if not isValidVersion(remoteVer) then return end

    local entry = VC.registered[addonName]
    if not entry then return end  -- we don't run this addon, ignore

    -- Per-sender, per-addon cooldown: blocks walk-the-version-number spam.
    local key = sender .. "\t" .. addonName
    local last = VC.lastFromSender[key]
    if last and (elapsed - last) < PER_SENDER_COOLDOWN then return end
    VC.lastFromSender[key] = elapsed
    if countSenderTable() > SENDER_TABLE_PRUNE_AT then pruneSenderTable() end

    if compareVersions(entry.localVer, remoteVer) >= 0 then return end

    -- Only fire the callback once per session per (addon, remoteVer) pair, to
    -- avoid spamming the user when many peers announce the same newer version.
    local already = VC.seen[addonName]
    if already and compareVersions(already, remoteVer) >= 0 then return end
    VC.seen[addonName] = remoteVer

    -- Global per-addon notify cooldown
    local lastNotify = VC.lastNotifiedAt[addonName]
    if lastNotify and (elapsed - lastNotify) < PER_ADDON_NOTIFY_COOLDOWN then return end
    VC.lastNotifiedAt[addonName] = elapsed

    if entry.onNewerVersion then
        entry.onNewerVersion(addonName, entry.localVer, remoteVer, sender)
    end
end


-- Sending -----------------------------------------------------------------

local function currentGroupScope()
    if GetNumRaidMembers and GetNumRaidMembers() > 0 then return "RAID" end
    if GetNumPartyMembers and GetNumPartyMembers() > 0 then return "PARTY" end
    return nil
end

local function currentGroupSize()
    local numRaid = GetNumRaidMembers and GetNumRaidMembers() or 0
    if numRaid > 0 then return numRaid end
    local numParty = GetNumPartyMembers and GetNumPartyMembers() or 0
    return numParty > 0 and (numParty + 1) or 0  -- +1 for self when in a 5-man
end

local function inBattleground()
    if not IsInInstance then return false end
    local _, instanceType = IsInInstance()
    return instanceType == "pvp" or instanceType == "arena"
end

local function scopeIsAvailable(scope)
    if scope == "GUILD"        then return IsInGuild and IsInGuild()       end
    if scope == "PARTY"        then return GetNumPartyMembers and GetNumPartyMembers() > 0 end
    if scope == "RAID"         then return GetNumRaidMembers  and GetNumRaidMembers()  > 0 end
    if scope == "BATTLEGROUND" then return inBattleground() end
    return false
end


-- Flush queued scopes: send one HELLO per registered addon to each pending
-- scope that is still available, spaced out so we don't trip the chat throttle.
local function flushPending()
    local scopes = {}
    for s in pairs(pendingScopes) do
        if scopeIsAvailable(s) then scopes[#scopes + 1] = s end
        pendingScopes[s] = nil
    end
    if #scopes == 0 then return end

    local i = 0
    for name, entry in pairs(VC.registered) do
        for _, scope in ipairs(scopes) do
            local addonName, version, dist = name, entry.localVer, scope
            schedule(i * PER_MSG_GAP, function()
                if scopeIsAvailable(dist) then
                    SendAddonMessage(PREFIX_NAME, encode(CMD_HELLO, addonName, version), dist)
                end
            end)
            i = i + 1
        end
    end
end

local function queueScope(scope)
    if not scope then return end
    pendingScopes[scope] = true
    flushAt = elapsed + REBROADCAST_DEBOUNCE
end

local function queueAllAvailable()
    if IsInGuild and IsInGuild() then queueScope("GUILD") end
    queueScope(currentGroupScope())
    if inBattleground() then queueScope("BATTLEGROUND") end
end


ticker:SetScript("OnUpdate", function(_, delta)
    elapsed = elapsed + delta

    if #pending > 0 then
        local i = 1
        while i <= #pending do
            local job = pending[i]
            if elapsed >= job.atSeconds then
                table.remove(pending, i)
                job.fn()
            else
                i = i + 1
            end
        end
    end

    if flushAt and elapsed >= flushAt then
        flushAt = nil
        flushPending()
    end
end)


-- Event handling ----------------------------------------------------------

local events = CreateFrame("Frame")

events:SetScript("OnEvent", function(_, event, ...)
    if event == "PLAYER_LOGIN" then
        if VC.started then return end
        VC.started = true
        schedule(INITIAL_ANNOUNCE_DELAY, queueAllAvailable)

    elseif event == "CHAT_MSG_ADDON" then
        local prefix, message, _, sender = ...
        if prefix ~= PREFIX_NAME then return end
        handleIncoming(message, sender)

    elseif event == "PLAYER_GUILD_UPDATE" then
        if IsInGuild and IsInGuild() then queueScope("GUILD") end

    elseif event == "PARTY_MEMBERS_CHANGED" or event == "RAID_ROSTER_UPDATE" then
        local size = currentGroupSize()
        if size > lastGroupSize then
            queueScope(currentGroupScope())
        end
        lastGroupSize = size

    elseif event == "PLAYER_ENTERING_WORLD" then
        if inBattleground() then queueScope("BATTLEGROUND") end
    end
end)

events:RegisterEvent("PLAYER_LOGIN")
events:RegisterEvent("CHAT_MSG_ADDON")
events:RegisterEvent("PLAYER_GUILD_UPDATE")
events:RegisterEvent("PARTY_MEMBERS_CHANGED")
events:RegisterEvent("RAID_ROSTER_UPDATE")
events:RegisterEvent("PLAYER_ENTERING_WORLD")


-- Public API --------------------------------------------------------------

--- Register an addon for peer-to-peer version discovery.
--- The local version is read from the addon's TOC ("## Version:"), so the
--- consumer only needs to pass its folder name plus an optional callback.
---@param addonName string  Folder name of the addon (matches its TOC filename)
---@param opts table|nil    { onNewerVersion = function(addon, local, remote, sender) }
function VC:Register(addonName, opts)
    if not isValidAddonName(addonName) then return end
    opts = opts or {}
    local localVer = GetAddOnMetadata(addonName, "Version") or "0"
    self.registered[addonName] = {
        localVer       = localVer,
        onNewerVersion = opts.onNewerVersion,
    }

    -- If we registered after PLAYER_LOGIN already fired (late-loading addon),
    -- queue an announce so peers learn about us promptly. Multiple late
    -- registrations coalesce via the debounced flush.
    if self.started then
        schedule(INITIAL_ANNOUNCE_DELAY, queueAllAvailable)
    end
end

--- Read what GP_Lib currently believes is the highest known version of an addon
--- (local or remote). Useful for slash commands like "/lbv version".
---@param addonName string
---@return string|nil localVer, string|nil remoteVer
function VC:GetVersions(addonName)
    local entry = self.registered[addonName]
    if not entry then return nil, nil end
    return entry.localVer, self.seen[addonName]
end
