--==============================
-- Petition functions
--==============================

--- Purchases an arena team charter
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/BuyPetition
function BuyPetition() end

--- Returns whether the player can sign the currently offered petition. Petitions can only be signed once per account, rather than once per character.
---@return any canSign 1 if the player can sign the offered petition; otherwise nil
function CanSignPetition() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function ClickPetitionButton() end

--- Ends interaction with a petition. Fires the PETITION_CLOSED event, indicating that Petition APIs may no longer have effects or return valid data.
function ClosePetition() end

--- Ends interaction with an arena registrar
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/ClosePetitionVendor
function ClosePetitionVendor() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function GetNumPetitionItems() end

--- Returns the number of people who have signed the open petition
---@return number numNames Number of characters that have signed the petition
function GetNumPetitionNames() end

--- Returns information about the currently open petition
---@return any petitionType Type of the petition ( string ) arena - An arena team charter guild - A guild charter
---@return string title Title of the petition
---@return string bodyText Body text of the petition
---@return number maxSignatures Maximum number of signatures allowed
---@return string originatorName Name of the character who initially purchased the charter
---@return any isOriginator 1 if the player is the petition's originator; otherwise nil
---@return number minSignatures Minimum number of signatures required to establish the charter
function GetPetitionInfo() end

--- Returns information about a purchasable arena team charter
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetPetitionItemInfo
function GetPetitionItemInfo() end

--- Returns the name of a character who has signed the currently offered petition
---@param index number Index of a signature slot on the petition (between 1 and minSignatures , where minSignatures = select(7, GetPetitionInfo() ) )
---@return string name Name of the signatory character, or nil if the slot has not yet been signed
function GetPetitionNameInfo(index) end

--- Returns whether the player has a completed petition
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/HasFilledPetition
function HasFilledPetition() end

--- Requests an arena or guild charter signature from the targeted unit
function OfferPetition() end

--- Renames the guild or arena team to be created by the open petition
---@param name string New name for the guild or arena team
function RenamePetition(name) end

--- Signs the currently offered petition
function SignPetition() end

--- This function is deprecated and should no longer be used deprecated
--- Flags: deprecated
function TurnInPetition() end
