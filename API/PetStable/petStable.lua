--==============================
-- Pet Stable functions
--==============================

--- Purchases the next available stable slot, without confirmation. Only available while interacting with a Stable Master NPC (between the PET_STABLE_SHOW and PET_STABLE_CLOSED events and only if IsAtStableMaster() returns true).
--- Flags: confirmation
function BuyStableSlot() end

--- This function or event no longer exists in version 6.0.2 (19034) of World of Warcraft. Please check the main API page for an up-to-date listing of the valid API functions
---@param index any Index of a stable slot ( number ) 0 - Active pet 1 to NUM_PET_STABLE_SLOTS - A stable slot
---@return any selected 1 if the function selected a stabled pet, rather than placed a pet in the stable slot
function ClickStablePet(index) end

--- Ends use of the Pet Stables UI/API. Causes the PET_STABLE_CLOSED event to fire, indicating that stables-related APIs are no longer valid.
function ClosePetStables() end

--- Returns the cost of the next available stable slot
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetNextStableSlotCost
function GetNextStableSlotCost() end

--- Returns the number of stabled pets. Returned value does not include the current pet.
---@return number numPets Number of pets in the stables
function GetNumStablePets() end

--- Returns the number of stable slots the player has purchased.
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/GetNumStableSlots
function GetNumStableSlots() end

--- Returns the index of the selected stable pet
---@return any selectedPet Index of the currently selected stable pet ( number ) -1 - The player has no pets (in the stables or otherwise) 0 - The active pet is selected 1 to NUM_PET_STABLE_SLOTS - A stable slot is selected
function GetSelectedStablePet() end

--- Returns the types of food that a stabled pet will eat
---@param index any Index of a stable slot ( number ) 0 - Active pet 1 to NUM_PET_STABLE_SLOTS - A stabled pet
function GetStablePetFoodTypes(index) end

--- Returns information about a stabled pet
---@param index any Index of a stable slot ( number ) 0 - Active pet 1 to NUM_PET_STABLE_SLOTS - A stable slot
---@return string icon Path to an icon texture for the pet
---@return string name Name of the pet
---@return number level Level of the pet
---@return string family Localized name of the pet's creature family (e.g. Cat, Bear, Chimaera)
---@return string talent Localized name of the pet's talent tree (e.g. Ferocity, Tenacity, Cunning)
function GetStablePetInfo(index) end

--- Returns whether the player is interacting with a Stable Master NPC. The Pet Stable UI/API can be active without an NPC if the player is using the Call Stabled Pet ability. New stable slots can only be purchased while talking to an NPC -- the default UI uses this function to determine whether to show UI elements related to purchasing slots.
---@return boolean isAtNPC True if the player is interacting with a Stable Master NPC; otherwise false
function IsAtStableMaster() end

--- Sets the given Model to show the selected stabled pet
---@param model table A Model frame
function SetPetStablePaperdoll(model) end

--- Puts the player's current pet into the stables
function StablePet() end

--- Makes a pet from the stables the active pet
--- NOTE: parse failed for https://web.archive.org/web/20100726112636/http://wowprogramming.com/docs/api/UnstablePet
function UnstablePet() end
