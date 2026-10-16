---
layout: module
title: System Admin Module

category: core-module

module_name: System Admin
module_path: system
module_creator: dotProject
module_devs: web2project
module_version: 5.0
module_source: https://github.com/web2project/web2project
module_download: http://github.com/web2project/web2project/archive/master.zip
---

## Module Overview

System Admin is where you control the system's core settings and general maintenance. Only users with access to the System Admin module can open it.

## System Admin Index

The System Admin page is split into these sections:

**System Status**

* System Configuration
* Reminders that need your attention: *Set the Admin Email Address* while it is still the default, *Apply System Updates* when database updates are waiting, *Select a Timezone* when the server time zone isn't set, and *Upgrade Available!* when a newer release is out

**Preferences**

* Default User Preferences
* System Lookup Keys
* System Lookup Values
* Custom Field Editor

**Modules**

* View Modules

**Language Support**

* Translation Management

**Administration**

* User Roles
* Users Permissions Information
* PHP Info

**Budgeting Setup** (only when *Display Budget Information* is on)

* Billing Code Table
* Setup Budgets

## Apply System Updates

After you upgrade, *Apply System Updates* runs the database migrations that haven't been applied yet. It lists any SQL errors it hits; a clean upgrade reports none. See the [Installation Guide](/docs/installation.html#upgrade-instructions).

## Translation Management (translate)

Translation Management lets you edit the strings of each installed language, module by module. It only saves to languages and modules that are installed, and the `locales/` folder must be writable by the web server while you work. Full details are in [Translation Management](/docs/translation-management.html).

