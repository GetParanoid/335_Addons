--==============================
-- Party functions
--==============================

--- Accepts an invitation to join a party or raid. Usable in response to the PARTY_INVITE_REQUEST event which fires when the player is invited to join a group.  This function does not automatically hide the default UI's group invite dialog; doing such requires calling StaticPopup_Hide("PARTY_INVITE") , but only after the PARTY_MEMBERS_CHANGED event fires indicating the player has successfully joined the group.
function AcceptGroup() end

--- Removes a group role assignment from a member of the player's party or raid. If no unit (or name) is given, removes the role assignment from all members of the party or raid.
--- Flags: protected
---@param assignment any A group role to assign to the unit ( string ) MAINASSIST - Remove the main assist role MAINTANK - Remove the main tank role
---@param unit string A unit in the player's party or raid
---@param name string Name of a unit in the player's party or raid
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function ClearPartyAssignment(assignment, unit, name, exactMatch) end

--- Responds to a ready check
---@param ready any True to report as "ready"; false to report as "not ready"
function ConfirmReadyCheck(ready) end

--- Converts a party to a raid. Only has effect if the player is in a party and the party leader.
function ConvertToRaid() end

--- Declines an invitation to join a party or raid. Usable in response to the PARTY_INVITE_REQUEST event which fires when the player is invited to join a group.
function DeclineGroup() end

--- Initiates a ready check. Only has effect if the player is the party/raid leader or a raid assistant.
function DoReadyCheck() end

--- Returns the number of additional members in the player's party
---@return number numPartyMembers Number of additional members in the player's party (between 1 and MAX_PARTY_MEMBERS , or 0 if the player is not in a party)
function GetNumPartyMembers() end

--- Returns whether a party/raid member is assigned a specific group role
---@param assignment any A group role assignment ( string ) MAINASSIST - Return whether the unit is assigned the main assist role MAINTANK - Return whether the unit is assigned the main tank role
---@param unit string A unit in the player's party or raid
---@param name string Name of a unit in the player's party or raid
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
---@return any isAssigned 1 if the unit is assigned the specified role; otherwise nil
function GetPartyAssignment(assignment, unit, name, exactMatch) end

--- Returns the index of the current party leader. Returns 0 if the player is the party leader or if the player is not in a party.
---@return number index Numeric portion of the party unitID for the party leader (e.g. 3 = party3 )
function GetPartyLeaderIndex() end

--- Returns whether a party member exists at a given index
---@param index number Index of a party member (between 1 and MAX_PARTY_MEMBERS ), or the numeric portion of a party unitID (e.g. 3 = party3 )
---@return any hasMember 1 if the given index corresponds to a member in the player's party; otherwise nil
function GetPartyMember(index) end

--- Returns a unit's status during a ready check. Returns nil for all units unless the player is the party/raid leader or a raid assistant.
---@param unit string A unit in the player's party or raid
---@return any status Ready check status for the unit ( string ) "notready" - Unit has responded as not ready "ready" - Unit has responded as ready "waiting" - Unit has not yet responded nil - No ready check is in progress
function GetReadyCheckStatus(unit) end

--- Returns the amount of time left on the current ready check. Returns 0 if no ready check is in progress.
---@return number timeLeft Amount of time remaining on the ready check (in seconds)
function GetReadyCheckTimeLeft() end

--- Invites a character to the player's party or raid
---@param name string Name of a character to invite
function InviteUnit(name) end

--- Returns whether or not a unit is the current party leader
---@param unit any The unit to query
---@return any isLeader 1 if the unit is the party leader, otherwise nil
function IsPartyLeader(unit) end

--- Exits the current party or raid. If there are only two characters in the party or raid, causes the party or raid to be disbanded.
function LeaveParty() end

--- Promotes a player to party/raid leader
---@param unit string A unit in the party or raid
---@param name string Name of a party member
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function PromoteToLeader(unit, name, exactMatch) end

--- Assigns a group role to a member of the player's party or raid
--- Flags: protected
---@param assignment any A group role to assign to the unit ( string ) MAINASSIST - Assign the main assist role MAINTANK - Assign the main tank role
---@param unit string A unit in the player's party or raid
---@param name string Name of a unit in the player's party or raid
---@param exactMatch boolean True to check only units whose name exactly matches the name given; false to allow partial matches
function SetPartyAssignment(assignment, unit, name, exactMatch) end

--- Removes a character from the player's party or raid. Only works if the player is the party leader, raid leader, or raid assistant.
---@param name string Name of a character to uninvite
function UninviteUnit(name) end

--- Returns whether or not a given unit is in the player's party.. This function always returns 1 for the "player" unit.  If the player has a pet, it is not considered part of the party.
---@param unit any The unit to query for party membership
---@return any inParty 1 if the unit is in the player's party, otherwise nil.
function UnitInParty(unit) end

--- Returns whether a unit is the leader of the player's party
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any leader 1 if the unit is the party leader; otherwise nil
function UnitIsPartyLeader(unit, name) end

--- Returns whether a unit is in the player's party or belongs to a party member. Returns nil for the player and the player's pet.
---@param unit string A unit to query
---@param name string The name of a unit to query
---@return any inParty 1 if the unit is in the player's party or is a pet belonging to a party member; otherwise nil
function UnitPlayerOrPetInParty(unit, name) end
