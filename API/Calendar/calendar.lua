--==============================
-- Calendar functions
--==============================

--- Saves the event recently created (and selected for editing) to the calendar. Until this function is called, an event created with CalendarNewEvent() , CalendarNewGuildEvent() , or CalendarNewGuildAnnouncement() will not exist on the calendar -- that is, guild members or invitees will not see it, and it will not persist if the player closes the calendar, reloads the UI, or goes to view or edit another event.
function CalendarAddEvent() end

--- Returns whether the player can add an event to the calendar
---@return boolean canAdd True if the player can add an event to the calendar; otherwise false
function CalendarCanAddEvent() end

--- Returns whether the player can invite others to a calendar event
---@return boolean canInvite True if the player can invite others to a calendar event; otherwise false
function CalendarCanSendInvite() end

--- Deselects (ends viewing/editing on) an event. After calling this function, results of attempting to query or change event information are not guaranteed until a new event is created or another existing event is opened.
function CalendarCloseEvent() end

--- Clears the event selection used only for CalendarContext functions. The selection state cleared by this function is used only by other CalendarContext functions; other calendar event functions use the selection state set by CalendarOpenEvent , CalendarNewEvent , CalendarNewGuildEvent , or CalendarNewGuildAnnouncement (if they use a selection state at all).
function CalendarContextDeselectEvent() end

--- Returns whether the player can report an event invitation as spam. If all arguments are omitted, uses the event selected by CalendarContextSelectEvent .
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
---@return boolean canReport true if the player can report the event as spam; otherwise false
function CalendarContextEventCanComplain(monthOffset, day, index) end

--- Returns whether the player can edit an event
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
---@return boolean canEdit True if the player can edit the event
function CalendarContextEventCanEdit(monthOffset, day, index) end

--- Returns whether the player can paste an event
---@return boolean canPaste true if an event has been copied via CalendarContextEventCopy ; otherwise false
function CalendarContextEventClipboard() end

--- Reports an event invitation as spam
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
function CalendarContextEventComplain(monthOffset, day, index) end

--- Copies an event for later pasting
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
function CalendarContextEventCopy(monthOffset, day, index) end

--- Returns the type of a calendar event. If all arguments are omitted, uses the event selected by CalendarContextSelectEvent .
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
---@return any calendarType Token identifying the type of event ( string ) GUILD_ANNOUNCEMENT - Guild announcement (does not allow players to sign up) GUILD_EVENT - Guild event (allows players to sign up) HOLIDAY - World event (e.g. Lunar Festival, Darkmoon Faire, Stranglethorn Fishing Tournament, Call to Arms: Arathi Basin) PLAYER - Player-created event or invitation RAID_LOCKOUT - Indicates when one of the player's saved instances resets RAID_RESET - Indicates scheduled reset times for major raid instances SYSTEM - Other server-provided event
function CalendarContextEventGetCalendarType(monthOffset, day, index) end

--- Pastes a copied event into a given date. Does nothing if no event has been copied via CalendarContextEventCopy .
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month
---@param day number Day of the month
function CalendarContextEventPaste(monthOffset, day) end

--- Deletes an event from the calendar
--- Flags: confirmation
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents() )
function CalendarContextEventRemove(monthOffset, day, index) end

--- Signs the player up for a guild event
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextEventSignUp(monthOffset, day, index) end

--- Returns the month, day, and index of the event selection used only for CalendarContext functions. The selection state referenced by this function is used only by other CalendarContext functions; other calendar event functions use the selection state set by CalendarOpenEvent , CalendarNewEvent , CalendarNewGuildEvent , or CalendarNewGuildAnnouncement (if they use a selection state at all).
---@return any monthOffset Month relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month
---@return number day Day of the month
---@return number index Index of the event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextGetEventIndex() end

--- Accepts an event invitation
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextInviteAvailable(monthOffset, day, index) end

--- Declines an event invitation
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextInviteDecline(monthOffset, day, index) end

--- Returns whether the player has been invited to an event and not yet responded
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return boolean pendingInvite True if the player is invited to the event and has yet to respond; otherwise false
function CalendarContextInviteIsPending(monthOffset, day, index) end

