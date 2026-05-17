--==============================
-- Trainer functions
--==============================

--- Purchases an ability or recipe available from a trainer
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
function BuyTrainerService(index) end

--- Ends interaction with a trainer. Fires the TRAINER_CLOSED event, indicating that Trainer APIs may no longer have effects or return valid data.
function CloseTrainer() end

--- Collapses a group header in the trainer service listing
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/CollapseTrainerSkillLine
function CollapseTrainerSkillLine() end

--- Expands a group header in the trainer service listing
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/ExpandTrainerSkillLine
function ExpandTrainerSkillLine() end

--- Returns the number of entries in the trainer service listing. Entries include both group headers and individual trainer services (i.e spells or recipes to be purchased). Reflects the list as it should currently be displayed, not necessarily the complete list -- if headers are collapsed or a filter is enabled, a smaller number will be returned.
---@return number numServices Number of headers and services to display in the trainer service listing
function GetNumTrainerServices() end

--- Returns the current trainer's greeting text. In the default UI, this text is displayed at the top of the trainer window.
---@return string text Greeting text for the trainer with whom the player is currently interacting
function GetTrainerGreetingText() end

--- Returns the index of the currently selected trainer service. Selection in the recipe list is used only for display in the default UI and has no effect on other Trade Skill APIs.
---@return number selectionIndex Index of the selected entry in the trainer service listing (between 1 and GetNumTrainerServices() )
function GetTrainerSelectionIndex() end

--- Returns information about an ability required for purchasing a trainer service
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@param abilityIndex number Index of one of the service's ability requirements (between 1 and GetTrainerServiceNumAbilityReq(index) )
---@return string ability Name of the required ability
---@return any hasReq 1 if the player has the required ability; otherwise nil
function GetTrainerServiceAbilityReq(index, abilityIndex) end

--- Returns the cost to purchase a trainer service
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return number moneyCost Amount of money required to purchase the service (in copper)
---@return number talentCost Number of talent points required to purchase the service (generally unused)
---@return number skillCost 1 if purchasing the service counts against the player's limit of learnable professions; otherwise 0
function GetTrainerServiceCost(index) end

--- Returns the description of a trainer service. Generally returns the same description found in the spell's tooltip for spells purchased from a class trainer; returns nil for trade skills and recipes.
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string text Description of the service
function GetTrainerServiceDescription(index) end

--- Returns the icon for a trainer service
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string icon Path to an icon texture for the service
function GetTrainerServiceIcon(index) end

--- Returns information about an entry in the trainer service listing
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string serviceName Name of the service
---@return string serviceSubText Secondary text associated with the service (often a spell rank; e.g. "(Rank 4)")
---@return any serviceType Type of service entry ( string ) available - The player can currently use this service header - This entry is a group header, not a trainer service unavailable - The player cannot currently use this service used - The player has already used this service
---@return any isExpanded 1 if the entry is a header which is currently expanded, or if the header containing the entry is expanded; otherwise nil
function GetTrainerServiceInfo(index) end

--- Returns the character level required to purchase a trainer service
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return number reqLevel Level required to purchase the service, or nil if the service has no level requirement
function GetTrainerServiceLevelReq(index) end

--- Returns the number of ability requirements for purchasing a trainer service. Ability requirements are often used for ranked class spells purchased from the trainer: e.g. learning Blood Strike (Rank 3) requires having learned Blood Strike (Rank 2). See GetTrainerServiceAbilityReq() for information about specific ability requirements.
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return number numRequirements Number of different ability requirements for the trainer service
function GetTrainerServiceNumAbilityReq(index) end

--- Returns the name of the skill line associated with a trainer service. For trade skill trainers, skill line is the name of the trade skill (e.g. Tailoring, First Aid). For other trainers, skill line is the name of the group header under which the skill appears (e.g. Riding, Frost, Protection, Holy, Defense, Dual Wield).
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string skillLine Name of the skill line associated with the service
function GetTrainerServiceSkillLine(index) end

--- Returns information about the skill requirement for a trainer service. Often used for trade skill recipes: e.g. Netherweave Bag requires Tailoring (315).
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
---@return string skill Name of the required skill
---@return number rank Rank required in the skill
---@return any hasReq 1 if the player has the required skill and rank; otherwise nil
function GetTrainerServiceSkillReq(index) end

--- This function is deprecated and should no longer be used deprecated
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetTrainerServiceStepIncrease
function GetTrainerServiceStepIncrease() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function GetTrainerServiceStepReq() end

--- Returns whether the trainer service listing is filtered by a service status
---@param type any A trainer service status ( string ) available - Services the player can use unavailable - Services the player cannot currently use used - Services the player has already used
---@return any isEnabled 1 if services matching the filter type are shown in the listing; otherwise nil
function GetTrainerServiceTypeFilter(type) end

--- Returns whether the trainer service listing is filtered by a skill line
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetTrainerSkillLineFilter
function GetTrainerSkillLineFilter() end

--- Returns the list of service group names available at a trainer
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetTrainerSkillLines
function GetTrainerSkillLines() end

--- Returns whether the player is interacting with a trade skill trainer (as opposed to a class trainer)
---@return any isTradeskill 1 if interacting with a trade skill trainer; otherwise nil
function IsTradeskillTrainer() end

--- Returns whether a trainer service is a trade skill level
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/IsTrainerServiceSkillStep
function IsTrainerServiceSkillStep() end

--- . Was used in early betas of World of Warcraft before trainer NPCs existed. Only remaining use is equivalent to CloseTrainer() .
--- Flags: deprecated
function OpenTrainer() end

--- Selects an entry in the trainer service listing. Selection in the service list is used only for display in the default UI and has no effect on other Trainer APIs.
---@param index number Index of an entry in the trainer service listing (between 1 and GetNumTrainerServices() )
function SelectTrainerService(index) end

--- Filters the trainer service listing by service status
---@param type any A service status ( string ) available - Services the player can use unavailable - Services the player cannot currently use used - Services the player has already used
---@param enable number 1 to show services matching type in the filtered list; 0 to hide them
---@param exclusive any 1 to disable other type filters when enabling this one; otherwise nil
function SetTrainerServiceTypeFilter(type, enable, exclusive) end

--- Filters the trainer service listing by skill line. The default UI does not provide control for skill line filters, but they can nonetheless be used to alter the contents of the trainer service listing.
---@param type string Index of a skill line filter (in the list returned by GetTrainerSkillLines() )
---@param enable number 1 to show services matching the given skill line in the filtered list; 0 to hide them
---@param exclusive any 1 to disable other skill line filters when enabling this one; otherwise nil
function SetTrainerSkillLineFilter(type, enable, exclusive) end
