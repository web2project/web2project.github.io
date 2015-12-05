---
layout: module
title: Tasks Module

category: core-module
status: cleanup

module_name: Tasks
module_path: tasks
module_creator: dotProject
module_devs: web2project
module_version: 3.3
module_source: https://github.com/web2project/web2project
module_download: http://github.com/web2project/web2project/archive/master.zip
---

## Module Overview

Task are used to define the [Projects](/modules/projects.html) scope and represents the designers actual workflow. You may have 1 project with multiple tasks representing the projects details. The Task module helps you track and maintain your time and cost.

You add task under a project or the project designer, but you can view and manage task in multiple areas of the system. Web2Project helps ensure that no task is ever overlooked.

Where to view task:

* The Task Menu
* The Todo
* The Today
* The View Project Page
* The View Task Page
* The [ProjectDesigner](/modules/project_designer.html)

### Tasks List View (Tasks index page)

<a href="/assets/docs/tasks/index.png"><img src="/assets/docs/tasks/thumb-index.png" /></a>

The Task List page is located when you click on the Task Menu. There are a number of filters you can set to change what you’re viewing.

Filter | Description
----- | -----
User | View the tasks specific to a single user
Company | View tasks specific to a single company
Task Filter | View the tasks according to your unfinished tasks, your projects, and more

On the left of the page are buttons you can use to further filter your results.

* My todo
* My Pinned Task
* Show Inactive Task
* Task Per User

At the center of the stage is a table with columns.

Field | Description
----- | -----
Pin | Mark as Yours
Log | Create a Task Log
Task Name | Click to View Details
Task Creator | Who Owns
Assigned Users | Who is Assigned
Start Date | When it was started
Duration | How long it will last
Finish Date | When its going to be done
Last Updated | When it was last updated

Also note that each task is color coded to help you identify when a task:

* Is a future task
* If it has been started on time
* If it should have started
* If it is overdue
* If it is done.

### Tasks View Screen (Task View Page)

<a href="/assets/docs/tasks/view.png"><img src="/assets/docs/tasks/thumb-view.png" /></a>

When you click on a task name it will take you to the view task page where you can view comprehensive information about the task.

The main view page consist of eight (8) main categories.

Details
Dates & Targets
Assigned Users
Dependencies
Task Depending on this Task
Description
Contacts for this Task
Contacts for the Project.

### Details

Field | Description
----- | -----
Project | Name of the project this task belongs to
Task | The name of the current task your viewing
Owner | The owner of the task
Priority | Either LOW, NORMAL, HIGH
Web Address | If the project has a URL
Milestone | Is this task a milestone of an array? Yes or NO
Progress | Lets you see how far along the project is in %
Time Worked | Based of the total time recorded from task logs


### Dates & Targets

Field | Description
----- | -----
Start Date | Displays the date and time task started
Finish Date | Displays the dynamic end date
Expected Duration | Calculated by the dates and time combined together
Target Budget | Each task can have a target budget which should be consistent with the project overall budget
Task Type | Displays the task type

Under the main window are a set of tabs.

Field | Description
----- | -----
Task Logs | Displays the logs details, summary of hours, cost code used and comments
Log | Allows you to enter a new task log for this task
Files | Allows you to work with files associated to this task (See <a href="/modules/files.html">Files Module</a> for more information)
Links | View links associated with this task (see <a href="/modules/links.html">Links Module</a> for more information)
Resources | Displays the extra resources for this task ( View the <a href="/modules/resources.html">Resources Module</a> for more information)

### View Add/Edit Screen 1 (Details Tab)

<a href="/assets/docs/tasks/addedit_1.png"><img src="/assets/docs/tasks/thumb-addedit_1.png" /></a>

The details view under the Edit Task page allows you to specify:

* Who the task owner is, which defaults to your own name but your can specify another user.
* Set Access Permissions which will allow you to block or allow access to people
  * Public: Everyone can view
  * Protected: Must be an assignee and belong to the same company as the task owner
  * Participant: Only the assignees can view
  * Private: Only the task owner can view
* Web Address if applicable
* Task Parent to make this task a child of another task.
* Move this task to another project
* Select a task type
* Add Contacts: Important especially if assigning permissions
* Add a budget: Should be consistent with the overall project budget.
* Add a description
* Specify a location

### View Add/Edit Screen 2 (Dates Tab)

<a href="/assets/docs/tasks/addedit_2.png"><img src="/assets/docs/tasks/thumb-addedit_2.png" /></a>

The dates tab lets you specify the start and end dates, expected duration and choose hours based on an 8 hour working day.

Note: You can specify the duration in either hours or days

Note: Choose your start time in the first time field and your “end by this time” in the second time field.

This is important especially in the design industry when a client wants the collateral by a specific time, but it also helps you keep track of your own overall schedule.

### View Add/Edit Screen 3 (Dependencies Tab)

<a href="/assets/docs/tasks/addedit_3.png"><img src="/assets/docs/tasks/thumb-addedit_3.png" /></a>

You can specify Dependencies in web2Project which is a great asset when you are working on larger projects that have multiple tasks that are dependant on one another.

The logic is, additional components (task) must be done in order for the main objective (this task) to be complete.

### View Add/Edit Screen 4 (Human Resources Tab)

<a href="/assets/docs/tasks/addedit_4.png"><img src="/assets/docs/tasks/thumb-addedit_4.png" /></a>

Its important not to confuse Human Resources here with your companies Human Resource Department. Human Resources in web2Project are additional resources used to assist in the production on a task.

Human resources is a great way to track or assign people to the task. You can assign a certain percent of responsibility to another user.

For example, you are a desktop publisher working on a catalog for a company. While you are the owner if this tasks you may require the assistance of a graphic designer to manage the various images. So you might assign that user 20-50% responsibility to this task.

Note: You can also specify this in the project designer module.

Also keep in mind this does have an effect on the permissions. If the task is set to private and you need someone to access the task it is best to have them as a resource.