--- Returns the player's moderator status for an event
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return any modStatus The player's level of authority for the event, or "" if not applicable ( number ) CREATOR - The player is the original creator of the event MODERATOR - The player has been granted moderator status for the event
function CalendarContextInviteModeratorStatus(monthOffset, day, index) end

--- Removes an invitation from the player's calendar or removes the player from a guild event's signup list
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextInviteRemove(monthOffset, day, index) end

--- Returns the player's invite status for an event
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return any inviteStatus The player's status regarding the event ( number ) 1 - Invited (also used for non-invitation/non-signup events) 2 - Accepted 3 - Declined 4 - Confirmed 5 - Out 6 - Standby 7 - Signed up 8 - Not signed up
function CalendarContextInviteStatus(monthOffset, day, index) end

--- Returns the invite type for an event
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return any inviteType Invitation/announcement type for the event ( number ) 1 - Characters can only be explicitly invited to the event (or event is a non-invite/non-signup event) 2 - Event is visible to the player's entire guild; guild members can sign up and other characters can be explicitly invited
function CalendarContextInviteType(monthOffset, day, index) end

--- Selects an event for use only with other CalendarContext functions. The selection state set by this function is used only by other CalendarContext functions; other calendar event functions use the selection state set by CalendarOpenEvent , CalendarNewEvent , CalendarNewGuildEvent , or CalendarNewGuildAnnouncement (if they use a selection state at all).
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month nil - Use the event selected by CalendarContextSelectEvent and ignore further arguments
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarContextSelectEvent(monthOffset, day, index) end

--- Returns default options for the guild member Mass Invite filter
---@return number minLevel Lowest level of characters to invite
---@return number maxLevel Highest level of characters to invite
---@return number rank Lowest guild rank of characters to invite
function CalendarDefaultGuildFilter() end

--- Accepts invitation to the selected calendar event. Only applies to player-created events and invitations sent by other players; has no effect if the current calendar event is of another type.
function CalendarEventAvailable() end

--- Returns whether the player can edit the selected calendar event
---@return boolean canEdit True if the player can edit the current event; otherwise false
function CalendarEventCanEdit() end

--- Returns whether an event invitee can be granted moderator authority
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites() )
---@return boolean canModerate True if the given character can be given moderator authority for the event; otherwise false
function CalendarEventCanModerate(index) end

--- Disables the auto-approve feature (currently unused) for the selected calendar event
function CalendarEventClearAutoApprove() end

--- Unlocks the selected calendar event. Locked events do not allow invitees to respond or guild members to sign up, but can still be edited.
function CalendarEventClearLocked() end

--- Removes moderator status from a character on the selected event's invite/signup list. Moderators can change the status of characters on the invite/signup list and invite more characters, but cannot otherwise edit the event.
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
function CalendarEventClearModerator(index) end

--- Declines invitation to the selected calendar event. Only applies to player-created events and invitations sent by other players; has no effect if the current calendar event is of another type.
function CalendarEventDecline() end

--- Returns the type of the selected calendar event
---@return any calendarType Token identifying the type of event ( string ) GUILD_ANNOUNCEMENT - Guild announcement (does not allow players to sign up) GUILD_EVENT - Guild event (allows players to sign up) PLAYER - Player-created event or invitation
function CalendarEventGetCalendarType() end

--- Returns information about an entry in the selected event's invite/signup list
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites() )
---@return string name Name of the character
---@return number level The character's current level
---@return string className Localized name of the character's class
---@return string classFileName Non-localized token representing the character's class
---@return any inviteStatus The character's status regarding the event ( number ) 1 - Invited 2 - Accepted 3 - Declined 4 - Confirmed 5 - Out 6 - Standby 7 - Signed up
---@return any modStatus The character's level of authority for the event, or "" if not applicable ( number ) CREATOR - The character is the original creator of the event MODERATOR - The character has been granted moderator status for the event
---@return boolean inviteIsMine True if this list entry represents the player; otherwise false
---@return any inviteType Invitation/announcement type for the event ( number ) 1 - Characters can only be explicitly invited to the event 2 - Event is visible to the player's entire guild; guild members can sign up and other characters can be explicitly invited
function CalendarEventGetInvite(index) end

