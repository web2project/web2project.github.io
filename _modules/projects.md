---
layout: module
title: Projects Module

category: core-module

module_name: Projects
module_path: projects
module_creator: dotProject
module_devs: web2project
module_version: 5.0
module_source: https://github.com/web2project/web2project
module_download: https://github.com/web2project/web2project/releases
---

## Module Overview

The very essence of web2Project is the ability to effectively manage projects. The Project Module is the foundation for [Tasks](/modules/tasks.html) and the heart of the system. Almost every other module in the system uses the project module in some sort of capacity to pull or share information.

### Creating a Project

<a href="/assets/docs/projects/addedit.png"><img src="/assets/docs/projects/thumb-addedit.png" /></a>

Select "Projects" in the navigation and then "New Project", or choose "New Project" from the "New Item" menu at the top of any page.

* First, give your Project a distinctive **Name**, a **Short Name** and a **Color Identifier**. These help distinguish it throughout the system for both you and your users.
* Next, assign it to a **Company**, and optionally to one or more departments. For many organizations, all projects will be assigned to the customer's company for easier permissions management, but your organization may have different requirements.
* A **Parent Project** groups this project under another one. See the [FAQ](/docs/faq.html#how-are-parent-projects-different-from-dynamic-tasks) for how this differs from dynamic tasks.
* Every project has a **Project Owner**. By default this is the person who created the project, but it can be changed to any active user. Being the owner doesn't confer any special permissions.
* **Start Date** and **Target Finish Date** set the plan. The **Actual Finish Date** is calculated from the tasks.
* **Status** decides which tab of the Projects list the project appears on, and tracks the project through its lifetime. **Priority**, **Project Type** and **Active** are also set here; an inactive project drops off the "All Active" tab.
* **Import tasks from** copies all the tasks of another project, usually a template, into this one. See below.
* **Contacts** links people from the Contacts module to the project.
* **URL**, **Staging URL** and **Project Location** are references for your team; web2project doesn't use them.
* When *Display Budget Information* is on (System Admin → System Configuration), the form also has **Target Budgets** per budget category, adding up to the **Total Target Budget**, and the **Actual Budget**. See [Project Budgeting](/docs/project-budgeting.html).
* **Notify by Email** e-mails the project owner about the change.
* Finally, save the project. If you have made a mistake, you can edit or even delete it from the project view if you have the proper permissions.

{% include icon-info.html %} **Project templates.** Create a project with status "Template" and add its tasks. When you create a new project and pick the template under *Import tasks from*, web2project copies every task with its parent, dependencies and assignees, and moves the dates so the earliest task starts on the new project's start date. The template itself isn't changed. You can import into an existing project too; existing tasks are kept. Within CaseySoftware, the most common template is a "Phase Template" covering a development phase from Requirements Discovery to Delivery, imported once per phase.

### Projects List (Projects Index Page)

<a href="/assets/docs/projects/index.png"><img src="/assets/docs/projects/thumb-index.png" /></a>

Selecting Projects from the navigation takes you to the Projects list.

At the top of the page are the **Type**, **Company** and **Owner** filters, the "New Project" button and a printer icon that opens a printable list.

Below the filters is a row of tabs, each with the number of projects it holds: "All Projects", "All Active", one tab per project status, and "Archived" for inactive projects. You can change the status tabs in System Admin under the *ProjectStatus* lookup values.

By default the list has these columns:

* **%**: the project's colour, and its progress as a percentage.
* **P**: the priority. An arrow pointing down is low priority, an arrow pointing up is high, and no arrow is normal.
* **Project Name**: hover over it to see the description, and click it to open the project. A (+) before the name means it is a parent project; click it to show or hide its subprojects.
* **Company**: click it to open the company.
* **Start**, **End** and **Actual**: the start date, target end date and actual finish date.
* **Owner**
* **Tasks**: the number of tasks.
* **Selection**: tick projects, choose a status at the bottom of the list and select "Update projects status" to change them all at once. The drop-down starts on the status of the tab you are on.

Other project lists, such as the Projects tab on a department or a user, also show an **LP** column with a warning icon when one of the project's task logs is flagged as a problem. The task log form no longer has a Problem checkbox, so only logs from older versions carry that flag.

Click a column heading to sort by it. Long lists are split into pages, and the page links keep your sort order.

### Viewing a Project (Projects View Page)

<a href="/assets/docs/projects/view.png"><img src="/assets/docs/projects/thumb-view.png" /></a>

Clicking a project's name opens the project view. The links at the top lead back to the projects list, to editing the project, to [Reports](/modules/reports.html) and to ProjectDesigner.

The top of the page has these sections:

* **Details**: company, short name, start, target end and actual end dates, owner, URLs and location.
* **Summary**: status, priority, type, progress, whether it is active, and the scheduled and worked hours.
* **Finances**: when *Display Budget Information* is on, the target budget per category and the actual costs from task logs.
* **Departments** and **Project Contacts**.
* **Description**.
* For subprojects and parent projects, the multi-project structure it belongs to.

Below that are the tabs. The tabs that appear depend on which modules are active and on your permissions. By default they are:

* [Tasks](/modules/tasks.html): the active tasks
* Tasks (Inactive): tasks marked inactive
* Tasks (All): active and inactive tasks together, in tree order
* Gantt Chart
* Task Logs: the logs of the project's tasks, filtered by user or cost code, and optionally hiding inactive or complete tasks
* [Events](/modules/events.html)
* [Files](/modules/files.html)
* [Forums](/modules/forums.html)
* [History](/modules/history.html)
* [Links](/modules/links.html)

If you add more values to the *TaskStatus* lookup, each one gets its own "Tasks (*status*)" tab before "Tasks (All)".

### Project Ownership / Company Filtering

One of the most common problems users face after they save their first project is that it seems to disappear. Normally the project still exists and no data was lost, but the user is unable to find it. When looking at the Project List screen, the Company, Owner and Type filters at the top of the page narrow the list. Set them all to "All" and every project you have permission to see is listed. Also check the tab: a project only appears on the tab for its status, on "All Projects", and on "All Active" while it is active.
