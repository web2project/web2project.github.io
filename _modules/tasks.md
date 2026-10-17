---
layout: module
title: Tasks Module

category: core-module

module_name: Tasks
module_path: tasks
module_creator: dotProject
module_devs: web2project
module_version: 5.0
module_source: https://github.com/web2project/web2project
module_download: https://github.com/web2project/web2project/releases
---

## Module Overview

After you have your first Project, the next thing to do is begin creating the Tasks. This is where the real features of Web2project begin to come into play. The simplest and most direct route is to simply create all the tasks with start and end dates and be done with it. Alternatively, dependencies can be meticulously planned, late task reminders activated, dynamic tasks used extensively for rollup reporting, and task logs used for time tracking to turn Web2project into a centralized project management and collaboration hub. Depending on the needs of your organization, you can choose either of these alternatives or anywhere in between.

Tasks define a [Project's](/modules/projects.html) scope and represent the actual work. One project usually has many tasks. The Tasks module helps you track and maintain your time and cost.

### Creating Tasks

<a href="/assets/docs/tasks/addedit_1.png"><img src="/assets/docs/tasks/thumb-addedit_1.png" /></a> <a href="/assets/docs/tasks/addedit_2.png"><img src="/assets/docs/tasks/thumb-addedit_2.png" /></a> <a href="/assets/docs/tasks/addedit_3.png"><img src="/assets/docs/tasks/thumb-addedit_3.png" /></a> <a href="/assets/docs/tasks/addedit_4.png"><img src="/assets/docs/tasks/thumb-addedit_4.png" /></a>

On a project or task page, select "New Task", or choose "New Task" from the "New Item" menu at the top of any page. The top of the form always shows the task's **Name**, **Status**, **Priority**, **Progress** and **Milestone** settings. Below it are four tabs:

* **Details**: the **Task Owner**, **Task Parent**, **Description**, **Task Type**, **Access**, **Department**, **Contacts** and a related **URL**. You can also move the task to another project (**Move to project**) and choose whether other users may add task logs for the assignees (**Allow users to add task logs for others**). For simple task tracking, the only important field is the Description, since it gives the assignees an overview of the work. For more advanced tracking, the parent task matters for how tasks are displayed and for Dynamic (roll-up) Task calculations. When *Display Budget Information* is on, the **Target Budgets** per category and **Total Target Budget** are here too.
* **Dates**: the **Start Date**, **Finish Date** and **Expected Duration**, with a **Calculate** button that works out one from the others using the working days and **Daily Working Hours**. Once set, the task appears on the Calendar. For Dynamic tasks, these dates and the duration come from the child tasks.
* **Dependencies**: where the advanced project management features start. **Dependency Tracking** makes the start date move as the predecessor tasks move. To choose predecessors, select tasks from **All Tasks** and add them to **Dependencies**. **Set task start date based on dependency** takes the latest end date of all the predecessors as this task's start date. **Dynamic Task** turns this task into a roll-up of the tasks beneath it. **Do not track this task** stops the tasks that depend on this one from moving when its dates change.
* **Human Resources**: the users who will do the work, each with a percentage of their time. **Notify Assignees of Task by Email** and **Additional Email Comments** control the e-mail sent when you save.

If the Resources module is active, there is also an **Other resources** tab for assigning equipment, rooms and other [Resources](/modules/resources.html).

<a href="/assets/docs/tasks/addedit_5.png"><img src="/assets/docs/tasks/thumb-addedit_5.png" /></a>

The options on the Dependencies tab create four types of tasks which are denoted distinctly throughout the system. Some of these automatically handle quite a few things for you while some do not. All of them appear on the Calendar and on the assignees' task lists.

* First, there are basic tasks. These have fixed start and end dates, have fixed durations, and are updated by the assignees as time goes on. No information – other than percent complete – will change about these tasks without a user making the specific change by hand.
* Next, there are dependency-driven tasks. Although the duration of these is fixed, their start and end dates are driven entirely by the predecessors. If Task D depends on Tasks A, B, and C being complete, the dates for Task D will shift as the dates for A, B, and C shift without a user editing D. Since many screens are sorted by date – such as My Tasks, the Calendar, and the task lists – dependency-driven tasks will shift around as necessary.
* Next, there are dynamic or rollup tasks. Each of these represents all of its child tasks in a single line with a "summary" of the lower-level data: the sum of all durations, the earliest start date, and the latest end date. As child tasks are edited, moved to another parent or project, or shift based on dependencies, the dynamic tasks shift accordingly. Instead of having to monitor or report on each of the individual tasks, the higher level task can be used, and the detailed tasks are still available for review.
* Finally, there are milestones. Most organizations associate milestones with special events such as delivery dates, launch dates, or specific meetings. A milestone is normally simply complete or not complete and isn't tracked in the same detail as other tasks. Web2project sets the duration of milestones to zero hours.

{% include icon-discussion.html %} One of the open questions within project management circles and within Web2project itself is "What does it mean when a user is 50% assigned to a task?" This could mean either that the person should perform 50% of the work or that the person should spend 50% of their time on the task. This question can have a major impact on scheduling and timelines. Web2project makes no distinction either way and leaves it up to you to decide which practice to follow.

### Email Notifications

There are three types of email notifications based on Web2project Tasks.

The first is the notification sent when a task is created or edited with *Notify Assignees of Task by Email* ticked. It contains the task description, the due date, and a link back to the task. By default it goes to all task assignees other than the task owner; each user can change that with the *Task Notification Method* preference.

The second comes when someone logs time against a task. The task log form lets the user choose who gets the update: the task creator, the task assignees, the task contacts, the project contacts, the user assigned to the log, and any extra recipients. When collaboration is necessary on a task, this is a simple way for people to coordinate and share information without requiring the other team members to log in. The boxes that start ticked come from the *Task Log Email Defaults* preference.

The third is the task reminder. When *Send Task Reminders* is on (System Admin → System Configuration), Web2project e-mails the assignees before a task is due and every day it is overdue, up to the *Maximum number of reminders to send* (100 by default). It applies to all users on all tasks. Since reminders aren't triggered by a user's action, the `queuescanner.php` cron job must be running; see [Server and Database Configuration](/docs/server-configuration.html#scheduled-tasks-cron).

### Tasks List (Tasks index page)

<a href="/assets/docs/tasks/index.png"><img src="/assets/docs/tasks/thumb-index.png" /></a>

Select Tasks from the navigation to see the Tasks list. There are a number of filters at the top of the page.

Filter | Description
----- | -----
User | View the tasks for a single user, if you can see other users
Company | View tasks for all companies or for one company
Task Filter | My Tasks, My Unfinished Tasks, All Unfinished Tasks, My Projects, All Tasks for my Company, All Tasks (unassigned), All Tasks That I Am Owner, All Tasks I Have Created, or All Tasks

The links above the list lead to:

* **my todo**: your own task list (also *My Tasks* in the header)
* **my pinned tasks** / **all tasks**: only the tasks you have pinned, or everything again
* **show all tasks** / **show active tasks**: include or leave out inactive tasks
* **tasks per user**: tasks grouped by assignee

The tasks are grouped under their projects, with subtasks indented below their parents. By default the list has these columns:

Field | Description
----- | -----
Edit, Pin and Log icons | Edit the task, pin it to your pinned list, or add a task log
Percent | How complete the task is
P | The task's priority
U | Your own priority for the task
Task Name | Click to view the task
Owner | The task owner
Assignees | Who is assigned
Start Date | When it starts
Duration | How long it will last
Finish Date | When it is due

Each row is colour-coded by its dates and progress. The key below the list shows the colours:

* **Future Task** (white): it hasn't started yet
* **Started and on time** (light blue)
* **Should have started** (yellow): its start date has passed but no progress is recorded
* **Overdue** (red)
* **Done** (green)
* **Inactive** (grey)

### Viewing a Task (Task View Page)

<a href="/assets/docs/tasks/view.png"><img src="/assets/docs/tasks/thumb-view.png" /></a>

Clicking a task's name opens the task view. The buttons at the top add a new task log, link, file or subtask, and the links lead to the project, to editing or deleting the task, and, for a task that represents a subproject, to that subproject.

The top of the page has these sections:

* **Details**: project, task parent, owner, priority, web address, milestone, progress and time worked (the total of the task logs).
* **Dates and Targets**: start date, finish date, expected duration and task type.
* **Finances**: when *Display Budget Information* is on, the target budgets and the actual costs from task logs.
* **Assigned Users**, **Dependencies** and **Tasks depending on this Task**.
* **Departments**, **Task Contacts** and **Project Contacts**.
* **Description**.

Below that are the tabs:

Tab | Description
----- | -----
Task Logs | The task's logs, with hours, cost code and comments
Log | Add a new task log. When you edit a log, this tab is called Edit Log
Child Tasks | The subtasks, when the task has any
Files | The task's files (see the [Files Module](/modules/files.html))
Links | The task's links (see the [Links Module](/modules/links.html))
Other resources | The resources assigned to the task, when the Resources module is active (see the [Resources Module](/modules/resources.html))

### Gantt Charts

<a href="/assets/docs/tasks/gantt.png"><img src="/assets/docs/tasks/thumb-gantt.png" /></a>

The Gantt Chart is the center of nearly every project management system. As you create tasks and dependencies, the system handles the display and ordering to create the traditional waterfall pattern. To view the Gantt Chart, open a project and select the Gantt Chart tab. The charts need PHP's `gd` extension and *Enable Gantt Charts* turned on in System Configuration.

There are four key aspects to all Gantt Charts within Web2project:

* Tasks – A task appears as a bar from its start to its end date. As the percent complete is updated, a progress bar fills more and more of it.
* Dynamic Tasks – A dynamic task represents a series of other tasks as a rollup. It is drawn as a thin black bar with a triangle at each end, above the tasks it contains.
* Dependencies – Dependencies are represented by arrows connecting tasks from one to another. Due to the day-based display of the chart, a task which ends on the same day that a later task begins may display an arrow going backwards. This is not necessarily an error.
* Milestones – A milestone, regardless of its duration, is a diamond on a single date. It is green when complete, red when its date has passed, blue when not started and orange when in progress.

To keep a copy of a chart, use your browser's *Print → Save as PDF*; v5.0 removed the built-in PDF export.

### Task Logs / Reporting {#reporting-module}

<a href="/assets/docs/tasks/log.png"><img src="/assets/docs/tasks/thumb-log.png" /></a>

Whenever a User wishes to log time against the task, they can open the task and select "New Log" or the Log tab, or select the log icon on a task list. Either route gives a simple form to record the **Date**, **Progress**, **Hours Worked** (with a Start/Stop timer if you want to time the work), a **Billing Code**, a **Summary**, a **Description**, a **Reference** and a **URL**, and to update the **Task end date**. The e-mail options decide who gets the update, as described under Email Notifications above.

Once the log is saved, it becomes part of the ongoing project log, appears in many of the reports throughout the system, and is sent to whoever was selected. The percent complete of any parent tasks and of the overall project changes to reflect the new information, so anyone viewing the project immediately sees the updated information.

For organizations which require extensive reporting or accountability – especially common in legal, governmental, or medical areas – this model is useful for tracking projects closely, even daily. For others, the notifications may be unnecessary noise. Therefore, the defaults are set by the System Administrator in the default user preferences and can be adjusted by each user and on each log.

### My Tasks (Todo List)

<a href="/assets/docs/tasks/todo_tasks.png"><img src="/assets/docs/tasks/thumb-todo_tasks.png" /></a> <a href="/assets/docs/tasks/todo_gantt.png"><img src="/assets/docs/tasks/thumb-todo_gantt.png" /></a>

*My Tasks* in the header, or "my todo" on the Tasks list, shows the open tasks assigned to you. Each row has the edit, pin and log icons, then the percent complete, the task's priority (P), your own priority (U), the task name, the project name, the start date, the duration, the finish date and how many days the task is **Due In**. The dates are colour-coded with the same key as the Tasks list, which is an efficient way to monitor all your open tasks and deadlines across projects. With the proper permissions, you can also view other users' lists.

### Costcode Management

<a href="/assets/docs/system-admin/billing_code.png"><img src="/assets/docs/system-admin/thumb-billing_code.png" /></a>

Costcodes – called Billing Codes, Project Codes, etc by some organizations – are a simple method of allowing different users to track their time against specific types of tasks on individual task log entries. Some of this information can be used to track the type of work performed – such as administrative work versus development work – or even between different developers with differing billing rates. The [Billing Code Table](/modules/system-admin.html#billing-code-table-billingcode) in System Admin is where you set them up, and [Project Budgeting](/docs/project-budgeting.html) explains how they feed the budget figures.

{% include icon-discussion.html %} There has been quite a bit of discussion and development towards supporting detailed budget tracking and concepts such as Earned Value Management within Web2project. Consistent use of Costcodes is vital to tracking the relevant information.