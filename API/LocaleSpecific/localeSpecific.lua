--==============================
-- Locale-specific functions
--==============================

--- Returns suggested declensions for a name. In the Russian language, nouns (including proper names) take different form based on their usage in a sentence. When the player enters the base name for a character or pet, the game suggests one or more sets of variations for the five additional cases; the player is asked to choose from among the suggestions and/or enter their own. (The set of declensions ultimately chosen/entered by the player are only used internally and not available to addons.)
---@param name string Nominative form of the player's or pet's name
---@param gender any Gender for the returned names (for declensions of the player's name, should match the player's gender; for the pet's name, should be neuter) ( number ) 1or nil - Neuter 2 - Male 3 - Female
---@param declensionSet number Index of a set of suggested declensions (between 1 and GetNumDeclensionSets(name,gender) . Lower indices correspond to "better" suggestions for the given name.
---@return string genitive Genitive form of the name
---@return string dative Dative form of the name
---@return string accusative Accusative form of the name
---@return string instrumental Instrumental form of the name
---@return string prepositional Prepositional form of the name
function DeclineName(name, gender, declensionSet) end

--- Fills a table with localized class names keyed by non-localized class tokens. Note that while localized class names have no gender in English, other locales have different names for each gender.
---@param table number An empty table to be filled
---@param female boolean True to fill the table with female class names; false or omitted to fill it with male class names
function FillLocalizedClassList(table, female) end

--- Returns the number of suggested declension sets for a name. Used in the Russian localized World of Warcraft client; see DeclineName for further details. Returns 0 in other locales.
---@param name string Nominative form of the player's or pet's name
---@param gender any Gender for names (for declensions of the player's name, should match the player's gender; for the pet's name, should be neuter) ( number ) 1 or nil - Neuter 2 - Male 3 - Female
---@return number numSets Number of available declension sets usable with DeclineName
function GetNumDeclensionSets(name, gender) end
