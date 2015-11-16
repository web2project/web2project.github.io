---
layout: page
title: Project Budgeting

category: proposal
status: draft
---

## Definitions

* Project - In general, any collections of tasks and the relationships between them such as dependencies and parent/child relationships. In web2project, a Project is represented by the CProjects class within the [Projects](/modules/projects.html) module.
* Task - A thing which requires work to be performed. It can be as small and simple as placing a call to order pizza or as complex as designing the next Intel processor. Whether stand-alone or dependent on other tasks or a milestone event, each task has start/end dates and a set of individuals assigned to it. Further, a Task can be considered a "rollup task" (in Microsoft Project lingo) or a "dynamic task" (web2project lingo) to represent a set of tasks beneath it. In web2project, a Task is represented by the CTasks class within the [Tasks](/modules/tasks.html) module.
* Tasklog - The work performed on a task by an individual. At minimum, a tasklog has to include who worked on the task and when. In web2project, a Tasklog is represented by the CTasklog class within the [Tasks](/modules/tasks.html) module. Further, it captures information on when the log was both created and updated.
* Billing Code - An identifier used by an individual to associate their work effort with a particular type of work or cost/billing rate or both. In web2project, a Billing Code (also called Cost Code) is managed via the [System Admin](/modules/system-admin.html) which allows an Admin to create a series of Billing Codes associated with a billing rate specific to a given Company. Then, when an individual adds a Tasklog for their effort, they can choose a Billing Code to connect it to a cost.
* Fixed Costs - Expenses which are not dependent on the number of hours, material consumed, or anything else that may vary from effort to effort. For example, this could be a license for SQL Server for a software development team or a city permit application for a construction site. In web2project, this information is not currently captured.
* Variable Costs -Expenses which are variably and completely dependent on the hours, material, or some other consumable item which is tracked per-unit. For example, this could be a contractor's time for a software development team or concrete for a construction site. In web2project, hours are tracked via the Tasklogs but material or other per-unit costs are not currently captured.

## Background

*For all intents and purposes, a Project is simply a set of Tasks and the relationships between those Tasks. Therefore, all notes below can be applied to either the Project or the individual Tasks within a Project.*

While tracking time information - both estimates and actuals - is vital to projects, tracking the financial costs are at least as important, if not more so. While the rules, requirements, and procedures vary from industry to industry, the underlying information is the same. There are a number of facets to the cost of a task:

* The most obvious is the cost of the time consumed by everyone working on the task. This is determined by multiplying the time used (Task Logs) by the hourly rate (Billing Code).
* Next, there could be the cost of materials consumed in the Task. As of v2.0, web2project does not support collecting this information.
* Next, there could be one-time costs (eg. licensing, hardware purchases, travel) required for the Task. As of v2.0, web2project does not support collecting this information.
* Next, there could be ongoing costs (eg. equipment rental) required for the Task. As of v2.0, web2project does not support collecting this information.
* Finally, there could be administrative costs which are added to the Task. These could be fixed price or % based on some set of the costs listed above. As of v2.0, web2project does not support collecting this information.

Further, the core concepts are *probably* similar enough for us to capture the information generically and then provide reporting in a way that will be meaningful to the specific industries. In order to provide useful information, we need to answer questions such as:

* How much of the budget has been consumed? How much is left?
* What is the estimated rate of consumption?
* How does the estimated vs actual rate of consumption vary?
* At the current rate of consumption, when will the budget be exhausted?
* Finally, each of the above questions should be considered for each of the cost areas identified.

## Workflow

* When an individual logs time against a given task and selects a costcode, a number of things immediately occur.
* Do something..
* If no costcode is selected, nothing happens.