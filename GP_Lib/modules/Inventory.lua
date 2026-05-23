--[[
GP_Lib :: modules/Inventory.lua
Container-scanning helpers for bags, bank, and keyring.

Requires GP_Lib.lua (loaded first by the toc).

Provides:
    GP_Lib.BAG_IDS, GP_Lib.BANK_IDS, GP_Lib.KEYRING_IDS  -- container id lists
    GP_Lib:LinkToItemID(link)                            -- parse itemID
    GP_Lib:ForEachItem(fn, opts)                         -- iterator
    GP_Lib:ScanContainers(opts)                          -- { [itemID] = count }
    GP_Lib:CountItem(itemID, opts)                       -- total count
    GP_Lib:FindItem(itemID, opts)                        -- first (bag, slot)
--]]


-- CONSTANTS -------------------------------------------------------------------

-- Bags: 0 = backpack, 1-4 = equipped bags.
GP_Lib.BAG_IDS     = { 0, 1, 2, 3, 4 }

-- Bank: -1 = main bank window slots, 5-11 = equipped bank bags. Only
-- readable while the bank is open (BANKFRAME_OPENED / BANKFRAME_CLOSED).
GP_Lib.BANK_IDS    = { -1, 5, 6, 7, 8, 9, 10, 11 }

-- Keyring: -2. Removed in patch 4.0; harmless on 3.3.5 even when empty.
GP_Lib.KEYRING_IDS = { -2 }


-- INTERNAL --------------------------------------------------------------------

-- Resolves an `opts` table to the list of container IDs to scan.
-- Defaults: bags = true, bank = false, keyring = false.
-- Pass `bags = false` to scan only the bank.
local function resolveContainerIDs(opts)
    opts = opts or {}
    local ids = {}
    if opts.bags ~= false then
        for _, b in ipairs(GP_Lib.BAG_IDS) do ids[#ids + 1] = b end
    end
    if opts.bank then
        for _, b in ipairs(GP_Lib.BANK_IDS) do ids[#ids + 1] = b end
    end
    if opts.keyring then
        for _, b in ipairs(GP_Lib.KEYRING_IDS) do ids[#ids + 1] = b end
    end
    return ids
end


-- PUBLIC ----------------------------------------------------------------------

--- Parses the itemID out of an item hyperlink.
---@param link string  Any string containing an itemString (e.g. a full hyperlink).
---@return number|nil  Numeric itemID, or nil if the link couldn't be parsed.
function GP_Lib:LinkToItemID(link)
    if not link then return nil end
    local id = link:match("item:(%d+)")
    return id and tonumber(id) or nil
end

--- Iterates every occupied slot across the requested containers, invoking
--- `fn(bag, slot, itemID, count)` for each. If `fn` returns `true`, iteration
--- stops early (useful for "find first" patterns).
---
--- `opts` is `{ bags = bool, bank = bool, keyring = bool }`. When omitted,
--- only bags are scanned. Bank slots are only readable while the bank window
--- is open.
function GP_Lib:ForEachItem(fn, opts)
    local ids = resolveContainerIDs(opts)
    for _, bag in ipairs(ids) do
        local slots = GetContainerNumSlots(bag)
        if slots and slots > 0 then
            for slot = 1, slots do
                local id = GetContainerItemID(bag, slot)
                if id then
                    local _, count = GetContainerItemInfo(bag, slot)
                    if fn(bag, slot, id, count or 1) then return end
                end
            end
        end
    end
end

--- Scans the requested containers and returns a map of `itemID -> total count`.
---@param opts table|nil  See ForEachItem; default is bags only.
---@return table          `{ [itemID] = count }` for every itemID present.
function GP_Lib:ScanContainers(opts)
    local counts = {}
    GP_Lib:ForEachItem(function(_, _, id, count)
        counts[id] = (counts[id] or 0) + count
    end, opts)
    return counts
end

--- Returns the total count of one itemID across the requested containers.
function GP_Lib:CountItem(itemID, opts)
    if not itemID then return 0 end
    local total = 0
    GP_Lib:ForEachItem(function(_, _, id, count)
        if id == itemID then total = total + count end
    end, opts)
    return total
end

--- Finds the first slot containing the given itemID. Returns `(bag, slot)`,
--- or `nil` if not found. Search order follows the container-id lists.
function GP_Lib:FindItem(itemID, opts)
    if not itemID then return nil end
    local foundBag, foundSlot
    GP_Lib:ForEachItem(function(bag, slot, id)
        if id == itemID then
            foundBag, foundSlot = bag, slot
            return true
        end
    end, opts)
    return foundBag, foundSlot
end
