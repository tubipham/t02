SQLite format 3   @                �                                                 -�%   �    ����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
"   !      � � �A��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        z h KA�w老����A�(wS����SmartDay iPad - Quick ReferenceA�(wS��� bR AAԛ�(prX��A�(wS����SmartDay - Quick ReferenceA�(wS��'��> 	Aԛ��?�+��Aԛ�F���OfficeAԛ�F��2��= Aԛ�,����	Aԛ�G��2�HomeAԛ�G��P��   @ 	Aԛ��?�+��Aԛ�F���OfficeAԛ�F��2��   �    ����������                                                                                                                                         b d' ��Shopping ListA�t&�t��M� ,A�t?^���Milkb ' ��  �' 	��Shopping ListA�t&��<���M� ,A�t?]�;�Eggs  W' ��Shopping ListA�t&������M� ,AF' ��Shoppin�!  ���A�x�������Q��4A�(w��y�Top MenuTop Menu
- Settings and Main Menu.
- Show / Hide projects
- Manage Tags for easy search and filtering.
- Timer to record time spent on tasks. Also available from any Task.
- Search box. Find anything!�<!  A�U��A�x�������Q��7A�(wj�Q��About this Quick ReferenceAbout this Quick Reference
This guide is organized into our notes section. It appears in a Project called SmartDay iPad - Quick Reference. You can hide this Project from the Show/   $� �       
   	               R R�/�                                                                                                           �2//�tableTaskProgressTableTaskProgressTableCREATE TABLE TaskProgressTable (TaskProgress_ID INTEGER PRIMARY KEY, Task_EndTime NUMERIC, Task_ID NUMERIC, Task_StartTime NUMERIC)~!!�GtableAlertTableAlertTableCREATE TABLE AlertTable (Alert_Data TEXT, Al�2//�tableTaskProgressTableTaskProgressTableCREATE TABLE TaskProgressTable (TaskProgress_ID INTEGER PRIMARY KEY, Task_EndTime NUMERIC, Task_ID NUMERIC, Task_StartTime NUMERIC)~!!�GtableAlertTableAler�2//�tableTaskProgressTableTaskProgressTableCREATE TABLE TaskProgressTable (TaskProgress_ID INTEGER PRIMARY KEY, Task_EndTime NUMERIC, Task_ID NUMERIC, Task_StartTime NUMERIC)~!!�GtableAlertTableAlertTableCREATE TABLE AlertTable (Alert_Data TEXT, Alert_ID INTEGER PRIMARY KEY, Alert_TaskID NUMERIC)w3/�indexTaskProgress_ID_idxTaskProgressTableCREATE INDEX TaskProgress_ID_idx ON TaskProgressTable(TaskProgress_ID)    �����������������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       � 3�	A��6ί��� "K(��	A��.V �u� �A��/}~ �K(��A��/}�V~ �K(�SA��.TFE�~ ��	A��.T K(�U	A��.T}�B "K(�N	A��-��B �A��.RB K(�OA��.R���~ (K(��	A��-�H�`~ K'�SA���S�`B   �K'�SA���Tax�   �	�A���   uA���`��u3A���`H�u   ]A���_��2A���_a�   EKK/"KJګ   5� KK[�6KK[�      �7KK[�   KK�T8KK[��     � `                               �e%%�tableProjectTableProjectTableCREATE TABLE ProjectTable (Project_OwnerName TEXT, Project_ExtraStatus NUMERIC, Project_Transparent NUMERIC, Project_Source NUMERIC, Project_SDWID TEXT, Project_UpdateTime NUMERIC, Project_Stat�e%%�tableProjectTableProjectTableCREATE TABLE ProjectTable (Project_OwnerName TEXT, Project_ExtraStatus NUMERIC, Project_Transparent NUMERIC, Project_Source NUMERIC, Project_SDWID TEXT, Project_UpdateTime NUMERIC, Project_Status NUMERIC, Project_SyncID TEXT, Project_Tag NUMERIC, Project_TaskMappingName TEXT, Project_EventMappingName TEXT, Project_PinnedDeadline NUMERIC, Project_ActualStartTime NUMERIC, Project_YMargin NUMERIC, Project_GoalID NUMERIC, Project_ColorID NUMERIC, Project_CreationTime NUMERIC, Project_EndTime NUMERIC, Project_Hours NUMERIC, Project_ID INTEGER PRIMARY KEY, Project_Name TEXT, Project_SeqNo NUMERIC, Project_StartTime NUMERIC, Project_Type NUMERIC, Project_WorkBalance NUMERIC, Project_LocationID NUMERIC)      ���                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                �  -1.000000|-3600   , -1.000000|-7200    -1.000000|-7200   ' '�                                               �V�{tableTaskTableTaskTableCREATE TABLE TaskTable (Task_TimeZoneOffset NUMERIC, Task_TimeZoneID NUMERIC, Task_ExtraStatus NUMERIC, Task_TimerStatus NUMERIC, Task_Link TEXT, Task_SDWID TEXT, Task_CompletionTime NUMERIC, Task_Me�f''�tableTaskLinkTableTaskLinkTable	CREATE TABLE TaskLinkTable (Dest_AssetType NUMERIC, SDW_ID TEXT, UpdateTime NUMERIC, CreationTime NUMERIC, Status NUMERIC, TaskLink_ID INTEGER PRIMARY KEY, Source_ID NUMERIC, Dest_ID NUMERIC)� �	tableURLTableURLTableCREATE TABLE URLTable (URL_SDWID TEXT, URL_Status NUMERIC, URL_UpdateTime NUMERIC, URL_ID INTEGER PRIMARY KEY, URL_Value TEXT)�O!%%�atableCommentTableCommentTableCREATE TABLE CommentTable (Comment_Type NUMERIC, Comment_Status NUMERIC, Comment_ID INTEGER PRIMARY KEY, Comment_SDWID TEXT, Comment_CreateTime NUMERIC, Comment_UpdateTime NUMERIC, Comment_ItemID NUMERIC, Comment_LastName TEXT, Comment_FirstName TEXT, Comment_IsOwner NUMERIC, Comment_Content TEXT)   � ����        X� ���        W � ���P��X�� J U��      c � ���V��X��                                                                                                                                                                                                                                                                                                �N     
    �   �                �E                               �J                               �Y                               �F                               �F                               �F                               �R                               �I                               �C                               �                                 �                                 �                                 �                                 �  ���������������������������������  �����������������   :  Aԛ��'�Aԛ�('$%&     Aԛ�U��Aԛ๲%%(	  A�(b���FA�({����    �  �  �{#''�5tableLocationTableLocationTableCREATE TABLE LocationTable (Location_ID INTEGER PRIMARY KEY, Location_Name TEXT, Location_Address TEXT, Location_Latitude NUMERIC, Location_Longitude NUMERIC, Location_Inside NUMERIC, Loc�"�etableTaskTableTaskTableCREATE TABLE TaskTable (Task_LocationAlert NUMERIC, Task_TimeZoneOffset NUMERIC, Task_TimeZoneID NUMERIC, Task_ExtraStatus NUMERIC, Task_TimerStatus NUMERIC, Task_Link TEXT, Task_SDWID TEXT, Task_CompletionTime NUMERIC, Task_MergedSeqNo NUMERIC, Task_SyncID TEXT, Task_Tag TEXT, Task_RepeatData TEXT, Task_UpdateTime NUMERIC, Task_Deadline NUMERIC, Task_Type NUMERIC, Task_Status NUMERIC, Task_EndTime NUMERIC, Task_StartTime NUMERIC, Task_CreationTime NUMERIC, Task_GoalID NUMERIC, Task_ContactEmail TEXT, Task_ContactName TEXT, Task_ContactPhone TEXT, Task_Duration NUMERIC, Task_GroupID NUMERIC, Task_ID INTEGER PRIMARY KEY, Task_Location TEXT, Task_Name TEXT, Task_Note TEXT, Task_ProjectID NUMERIC, Task_SeqNo NUMERIC, Task_LocationID NUMERIC)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   7                                             � �_��Aԛ�?�r��Rk}�Aԛ�m��@�Top MenuTop Menu
- iPhone: Main Menu and Timer
- iPad: Main Menu, Show/Hide, Tags, Timer, Search box

❎ Manage Tags for easy search and filtering.
❎ Timer to record time spent on tasks. Start from top menu bar or from any Task.
❎ Search box (iPad): Find anything!
❎ SmartDay automatically pushes any changes you make, up to SmartDay Online. You can disable this in settings and also per �{! A�U	��AԜF�����Rr7Aԛ��`Q��About this Quick ReferenceAbout this Quick Reference

This guide is organized into the Notes list. It appears in a Project called SmartDay - Quick Reference. You can hide this Project from the Show/Hide menu (the eyeball at the top of the screen).
❎ Key features have a check box like this one. Mark a feature as "done" after you've tried it out. Questions? Drop an email to support@leftcoastlogic.com or go to http://leftcoastlogic.com/support    de - turn this on to gain more viewable space by automatically hiding the lower navigation bar when you are not using it.
❎ Delete Sync Duplication - This will delete suspected duplicate items as a result of synchronization. Please BACKUP FIRST.
❎ 'Must Do' Range - Any tasks with deadlines that fall within this range will automatically bubble to the top of your  list. These cannot be sorted or moved until you mark them as Done. The ultimate "task master"!
❎ Show in Calendar - Turn this off to disabled the automatic scheduling of tasks into your calendar.
❎ Calendar Working Times - Select the default working times for each day of the week. Our SmartTime logic uses this to automatically schedule tasks.
❎ Synchronization - See separate Note.
❎ Enable TimeZone support to set meetings to specific time zones. You can also "float" appointments, for example "Jog at 6am" wherever you are.
❎ Enable Geo-Fencing for location-based filters and alerts.
❎ Set up Locations to use for alerts and filtering.                                                             � G���Aԛ��̀E��Rkv�Aԛ��#�6�Settings - Tips & SuggestionsSettings - Tips & Suggestions
❎ Hints - tap to reset if you wish to see any that you have disabled.
❎ Tag List - create powerful filter and cont  � !�	��AԜϯ}���Rh�Aԛ�7�b�Notes ListNotes List
Create Notes here. Kept them independent, or...
❎  Link them to any number of Events or Tasks. You can view linked Notes directly from the Event or Task, without having to hunt for them!
❎ Change the order by changing the date. [iPad] Drag onto Mini calendar to change dates.
❎ Add checkmarks, such as this one, by selecting the checkmark icon at the top of the keyboard. 
❎ Tap a checkmark box to select it.
❎ You can clear all selections, by tapping on the "Unselect All" icon above the keyboard.
❎ Filter the Notes list by "current day" (great for browsing with the Mini calendar) or by "current week" for quick reference.    (  (b��2                      �7" �o	 ��AԜ[�:���Rr7Aԛ��>��Top MenuTop Menu
- iPhone: Main Menu, Filters, and Timer
- iPad: Main Menu, Show/Hide, Tags, Timer, Search box

❎ Create tags for easy search and filtering.
❎ Timer to record time spent on tasks. Apply from top menu bar or from any Task.
❎ Search box (iPad): Find anything!
❎ On iPhone, tap the top of the menu bar for quick filters.
❎ SmartDay automatically pushes any changes you make, up to SmartDay Online. You can disable this in settings and also perform a two-way sync from the Main Menu.�" '�+	 ���AԜd)p��Rr7Aԛ��v2�Mini CalendarMini Calendar
This is your navigator and drag/drop planner.

❎ To view different days, tap the Mini calendar.
❎ Toggle between Week and Month in the Mini calendar.
❎ "Heat Map" shows darker days as busier.
❎ Drag an event into the Mini calendar to change its day.
❎ Drag a Task into the Mini calendar, to change its deadline.    n  n�                                                                                                  �!" %�9	 1��AԜ��IZ��Rr7Aԛ��A&p�Day CalendarDay Calendar
on iPad: Left column
on iPhone: "Calendar" page
❎ Events hug the timeline, Tasks float on the right - scheduled for you directly from your Tasks list.
❎ Tap and hold the timeline to create a new event.
❎ Tap/Hold, then drag the edge, to change the duration of any event or task.
❎ Drag a task over to the timeline to anchor it to a specific time.
❎ Select then drag the shade at either end of the day, to adjust your working hours. Tasks adapt accordingly.
❎ Tap any item to preview notes that are attached, or to create a new note. You can also view these separately in the Notes list.
❎ Get driving directions for a meeting. Even set an alarm based on driving time, to make sure you leave on time!�Z" �3	 ��AԜ��8���Rr7Aԛ��X�f�Task ListTask List
❎ Tap the left side       - -- p                                                                                                          �$" +�;	 ��AԜ<����Rf1�Aԛ�k�-M�Land�Z" �3	 ��AԜ��8���Rj)�Aԛ��X�f�Task ListTask List
❎ Tap the left side    �P" !�	 ��AԜϯ}���Rr7Aԛ�7�b�Notes ListNotes List
Create Notes here. Kept them independent, or...
❎  Link them to any number of Events or Tasks. You can view linked Notes directly from the Event or Task, without having to hunt for them!
❎ Change the order by changing the date. [iPad] Drag onto Mini calendar to change dates.
❎ Add checkmarks, such as this one, by selecting the checkmark icon at the top of the keyboard. 
❎ Tap a checkmark box to select it.
❎ You can clear all selections, by tapping on the "Unselect All" icon above the keyboard.
❎ Filter the Notes list by "current day" (great for browsing with the Mini calendar) or by "current week" for quick reference.      eft, Smart Tasks on the right.
• Flip between days by swiping your finger.
• Tap the title bar to view the Mini Week calendar, then...
• Tap the -><- symbol to expand to an entire Month calendar.
• "Heat Map" shows darker days as busier.
• All Day Events are shown in the week and month views, or in a separate scrollable review pane.
• Tap any day in the Mini Week/Month view, to jump to that day.
• Tap and hold the timeline to create a new event.
• Tap/Hold, then drag, to change the duration of any event or text.
• Drag a task over to the timeline to convert it to an event.
• Drag an event from the main calendar up to the Mini calendar to change its day.
• Drag a Task from the main calendar into the Mini calendar, to change its deadline.
• Select then drag the shaded box at either end of the main calendar, to adjust your working hours.
• Tap any item to preview Notes that are attached, or to create a new note. You can also view these separately in the Notes View.ple devices.    �.����                  ��D! �i�782|3��A�w�cF=��Q�p�A�w�<�3�$" +�;	 ��AԜ<����Rf1�Aԛ�k�-M�Landscape ViewsLandscape Views

iPad: Planner Pro  
❎  Flip your iPad sideways�r
" 5�K	 ���AԜ�[u���Rr7Aԛ��а�Synchronization TipsSynchronization Tips
❎ You can sync with your iPhone/iPad Calendar, or with SmartDay Online, but not with both at the same time. This is to protect you from duplicated calendars.
❎ We suggest you use this feature to import calendars from the Calendar app, and tasks from Reminders or Toodledo, then switch to SmartDay Sync, to synchronize with SmartDay Online and with SmartDay on your other devices.
❎ SmartDay for Mac OS X can sync simultaneously with Calendar/Reminders on your Mac, and with SmartDay Online.
❎ If you use iCal, iCloud, Exchange, or a Google Calendar then we suggest you visit our sync wizard at http://leftcoastlogic.com/smartday/synchronizing   � �� pbar when you are not using it.
❎ Delete Sync Duplication - This will delete suspected duplicate items as a�q! 5  � 5�K	���AԜ�[u���Rc��Aԛ��а�Synchronization TipsSynchronization Tips
❎ You can sync with your iPhone/iPad Calendar, or with SmartDay Online, but not with both at the same time. This is to protect you f�" �3 ��1��Aԛ���ދ�RmnhRmK@A�({p���#(�Welcome to SmartDay! In this Calendar view, Events appear on the left, and Tasks are automatically scheduled for you on the right. Tap this Event to view linked Notes.  Go to "Notes View" to see our Quick Guide.W! 7 ��Aԛ��0^�Rt@RlW�A�x�SU{c���I am an All-Day Eventn  k		���AԜ	�eL�Rn��Rn{�Aԛ�� �I am a Task - tap me once to see what's inside!�! �!	�����Aԛ��"q��Rn�|Rnm�Aԛ�K����I am an Event - I'm on the left side because I'm anchored to the timeline.   y y                                                 � �i�782|3��A�w�cF=��Q�p  ��! �}��Aԛ�E�JM��Rk{1Aԛ�4k}��Task ListTask List
❎ Tap the � ! %�9	1��AԜ��IZ��Rk|�Aԛ��A&p�Day CalendarDay Calendar
on iPad: Left column
on iPhone: "Calendar" page
❎ Events hug the�" '�	 ��AԜ�F���Rr7Aԛ�4X>u�Projects ListProjects List
Each Task, Event, and Note is associated with a Project category. You can create as many Projects as you wish.
❎ Select any Project then tap the arrow icon to show all Tasks, Events, Notes, or Anchored Tasks inside.
❎ Tap the Project itself to edit settings such as name and color. 
❎ Track progress of tasks by # and % complete; also # of hours remaining.
❎ Mark a Project as transparent to allow tasks to overlap in the calendar. This is helpful for viewing shared calendars from other people, without getting in the way of auto task scheduling.    z  z�]��                    � �11��Aԛ��J����Rk|�Aԛ��G�n�Ca  ��$" +�;	 ��AԜ<����Rr7Aԛ�k�-M�Landscape ViewsLandscape Views

iPad: Planner Pro  
❎  Flip your iPad sideways to see Planner. 
❎  Drag Tasks into the Month planner to change their deadlines.  View due Tasks, all-day Events, Notes, and completed Tasks for each day.
❎ Drag Tasks directly into the week time-line to anchor them to a specific time!

iPhone:
❎ "Overview" shows all Events and automatically scheduled tasks, for the entire week.
❎ Export to email for handy reference or to print out a hard copy.�T	" G�	 ��AԜh����Rr7Aԛ�����Settings - Tips & SuggestionsSettings - Tips & Suggestions
❎ Hints - tap to reset if you wish to see any that you have disabled.
❎ Tag List - create powerful filter and context tags here.
❎ Delete Warning - turn this off to hide all confirmations. Careful!
❎ Tab Bar Auto Hi       de - turn this on to gain more viewable space by automatically hiding the lower navigation bar when you are not using it.
❎ Delete Sync Duplication - This will delete suspected duplicate items as a result of synchronization. Please BACKUP FIRST.
❎ 'Must Do' Range - Any tasks with deadlines that fall within this range will automatically bubble to the top of your  list. These cannot be sorted or moved until you mark them as Done. The ultimate "task master"!
❎ Show in Calendar - Turn this off to disabled the automatic scheduling of tasks into your calendar.
❎ Calendar Working Times - Select the default working times for each day of the week. Our SmartTime logic uses this to automatically schedule tasks.
❎ Synchronization - See separate Note.
❎ Enable TimeZone support to set meetings to specific time zones. You can also "float" appointments, for example "Jog at 6am" wherever you are.
❎ Enable Geo-Fencing for location-based filters and alerts.
❎ Set up Locations to use for alerts and filtering.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      s on to gain more viewable space by automatically hiding the lower navigation bar when you are not using it.
❎ Delete Sync Duplication - This will delete suspected duplicate items as a result of synchronization. Please BACKUP FIRST.
❎ 'Must Do' Range - Any tasks with deadlines that fall within this range will automatically bubble to the top of your  list. These cannot be sorted or moved until you mark them as Done. The ultimate "task master"!
❎ Show in Calendar - Turn this off to disabled the automatic scheduling of tasks into your calendar.
❎ Calendar Working Times - Select the default working times for each day of the week. Our SmartTime logic uses this to automatically schedule tasks.
❎ Synchronization - See separate Note.
❎ Enab�{#''�5tableLocationTableLocationTableCREATE TABLE LocationTable (Location_ID INTEGER PRIMARY KEY, Location_Name TEXT, Location_Address TEXT, Location_Latitude NUMERIC, Location_Longitude NUMERIC, Location_Inside NUMERIC, Location_UpdateTime NUMERIC)             $                   $   2   2   2   2                          �   Q             �         �   �   �                      �   �   Y   �   �   3              t   �   �                  �   �   �   �                           �   �   �               �   �   �   �   a                       �   �   �               �   �   �   �   �   |                  �   �   �               S   f   f   f   f   f              �   �   �   �                                              �   �   �   �                                              E   �   �   �                                                      :   �                                                                                                                                                                             �?                              �?              �?                ��B                             �   �                                                                                                                      to select one or more Tasks and apply actions such as "move to top of list" or "defer deadlines."
❎ [iPad] Drag tasks onto the Mini Calendar to assign deadlines, or onto the Calendar timeline to anchor them. Works in portrait and landscape.
❎ Choose task alerts that are triggered when you arrive at, or leave, any location.
❎ Filter tasks by location and view a drop-down list of those tasks each time you arrive at a new location.

Tap the title bar to apply any of these filters:
❎ All - this is the best view for sorting tasks by drag/drop.
❎ Star - handy for manually choosing what you want to do.
❎ GTDo - shows only the top priority task from each of your Projects, indicated by a red flag. Mark one as done, the next automatically flows in.
❎ Due - This shows only tasks that have deadlines, then sorts them by due date. Never miss a deadline!
❎ Long - sort tasks by duration. Great for when you have large blocks of time!
❎ Short - or when you don't have much time, pick one of these!deadline.