--[[
GP_Lib :: modules/VersionCheck.lua
Peer-to-peer version discovery for GetParanoid addons.

Requires GP_Lib.lua (loaded first by the toc).

Transport: a single hidden custom chat channel "GPLibVC" for realm-wide reach.
If the player is at the server's 10-channel cap, version discovery is silently
disabled for the session (no fallback to guild/party broadcasts by design).

Usage from a consumer addon (e.g. LuaBugViewer):

    GP_Lib.VersionCheck:Register("LuaBugViewer", {
        onNewerVersion = function(addonName, localVer, remoteVer, sender)
            GP_Lib:ShowToast(addonName .. " " .. remoteVer .. " is available")
        end,
    })

Version strings are read from each addon's TOC via GetAddOnMetadata(name, "Version")
so you do not need to pass anything beyond the addon folder name.
--]]

local CHANNEL_NAME = "GPLibVC"
local WIRE_TAG     = "GPLVC1"   -- magic prefix on every payload, gates parsing
local CMD_HELLO    = "H"        -- "I am running <addon> at <version>"

-- Pacing knobs. Conservative so we never trip the ~10 msg/sec global chat throttle.
local INITIAL_ANNOUNCE_DELAY  = 10  -- seconds after login before first broadcast
local PER_ADDON_GAP           = 2   -- seconds between successive HELLOs on join
local CHANNEL_JOIN_RETRY_GAP  = 5   -- seconds between attempts to (re)join channel
local CHANNEL_JOIN_MAX_TRIES  = 6


local VC = {
    registered     = {},  -- addonName -> { localVer, onNewerVersion }
    seen           = {},  -- addonName -> highest remote version string observed
    channelIndex   = nil, -- resolved index for CHANNEL_NAME, or nil if not joined
    channelTries   = 0,
    started        = false,
}
GP_Lib.VersionCheck = VC


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
-- "GPLVC1:H:AddonName:1.2.3"

local function encode(cmd, addonName, version)
    return WIRE_TAG .. ":" .. cmd .. ":" .. addonName .. ":" .. (version or "")
end

