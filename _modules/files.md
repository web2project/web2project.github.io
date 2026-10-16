---
layout: module
title: Files Module

category: core-module

module_name: Files
module_path: files
module_creator: dotProject
module_devs: web2project
module_version: 3.3
module_source: https://github.com/web2project/web2project
module_download: http://github.com/web2project/web2project/archive/master.zip
---

## Module Overview

Once your project begins, you will likely want to attach files to it: contracts, requirements, technical specifications, relevant standards, or any of a plethora of other things. While these can be handled in a third-party Document Management System or a wiki, it is often better to have a single location for pulling all this information together into a single interface for review, comment, update, or perusal.

The Files module stores files and associates them with [Companies](/modules/companies.html), [Projects](/modules/projects.html) and [Tasks](/modules/tasks.html). It appears in the main navigation by default, and the same list is shown on the Files tab of each company, project and task.

In the Files module you can:

* Upload files in any format
* Put each file in a category
* Attach files to a project or a task
* Filter the list by project, owner and category
* See who uploaded each file and when

{% include icon-info.html %} v5.0 removed file check-in/check-out, file versions and the e-mail notification sent when a file was added. Existing files keep their data; the latest version of each file is the one shown.

### Attach a File

There are three ways to get to the upload form and they are all effectively the same. The fastest is to select "New File" from the "New Item" menu at the top of any page. Alternatively, you can select Files from the main navigation and then click on the "New File" button. Finally, you can open a particular project or task, select its Files tab, and add the file from there.

### Files List (Files Index)

When you select "Files" from the main navigation you will see the Files list.

At the top of the page are the "New File" button and three filters:

* **Project** shows only the files attached to that project.
* **Owner** shows only the files uploaded by that user.
* **Category** jumps to that category's tab.

Below them is a row of tabs: "All Files" and one tab per file category, each with the number of files it holds. The counts follow the Project and Owner filters, so you can combine a project with a category. You can define the categories to meet your own needs in System Admin under the *FileType* lookup values.

The files are listed under a heading for the project they belong to. You only see files from the projects and tasks you are allowed to see.

By default the list has these columns:

* An edit icon, to change the file's details or upload a replacement
* **File Name**: click it to download the file
* **Description**
* **Category**
* **Task Name**: the task the file is attached to, if any
* **Owner**: the user who uploaded it
* **Date**: when it was uploaded

Long lists are split into pages, and the page links keep your current project, company or task.

Downloads go through `fileviewer.php`, which checks that you are logged in and allowed to see the file. See [Security Notes](/docs/security-notes.html) for how to make sure files can't be downloaded any other way.

### Add or Edit a File (Files addedit)

The form has these fields:

* **File Name, Type, Size and Uploaded By** are shown when you edit an existing file. They come from the uploaded file and can't be changed here.
* **Category** puts the file under one of the category tabs on the Files list.
* **Project** attaches the file to a project. Adding the file from a project's or task's Files tab fills this in for you.
* **Task** attaches the file to one of that project's tasks. Use the "select task..." button to pick it.
* **Description** lets you add notes about the file.
* **Upload File** lets you choose the file on your computer. When you edit a file, choosing a new one replaces the file attached to this entry. Changing the project moves the stored file to the new project's folder.

### Folders

Earlier versions also let you organise files into folders. In v5.0 the Files list no longer shows folders or offers the "New Folder" button, so files are organised by project and category instead. Folder records in an upgraded database are kept but aren't used.
