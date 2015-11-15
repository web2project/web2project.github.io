---
layout: module
title: Tasks Module

category: core-module

module_name: Tasks
module_path: tasks
module_creator: dotProject
module_devs: web2project
module_version: 3.3
module_source: https://github.com/web2project/web2project
module_download: http://github.com/web2project/web2project/archive/master.zip
---

## Module Overview

Task are used to define the [[projects]] scope and represents the designers actual workflow. You may have 1 project with multiple tasks representing the projects details. The Task module helps you track and maintain your time and cost.

You add task under a project or the project designer, but you can view and manage task in multiple areas of the system. Web2Project helps ensure that no task is ever overlooked.

Where to view task:

*The Task Menu
*The Todo
*The Today
*The View Project Page
*The View Task Page
*The [[ProjectDesigner]]

== Tasks List View (Tasks index page) ==
[[Image:tasks_index.png|thumb|right|A pic of the Tasks module '''index''' page.]]
The Task List page is located when you click on the Task Menu. There are a number of filters you can set to change what you’re viewing.

{| border="1" cellpadding="2"
|-valign="top"
|width="10%"|'''USER'''
|width="70%"|Allows you to view task specific to another user or self.
|-valign="top"
|'''COMPANY'''
|View task that are specific to a client or internal company/department
|-valign="top"
|'''TASK FILTER'''
|Allows you to get even more specific and narrow down your search. You can filter your task, your unfinished task, your task under projects, Task specific to your company and more!
|}

On the left of the page are buttons you can use to further filter your results.

*My todo
*My Pinned Task
*Show Inactive Task
*Task Per User

At the center of the stage is a table with columns.

{| border="1" cellpadding="2"
|-
|width="200pt"|Pin
|width="200pt"|Log
|width="200pt"|Task Name
|width="200pt"|Task Creator
|width="200pt"|Assigned Users
|width="200pt"|Start Date
|width="200pt"|Duration
|width="200pt"|Finnish Date
|width="200pt"|Last Updated
|-
|Mark as Yours || Create a Task Log || Click to View Details || Who Owns || Who is Assigned || When it was started || How long it will last || When its going to be done || When it was last updated
|}

Also note that each task is color coded to help you identify when a task:

*Is a future task
*If it has been started on time
*If it should have started
*If it is overdue
*If it is done.

== Tasks View Screen (Task View Page) ==
[[Image:Tasks_view.png|thumb|right|A pic of the Tasks module '''view''' page.]]

When you click on a task name it will take you to the view task page where you can view comprehensive information about the task.

The main view page consist of eight (8) main categories.

Details
Dates & Targets
Assigned Users
Dependencies
Task Depending on this Task
Desciption
Contacts for this Task
Contacts for the Project.


<b>DETAILS</b>
{| border="1" cellpadding="2"
|-valign="top"
|width="10%"|'''Project'''
|width="30%"|Name of the project this task belongs to.
|-valign="top"
|'''Task'''
|The name of the current task your viewing
|-valign="top"
|'''Owner'''
|The owner of the task
|-valign="top"
|'''Priority'''
|Either LOW, NORMAL, HIGH
|-valign="top"
|'''Web Address'''
|If the project has a URL
|-valign="top"
|'''MileStone'''
|Is this task a milestone of an array? Yes or NO
|-valign="top"
|'''Progress'''
|Lets you see how far along the project is in %
|-valign="top"
|'''Time Worked'''
|Based of the total time recorded from task logs.
|}

<b>DATES & TARGETS</b>
{| border="1" cellpadding="2"
|-valign="top"
|width="10%"|'''Start Date'''
|width="30%"|Displays the date and time task started
|-valign="top"
|'''Finish Date'''
|Displays the dynamic end date.
|-valign="top"
|'''Expected Duration'''
|Calculated by the dates and time combined together.
|-valign="top"
|'''Target Budget'''
|Each task can have a target budget which should be consistant with the project overall budget
|-valign="top"
|'''Task Type'''
|Displays the task type
|}


Under the main window are a set of tabs.

{| border="1" cellpadding="2"
|-valign="top"
|width="10%"|'''Task Logs'''
|width="30%"|Displays the logs details, summary of hours, cost code used and comments.
|-valign="top"
|'''Log'''
|Allows you to enter a new task log for this task
|-valign="top"
|'''Files'''
|Allows you to work with files associated to this task (See files module for more information)
|-valign="top"
|'''Links'''
|View links associated with this task (see links module for more information)
|-valign="top"
|'''Resources'''
|Displays the extra resources for this task ( View the Resources Module for more information)
|}

== View Add/Edit Screen 1 (Details Tab) ==
[[Image:Tasks_addedit_1.png|thumb|right|A pic of the Tasks addedit screen '''Details''' Tab.]]
The details view under the Edit Task page allows you to specify:

*Who the task owner is, which defaults to your own name but your can specify another user.

*Set Access Permissions which will allow you to block or allow access to people
**Public: Everyone can view
**Protected: Must be an assignee and belong to the same company as the task owner
**Participant: Only the assignees can view
**Private: Only the task owner can view

*Web Address if applicable

*Task Parent to make this task a child of another task.

*Move this task to another project

*Select a task type

*Add Contacts: Important especially if assigning permissions

*Add a budget: Should be consistent with the overall project budget.

*Add a description

*Specify a location

== View Add/Edit Screen 2 (Dates Tab) ==
[[Image:Tasks_addedit_2.png|thumb|right|A pic of the Tasks addedit screen '''Dates''' Tab.]]
The dates tab lets you specify the start and end dates, expected duration and choose hours based on an 8 hour working day.

Note: You can specify the duration in either hours or days

Note: Choose your start time in the first time field and your “end by this time” in the second time field.

This is important especially in the design industry when a client wants the collateral by a specific time, but it also helps you keep track of your own overall schedule.

== View Add/Edit Screen 3 (Dependencies Tab) ==
[[Image:Tasks_addedit_3.png|thumb|right|A pic of the Tasks addedit screen '''Dependencies''' Tab.]]
You can specify Dependencies in web2Project which is a great asset when you are working on larger projects that have multiple tasks that are dependant on one another.

The logic is, additional components (task) must be done in order for the main objective (this task) to be complete.

== View Add/Edit Screen 4 (Human Resources Tab) ==
[[Image:Tasks_addedit_4.png|thumb|right|A pic of the Tasks addedit screen '''Human Resources''' Tab.]]

Its important not to confuse Human Resources here with your companies Human Resource Department. Human Resources in web2Project are additional resources used to assist in the production on a task.

Human resources is a great way to track or assign people to the task. You can assign a certain percent of responsibility to another user.

For example, you are a desktop publisher working on a catalog for a company. While you are the owner if this tasks you may require the assistance of a graphic designer to manage the various images. So you might assign that user 20-50% responsibility to this task.

Note: You can also specify this in the project designer module.

Also keep in mind this does have an effect on the permissions. If the task is set to private and you need someone to access the task it is best to have them as a resource.

== Videos ==
[http://wiki.web2project.net/video_feeds/w2p/7.Task_Basics/index.html > Task Basics]