--- Returns the time at which a character on the selected event's invite/signup list responded. Returns all zeros if the character has not yet responded or is the event's creator.
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
---@return number hour Hour part of the time (on a 24-hour clock)
---@return number minute Minute part of the time
function CalendarEventGetInviteResponseTime(index) end

--- Returns the current sort mode for the event invite/signup list
---@return any criterion Token identifying the attribute used for sorting the list ( string ) class - Sorted by character class (according to the global table CLASS_SORT_ORDER ) name - Sorted by character name status - Sorted by invite status
---@return boolean reverse True if the list is sorted in reverse order; otherwise false
function CalendarEventGetInviteSortCriterion() end

--- Returns the number of characters on the selected calendar event's invite/signup list
---@return number numInvites Number of characters on the event's invite/signup list
function CalendarEventGetNumInvites() end

--- Returns a list of localized event repetition option labels (currently unused)
function CalendarEventGetRepeatOptions() end

--- Returns the index of the selected entry on the selected event's invite/signup list. In the current default UI, selection behavior in the invite list is implemented but disabled; selecting an invite list entry has no effect on the behavior of other APIs.
---@return number index Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites()), or 0 if no selection has been made
function CalendarEventGetSelectedInvite() end

--- Returns a list of localized invite status labels
function CalendarEventGetStatusOptions() end

--- Returns a list of instance names and icons for dungeon or raid events
---@param eventType any Type (display style) of event to query ( number ) 1 - Raid dungeon 2 - Five-player dungeon
---@return string name Name of an instance (may include heroic designation)
---@return string icon Unique part of the path to the instance's icon texture; for the full path, prepend with "Interface\LFGFrame\LFGIcon-"
---@return number expansion Expansion to which the instance belongs; localized names can be found in the constants EXPANSION_NAME0 , EXPANSION_NAME1 , etc.
function CalendarEventGetTextures(eventType) end

--- Returns a list of event display style labels
function CalendarEventGetTypes() end

--- Returns whether the player has been invited to the selected event and not yet responded
---@return boolean pendingInvite True if the player has been invited to the event and not yet responded; otherwise false
function CalendarEventHasPendingInvite() end

--- Returns whether the selected event has unsaved changes
---@return boolean settingsChanged True if any of the event's attributes have been changed since the event was last saved; otherwise false
function CalendarEventHaveSettingsChanged() end

--- Attempts to invite a character to the selected event. If successful, the CALENDAR_UPDATE_INVITE_LIST event fires indicating the character has been added to the invite list; otherwise the CALENDAR_UPDATE_ERROR event fires containing a localized error message.
---@param name string Name of a character to invite
function CalendarEventInvite(name) end

--- Returns whether the player has moderator status for the selected calendar event. Also returns true if the player is the event's creator.
---@return boolean isModerator True if the player has moderator status for the event; otherwise false
function CalendarEventIsModerator() end

--- Removes a character from the selected event's invite/signup list. Cannot be used to remove the event's creator (fires a CALENDAR_UPDATE_ERROR event with nil error message if such is attempted).
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
function CalendarEventRemoveInvite(index) end

--- Selects an entry in the selected event's invite/signup list. In the current default UI, selection behavior in the invite list is implemented but disabled; selecting an invite list entry has no effect on the behavior of other APIs.
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
function CalendarEventSelectInvite(index) end

--- Enables the auto-approve feature (currently unused) for the selected calendar event
function CalendarEventSetAutoApprove() end

--- Changes the scheduled date of the selected calendar event
---@param month number Index of the month (starting at 1 = January)
---@param day number Day of the month
---@param year number Year (full four-digit year)
function CalendarEventSetDate(month, day, year) end

--- Changes the descriptive text for the selected event
function CalendarEventSetDescription() end

--- Locks the selected calendar event. Locked events do not allow invitees to respond or guild members to sign up, but can still be edited.
function CalendarEventSetLocked() end

