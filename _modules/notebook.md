---
layout: module
title: Notebook Module

category: addon-module

module_name: Notebook Module
module_path: notebook
module_creator: Pedro Azevedo
module_devs: CaseySoftware, LLC
module_version: 5.0.0
module_source: https://github.com/web2project/modules-notebook
module_download: https://github.com/web2project/modules-notebook/archive/master.zip
---

## Module Overview

Notebook keeps notes in web2project. A note has a title, a plain-text body, a category, a status and an optional URL. Notes can be filed on a company, a project or a task, and those pages get a Notes tab listing their notes. Each user's page has a Notes tab with the notes they wrote.

The Notebook page lists every note you can see, with a tab per category, filters for company, project and status, and a search box that looks in titles and bodies. Notes are also found by SmartSearch.

Private notes are shown only to the user who wrote them. A note filed on a project or company is shown only to users who can see that project or company.

Categories and statuses are System Lookup Values (`NoteCategory` and `NoteStatus`).

## Requirements

Version 5.0.0 needs web2project 5.0 or later and PHP 8.3 or later. Versions 3.x and 4.x are for web2project 3.x and 4.x.

## Upgrading from 3.x or 4.x

Back up your database first. The upgrade converts note bodies written with the old TinyMCE editor to plain text: paragraphs, line breaks, list items and links are kept, but images, tables and text formatting are lost. It also fills in each note's creator from web2project's history where it can.

## Release Notes

### 5.0.0

* Works on web2project 5.0 and PHP 8.3. TinyMCE is gone: note bodies are plain text.
* Security: the list search is no longer open to SQL injection, the add/edit form escapes stored values, and the pages check module access and project/company permissions.
* Private notes are private, and Private can be unticked.
* Notes keep their project, task and company; the creator is saved.
* The category tabs, the Users tab, the filters and the page links on the Notes tabs work.
* Bootstrap buttons, an English locale file, and a rewritten README.

### 4.0.0

* For web2project 4.x. The list uses the core list table.
