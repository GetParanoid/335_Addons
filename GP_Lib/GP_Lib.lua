--[[
GP_Lib - Shared utilities for GetParanoid's addons.

Bootstrap file. Initialises the GP_Lib table and exposes utilities
that every module in this library shares.
--]]

GP_Lib = {}

-- Shared frame-name counter. All GP_Lib modules call GP_Lib.UniqueName()
-- so names never collide across files.
do
    local _seq = 0
    function GP_Lib.UniqueName(prefix)
        _seq = _seq + 1
        return (prefix or "GP_Widget") .. "_" .. _seq
    end
end