--- Changes the lockout date associated with the selected event (currently unused). This feature is not enabled in the current version of World of Warcraft; saving an event in which the lockout date has been changed will revert it to its default of 1, 1, 1, 2000 (January 1, 2000).
---@param month number Index of the month (starting at 1 = January)
---@param day number Day of the month
---@param year number Year (full four-digit year)
function CalendarEventSetLockoutDate(month, day, year) end

--- Changes the lockout time associated with the selected event (currently unused). This feature is not enabled in the current version of World of Warcraft; saving an event in which the lockout time has been changed will revert it to its default of 0, 0 (midnight).
---@param hour number Hour part of the time (on a 24-hour clock)
---@param minute number Minute part of the time
function CalendarEventSetLockoutTime(hour, minute) end

--- Grants moderator status to a character on the selected event's invite/signup list. Moderators can change the status of characters on the invite/signup list and invite more characters, but cannot otherwise edit the event.
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
function CalendarEventSetModerator(index) end

--- Changes the repetition option for the selected event (currently unused). This feature is not enabled in the current version of World of Warcraft; saving an event in which the repeat option has been changed will revert it to its default of 1 (Never).
---@param title number Index of a repeating event option; see CalendarEventGetRepeatOptions()
function CalendarEventSetRepeatOption(title) end

--- Changes the maximum number of invites/signups for the selected event (currently unused). This feature is not enabled in the current version of World of Warcraft; saving an event in which the max size has been changed will revert it to its default of 100.
---@param size number Maximum number of invites/signups for the event
function CalendarEventSetSize(size) end

--- Sets the status of a character on the selected event's invite/signup list
---@param index number Index of a character on the event's invite list (between 1 and CalendarEventGetNumInvites())
---@param inviteStatus any The player's status regarding the event ( number ) 1 - Invited (also used for non-invitation/non-signup events) 2 - Accepted 3 - Declined 4 - Confirmed 5 - Out 6 - Standby 7 - Signed up 8 - Not signed up
function CalendarEventSetStatus(index, inviteStatus) end

--- Changes the raid or dungeon instance for the selected event. Only applicable if the event's eventType is set to 1 or 2 (see CalendarEventSetType ).
---@param index number Index of a dungeon or raid instance
function CalendarEventSetTextureID(index) end

--- Changes the scheduled time of the selected event
---@param hour number Hour part of the time (on a 24-hour clock)
---@param minute number Minute part of the time
function CalendarEventSetTime(hour, minute) end

--- Changes the title for the selected event
---@param title string A title to be displayed for the event
function CalendarEventSetTitle(title) end

--- Changes the display type of the selected event
---@param eventType any Display type for the event; used in the default UI to determine which icon to show ( number ) 1 - Raid dungeon 2 - Five-player dungeon 3 - PvP event 4 - Meeting 5 - Other event
function CalendarEventSetType(eventType) end

--- Signs the player up for the selected calendar event. Only applies to guild events; has no effect if called when the current calendar event is not a guild event.
function CalendarEventSignUp() end

--- Sorts the event invite/signup list. Does not cause the list to automatically remain sorted; e.g. if sorted by status and a character's status is changed, the list will not be resorted until this function is called again.
---@param criterion any Token identifying the attribute to use for sorting the list ( string ) class - Sort by character class (according to the global table CLASS_SORT_ORDER ) name - Sort by character name status - Sort by invite status
---@param reverse boolean True to sort the lis in reverse order; otherwise false
function CalendarEventSortInvites(criterion, reverse) end

--- Returns date information for a given month and year. Note: This function is broken in WoW 3.1.1, but is expected to work as described in WoW Patch 3.2.0 and later.
---@param month number Index of a month (starting at 1 = January)
---@param year number Year (full four-digit year)
---@return number month Index of the month (starting at 1 = January)
---@return number year Year (full four-digit year)
---@return number numDays Number of days in the month
---@return number firstWeekday Index of the weekday (starting at 1 = Sunday) for the first day of the month
function CalendarGetAbsMonth(month, year) end

