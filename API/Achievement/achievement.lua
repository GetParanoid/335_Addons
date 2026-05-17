--==============================
-- Achievement functions
--==============================

--- Adds an achievement to the objectives tracker UI
---@param id number The numeric ID of an achievement
function AddTrackedAchievement(id) end

--- Returns whether the Achievements UI should be enabled.
---@return boolean canShow true if the Achievements UI should be enabled, otherwise false
function CanShowAchievementUI() end

--- Disables comparing achievements/statistics with another player
function ClearAchievementComparisonUnit() end

--- Returns the numeric ID of the category to which an achievement belongs
---@param achievementID number The numeric ID of an achievement
---@return number categoryID The numeric ID of the achievement's category
function GetAchievementCategory(achievementID) end

--- Returns information about the comparison unit's achievements. Only accurate once the INSPECT_ACHIEVEMENT_READY event has fired following a call to SetAchievementComparisonUnit() . No longer accurate once ClearAchievementComparisonUnit() is called.
---@param id number The numeric ID of an achievement
---@return boolean completed True if the comparison unit has completed the achievement; otherwise nil
---@return number month Month in which the comparison unit completed the achievement
---@return number day Day of the month on which the comparison unit completed the achievement
---@return number year Year in which the comparison unit completed the achievement. (Two digit year, assumed to be 21st century.)
function GetAchievementComparisonInfo(id) end

