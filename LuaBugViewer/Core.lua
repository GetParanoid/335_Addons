--[[
LuaBugViewer :: Core.lua
Bootstrap, namespace, module registry, and a tiny event bus.

Each module file attaches itself to LuaBugViewer.modules.<Name> and exposes an
:Init() method. Core calls Init() in dependency order once SavedVariables are
ready (after ADDON_LOADED for our addon).
--]]

LuaBugViewer = {
    modules    = {},
    _listeners = {},   -- eventName -> { fn, fn, ... }
}

local LBV = LuaBugViewer

local DEFAULTS = {
    notifyInChat     = true,
    throttleRate     = 20,    -- errors/sec that triggers a pause
    throttleCooldown = 60,    -- seconds capture is paused after a burst
    maxStored        = 100,   -- session log cap (oldest dropped)
}


-- Tiny pub/sub. Module init code can do LBV:On("OnNewError", fn) and any
-- producer can do LBV:Emit("OnNewError", entry). No callback-handler lib needed.

function LBV:On(event, fn)
    local list = self._listeners[event]
    if not list then
        list = {}
        self._listeners[event] = list
    end
    table.insert(list, fn)
end

function LBV:Emit(event, ...)
    local list = self._listeners[event]
    if not list then return end
    for _, fn in ipairs(list) do
        fn(...)
    end
end


-- Bootstrap ---------------------------------------------------------------

local INIT_ORDER = {
    "SessionLog",
    "ErrorHandler",
    "Notifier",
    "Viewer",
    "EscMenuEntry",
    "SlashCommand",
}


local function OnLoaded()
    if type(LuaBugViewerDB) ~= "table" then LuaBugViewerDB = {} end
    GP_Lib.ApplyDefaults(LuaBugViewerDB, DEFAULTS)
    LBV.db = LuaBugViewerDB

    for _, name in ipairs(INIT_ORDER) do
        local m = LBV.modules[name]
        if m and m.Init then m:Init() end
    end
end


local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:SetScript("OnEvent", function(self, event, addon)
    if event == "ADDON_LOADED" and addon == "LuaBugViewer" then
        self:UnregisterEvent("ADDON_LOADED")
        OnLoaded()
    end
end)