--- Returns the current date (in the server's time zone). Only returns valid information after the PLAYER_LOGIN event has fired.
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
function CalendarGetDate() end

--- Returns information about a calendar event on a given day. Information can only be retrieved for events which might be visible in the calendar's current month -- i.e. those in the current month as well as those in (roughly) the last week of the previous month and (roughly) the first two weeks of the following month. To reliably retrieve information for events outside the calendar's current month, first change the calendar's month with CalendarSetMonth .
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month
---@param day number Day of the month containing an event
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return string title Title displayed for the event
---@return number hour Hour part of the event's start time (on a 24-hour clock)
---@return number minute Minute part of the event's start time
---@return any calendarType Token identifying the type of event ( string ) GUILD_ANNOUNCEMENT - Guild announcement (does not allow players to sign up) GUILD_EVENT - Guild event (allows players to sign up) HOLIDAY - World event (e.g. Lunar Festival, Darkmoon Faire, Stranglethorn Fishing Tournament, Call to Arms: Arathi Basin) PLAYER - Player-created event or invitation RAID_LOCKOUT - Indicates when one of the player's saved instances resets RAID_RESET - Indicates scheduled reset times for major raid instances SYSTEM - Other server-provided event
---@return any sequenceType Display cue for multi-day events, or "" if not applicable ( string ) END - Last day of the event INFO - An additional specially-labeled day related the event ONGOING - Continuation of the event START - First day of the event
---@return any eventType Display type for the event; used in the default UI to determine which icon to show ( number ) 0 - Holiday or other server-provided event 1 - Raid dungeon 2 - Five-player dungeon 3 - PvP event 4 - Meeting 5 - Other event
---@return string texture Unique portion of the path to a texture for the event (e.g. "Calendar ChildrensWeek"). The mechanism by which a full texture path can be generated is not public API, but can be found in Addons/Blizzard Calendar/Blizzard_Calendar.lua after extracting default UI files with the AddOn Kit.
---@return any modStatus The player's level of authority for the event, or "" if not applicable ( number ) CREATOR - The player is the original creator of the event MODERATOR - The player has been granted moderator status for the event
---@return any inviteStatus The player's status regarding the event ( number ) 1 - Invited (also used for non-invitation/non-signup events) 2 - Accepted 3 - Declined 4 - Confirmed 5 - Out 6 - Standby 7 - Signed up 8 - Not signed up
---@return string invitedBy Name of the character who created (or invited the player to) the event
---@return any difficulty Difficulty of the dungeon or raid instance associated with the event (used only for RAID_LOCKOUT and RAID_RESET events, not player-created raid/dungeon events) ( number ) 1 - Normal 2 - Heroic
---@return any inviteType Invitation/announcement type for the event ( number ) 1 - Characters can only be explicitly invited to the event (or event is a non-invite/non-signup event) 2 - Event is visible to the player's entire guild; guild members can sign up and other characters can be explicitly invited
function CalendarGetDayEvent(monthOffset, day, index) end

--- Returns the month, day, and index of the selected calendar event
---@return any monthOffset Month relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month
---@return number day Day of the month
---@return number index Index of the event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarGetEventIndex() end

--- Returns information about the selected calendar event (for player/guild events)
---@return string title Title displayed for the event
---@return string description Descriptive text about the event
---@return string creator Name of the character who created the event
---@return any eventType Display style for the event; used in the default UI to determine which icon to show ( number ) 1 - Raid dungeon 2 - Five-player dungeon 3 - PvP event 4 - Meeting 5 - Other event
---@return number repeatOption Index of an event repetition option (see CalendarEventGetRepeatOptions); currently unused (always 1)
---@return number maxSize Maximum number of invites/signups; currently unused (always 100)
---@return number textureIndex Index of the dungeon or raid instance (between 1 and select("#", CalendarEventGetTextures(eventType)) / 3
---@return number weekday Index of the day of the week on which the event starts (starting at 1 = Sunday)
---@return number month Index of the month in which the event starts (starting at 1 = January)
---@return number day Day of the month on which the event starts
---@return number year Year in which the event starts (full four-digit year)
---@return number hour Hour part of the event's start time (on a 24-hour clock)
---@return number minute Minute part of the event's start time
---@return number lockoutWeekday Currently unused
---@return number lockoutMonth Currently unused
---@return number lockoutDay Currently unused
---@return number lockoutYear Currently unused
---@return number lockoutHour Currently unused
---@return number lockoutMinute Currently unused
---@return any locked 1 if the event is locked (preventing invitees from responding); otherwise nil
---@return any autoApprove 1 if signups to the event should be automatically approved (currently unused); otherwise nil
---@return any pendingInvite 1 if the player has been invited to this event and has not yet responded; otherwise nil
---@return any inviteStatus The player's status regarding the event ( number ) 1 - Invited 2 - Accepted 3 - Declined 4 - Confirmed 5 - Out 6 - Standby 7 - Signed up 8 - Not signed up
---@return any inviteType Invitation/announcement type for the event ( number ) 1 - Player has been explicitly invited to the event and can accept or decline 2 - Event is visible to the player's entire guild; player can sign up if desired
---@return any calendarType Token identifying the type of event ( string ) GUILD_ANNOUNCEMENT - Guild announcement (does not allow players to sign up) GUILD_EVENT - Guild event (allows players to sign up) PLAYER - Player-created event or invitation SYSTEM - Other server-provided event
function CalendarGetEventInfo() end

--- Returns the index of the first invitation on a given day to which the player has not responded
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month)
---@param day number Day of the month to query
---@return number index Index of the event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarGetFirstPendingInvite(monthOffset, day) end

--- Returns additional information about a holiday event. Information can only be retrieved for events which might be visible in the calendar's current month -- i.e. those in the current month as well as those in (roughly) the last week of the previous month and (roughly) the first two weeks of the following month. To reliably retrieve information for events outside the calendar's current month, first change the calendar's month with CalendarSetMonth .
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month)
---@param day number Day of the month to query
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return string name Localized name of the event
---@return string description Localized text describing the event
---@return string texture Unique portion of the path to a texture for the event (e.g. "Calendar ChildrensWeek"). The mechanism by which a full texture path can be generated is not public API, but can be found in Addons/Blizzard Calendar/Blizzard_Calendar.lua after extracting default UI files with the AddOn Kit.
function CalendarGetHolidayInfo(monthOffset, day, index) end