--- Gets information about criteria for an achievement or data for a statistic
---@param achievementID number The numeric ID of an achievement
---@param index number Index of one of the achievement's criteria (between 1 and GetAchievementNumCriteria())
---@param statisticID number The numeric ID of a statistic
---@return string description Description of the criterion (as displayed in the UI for achievements with multiple criteria) or statistic
---@return number type Type of criterion: a value of 8 indicates the criterion is another achievement; other values are not used in the default UI
---@return boolean completed True if the player has completed the criterion; otherwise false
---@return number quantity If applicable, number of steps taken towards completing the criterion (e.g. for the only criterion of "Did Somebody Order a Knuckle Sandwich?", the player's current Unarmed skill; for the first criterion of "Pest Control", 1 if the player has killed an Adder, 0 otherwise
---@return number requiredQuantity If applicable, number of steps required to complete the criterion (e.g. 400 for the only criterion of "Did Somebody Order a Knuckle Sandwich?"; 1 for any criterion of "Pest Control"
---@return string characterName Character name with which the criterion was completed. Currently always the player character's name for completed criteria
---@return any flags Test against the following masks with bit.band() to reveal additional information: ( bitfield ) 0x00000001 - Criterion should be displayed as a progress bar 0x00000002 - Criterion should be hidden in normal achievement displays
---@return number assetID Internal ID number of the quest to complete, NPC to kill, item to acquire, world object to interact with, achievement to earn, or other game entity related to completing the criterion. (Note: some but not all of these ID types are usable elsewhere in the WoW API)
---@return string quantityString Text to be shown when displaying quantity and requiredQuantity in a UI element. (Not always the same as format("%d / %d", quantity, requiredQuantity) ; e.g. "Got My Mind On My Money" shows monetary amounts with embedded textures for gold, silver, and copper)
---@return number criteriaID Unique ID number identifying the criterion; usable with GetAchievementInfoFromCriteria()
function GetAchievementCriteriaInfo(achievementID, index, statisticID) end

--- Gets information about an achievement or statistic
---@param category number Numeric ID of an achievement category
---@param index number Index of an achievement within a category (between 1 and GetCategoryNumAchievements())
---@param id number The numeric ID of an achievement or statistic
---@return number id The numeric ID of the achievement or statistic
---@return string name Name of the achievement or statistic
---@return number points Amount of achievement points awarded for completing the achievement
---@return boolean completed True if the player has completed the achievement; otherwise false
---@return number month Month in which the player completed the achievement
---@return number day Day of the month on which the player completed the achievement
---@return number year Year in which the player completed the achievement. (Two digit year, assumed to be 21st century.)
---@return string description Description of the achievement
---@return any flags Test against the following masks with bit.band() to reveal additional information: ( bitfield ) 0x00000001 - Info is for a statistic, not an achievement 0x00000002 - Achievement should be hidden in normal displays 0x00000080 - Achievement should display its criteria as a progress bar regardless of per-criterion flags
---@return string icon Path to an icon texture for the achievement
---@return string rewardText Text describing a reward for the achievement, or the empty string if no reward is offered
function GetAchievementInfo(category, index, id) end

--- Gets information about an achievement or statistic given a criterion ID
---@param id number The numeric ID of an achievement or statistic criterion (as can be retrieved from GetAchievementCriteriaInfo())
---@return number id The numeric ID of the achievement or statistic
---@return string name Name of the achievement or statistic
---@return number points Amount of achievement points awarded for completing the achievement
---@return string description Description of the achievement
---@return any flags Test against the following masks with bit.band() to reveal additional information: ( bitfield ) 0x00000001 - Info is for a statistic, not an achievement 0x00000002 - Achievement should be hidden in normal displays 0x00000080 - Achievement should display its criteria as a progress bar regardless of per-criterion flags
---@return string icon Path to an icon texture for the achievement
---@return string rewardText Text describing a reward for the achievement, or the empty string if no reward is offered
function GetAchievementInfoFromCriteria(id) end

--- Returns a hyperlink representing the player's progress on an achievement.
---@param id number The numeric ID of an achievement
---@return string link A hyperlink for the player's achievement
function GetAchievementLink(id) end

--- Returns the number of measured criteria for an achievement.
---@param id number The numeric ID of an achievement
---@return number count Number of criteria for the achievement
function GetAchievementNumCriteria(id) end

--- Returns the number of point rewards for an achievement (currently always 1).
---@param id number The numeric ID of an achievement or statistic
---@return number count Number of point rewards offered for the achievement
function GetAchievementNumRewards(id) end

--- Returns the number of achievement points awarded for earning an achievement.
---@param id number The numeric ID of an achievement or statistic
---@param index number Index of one of the achievement's rewards (between 1 and GetAchievementNumRewards(); currently always 1)
---@return number points Number of achievement points awarded for completing the achievement
function GetAchievementReward(id, index) end

--- Returns information about an achievement/statistic category
---@param id number The numeric ID of an achievement/statistic category
---@return string name Name of the category
---@return number parentID ID of the parent category of which this is a sub-category, or -1 if this is a top-level category
---@return any flags Various additional information about the category; currently unused (0 for all existing categories)
function GetCategoryInfo(id) end

--- Returns a list of all achievement categories
---@return table categories A list of achievement category IDs
function GetCategoryList() end

--- Returns the number of achievements/statistics to display in a category.
---@param id number The numeric ID of an achievement/statistic category
---@return number numItems Number of achievements or statistics to display in the category
---@return number numCompleted Number of completed achievements in the category (or 0 for statistics)
function GetCategoryNumAchievements(id) end

--- Returns the comparison unit's total achievement points earned.
---@return number points Total number of achievement points earned by the comparison unit
function GetComparisonAchievementPoints() end

--- Returns the number of achievements completed by the comparison unit within a category.
---@param id number The numeric ID of an achievement category
---@return number numCompleted Number of achievements completed by the comparison unit in the category
function GetComparisonCategoryNumAchievements(id) end

--- Returns the comparison unit's data for a statistic.
---@param id number The numeric ID of a statistic
---@return string info The comparison unit's data for the statistic, or "--" if none has yet been recorded for it
function GetComparisonStatistic(id) end

--- Returns a list of the player's most recently earned achievements
function GetLatestCompletedAchievements() end

--- Returns a list of the comparison unit's most recently earned achievements
function GetLatestCompletedComparisonAchievements() end

--- Returns a list of the comparison unit's latest updated statistics.
--- Flags: deprecated
function GetLatestUpdatedComparisonStats() end

--- Returns a list of the player's latest updated statistics.
--- Flags: deprecated
function GetLatestUpdatedStats() end

--- Returns the next achievement for an achievement which is part of a series
---@param id number The numeric ID of an achievement
---@return number nextID If the given achievement is part of a series and not the last in its series, the ID of the next achievement in the series; otherwise nil
---@return boolean completed True if the next achievement has been completed; otherwise nil
function GetNextAchievement(id) end

--- Returns the number of achievements earned by the comparison unit.
---@return number total Total number of achievements currently in the game
---@return number completed Number of achievements earned by the comparison unit
function GetNumComparisonCompletedAchievements() end

--- Returns the number of achievements earned by the player.
---@return number total Total number of achievements currently in the game
---@return number completed Number of achievements earned by the player
function GetNumCompletedAchievements() end

--- Returns the number of achievements flagged for display in the objectives tracker UI
---@return number count Number of achievements flagged for tracking
function GetNumTrackedAchievements() end

--- Returns the previous achievement for an achievement which is part of a series
---@param id number The numeric ID of an achievement
---@return number previousID If the given achievement is part of a series and not the first in its series, the ID of the previous achievement in the series; otherwise nil
function GetPreviousAchievement(id) end

--- Returns data for a statistic that can be shown on the statistics tab of the achievements window
---@param id number The numeric ID of a statistic
---@return string info The data for the statistic, or "--" if none has yet been recorded for it
function GetStatistic(id) end

--- Returns a list of all statistic categories
---@return table categories A list of statistic category IDs
function GetStatisticsCategoryList() end

--- Returns the player's total achievement points earned
---@return number points Total number of achievement points earned by the player
function GetTotalAchievementPoints() end

--- Returns numeric IDs of the achievements flagged for display in the objectives tracker UI
function GetTrackedAchievements() end

--- Returns whether an achievement is flagged for display in the objectives tracker UI
---@param id number The numeric ID of an achievement
---@return boolean isTracked True if the achievement is flagged for tracking; otherwise false
function IsTrackedAchievement(id) end

--- Removes an achievement from the objectives tracker UI
---@param id number The numeric ID of an achievement
function RemoveTrackedAchievement(id) end

--- Enables comparing achievements/statistics with another player.
---@param unit any ID of a unit to compare against
---@return any success 1 if the given unit is a valid unit. (Does not indicate whether the unit exists or can be compared against.)
function SetAchievementComparisonUnit(unit) end
