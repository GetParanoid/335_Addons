--==============================
-- Mail functions
--==============================

--- Automatically takes any attached items and money from a mail. If the mail does not have body text (which can be saved as a permanent copy), also deletes the mail.
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
function AutoLootMailItem(mailID) end

--- Requests information on the player's mailbox contents from the server server
--- Flags: server
function CheckInbox() end

--- Clears any text, items, or money from the mail message to be sent
function ClearSendMail() end

--- Ends interaction with a mailbox. Fires the MAIL_CLOSED event, indicating that Mail/Inbox APIs may no longer have effects or return valid data.
function CloseMail() end

--- Deletes a mail from the player's inbox
--- Flags: confirmation
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
function DeleteInboxItem(mailID) end

--- Returns information about a mail in the player's inbox
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
---@return string packageIcon Path to an icon texture for the message if it contains an item; nil for other messages
---@return string stationeryIcon Path to an icon texture for the message
---@return string sender Name of the mail's sender
---@return string subject Subject text of the mail
---@return number money Amount of money attached to the mail (in copper)
---@return number CODAmount Cash-On-Delivery cost to take any items attached to the mail (in copper)
---@return number daysLeft Number of days remaining before the mail is automatically returned or deleted
---@return number itemCount Number of item attachments to the mail
---@return any wasRead 1 if the player has read the mail; otherwise nil
---@return any wasReturned 1 if the mail was sent by the player to another character and returned by the recipient; otherwise nil
---@return any textCreated 1 if the player has saved a copy of the mail text as an item; otherwise nil
---@return any canReply 1 if the player can reply to the mail; otherwise nil
---@return any isGM 1 if the mail is from a game master; otherwise nil
---@return number itemQuantity Number of stacked items attached to the mail if the mail has one attachment; nil if the mail has zero or multiple attachments
function GetInboxHeaderInfo(mailID) end

--- Returns information for an item attached to a message in the player's inbox
---@param mailID number Index of a message in the player's inbox (between 1 and GetInboxNumItems() )
---@param attachmentIndex number Index of an attachment to the message (between 1 and select(8, GetInboxHeaderInfo(mailID) ) )
---@return string name Name of the item
---@return string itemTexture Path to an icon texture for the item
---@return number count Number of stacked items
---@return number quality Quality (rarity) of the item
---@return any canUse 1 if the player can use or equip the item; otherwise nil
function GetInboxItem(mailID, attachmentIndex) end

--- Returns the number of mails in the player's inbox
---@return number numItems Number of mails in the player's inbox
---@return number totalItems Total number of items both in the inbox and on the server.
function GetInboxNumItems() end

--- Returns information about the text of an inbox mail. Also marks the mail as read if it wasn't already.
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
---@return string bodyText Text of the mail
---@return string texture Unique part of the path to a background texture to be displayed for the message; actual texture paths are STATIONERY_PATH .. texture .. "1" and STATIONERY_PATH .. texture .. "2"
---@return any isTakeable 1 if the text of the mail can be saved as an item; otherwise nil
---@return any isInvoice 1 if the mail is an auction house invoice; otherwise nil
function GetInboxText(mailID) end

--- Returns the names of the last three senders of new mail. Returns sender names for new messages which the player has not yet seen in the mailbox; returns nothing if the player's inbox only contains unread messages which have been seen in the mailbox listing but not yet opened.
---@return string sender1 Name of a recent message's sender
---@return string sender2 Name of a recent message's sender
---@return string sender3 Name of a recent message's sender
function GetLatestThreeSenders() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetNumPackages() end

--- Returns the number of available stationery types. Always returns 1; the stationery feature for sending mail is not implemented in the current version of World of Warcraft.
--- Flags: internal
---@return number numStationeries Number of available stationery types
function GetNumStationeries() end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function GetPackageInfo() end

--- Returns the currently selected stationery type. Always returns 1; the stationery feature for sending mail is not implemented in the current version of World of Warcraft.
--- Flags: internal
---@return number index Index of the selected stationery type (between 1 and GetNumStationeries() )
function GetSelectedStationeryTexture() end

--- Returns the Cash-On-Delivery cost of the outgoing message. Returns the amount set via SetSendMailCOD() , which in the default UI is only called once its Send button has been clicked (immediately before sending the message). Thus, does not return the COD amount set in the default UI's Send Mail window.
---@return number amount COD cost for the items attached to the message (in copper)
function GetSendMailCOD() end