--- Returns the latest date for which events may be scheduled. Currently, events can only be created up to one year from the last day of the current month (e.g. If the current date is May 19, 2009, the player is not allowed to create events scheduled for later than May 31, 2010). The default Calendar UI also does not allow viewing months beyond this date.
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
function CalendarGetMaxCreateDate() end

--- Returns the latest date usable in the calendar system. This function currently always returns December 31st, 2030 as the max date.
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
function CalendarGetMaxDate() end

--- Returns the earliest date usable in the calendar system. This function currently returns November 24th, 2004 as the minimum date.  This is the date that World of Warcraft was launched in the U.S.
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
function CalendarGetMinDate() end

--- Returns the earliest date for which information about past player events is available. Applies to events created by the player, invites the player accepted, and guild events or announcements. Currently, the default UI only shows past events from up to two weeks before the current date.
---@return number weekday Index of the day of the week (starting at 1 = Sunday)
---@return number month Index of the month (starting at 1 = January)
---@return number day Day of the month
---@return number year Year (full four-digit year)
function CalendarGetMinHistoryDate() end

--- Returns information about a calendar month
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month). Defaults to the calendar's current month if omitted.
---@return number month Index of the month (starting at 1 = January)
---@return number year Year (full four-digit year)
---@return number numDays Number of days in the month
---@return number firstWeekday Index of the weekday (starting at 1 = Sunday) for the first day of the month
function CalendarGetMonth(monthOffset) end

--- Returns a list of localized month names
function CalendarGetMonthNames() end

--- Returns the number of calendar events on a given day
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month)
---@param day number Day of the month to query
---@return number numEvents Number of events on the given day
function CalendarGetNumDayEvents(monthOffset, day) end

--- Returns the number of calendar invitations to which the player has yet to respond
---@return number numInvites Number of pending calendar invitations
function CalendarGetNumPendingInvites() end