Additional language packs are mostly contributed by users and are available from the [locales repository](https://github.com/web2project/locales).

## System Configuration (systemconfig)

The settings are grouped by area. Hover over the (i) icon next to each setting for a short description.

### System

* **Company Name**: shown at the top of the sign-in box.
* **Debug Level** and **Show Debug Messages**: see [Turn on Debugging](/docs/turn-on-debugging.html). Leave them at 0 and off on a live system.
* **Enable Gantt Charts**: turns the Gantt charts on or off. They need PHP's `gd` extension.
* **Host Locale**: the default language for the site.
* **Log Changes**: records changes in the History module.
* **Page Size**: the number of records per page in long lists.
* **Page Title**: shown in the browser's title bar.
* **Memory Limit for Gantt**: raises PHP's memory limit while drawing Gantt charts, for example `64M` or `128M`.
* **Site Domain**: used to complete e-mail addresses entered without a domain.
* **Server Timezone**: the time zone of the server itself. Each user also sets their own time zone in *Preferences*.
* **System Administrator Email Address**: where system messages, such as new sign-up notices, are sent.
* **Check for Official Updates?**: checks for a newer release and shows *Upgrade Available!* on this page. **Last Check for System Updates** shows when it last checked.

### Users

* **Activate External User Creation**: shows a sign-up link on the sign-in page. It is on by default; see [Security Notes](/docs/security-notes.html#public-sign-up-has-no-spam-protection) before you leave it on.
* **Admin Username**: the login name of the administrative user.
* **Minimum Password Length** and **Minimum Username Length**.

### User Authentication Settings

* **User Authentication Method**: `sql` (the web2project database), `ldap`, or `pn` (PostNuke).
* **Postnuke login also allows Standard Login**: with PostNuke authentication, also accept web2project logins.

### Budgeting

* **Currency Symbol**.
* **Display Budget Information**: shows budgets on projects, tasks and other modules, and adds the *Budgeting Setup* section to this page. See [Project Budgeting](/docs/project-budgeting.html).

### Calendar

* **Calendar Start Hour** and **Calendar End Hour**: the working day, from 0 to 23.
* **Calendar Minute Increment**: the steps in the calendar's time pickers.
* **Show MiniCals in Day View**.
* **Calendar Working Days**: a comma-separated list where 0 is Sunday. Monday to Friday is `1,2,3,4,5`.
* **Daily Working Hours**: the length of a working day, for example `8.0`.

### Files

* **Maximum File Size for Indexing**: files larger than this (in kilobytes) aren't indexed for searching. A negative value indexes every file.
* **Default File Indexing Parser**, **MS Word Indexing Parser**, **Html File Indexing Parser** and **PDF Indexing Parser**: the programs used to extract text from uploaded files for searching, for example `/usr/bin/strings` or `/usr/bin/pdftotext`.
* **Preserve File Settings on CI** and **Allow Editing of Previous Versions** belonged to file check-in and file versions, which v5.0 removed. They no longer do anything.

### LDAP Settings

* **LDAP Host** and **LDAP Port** (389 by default).
* **LDAP Version**: leave at 3 unless your server needs otherwise.
* **LDAP Base DN**: the base Distinguished Name for searches.
* **LDAP User Filter**: how to find a user, for example `(uid=%USERNAME%)`.
* **LDAP Search User** and **LDAP Search User Password**: the full DN and password of an account that can search the directory.
* **Full LDAP Connect String**: if set, overrides most of the settings above.
* **LDAP also allows standard login**: also accept users who exist only in the web2project database.

See [Active Directory](#configure-web2project-to-use-active-directory-accounts) below for a worked example.

### Locales

* **Translation Warning**: marks strings that have no translation.
* **Translation Alert String**: the marker added to them, `^` by default.

### Email Settings

* **Email Prefix**: added to the start of every e-mail subject.
* **Email Transport**: `php` (PHP's `mail()`) or `smtp`.
* **SMTP Host**, **SMTP Port** (25 by default) and **SMTP Secure** (none, TLS or SSL).
* **Host requires login**, **SMTP Username** and **SMTP Password**.
* **SMTP Server Timeout**: in seconds.
* **SMTP Debug**: shows the SMTP conversation on screen. Leave it off on a live system.
* **Queue Email for later sending**: puts e-mail in the event queue. It is sent when `queuescanner.php` runs from cron (see [Server and Database Configuration](/docs/server-configuration.html#scheduled-tasks-cron)) or, with *Scan Event Queue on Session Garbage Collection* on, when old sessions are cleaned up.

### Projects

* **Use ProjectDesigner to View Projects by Default.**: opens projects in ProjectDesigner instead of the project view.
* **Restrict Project Colour Selection**: limits project colours to the *ProjectColors* lookup values.
* **Template Projects Status Id**: the *ProjectStatus* value used for template projects (6, "Template", by default).

### Session Handling Settings

* **Session Handler**: `app` stores sessions in the database (the default); `php` uses PHP's own sessions.
* **Session Idle Time** (default `2d`) and **Session Maximum Lifetime** (default `1m`): in seconds unless followed by `h`, `d`, `m` or `y`. Only one letter is allowed, so `28h` is valid and `2d4h` is not.
* **Scan Event Queue on Session Garbage Collection**: processes the event queue when old sessions are cleaned up, as an alternative to cron.

### Start Up

* **Default Module**, **Default Submodule** and **Default Tabbed Subview**: the page users see after they sign in. The default is the Calendar's day view.

### Tasks

* **Overallocation Checking**: an unfinished feature. Leave it off.
* **Check Task Dates**: requires start and end dates on every task.
* **Default Company Filter** and **Default Task Filter**: the filters the Tasks list starts with.
* **Edit Multiple Task Assignments**: lets users change assignments for a block of tasks from the Tasks list.
* **Restrict Task Time Editing**: only the task owner, the project owner or an administrator can change task times.
* **Show All Task Assignees**: lists every assignee in task lists instead of the first one and a count.
* **Send Task Reminders**: e-mails the assignees when a task is due and every day it is overdue until it is complete. It needs the cron job.
* **Number of days warning for due tasks**: how many days before the due date the first reminder is sent.
* **Maximum number of reminders to send**: the total number of reminders for one task, including the early warnings.

## Default User Preferences (addeditpref)

These are the preferences new users start with. Changing them doesn't change existing users; each user can change their own under *Preferences* in the user menu at the top right, and an administrator can change them from User Admin.

* Locale
* Tabbed Box View
* Short Date Format and Time Format
* Currency Format
* Timezone
* User Task Assignment Maximum
* Default Event Filter
* Task Notification Method: whether the task or event owner is included in notifications
* Task Log Email Defaults: which boxes (Email Assignees, Email Task Contacts, Email Project Contacts) start ticked on a new task log
* Task Log Email Subject
* Task Log Email Recording Method: for example *Append to Log*
* Show Parent Tasks Expanded by Default

v5.0 removed the "User Interface Style" preference, because there is now only one theme.

## System Lookup Keys (keys)

System Lookup Keys and System Lookup Values are used together to build drop-down lists, tabs and similar pre-set choices.

**Warning:** *Unless you are a programmer we strongly recommend that you do not modify this section!*

## System Lookup Values (syskeys)

System Lookup Values hold the choices themselves. This includes standard drop-down lists and tabs such as those on the Projects list.

For example the Projects list tabs come from the "ProjectStatus" values:

    0|Not Defined 1|Proposed 2|In Planning 3|In Progress 4|On Hold 5|Complete 6|Template

Changing these values changes the tabs, but you can't change the "All Projects", "All Active" or "Archived" tabs, which are built in.

Other commonly edited lists are *FileType* (the Files categories), *BudgetCategory* (billing and budget categories) and *ResourceTypes* (the Resources types).

It is strongly recommended you do not modify these settings unless you are comfortable with what you're doing. Modifying the wrong system values could have undesired results.

## Custom Field Editor (customfields)

The Custom Field Editor lets you add your own fields to Companies, Projects, Tasks, Calendar (events), Contacts and Users without programming.

* Select the add icon next to the module.
* Enter a **Field Name/Identifier** (no spaces) and a **Field Description**, which is the label users see.
* Choose the **Field Display Type**. For a list, enter the **List of Options**.
* Choose whether it is published (**Field Published**) and its **Field Display Order**.
* Add **HTML Tag Options** if you need them.

The new field appears on that module's add/edit form and view.

## Billing Code Table (billingcode)

Billing codes put a cost on time, mainly when creating a task log. Each code has:

* **Billing Code**: usually an accounting code
* **Value**: the cost per hour
* **Description**: something to identify it easily
* **Billing Category**: one of the *BudgetCategory* values
* **Company**: optional; limits the code to one company

Saved codes appear in the task log's cost code drop-down. This page is only linked when *Display Budget Information* is on.

## Setup Budgets (budgeting)

Sets budget amounts per company, period and billing category. See [Project Budgeting](/docs/project-budgeting.html).

## View Modules (modules)

View Modules lists the installed and available modules. From here you can install, activate or disable, upgrade, configure and remove modules, change their order, and choose whether each appears in the navigation.

* The arrows move a module up or down, which also changes its position in the navigation.
* Select "visible" or "hidden" to show or hide it in the navigation.
* Some core modules, such as Reports and Resources, are installed but hidden or disabled by default.
* Add On modules are uploaded with *Select a module to upload*, if the `modules` folder is writable, or copied into `modules/` by hand. Check them against [Updating Add On Modules for v5.0](/docs/upgrading-modules-to-5.html) first.

## User Roles (roles)

Roles are an asset to the comprehensive permissions system built into web2Project. You can specify roles for specific types of users or users groups to allow or deny access to various features within web2Project.

Roles make it easier to apply permissions to a user or set of users rather than applying individual permissions to each user.

To create a user role for a group of users click on the User Roles link on the System Admin page.

You will see a table.

Field | Description
----- | -----
Icons | Edit-Modify-Delete
Role ID | ID of Role
Description | Description of Role

To create a new role give the role an ID in the textbox located at the bottom of the second column. Then type a brief description in the second textbox located last in the description column.

After you create a role, click on the lock icon to add permissions to it.

Visit the permissions page for more information.

## System Admin Permissions Result Table (acls_view)

The permissions result table gives a more comprehensive look into the permissions for each. You can filter the view by user, module, or by action.

When you visit the page and select a filter it will display a table.


**Field** | User ID | User | User Name | Module | Item | Item Name | Action | Allow | ACL_ID
----- | ----- | -----
**Description** | Automatic ID by System | Login ID | Actual Name | Name of Module | ID If Applicable | Name of Item | See Permissions | Allow(1) Deny (0) | ID of the ACL

## Configure web2project to use Active Directory accounts

Create a service Account, the account only needs to be a member of the domain users group in active directory in order to search ldap.

Go to the System Configuration of the Systems Admin page of web2project.

Under "User Authentication Settings"

User Authentication Method: LDAP (Change to LDAP)

Under "Users"

Activate External User Creation: Deselect the checkbox (This is not required)

Under "LDAP Settings"
LDAP also allows standard login: (check the box)

LDAP Base DN : DC= peanutbutter,DC=com
This would be your domain name in my example I used peanutbutter.com

LDAP Host: dc.peanutbutter.com
Use the IP address or fully qualified domain controller name. example: dc.peanutbutter.com

LDAP Port: 389 (This default port used by AD)

LDAP Search User Password: Password for the user entered below

LDAP Search User: Use the user you created as the service account. You must use the full AD path to that user account. Be sure to use OU for an organizational unit and CN for a Container, CN would be used if your users were in the default "User" folder created when you install Active Directory.

LDAP Search User : CN=project,CN=Users,DC=peanutbutter,DC=com

LDAP User Filter : sAMAccountName=%USERNAME%

LDAP Version: 3

Now you can use your active directory usernames and password to login to web2project.
