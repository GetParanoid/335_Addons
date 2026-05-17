--==============================
-- Taxi/Flight functions
--==============================

--- Ends interaction with the Taxi (flight master) UI. Causes the TAXIMAP_CLOSED event to fire, indicating that Taxi APIs may no longer have effects or return valid data.
function CloseTaxiMap() end

--- Returns the number of hops from the current location to another taxi node. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
---@return number numHops Number of hops from the current location to the given node
function GetNumRoutes(index) end

--- Returns the number of flight points on the taxi map. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@return number numNodes Number of flight points on the taxi map
function NumTaxiNodes() end

--- Sets a Texture object to show the appropriate flight map texture. Only has effect while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param texture table A Texture object
function SetTaxiMap(texture) end

--- Embarks on a taxi flight to a given destination. Only has effect while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
function TakeTaxiNode(index) end

--- Returns the horizontal coordinate of a taxi flight's destination node. Used in the default UI to draw lines between nodes; TaxiNodeSetCurrent() should be called first so the client can compute routes.
---@param source number Index of the source flight point (between 1 and NumTaxiNodes() )
---@param dest number Index of the destination flight point (between 1 and NumTaxiNodes() )
---@return number dX X coordinate of the destination taxi node (as a proportion of the taxi map's width; 0 = left edge, 1 = right edge)
function TaxiGetDestX(source, dest) end

--- Returns the vertical coordinate of a taxi flight's destination node. Used in the default UI to draw lines between nodes; TaxiNodeSetCurrent() should be called first so the client can compute routes.
---@param source number Index of the source flight point (between 1 and NumTaxiNodes() )
---@param dest number Index of the destination flight point (between 1 and NumTaxiNodes() )
---@return number dY Y coordinate of the destination taxi node (as a proportion of the taxi map's height; 0 = bottom, 1 = top)
function TaxiGetDestY(source, dest) end

--- Returns the horizontal coordinate of a taxi flight's source node. Used in the default UI to draw lines between nodes; TaxiNodeSetCurrent() should be called first so the client can compute routes.
---@param source number Index of the source flight point (between 1 and NumTaxiNodes() )
---@param dest number Index of the destination flight point (between 1 and NumTaxiNodes() )
---@return number sX X coordinate of the source taxi node (as a proportion of the taxi map's width; 0 = left edge, 1 = right edge)
function TaxiGetSrcX(source, dest) end

--- Returns the vertical coordinate of a taxi flight's source node. Used in the default UI to draw lines between nodes; TaxiNodeSetCurrent() should be called first so the client can compute routes.
---@param source number Index of the source flight point (between 1 and NumTaxiNodes() )
---@param dest number Index of the destination flight point (between 1 and NumTaxiNodes() )
---@return number sY Y coordinate of the source taxi node (as a proportion of the taxi map's height; 0 = bottom, 1 = top)
function TaxiGetSrcY(source, dest) end

--- Returns the cost to fly to a given taxi node. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
---@return number cost Price of a flight to the given node (in copper)
function TaxiNodeCost(index) end

--- Returns the type of a flight pont. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
---@return any type Type of the flight point ( string ) CURRENT - The player's current location DISTANT - Unreachable from the current location NONE - Not currently in use REACHABLE - Reachable from the current location
function TaxiNodeGetType(index) end

--- Returns the name of a flight point. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
---@return string name Name of the taxi node
function TaxiNodeName(index) end

--- Returns the position of a flight point on the taxi map. Only returns valid data while interacting with a flight master (i.e. between the TAXIMAP_OPENED and TAXIMAP_CLOSED events).
---@param index number Index of a flight point (between 1 and NumTaxiNodes() )
---@return number x Horizontal coordinate of the taxi node (as a proportion of the taxi map's width; 0 = left edge, 1 = right edge)
---@return number y Vertical coordinate of the taxi node (as a proportion of the taxi map's height; 0 = bottom, 1 = top)
function TaxiNodePosition(index) end

--- Sets the "current" flight path node. Used in the default UI when mousing over a node; tells the client to compute the route paths involving the node (see TaxiGetSrcX() et al).
---@param slot number The internal index of a flight path node
function TaxiNodeSetCurrent(slot) end

--- Returns whether a unit is currently riding a flight path (taxi). Valid for any unit in the player's area of interest, but generally useful only for player -- taxi flights move quickly, so a taxi-riding unit visible to the player will not remain visible for very long.
---@param unit string A unit to query
---@return any onTaxi 1 if the unit is on a taxi; otherwise nil
function UnitOnTaxi(unit) end
