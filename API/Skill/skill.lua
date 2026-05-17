--==============================
-- Skill functions
--==============================

--- Unlearns a skill (used only for professions)
--- Flags: confirmation
---@param index number Index of an entry in the skills list (between 1 and GetNumSkillLines() )
function AbandonSkill(index) end

--- Collapses a group header in the Skills UI
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/CollapseSkillHeader
function CollapseSkillHeader() end

--- Expands a group header in the Skills UI
---@param index number Index of an entry in the skills list (between 1 and GetNumSkillLines() )
function ExpandSkillHeader(index) end

--- This function no longer exists in the current version of World of Warcraft
---@return number numSkills Number of skills and headers to be displayed in the Skills UI
function GetNumSkillLines() end

--- Returns the index of the selected skill in the Skills UI
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetSelectedSkill
function GetSelectedSkill() end

--- Returns information about an entry in the Skills UI list
---@param index number The index of the skill line
---@return string skillName The name of the skill
---@return any header 1 if the skill line is a header, instead of a skill
---@return any isExpanded 1 if the skill line is a header and is expanded, otherwise nil
---@return number skillRank The rank of the skill
---@return number numTempPoints The temporary profession rank increase (for example 15 for engineering for Gnomes due to the racial trait)
---@return number skillModifier The temporary rank modifier due to buffs, equipment, etc. (for example +Defense gear and the Defense skill)
---@return number skillMaxRank The max rank available
---@return any isAbandonable 1 if the skill can be unlearnt, otherwise nil
---@return number stepCost Unused return value
---@return number rankCost Unused return value
---@return number minLevel The minimum level required to learn the skill
---@return number skillCostType Unused return value
---@return string skillDescription The description of the skill
function GetSkillLineInfo(index) end

--- Selects a skill in the Skills UI
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/SetSelectedSkill
function SetSelectedSkill() end
