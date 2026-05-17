--==============================
-- Talent functions
--==============================

--- Spends (or unspends) talent points in the Talent UI's preview mode
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param talentIndex number Index of a talent option (between 1 and GetNumTalents() )
---@param points number Number of points to spend on the talent, or a negative number to unspend points. Values larger than allowed for the talent will be clipped to the maximum value (e.g. attempting to spend ten points on a talent that has five ranks will only spend up to five points).
---@param isPet boolean True to edit talents for the player's pet, false to edit talents for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
function AddPreviewTalentPoints(tabIndex, talentIndex, points, isPet, talentGroup) end

--- Returns whether the player is in range of an NPC that can reset talents. Usable following the CONFIRM_TALENT_WIPE event which fires when the player speaks to an trainer NPC and chooses to reset his or her talents. Used in the default UI to hide the confirmation window for such if the player moves too far away from the NPC.
---@return any inRange 1 if the player is in range of a talent trainer; otherwise nil
function CheckTalentMasterDist() end

--- Resets the player's talents. Usable following the CONFIRM_TALENT_WIPE event which fires when the player speaks to an trainer NPC and chooses to reset his or her talents.
--- Flags: confirmation
function ConfirmTalentWipe() end

--- Returns the index of the active talent specialization
---@param isInspect boolean true to query talent info for the currently inspected unit, false to query talent info for the player
---@param isPet boolean true to query talent info for the player's pet, false to query talent info for the player
---@return any activeTalentGroup Which talent group is currently active ( number ) 1 - Primary Talents 2 - Secondary Talents
function GetActiveTalentGroup(isInspect, isPet) end

--- Returns the total number of points spent in the Talent UI's preview mode.
---@param isPet boolean true to query talent info for the player's pet, false to query talent info for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return number pointsSpent Number of points spent in preview mode
function GetGroupPreviewTalentPointsSpent(isPet, talentGroup) end

--- Returns the number of talent specs a character can switch among
---@param isInspect boolean true to query talent info for the currently inspected unit, false to query talent info for the player
---@param isPet boolean true to query talent info for the player's pet, false to query talent info for the player
---@return any numTalentGroups Number of talent groups the character has enabled ( number ) 1 - Default 2 - The character has purchased Dual Talent Specialization
function GetNumTalentGroups(isInspect, isPet) end

--- Returns the number of talent tabs for the player, pet, or inspect target
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@return number numTabs Number of talent tabs
function GetNumTalentTabs(inspect, pet) end

--- Returns the number of options in a talent tab
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@return number numTalents Number of different talent options
function GetNumTalents(tabIndex, inspect, pet) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetPreviewTalentPointsSpent() end

--- Returns information about a talent option
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param talentIndex number Index of a talent option (between 1 and GetNumTalents() )
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return string name Name of the talent
---@return string iconTexture The icon texture of the talent.
---@return number tier Row in which the talent should be displayed (1 = top)
---@return number column Column in which the talent should be displayed (1 = left)
---@return number rank Number of points spent in the talent
---@return number maxRank Maximum number of points that can be spent in the talent
---@return any isExceptional 1 if the talent confers a new ability (spell); otherwise nil
---@return any meetsPrereq 1 if the prerequisites to learning the talent have been met; otherwise nil
---@return number previewRank Number of points spent in the talent in preview mode
---@return any meetsPreviewPrereq 1 if the prerequisites to learning the talent have been met in preview mode; otherwise nil
function GetTalentInfo(tabIndex, talentIndex, inspect, pet, talentGroup) end

--- Returns information about prerequisites to learning a talent
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param talentIndex number Index of a talent option (between 1 and GetNumTalents() )
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return number tier Row in which the talent's prerequisite is displayed (1 = top)
---@return number column Column in which the talent's prerequisite is displayed (1 = left)
---@return any isLearnable 1 if the talent is learnable; otherwise nil
---@return any isPreviewLearnable 1 if the talent is learnable in preview mode; otherwise nil
function GetTalentPrereqs(tabIndex, talentIndex, inspect, pet, talentGroup) end

--- Returns information about a talent tab
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return number id ID of the talent tab
---@return string name Name of the talent tab
---@return string description Localized summary of the talent tab
---@return string icon Path to an icon texture for the talent tab
---@return number points Number of points spent in the talent tab
---@return string background Path to a background texture for the talent tab
---@return number previewPoints Number of points spent in the talent tab in preview mode
---@return boolean isUnlocked Whether the player can put points into the talent tab or not
function GetTalentTabInfo(tabIndex, inspect, pet, talentGroup) end

--- Returns the number of unused talent points
---@param inspect boolean true to return information for the currently inspected unit; false to return information for the player
---@param pet boolean true to return information for the player's pet; false to return information for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
---@return number points Number of points available for spending
function GetUnspentTalentPoints(inspect, pet, talentGroup) end

--- Commits changes made in the Talent UI's preview mode
--- Flags: confirmation
---@param isPet boolean true to edit talents for the player's pet, false to edit talents for the player
function LearnPreviewTalents(isPet) end

--- Learns a talent, spending one talent point
---@param tabIndex number Index of a talent tab (between 1 and GetNumTalentTabs() )
---@param talentIndex number Index of a talent option (between 1 and GetNumTalents() )
---@param isPet boolean True to edit talents for the player's pet, false to edit talents for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
function LearnTalent(tabIndex, talentIndex, isPet, talentGroup) end

--- Reverts all changes made in the Talent UI's preview mode
---@param isPet boolean true to edit talents for the player's pet, false to edit talents for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
function ResetGroupPreviewTalentPoints(isPet, talentGroup) end

--- Reverts changes made within a specific tab in the Talent UI's preview mode
---@param tabIndex number Index of a talent school/tab (between 1 and GetNumTalentTabs())
---@param isPet boolean true to edit talents for the player's pet, false to edit talents for the player
---@param talentGroup any Which set of talents to edit, if the player has Dual Talent Specialization enabled ( number ) 1 - Primary Talents 2 - Secondary Talents nil - Currently active talents
function ResetPreviewTalentPoints(tabIndex, isPet, talentGroup) end

--- Switches the player's active talent specialization.
---@param talentGroup number Index of the talent specialization to enable
function SetActiveTalentGroup(talentGroup) end