--- Returns information for an item attached to the outgoing message
---@param slot number Index of an outgoing attachment slot (between 1 and ATTACHMENTS_MAX_SEND )
---@return string itemName Name of the attachment item
---@return string itemTexture Path to an icon texture for the attachment item
---@return string stackCount Number of stacked items
---@return number quality Quality (rarity) of the attachment item
function GetSendMailItem(slot) end

--- Returns the amount of money to be sent with the outgoing message. Returns the amount set via SetSendMailMoney() , which in the default UI is only called once its Send button has been clicked (immediately before sending the message). Thus, does not return the Send Money amount set in the default UI's Send Mail window.
---@return number amount Amount of money to be sent (in copper)
function GetSendMailMoney() end

--- Returns the cost to send the outgoing mail message. The cost of sending a message rises as more items are attached.
---@return number price Cost to send the outgoing mail message (in copper)
function GetSendMailPrice() end

--- Returns information about a stationery type. Only returns information for the default stationery type; the stationery feature for sending mail is not implemented in the current version of World of Warcraft.
--- Flags: internal
---@param index number Index of a stationery type (between 1 and GetNumStationeries() )
---@return string name Name of the stationery type
---@return string texture Path to an icon texture for the stationery type
---@return number cost Cost to use the stationery when sending a message, in addition to normal postage (in copper)
function GetStationeryInfo(index) end

--- Returns whether the player has received new mail since last visiting a mailbox
---@return any hasMail 1 if the player has received new mail since last visiting a mailbox; otherwise nil
function HasNewMail() end

--- Returns whether a message in the player's inbox can be deleted
---@param mailID number Index of a message in the player's inbox (between 1 and GetInboxNumItems() )
---@return any canDelete 1 if the message can be deleted; otherwise nil
function InboxItemCanDelete(mailID) end

--- Returns a message in the player's inbox to its sender
---@param mailID number Index of a message in the player's inbox (between 1 and GetInboxNumItems() )
function ReturnInboxItem(mailID) end

--- This function has not been documented.  You could document this function by logging in, and clicking the 'Edit' tab.
--- Flags: deprecated
function SelectPackage() end

--- Selects a given stationery for usage when sending mail. Has no effect; the stationery feature for sending mail is not implemented in the current version of World of Warcraft.
--- Flags: internal
---@param index number Index of a stationery type (between 1 and GetNumStationeries() )
function SelectStationery(index) end

--- Sends the outgoing message. Any money or COD costs and attachments specified for the mail (via SetSendMailMoney() , SetSendMailCOD() , and ClickSendMailItemButton() ) are included with the mail (and the values for such are reset for the next outgoing mail).
---@param recipient string Name of the character to receive the mail
---@param subject string Subject text of the mail
---@param body string Body text of the mail
function SendMail(recipient, subject, body) end

--- Sets the Cash-On-Delivery cost of the outgoing message. Called in the default UI when clicking its Send button, immediately before sending the mail.
---@param amount number COD cost for the items attached to the mail (in copper)
function SetSendMailCOD(amount) end

--- Sets the amount of money to be sent with the outgoing message. Called in the default UI when clicking its Send button, immediately before sending the message. Causes an error message if the amount plus postage exceeds the player's total money.
---@param amount number Amount of money to send (in copper)
---@return any success 1 if the player has enough money to send the message; otherwise nil
function SetSendMailMoney(amount) end

--- Enables or disables shortcuts for attaching items to outgoing mail. When shortcuts are enabled, UseContainerItem() (i.e. right-click in the default UI's container frames) attaches the item to the outgoing message instead of using it.
---@param enable boolean True to enable shortcuts; false to disable
function SetSendMailShowing(enable) end

--- Retrieves an item attachment from a message in the player's inbox (accepting COD charges if applicable)
--- Flags: confirmation
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
---@param attachmentIndex number Index of an attachment to the mail (between 1 and select(8, GetInboxHeaderInfo(mailID) ) )
function TakeInboxItem(mailID, attachmentIndex) end

--- Retrieves any money attached to a mail in the player's inbox
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
function TakeInboxMoney(mailID) end

--- Requests a copy of a mail's body text as an item. The text of an in-game mail can be retrieved as a readable " Plain Letter " item to store in the player's bags; this function sends a request to the server for this item, causing the standard inventory events to fire as the item is placed into the player's inventory.
---@param mailID number Index of a mail in the player's inbox (between 1 and GetInboxNumItems() )
function TakeInboxTextItem(mailID) end
