--==============================
-- Barbershop functions
--==============================

--- Purchases the selected barber shop style changes. Does not exit the barber shop session, so further changes are still allowed.
function ApplyBarberShopStyle() end

--- Resets barber shop options to the currently worn styles. Changes the underlying data (and thus the character's appearance) only; the default barbershop UI does not update.
function BarberShopReset() end

--- Lets you check if the player can change their skin color. Returns true if the player can change their skin color while using the barbershop.
---@return boolean canAlter Can the player change skin color
function CanAlterSkin() end

--- Exits a barber shop session. Causes the player character to stand up, returning to the normal world, and fires the BARBER_SHOP_CLOSE event. Any style changes already paid for (with ApplyBarberShopStyle() ) are kept; any changes since are discarded.
function CancelBarberShop() end

--- Returns information about the selected barber shop style option
---@param styleIndex any Index of a style option ( number ) 1 - Hair (or Horn) Style 2 - Hair (or Horn) Color 3 - Varies by race and gender: Facial Hair, Earrings, Features, Hair, Horns, Markings, Normal, Piercings, or Tusks
---@return string name Name of the style option, or nil if the style is not named
---@return string unused Currently unused
---@return number cost Price of applying the style option, not including changes to other style options (in copper)
---@return any isCurrent 1 if the style option matches the character's existing style; otherwise nil
function GetBarberShopStyleInfo(styleIndex) end

--- Returns the total price of selected barber shop style changes
---@return number cost Price of the barber shop style change (in copper)
function GetBarberShopTotalCost() end

--- Returns a token used for displaying facial feature customization options. The token referred to by this function can be used to look up a global variable containing localized names for the customization options available to the player's race at character creation time and in the Barbershop UI; see example.
---@return string token Part of a localized string token for displaying facial feature options for the player's race
function GetFacialHairCustomization() end

--- Returns a token used for displaying "hair" customization options. The token referred to by this function can be used to look up a global variable containing localized names for the customization options available to the player's race at character creation time and in the Barbershop UI; see example.
---@return string token Part of a localized string token for displaying "hair" options for the player's race
function GetHairCustomization() end

--- Selects the next style for a barber shop style option. Changes the underlying data (and thus the character's appearance) only; the default barbershop UI does not update.
---@param styleIndex any Index of a style option ( number ) 1 - Hair (or Horn) Style 2 - Hair (or Horn) Color 3 - Varies by race and gender: Facial Hair, Earrings, Features, Hair, Horns, Markings, Normal, Piercings, or Tusks
---@param reverse boolean True to select the previous style; false or omitted to select the next
function SetNextBarberShopStyle(styleIndex, reverse) end
