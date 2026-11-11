---
layout: module
title: TodoList Module

category: addon-module

module_name: Todo Module
module_path: todos
module_creator: CaseySoftware, LLC
module_devs: CaseySoftware, LLC
module_version: 3.0.1
module_source: https://github.com/web2project/modules-todos
module_download: https://github.com/web2project/modules-todos/archive/master.zip
---

## Module Overview

TodoList keeps simple to-do items in web2project. Unlike a Task, a todo has no duration or percent complete: it is either done or not done. Each todo has:
- a name
- a due date, or none ("Later")
- an assignee
- an optional project, contact and category

The TodoList page has these tabs:
- **Todo Items:** open todos grouped into Overdue, Today, Tomorrow, This Week, Next Week and Later, with the add/edit form beside them. Tick a todo's checkbox to complete it, or use the trash icon to delete it.
- **GTD Active Projects** and **GTD All Projects:** the next three open todos for each project, soonest first, in the spirit of Getting Things Done. Todos without a project are listed first.
- **Closed Items:** completed todos, most recently changed first.

The **Owner** filter in the title bar shows your own todos (the default), another user's, or everyone's.

When adding a todo, pick a timeframe (Today, Tomorrow, This Week, Next Week, Later) or choose a date. "Today", "This Week" and so on follow your own time zone preference and the first day of the week set for your locale.

Projects and Companies get a **Todolist** tab showing the open todos for that project or company, with the same add form. A todo saved there takes you back to that page.

Open todos due in the next 30 days, including overdue ones, appear in your iCalendar feed. Smart Search finds your own open todos.

## Requirements

Version 3.0 needs web2project 5.0 or later and PHP 8.3 or later. The installer checks both. Version 2.0 is for web2project 3.x and 4.x and doesn't run on 5.0.

## Installation

1. Copy the `todos` folder into web2project's `modules` folder.
2. In System Admin › View Modules, install Todos, enable it and make it visible.
3. Give your roles access to the Todos module.

Installing adds the `todos` table and the `TodoType` System Lookup Values, which hold the categories (Admin, Billing, Call, and so on). Edit them under System Admin › System Lookup Values. Removing the module drops both.

## Permissions

* Using the module follows the user's Todos module permissions.
* A todo can be opened by its owner, by anyone who can view its project, or by a system administrator. It can be edited, completed or deleted by its owner, by anyone who can edit its project, or by a system administrator. The lists only show the edit, complete and delete controls to those users.
* Todos on projects a user can't see are left out of their lists.
* Contacts that are private to someone else can't be chosen and aren't shown on a todo.

## Upgrading from 1.x or 2.x

Back up the `todos` table first. Then:
1. Replace the module folder.
2. Click **upgrade** on the Todos row of the View Modules page.

The upgrade runs every step your version needs, under MySQL 8 strict mode:
* "Later" todos are stored with a due date of 9999-12-31 instead of 2020-01-01, which is now in the past and made them show as Overdue.
* Tables first created by version 1.3 or earlier lose the unused `todo_closed` column. Under MySQL 8 that column made adding a todo fail with "Field 'todo_closed' doesn't have a default value". A closed date stored there is kept.
* Indexes are added for the list queries.

If you already upgraded to 3.0.0 and see that error, install 3.0.1 and click **upgrade** again.

## Release Notes

### 3.0.1

* Fixes adding todos on sites first installed with version 1.3 or earlier. The upgrade drops the leftover `todo_closed` column, which also stopped upgrades from 1.x.

### 3.0

* **Runs on web2project 5.0 and PHP 8.3.** The module loads on PHP 8 again, and Smart Search, the iCalendar feed and the Project and Company pages no longer break when it's installed.
* **Completing and deleting** work with web2project's form tokens, and a todo is only removed from the list once it is saved.
* **Dates:**
  * "Later" todos no longer show as Overdue.
  * Completing or deleting a todo keeps its due date.
  * Editing an overdue todo keeps its date instead of moving it to today.
  * Today, This Week and the other groups follow the user's time zone and the locale's first day of the week.
* **Security:**
  * A todo can only be opened or changed by its owner, by people with access to its project, or by administrators.
  * Names are escaped on every list.
  * Smart Search only returns your own open todos.
* **Pages:**
  * Bootstrap layout and icons, a native date picker, and an add form that stays in view.
  * The Assignee list selects the todo's owner when editing.
  * The GTD tabs use one query and follow the Owner filter.
  * The Closed Items tab pages correctly.
  * The Todolist tabs on Projects and Companies work and return to their page.
* **Install and upgrade:** upgrades run every step a version needs and work under MySQL 8 strict mode, and reinstalling doesn't duplicate the categories.
* Complete Brazilian Portuguese translation, and an English key list for translators.

### 2.0

* Getting Things Done views for active projects and all projects.
* Column names follow web2project's naming conventions.
* For web2project 3.x and 4.x.

### 1.1

* Deleting an item no longer scrolls the page to the top.
* The category list is stored in System Lookup Values instead of the code.

### 1.0

* Initial release.

## Open Issues

Report bugs and requests at [github.com/web2project/modules-todos/issues](https://github.com/web2project/modules-todos/issues).

* The Todolist tab doesn't appear on a Contact's page, because the web2project 5.0 Contact page doesn't show other modules' tabs ([web2project#561](https://github.com/web2project/web2project/issues/561)). Todos linked to a contact still show the contact's name in the lists.
* The module shows the generic icon in the sidebar until web2project lets add-on modules choose their own ([web2project#434](https://github.com/web2project/web2project/issues/434)).
