--[[
GP_Lib :: modules/Table.lua
Generic table utilities.

Requires GP_Lib.lua (loaded first by the toc).

Provides:
    GP_Lib.DeepCopy(t)              -- recursive clone
    GP_Lib.ApplyDefaults(tbl, def)  -- fill missing entries from defaults
--]]


--- Recursive deep copy of a table. Non-table values are returned unchanged.
--- Does not handle metatables or cyclic references.
function GP_Lib.DeepCopy(orig)
    if type(orig) ~= "table" then return orig end
    local copy = {}
    for k, v in pairs(orig) do
        copy[k] = type(v) == "table" and GP_Lib.DeepCopy(v) or v
    end
    return copy
end

--- Fills missing entries in `tbl` from `defaults`. Nested tables are merged
--- recursively; missing nested tables are deep-copied (so callers never share
--- references with the defaults).
function GP_Lib.ApplyDefaults(tbl, defaults)
    for k, v in pairs(defaults) do
        if tbl[k] == nil then
            tbl[k] = type(v) == "table" and GP_Lib.DeepCopy(v) or v
        elseif type(v) == "table" and type(tbl[k]) == "table" then
            GP_Lib.ApplyDefaults(tbl[k], v)
        end
    end
end
