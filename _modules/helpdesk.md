---
layout: module
title: Helpdesk Module

category: addon-module

module_name: Helpdesk Module
module_path: helpdesk
module_creator: the dotProject Help Desk contributors
module_devs: CaseySoftware, LLC
module_version: 5.0
module_source: https://github.com/web2project/modules-helpdesk
module_download: https://github.com/web2project/modules-helpdesk/archive/master.zip
---

## Module Overview

Help Desk tracks support calls, bug reports, feature requests and complaints as tickets. Each ticket records:
- who asked (a user, a contact, or just a name, e-mail address and phone number)
- who it's assigned to
- its call type, source, status, priority, severity, service and application
- an optional company, project and task
- a deadline and a summary

Work on a ticket is recorded as logs with hours and a cost code. Every change to a ticket is kept in its history. Watchers are e-mailed when it changes.

The Help Desk page has these tabs:
- **Help Desk Items:** a count of tickets by call type and status.
- **My Open:** open tickets assigned to you.
- **Opened Today** and **Closed Today.**
- **Watched Tickets:** the tickets you watch.

The **list** page filters tickets by any field and searches titles and summaries.

A ticket's page has these tabs:
- **Task Logs** and **New Log**
- **Item History**
- **Files:** the files attached to the ticket.

From the ticket's page you can **export it to a task** in its project, which closes the ticket.

Projects get a Help Desk tab listing their tickets. Tasks › To-do gets a "My open Requests" tab. Two reports come with the module: the Help Desk list for a period, and the hours logged on tickets.

Tickets show a number made from the title prefix setting and the ticket id, for example `HD-00042`.

## Requirements

Version 5.0 needs web2project 5.0 or later and PHP 8.3 or later. The installer checks both. Version 0.8 is for web2project 3.x and 4.x and doesn't run on 5.0.

## Installation

1. Copy the `helpdesk` folder into web2project's `modules` folder.
2. Make `modules/helpdesk/config.php` writable by the web server. The Configure page saves the module's settings there.
3. In System Admin › View Modules, install Help Desk, enable it, and make it visible. Then give your roles access to the Help Desk module.
4. Click **configure** on the same page to set the module up.

Installing adds:
- the tables `helpdesk_items`, `helpdesk_item_status` and `helpdesk_item_watchers`
- a `task_log_help_desk_id` column on `task_log` and a `file_helpdesk_item` column on `files`
- the module's System Lookup Values (see below)

Removing the module drops all of these.

## Configuration

Configure needs edit rights on System Admin.

* **Permission Options:**
  * the host company (the company that runs the help desk; users from other companies are treated as clients)
  * whether tickets without a company can be edited
  * whether project permissions limit which tickets a user sees
* **New Item Default Selections:**
  * the title prefix (a `sprintf` format such as `HD-%05d`)
  * the default assignee and company
  * default watchers
* **Search Fields On Item List:** which filters the list page shows.
* **Notification Email Options:**
  * whether new tickets e-mail by default
  * whether watchers and the requestor hear about every log or only status changes
  * the address for new unassigned tickets
  * the e-mail subject and header

The lists of call types, sources, statuses, priorities, severities, services and applications are System Lookup Values:
- `HelpDeskCallType`
- `HelpDeskSource`
- `HelpDeskStatus`
- `HelpDeskPriority`
- `HelpDeskSeverity`
- `HelpDeskService`
- `HelpDeskApplic`

`HelpDeskAuditTrail` names the history entries. Applications start with only "Not Specified", so add your own under System Admin › System Lookup Values.

## Permissions

* Viewing, adding, editing and deleting tickets follow the user's Help Desk module permissions. A user with view-only access can't change or delete tickets.
* A user sees the tickets of companies they can see, plus the tickets they created, are assigned to or requested. When project permissions are on, tickets on projects they can't see are left out.
* A log can be changed or deleted by the user who wrote it, the user who recorded it, or anyone who may edit the ticket.
* Attaching a file also needs add rights on Files. The Files tab only lists files the user may see.

## Upgrading from 0.x

Back up your database first. Then:
1. Replace the module folder, keeping your `config.php`.
2. Click **upgrade** on the View Modules page.

Versions 0.3 to 0.8 are upgraded in place, and the upgrade can be run again safely.

Version 5.0 stores every ticket date in UTC and shows it in each user's time zone. The upgrade converts existing deadlines and history from the system time zone (System Admin › System Configuration), so check that setting before you upgrade.

## Release Notes

### 5.0

* **Runs on web2project 5.0 and PHP 8.3.** It uses the v5 database layer and class names, sends the form token with every change, and has no PDF output (v5 dropped the PDF library).
* **Security fixes:**
  * The list filters, search and sort are no longer open to SQL injection.
  * Stored values are escaped on every page.
  * Configure can no longer write PHP code into `config.php`, and needs system edit rights and the form token.
  * Delete, edit and add check permissions.
  * Export to task is a form action, not a link.
* **Logs:** ticket logs can be saved, edited and deleted again, and only ever touch Help Desk logs.
* **Data fixes:**
  * Editing a ticket records its history and sends notices again.
  * Attachments are saved and listed on the ticket.
  * New tickets no longer create a blank second ticket.
  * The chosen task is saved, and an empty deadline stays empty.
  * The Application list is installed.
  * The reports' date ranges and their Status and Priority columns are correct.
* **Dates:** stored in UTC and shown in the user's time zone. Exported tasks end on the ticket's deadline.
* **Install and upgrade:** uninstall removes the lookup values (a reinstall used to double them), and the upgrade from 0.x was rewritten.
* **Pages:**
  * Pages use the core paginator and the core save controller.
  * The add/edit form, item view and log form scripts work.
  * The PHP warnings are gone.

### 0.8

* For web2project 3.x and 4.x.

## Open Issues

Report bugs and requests at [github.com/web2project/modules-helpdesk/issues](https://github.com/web2project/modules-helpdesk/issues).

* The pages still use the older table layout rather than Bootstrap templates ([#39](https://github.com/web2project/modules-helpdesk/issues/39)). This waits on web2project finding templates shipped inside a module ([web2project#551](https://github.com/web2project/web2project/issues/551)).
* Settings live in `modules/helpdesk/config.php`, so that file must stay writable and should be kept when you replace the module folder.
* Ticket logs are stored in web2project's `task_log` table with no task (`task_log_task = 0`).
