---
layout: module
title: Links Module

category: core-module

module_name: Links
module_path: links
module_creator: dotProject
module_devs: web2project
module_version: 5.0
module_source: https://github.com/web2project/web2project
module_download: https://github.com/web2project/web2project/releases
---

## Module Overview

The links module is where you store quick links for reference and attach them to [Projects](/modules/projects.html) or [Tasks](/modules/tasks.html).

This is particularly useful to store client or vendor websites, but can be used for a number of purposes including links to external project files. Links attached to a project or task also appear on that project's or task's Links tab.

### Links List View (Links Index)

<a href="/assets/docs/links/index.png"><img src="/assets/docs/links/thumb-index.png" /></a>

Select Links in the sidebar to see the list. It has an "All Links" tab and one tab per link category. The categories are the *LinkType* lookup values in System Admin; a new installation has Unknown, Document and Application. They help you sort your links so you can find them quickly.

At the top of the page are a search box, a **Filter** drop-down to show one project's links, and the "New link" button.

By default the list has these columns:

* An edit icon, and an open icon that opens the link in a new window
* **Link Name**: click it to open the link
* **Description**
* **Category**
* **Project Name** and **Task Name**: what the link is attached to, if anything
* **Owner**: who created it
* **Date**: when it was added

### Links Add/Edit (Links addedit)

<a href="/assets/docs/links/addedit.png"><img src="/assets/docs/links/thumb-addedit.png" /></a>

To add a new link, choose "New Link" from the "New Item" menu, or use the "New link" button on the Links list or on a task's page.

The form has these fields:

* **Link Name**: what is shown in the list
* **Created By**: the link's owner
* **Category**: puts the link on one of the list's tabs
* **Project** and **Task**: optional; attach the link to a project and one of its tasks
* **Description**
* **URL**: the address. If you leave off the `http://` or `https://`, Web2project adds `http://`.

When you edit a link, the "delete link" link at the top of the form removes it.