--- Returns information about a raid lockout or scheduled raid reset event. Information can only be retrieved for events which might be visible in the calendar's current month -- i.e. those in the current month as well as those in (roughly) the last week of the previous month and (roughly) the first two weeks of the following month. To reliably retrieve information for events outside the calendar's current month, first change the calendar's month with CalendarSetMonth .
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month)
---@param day number Day of the month to query
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
---@return number title Title displayed for the event
---@return any calendarType Token identifying the type of event ( string ) RAID_LOCKOUT - Indicates when one of the player's saved instances resets RAID_RESET - Indicates scheduled reset times for major raid instances
---@return number raidID ID number of the instance to which the player is saved, or 0 if not applicable
---@return number hour Hour part of the time at which the instance resets (on a 24-hour clock)
---@return number minute Minute part of the time at which the instance resets
---@return any difficulty Difficulty of the dungeon or raid instance associated with the event ( number ) 1 - Normal 2 - Heroic
function CalendarGetRaidInfo(monthOffset, day, index) end

--- Returns a list of localized weekday names
function CalendarGetWeekdayNames() end

--- Returns whether an update to calendar information is in progress. Returns true while the client is synchronizing its calendar information from the server; e.g. after calling CalendarOpenEvent, CalendarAddEvent, or CalendarUpdateEvent. During such periods, using other calendar API functions to query or change event information may not have valid orexpected results.
---@return boolean isPending True if an update to calendar information is in progress; otherwise false
function CalendarIsActionPending() end

--- Repopulates the current event's invite list with members of one of the player's arena teams. Clears any invites already listed. Can only be used for events not yet created (i.e. saved to the calendar).
---@param index any Index of an arena team type ( number ) 1 - 2v2 team 2 - 3v3 team 3 - 5v5 team
function CalendarMassInviteArenaTeam(index) end

--- Repopulates the selected event's invite list with members of the player's guild. Clears any invites already listed. Can only be used for events not yet created (i.e. saved to the calendar).
---@param minLevel number Lowest level of characters to invite
---@param maxLevel number Highest level of characters to invite
---@param rank number Lowest guild rank of characters to invite
function CalendarMassInviteGuild(minLevel, maxLevel, rank) end

--- Creates a new event and selects it for viewing/editing
function CalendarNewEvent() end

--- Creates a new guild announcement and selects it for viewing/editing. Guild announcements are visible to all guild members but do not allow signups or invitations.
function CalendarNewGuildAnnouncement() end

--- Creates a new guild event and selects it for viewing/editing. Guild events are visible to all guild members and allow members to sign up (or non-members to be invited).
function CalendarNewGuildEvent() end

--- Selects a calendar event for viewing/editing
---@param monthOffset number Month to query relative to the calendar's currently displayed month (i.e. 0 for current month, 1 for next month, -1 for previous month)
---@param day number Day of the month to query
---@param index number Index of an event on the given day (from 1 to CalendarGetNumDayEvents())
function CalendarOpenEvent(monthOffset, day, index) end

--- Removes the selected event invitation from the player's calendar or removes the player from the selected guild event's signup list. NOTE: May disconnect the player if called when the selected calendar event is not a received invitation or a guild event.
function CalendarRemoveEvent() end

--- Set's the calendar's month to an absolute date
---@param month number Index of the month (starting at 1 = January)
---@param year number Year (full four-digit year); uses current year if omitted
function CalendarSetAbsMonth(month, year) end

--- Sets the calendar's month relative to its current month
---@param monthOffset any Month containing an event relative to the calendar's currently displayed month ( number ) -1 - Month preceding the calendar's current month 0 - The calendar's current month (i.e. same month as CalendarGetMonth()) 1 - Month after the calendar's current month
function CalendarSetMonth(monthOffset) end

--- Saves changes made to the selected event. Until this function is called, changes made to an event will not be saved -- they will not propagate to guild members or invitees, and the event will revert to its previous state if the player closes the calendar, reloads the UI, or goes to view or edit another event.
function CalendarUpdateEvent() end

--- Returns whether the player is allowed to edit guild-wide calendar events
---@return any canEdit 1 if the player can create or edit guild calendar events, otherwise nil
function CanEditGuildEvent() end

--- Queries the server for calendar status information. May cause one or more CALENDAR_UPDATE_* events to fire depending on the contents of the player's calendar. In the default UI, called when the calendar is shown.
--- Flags: server
function OpenCalendar() end
