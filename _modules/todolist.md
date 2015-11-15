---
layout: module
title: TodoList Module

category: addon-module

module_name: Todo Module
module_path: todos
module_creator: CaseySoftware, LLC
module_devs: CaseySoftware, LLC
module_version: 1.1
module_source: https://github.com/web2project/modules-todos
module_download: https://github.com/web2project/modules-todos/archive/master.zip
---

Module Info
 |mod_name =
 |mod_foldername = todos
 |mod_original_dev = CaseySoftware, LLC
 |mod_current_dev = CaseySoftware, LLC
 |mod_latest_version = 1.1
 |mod_depends_on = n/a

## Module Overview

This module provides a way for a user to create individual Todo Items - similar to Basecamp - within Web2project. A Todo Item consists of a simple name, a Due Date, an Assignee, a Project (optional), a Contact (optional), and a Category (optional). By default, these items appear in the users' iCalendar feed.

This module is available for download here: https://github.com/caseysoftware/web2project-todos

## Release Notes

### 1.1

* Resolved an annoyance where deleting an item caused the browser to scroll to the top, now it stays in place as expected.
* The Category List is now stored in the System Lookup Values as opposed to being hardcoded in the CTodo class [http://bugs.web2project.net/view.php?id=363 resolves #363].
* Updated the main controller to match the existing basic controller structure.
* Removed a method that could be replaced with a core function.
* Updated the contact information lookup to use the new Contact Methods structure.

### 1.0

* Initial release.

## Known/Open Issues

*  When editing a Todo Item, the owner is not selected[http://bugs.web2project.net/view.php?id=557].
*  When looking at a Project View, you can't see another users' Todo Items[http://bugs.web2project.net/view.php?id=523].

## Development Status

*  v1.2.0 (tentative) December 2012 - https://github.com/caseysoftware/web2project-todos
*  v1.1.0 Update Release: 2010 July
*  v1.0.1 Update Release: 2010 January
*  v1.0.0 Initial Release: 2009 December