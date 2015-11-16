---
layout: module
title: Projects Module

category: core-module

module_name: Projects
module_path: projects
module_creator: dotProject
module_devs: web2project
module_version: 3.3
module_source: https://github.com/web2project/web2project
module_download: http://github.com/web2project/web2project/archive/master.zip
---

## Module Overview

The very essence of web2Project is the ability to effectively manage projects. The Project Module is the foundation for [[Task]] and the heart of the system. Almost every other module in the system uses the project module in some sort of capacity to pull or share information.

### Projects List Page (Projects Index Page)

[[Image:Projects_index.png|thumb|right|A pic of the Projects module '''index''' page.]]
When you click on Projects from the menu it takes you to the Projects List Page, also referred to as “The Queue”

The Project Queue contains a number of filters, tabs and options that you can use to help control your workflow.

At the top of the page is a filter to search for projects in the queue. There are also two other dropdown filters that allow you to filter projects by company, department or owner. This is helpful when you have an abundance of projects and you need to narrow your results.

Below the filters are a set of tabs. These tabs are designed to help you control a projects entire lifecycle from beginning to end. You can customize most of these tabs in the System Administration lookup Values.

Each tab contains a table where projects are listed. Each row represents a project, and each column contains useful information about the project at a glance.

* The first column represents the projects unique color identifier and displays the projects overall status.

* The second column (P) represents the priority of the project. You set the priority of the project in the add/edit project page. A blue arrow pointing down represents a project with a low priority. A red arrow facing up is a high priority project. No arrow in the field means the project is a normal priority.

* The third column shows the project name. Hovering your mouse over the project name will display the projects details. Clicking on the project name will take you to the Project View Page.  A (+) before the project means the project is a parent project with children under it. Click the icon to expand the view.

* The fourth column tells you what company this project represents. Clicking on the company name will take you to the Company View Page.

* The fifth column is the start date which represents the date the project should start.

* The sixth column is the target end date. When creating a project a target end date is selected, but the actual finish date is set by the designer’s task.

* The seventh column is the actual finish date. This date is dynamic according to task production.

* The eight columns (LP) shows an icon if the designer has marked an issue in a task log.

* The Ninth Column shows who the owner of the project is. The owner is usually the person ultimately responsible for the projects production. Clicking on the owners name will take you to a detailed view about that person.

* The selection checkbox lets you change the status of the project. You’ll mark that checkbox and then select an option from the dropdown menu at the bottom of the table.

* The last column represents the project status. The project status also represents the tabs at the top of the queue.

### Projects View Page (Projects View Page)

[[Image:Projects_view.png|thumb|right|A pic of the Projects module '''view project''' page.]]
Clicking on the projects name in the projects list takes you to the project view page. This page displays important information about the project and other elements related to it.

The first window contains six (6) main sections.

* Details
* Description
* Summary
* Departments
* Contacts

- The details section highlights the projects name, company, short name, dates, budget, owner and urls for the project. The urls are typically dynamic and support both http:// and network links.

- The description usually outlines the projects scope and defines the task to be created.

- The Summary displays useful information about the projects status, priority, type, progress, active state, hours worked and projected.

- The departments will show what department the project is assigned to

- Contacts will list is useful when you need to contact someone in regards to the project.

At the bottom of the project view are sub-tabs. These tabs represent other modules that are associated with projects. The amount of tabs that appear here depend on what modules are active via the system administration.

By default the tabs shown here are:

* [[Task]]
* Inactive Task
* [[Forums]]
* [[Gantt Chart]]
* Task Logs
* [[Events]]
* [[Files]]
* [[History]]
* [[Links]]

### Projects Add/Edit (Projects addedit Page)

[[Image:Projects_addedit.png|thumb|right|A pic of the Projects module '''addedit''' page.]]
The most common way to add a new project in the system is to click on the “new project” button in the project queue.

The Add/Edit Project Interface is where you add or edit projects details. This page contains a short forum with control elements that you can set for your project.

From this page you can:

* Give the project a name
* Assign a parent to this project
* Assign a project owner
  * Note: Project owner defaults to the name of the person creating the project, though you can change the name to another person if applicable.
* Assign a company
  * Note: The Company is typically the company the work is being preformed for
* Start Date
  * Note: Defaults to current date by default and can be changed accordingly
* Target Finnish Date
* Actual Finish Date
  * Note: Nothing shows in this area until a task has been created with a finish date assigned.
* URL – Default links
* Staging URL – Usually the project files location.
* Opportunity Number
  * Note: Also known as a PO number. Must be alpha-numeric.
* Priority
  * Note: Be default set to low
* Short Name
  * Note: Automatically assigned by the system.
* Color Identifier
  * Note: The color identifier can be used for a number of reasons such as to represent the designer or the projects *Status/priority.
* Project type
* Project Status
* Import task
  * Note: When creating a new project you have the ability to import task from another project.
* Description
* Notify by email
  * Note: You can set preferences by default or for specific users to have these boxes set to mark by default. When these boxes are checked an email notification is sent to all the stakeholders involved.

### Videos

[http://wiki.web2project.net/video_feeds/w2p/6.Project_Basics/index.html > Project Basics]