local function decode(payload)
    if type(payload) ~= "string" then return nil end
    if string.sub(payload, 1, #WIRE_TAG + 1) ~= WIRE_TAG .. ":" then return nil end
    local _, _, cmd, addonName, version = string.find(payload, "^[^:]+:([^:]+):([^:]+):(.*)$")
    return cmd, addonName, version
end


-- Inbound handling --------------------------------------------------------

local function handleIncoming(payload, sender)
    local cmd, addonName, remoteVer = decode(payload)
    if not cmd or cmd ~= CMD_HELLO then return end
    if not addonName or not remoteVer or remoteVer == "" then return end
    local entry = VC.registered[addonName]
    if not entry then return end  -- we don't run this addon, ignore

    if compareVersions(entry.localVer, remoteVer) >= 0 then return end

    -- Only fire the callback once per session per (addon, remoteVer) pair, to
    -- avoid spamming the user when many peers announce the same newer version.
    local already = VC.seen[addonName]
    if already and compareVersions(already, remoteVer) >= 0 then return end
    VC.seen[addonName] = remoteVer

    if entry.onNewerVersion then
        entry.onNewerVersion(addonName, entry.localVer, remoteVer, sender or "?")
    end
end


-- Chat-frame suppression for our hidden channel ---------------------------
-- Returning true from a registered filter drops the message from chat display.

local function isOurChannelMsg(channelName)
    return type(channelName) == "string" and string.lower(channelName) == string.lower(CHANNEL_NAME)
end

local function chatMsgFilter(_, _, _, _, _, _, _, _, _, channelName)
    if isOurChannelMsg(channelName) then return true end
end

local function chatNoticeFilter(_, _, _, _, _, _, _, _, _, channelName)
    if isOurChannelMsg(channelName) then return true end
end


-- Transport: custom chat channel ------------------------------------------

local function isInChannel()
    local idx = GetChannelName(CHANNEL_NAME)
    return idx and idx > 0, idx
end

local function tryJoinChannel()
    if VC.channelTries >= CHANNEL_JOIN_MAX_TRIES then return false end
    VC.channelTries = VC.channelTries + 1
    local joined, idx = isInChannel()
    if joined then
        VC.channelIndex = idx
        return true
    end
    JoinTemporaryChannel(CHANNEL_NAME)
    -- Index is not guaranteed available immediately; resolved lazily on send
    -- or when CHANNEL_UI_UPDATE fires.
    return false
end

local function refreshChannelIndex()
    local joined, idx = isInChannel()
    VC.channelIndex = joined and idx or nil
end


-- Sending -----------------------------------------------------------------

local function sendViaChannel(payload)
    refreshChannelIndex()
    if not VC.channelIndex then return false end
    SendChatMessage(payload, "CHANNEL", nil, VC.channelIndex)
    return true
end

local function broadcast(payload)
    sendViaChannel(payload)
end


-- OnUpdate ticker (no C_Timer on 3.3.5) -----------------------------------
-- One shared frame drives delayed work: initial announce + periodic rejoin.

local ticker = CreateFrame("Frame")
local pending = {}  -- list of { atSeconds = number, fn = function }
local elapsed = 0

ticker:SetScript("OnUpdate", function(_, delta)
    elapsed = elapsed + delta
    if #pending == 0 then return end
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
end)

local function schedule(delay, fn)
    pending[#pending + 1] = { atSeconds = elapsed + delay, fn = fn }
end


-- Initial announce: one HELLO per registered addon, staggered.
local function announceAll()
    local i = 0
    for name, entry in pairs(VC.registered) do
        local localName, localEntry = name, entry
        schedule(i * PER_ADDON_GAP, function()
            broadcast(encode(CMD_HELLO, localName, localEntry.localVer))
        end)
        i = i + 1
    end
end


-- Event handling ----------------------------------------------------------

local events = CreateFrame("Frame")

events:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        if VC.started then return end
        VC.started = true

        ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",        chatMsgFilter)
        ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_NOTICE", chatNoticeFilter)
        ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_JOIN",   chatNoticeFilter)
        ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_LEAVE",  chatNoticeFilter)
        ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_LIST",   chatNoticeFilter)

        tryJoinChannel()
        schedule(INITIAL_ANNOUNCE_DELAY, announceAll)

    elseif event == "CHANNEL_UI_UPDATE" then
        refreshChannelIndex()
        if not VC.channelIndex then
            schedule(CHANNEL_JOIN_RETRY_GAP, tryJoinChannel)
        end

    elseif event == "CHAT_MSG_CHANNEL_NOTICE" then
        -- arg1 = notice type ("YOU_LEFT", "YOU_JOINED", ...), arg9 = channel name
        local noticeType = ...
        local chName = select(9, ...)
        if isOurChannelMsg(chName) then
            if noticeType == "YOU_LEFT" then
                VC.channelIndex = nil
                schedule(CHANNEL_JOIN_RETRY_GAP, tryJoinChannel)
            elseif noticeType == "YOU_JOINED" or noticeType == "YOU_CHANGED" then
                refreshChannelIndex()
            end
        end

    elseif event == "CHAT_MSG_CHANNEL" then
        -- arg1 = text, arg2 = sender, arg9 = channel name
        local text, sender = ...
        local chName = select(9, ...)
        if isOurChannelMsg(chName) then
            handleIncoming(text, sender)
        end
    end
end)

events:RegisterEvent("PLAYER_LOGIN")
events:RegisterEvent("CHANNEL_UI_UPDATE")
events:RegisterEvent("CHAT_MSG_CHANNEL")
events:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")


-- Public API --------------------------------------------------------------

--- Register an addon for peer-to-peer version discovery.
--- The local version is read from the addon's TOC ("## Version:"), so the
--- consumer only needs to pass its folder name plus an optional callback.
---@param addonName string  Folder name of the addon (matches its TOC filename)
---@param opts table|nil    { onNewerVersion = function(addon, local, remote, sender) }
function VC:Register(addonName, opts)
    opts = opts or {}
    local localVer = GetAddOnMetadata(addonName, "Version") or "0"
    self.registered[addonName] = {
        localVer       = localVer,
        onNewerVersion = opts.onNewerVersion,
    }

    -- If we registered after PLAYER_LOGIN already fired (late-loading addon),
    -- queue an announce for this one addon so peers learn about us promptly.
    if self.started then
        schedule(INITIAL_ANNOUNCE_DELAY, function()
            broadcast(encode(CMD_HELLO, addonName, localVer))
        end)
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
