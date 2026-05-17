--==============================
-- Socketing functions
--==============================

--- Accepts changes made in the Item Socketing UI. Any gems added are permanently socketed into the item, and any existing gems replaced by new gems are destroyed.  This function only has effect while the Item Socketing UI is open (i.e. between the SOCKET_INFO_UPDATE and SOCKET_INFO_CLOSE events).
--- Flags: confirmation
function AcceptSockets() end

--- Ends interaction with the Item Socketing UI, discarding any changes made. Causes the SOCKET_INFO_CLOSE event to fire, indicating that Socket API functions may no longer have effects or return valid data.
function CloseSocketInfo() end

--- Returns information about a permanently socketed gem. If the given socket contains a permanently socketed gem, returns information for that gem (even if a new gem has been dropped in the socket to overwrite the existing gem, but has not yet been confirmed). If the socket is empty, returns nil .
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
---@return string name Name of the socketed gem
---@return string texture Path to an icon texture for the socketed gem
---@return any name 1 if the gem matches the socket's color; otherwise nil
function GetExistingSocketInfo(index) end

--- Returns information about a gem added to a socket. If the given socket contains a new gem (one that has been placed in the UI, but not yet confirmed for permanently socketing into the item), returns information for that gem. If the socket is empty or has a permanently socketed gem but no new gem, returns nil .
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
---@return string name Name of the gem added to the socket
---@return string texture Path to an icon texture for the gem added to the socket
---@return any matches 1 if the gem matches the socket's color; otherwise nil
function GetNewSocketInfo(index) end

--- Returns the number of sockets on the item currently being socketed. Only returns valid information when the Item Socketing UI is open (i.e. between the SOCKET_INFO_UPDATE and SOCKET_INFO_CLOSE events).
---@return number numSockets Number of sockets on the item
function GetNumSockets() end

--- Returns whether the item open for socketing is temporarily tradeable. A Bind on Pickup item looted by the player can be traded to other characters who were originally eligible to loot it, but only within a limited time after looting. This period can be ended prematurely if the player attempts certain actions (such as socketing gems into the item).
---@return any tradeable 1 if the item can temporarily be traded to other players; otherwise nil
function GetSocketItemBoundTradeable() end

--- Returns information about the item currently being socketed. Only returns valid information when the Item Socketing UI is open (i.e. between the SOCKET_INFO_UPDATE and SOCKET_INFO_CLOSE events).
---@return string name Name of the item
---@return string icon Path to an icon texture for the item
---@return number quality Quality level of the item
function GetSocketItemInfo() end

--- Returns whether the item open for socketing is temporarily refundable. Items bought with alternate currency (honor points, arena points, or special items such as Emblems of Heroism and Dalaran Cooking Awards) can be returned to a vendor for a full refund, but only within a limited time after the original purchase. This period can be ended prematurely if the player attempts certain actions (such as socketing gems into the item).
---@return any refundable 1 if the item can be returned to a vendor for a refund; otherwise nil
function GetSocketItemRefundable() end

--- Returns information about the gem types usable in a socket. Only returns valid information when the Item Socketing UI is open (i.e. between the SOCKET_INFO_UPDATE and SOCKET_INFO_CLOSE events).
---@param index number Index of a gem socket (between 1 and GetNumSockets() )
---@return any gemColor Type of the gem socket ( string ) Blue - Accepts any gem, but requires a blue, green, purple or prismatic gem to activate the item's socket bonus Meta - Accepts only meta gems Red - Accepts any gem, but requires a red, purple, orange or prismatic gem to activate the item's socket bonus Socket - Accepts any gem Yellow - Accepts any gem, but requires a yellow, orange, green or prismatic gem to activate the item's socket bonus
function GetSocketTypes(index) end
