---
layout: page
title: Desktop/Mobile Client

category: proposal
status: draft
---

'''THIS IS A DRAFT'''

Web2project is a full project management system that allows for a well-informed user to accomplish things ranging from simple time logging to complex inter-project dependency management. While this advanced functionality is available in the core system, most users will only use the most basic functionality to log their working time against their assigned tasks. Interaction with more advanced aspects distract at best and confuse or annoy at worst. Therefore, the goal of this effort is to build a simple user interface that allows for the every day user to simply retrieve their assigned tasks and log time as needed.

Each requirement is rated: A, B, or C representing High, Medium, and Low priority respectively.

== Requirements ==

The client must:
*  A: be desktop-based, not a web site or a wrapper around a web site;

*  A: not require Apache/IIS, mysql, or PHP to be installed in order to work;

*  A: work on Windows XP, Windows 7, and the most recent versions of Mac OSX (for desktop clients);

*  A: work on Android and/or iPhone/iPad devices (for mobile clients);

*  A: be able to retrieve of list of tasks including parent project, task description, percent complete, current logged time, expected duration, and start/end dates automatically at startup;

*  A: retrieve an updated list of tasks whenever the user requests;

*  A: have fields to support updating percent complete, specifying a date (default to today), specifying a billing code, and providing a comment;

*  A: appropriately encode/decode the core system supported languages/character sets for any user comments submitted;

*  B: be able to interact with the system without any non-core module, functionality, or scripts;

*  B: identify and designate tasks which are currently overdue;

*  C: determine what the current server-version is and determine compatibility (simple version check?);

== Bonus Features/Ideas ==

It would be nice if the client:

*  was not dependent on a continuous internet connection;

*  automatically synchronized with the core web2project system without user interaction;

*  worked on Ubunutu 9.10 and above - using plugins/extensions/runtimes as appropriate;

*  took on the native look & feel of the underlying operating system;

*  notified the user when the client was not able to retrieve/submit information to the central system;

*  used the specified project_color field to designate project names;

*  identified tasks which had been created since the last synchronization;

*  identified tasks which had been updated since the last synchronization;

*  included information on other assignees along with their contact information;

*  included information on the other time logged against those tasks by other users;

*  retrieved the appropriate System Lookup Values - such as Project Type, Task Type, etc - to ensure the client stayed in sync with the core system;

*  allowed for translation modules, better if the appropriate web2project translation could be used;

*  provided an update mechanism within the client itself;

*  provided a mechanism to retrieve/update multiple installations of web2project;

*  provided a way to attach files within the comments area and have them automatically uploaded/attached to the appropriate task withing the core system;

*  displayed a list of upcoming events (Calendar module);

*  offered visibility into additional modules - such as TodoList - that uses date-based information;

== Details ==

=== Definitions ===

*  A '''Company''' is a single row of the ''companies'' table from the web2project database.  Every ''Company'' is owned by a single ''User'' and has a set of zero or more ''Projects'' it owns.

*  A '''Project''' is a single row of the ''projects'' table from the web2project database.  Every ''Project'' is owned by a single '''Company''' and has a set of zero or more '''Tasks'''.  For usability purposes, every ''Project'' has a specific color assigned to it which is used throughout web2project.

*  A '''Task''' is a single row of the ''tasks'' table from the web2project database.  Every ''Task'' is attached to a single ''Project'' and can be a child of or have other ''Tasks'' as children to it.  A ''Task'' will also have a set of zero or more ''Users'' assigned to it.

*  An '''Overdue Task''' is a ''Task'' in which the due date of the task has been passed but the percent complete is less than 100%.

*  A '''User''' is a single row of the ''users'' table combined with a single row of the ''contacts'' table both from the web2project database.  Every ''User'' will be attached to exactly one ''Company'' and will have a set of zero or more ''Tasks'' assigned to them.

*  '''Permissions''' are something else entirely.  They are not a single row of any particular table and are instead a combination of various attributes combined from the ''Company'', ''Project'', and ''Task'' objects and attached to a specific ''User''.  Permissions can both be positive ("allow read access to Company X") and negative ("deny delete access to Project Y") but are additive throughout.

=== Phase One ===

#  As a user of the widget, I should be able to specify a web2project installation against which the application authenticates (web2project url).

#  As a user of the system, I should be able to submit my credentials to retrieve information from the system.

#  Upon authenticating against the system, I should be able to retrieve a list of all Tasks currently assigned to me.  This list should include information such as the Task's name, start date, end date, estimated hours, priority, hours of work performed, and assignee list.

#  When displaying this list to me, it should retain information such as Project name and color to make it easier to distinguish between similarly named Tasks on different projects.

#  When a Task is overdue, the Task should be designated differently to the User.

#  When a Task is completed (marked 100% complete), it should no longer appear on my list.

#  All of this information should be cached locally to allow me to see my required tasks when I am offline.

#  If the Task is not assigned to me, I should not see it or any information about it.  I should not be able to tell it exists.

=== Phase Two ===

#  As one of the Assignees of the Tasks, I should be able to log time against it.  I should be able to input time (1.5 hours or 1:30), attach a comment, and submit it for saving.

#  As an alternative to manually inputting a time, the application should be able to keep a simple timer counting up from 0 minutes, rounded to the nearest minute.

#  As another alternative, I should be able to input a time (1.25 hours or 1:15) and start the timer.  The application should start counting up from this time specified.

#  All of this information should be able to be stored offline in case access to the web2project installation is temporarily lost.  When there are locally stored entries which have not been saved in web2project, the application should provide some sort of indication to the user.

#  When internet access is regained, the system should automatically submit locally stored entries without any user interaction.

#  This Task list should be automatically updated on a configurable interval I can select.

#  If the update time comes and I am offline, the current Task List is preserved and the application waits for the next update interval.

== Alternatives ==

There are a couple alternative implementations out there:

*  There is an Eclipse plugin which displays the open Tasks as Todo items in its Todo perspective.  This uses raw SQL statements on the client side which requires database access granted to each user wishing to use the plugin.  Information: http://sourceforge.net/projects/eclipsedotproj/

*  There is a (relatively recent) client called [http://dpdesktop.sourceforge.net/ DPDesktop]. It is Java-based and is believed to have some compatibility with web2project. This has not been validated.

* '''No longer available.''' There is a Yahoo Widget Engine Widget which does much of this (pictured, right).  The primary weakness is that it requires the inclusion of a php file which retrieves data from dotProject via raw SQL instead of using the built in access methods and therefore ignores all permissions.  Information:  http://widgets.yahoo.com/widgets/dotprojectnet-tasktracker [[images/yahoo-widget.jpg|align=right]]

'''THIS IS A DRAFT'''