---
layout: module
title: Reports Module

category: core-module

module_name: Reports
module_path: reports
module_creator: dotProject
module_devs: web2project
module_version: 5.0
module_source: https://github.com/web2project/web2project
module_download: https://github.com/web2project/web2project/releases
---

## Module Overview

The Reports module summarises hours, costs and task status across your projects. Open a project and select the "reports" link at the top of the project view, or use the same link in ProjectDesigner. The Reports module isn't in the main navigation by default; to add it under *Tools*, go to System Admin → View Modules and switch Reports from "hidden" to "visible".

The reports index lists every report with a short description. At the top of every report is a **Projects** drop-down: choose one project or "All". Most reports then ask for a period (**For period** … **to**, with a calendar for each date) and show their results on the page when you select "submit".

<a href="/assets/docs/reports/index.png"><img src="/assets/docs/reports/thumb-index.png" /></a>

{% include icon-info.html %} v5.0 removed PDF output, and the reports don't offer CSV downloads. To keep a copy, use your browser's *Print → Save as PDF*. The old Daily, Hour Summary, Task Summary, Weekly, Upcoming, Completed and Overdue reports are no longer included.

### Allocated user hours

<a href="/assets/docs/reports/allocated_user_hours.png"><img src="/assets/docs/reports/thumb-allocated_user_hours.png" /></a>
Shows how many hours each user has allocated in the period, by day or by week, against their total capacity. Options: **Log All Projects**, **Use assigned percentage**, **Hide non-working days**, and **Tasks created by**.

### Budgets by Project and Budget Category

<a href="/assets/docs/reports/budgets_by_category.png"><img src="/assets/docs/reports/thumb-budgets_by_category.png" /></a>
For a company (**For Company**), compares each project's budget per budget category with what has been used and what remains. Option: **Active Projects Only**.

### Costs By Project

<a href="/assets/docs/reports/costs_by_project.png"><img src="/assets/docs/reports/thumb-costs_by_project.png" /></a>
For a company, compares each project's target budget with its actual cost, with the project owner, start and finish dates. Option: **Active Projects Only**.

### Costs By Task

<a href="/assets/docs/reports/costs_by_task.png"><img src="/assets/docs/reports/thumb-costs_by_task.png" /></a>
For the selected project, compares each task's target budget with its actual cost, with the task owner, start and finish dates.

### Overall Report

<a href="/assets/docs/reports/overall.png"><img src="/assets/docs/reports/thumb-overall.png" /></a>
Totals the hours logged in the period for each company's projects, split by billing code, with a grand total. Option: **Log All** to ignore the period.

### Project Statistics

<a href="/assets/docs/reports/project_statistics.png"><img src="/assets/docs/reports/thumb-project_statistics.png" /></a>
For the selected project: task counts by status (complete, in progress, not started, past due), the hours worked by each task assignee, the project team, and the space used by the project's files. Tasks without an assignee are counted under "No Assignee". This report has no options.

### Tasks end date
Lists each task's end date with its last activity date, owner, hours allocated and percentage done, for tasks ending in the period.

### Task List

<a href="/assets/docs/reports/task_list.png"><img src="/assets/docs/reports/thumb-task_list.png" /></a>
Lists the tasks of the selected project, or of all projects, with their start and end dates, description, assignees and completion. Besides the period, the *Default Actions* buttons pick a period for you: Previous or Next Day, Week or Month. The **value for the previous buttons** box multiplies them, so 2 with "Previous Month" shows the last two months. Option: **Log All** to include every task regardless of date.

### Task Log with Cost Codes

<a href="/assets/docs/reports/task_log_cost_codes.png"><img src="/assets/docs/reports/thumb-task_log_cost_codes.png" /></a>
Lists the task logs in the period with their creator, hours, description and billing code, and totals them. Options: **Company**, **User** (or all users), **Log All** to ignore the period, and **Ignore 0 hours**.

### Task Log Valued

<a href="/assets/docs/reports/task_log_valued.png"><img src="/assets/docs/reports/thumb-task_log_valued.png" /></a>
The same as *Task Log with Cost Codes*, plus the cost and amount of each log based on its billing code.

### Tasks sorted by user

<a href="/assets/docs/reports/tasks_by_user.png"><img src="/assets/docs/reports/thumb-tasks_by_user.png" /></a>
Shows the tasks allocated to each user or to one user. Options: **Levels to display** (how deep into subtasks to go), **Use the period** to limit the tasks to the dates above, and **Display allocated hours/week**.

### User performance

<a href="/assets/docs/reports/user_performance.png"><img src="/assets/docs/reports/thumb-user_performance.png" /></a>
Compares the hours each user worked with the hours allocated to them. Option: **Log All**. User efficiency is based on actual versus estimated time for completed tasks: a user who finishes in less time than the task allowed is more than 100% efficient, and one who takes longer is less than 100%.
