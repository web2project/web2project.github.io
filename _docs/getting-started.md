---
layout: page
title: Getting Started with Web2project
---

**Applies to**: v5.0.0 and later

### Finding your way around

<a href="/assets/docs/getting-started/layout.png"><img src="/assets/docs/getting-started/thumb-layout.png" /></a>

Web2project v5.0 has one layout. The bar across the top has, from left to right, a button to show or hide the sidebar, the logo, *Global Search*, and on the right the *New Item* menu, *Today* (the Calendar), *My Tasks*, *Help* and your user menu with *My Info*, *Preferences* and *Logout*. On a narrow screen some of these move into the user menu.

The sidebar on the left lists the modules you can use, in up to four groups:

* **Work**: Companies, Projects, Tasks, Calendar, Contacts, Files, Links and the other everyday modules
* **Tools**: SmartSearch and, when you make them visible, Reports, History and Help
* **Modules**: any Add On modules you have installed
* **Administration**: User Admin and System Admin

Which modules appear depends on your permissions and on which modules are active (System Admin → View Modules).

### The Admin Account

<a href="/assets/docs/getting-started/change_password.png"><img src="/assets/docs/getting-started/thumb-change_password.png" /></a>

{% include icon-warn.html %} After you install, you must log in as admin and change the default password. Your system is not secure until you change the default admin password.

To change the password, log in and open *My Info* from the user menu at the top right. Select the "change password" link at the top of the page. This shows a small popup window allowing you to set a new password. To change another user's password, select User Admin in the sidebar, click the username, and use the same link.

While you're there, set the *Server Timezone* under System Admin → System Configuration, and your own time zone under *Preferences* in the user menu. See [Server and Database Configuration](/docs/server-configuration.html) and the [Security Notes](/docs/security-notes.html) for the other settings worth checking after you install.

### Create a Company

<a href="/assets/docs/companies/addedit.png"><img src="/assets/docs/companies/thumb-addedit.png" /></a>

Now create your first company. The fastest way is to choose "New Company" from the *New Item* menu at the top of any page. Alternatively, select Companies in the sidebar and then the "New Company" button. The next screen is where you fill in basic information on your organization. Nearly everything in the system – Projects, Users, Contacts, Files, Forums, and even Permissions – is attached to a Company.

Within CaseySoftware, much of the work is for other organizations. Creating a Company entry for each organization is a simple way of organizing Projects and limiting Permissions to respect privacy and confidentiality requirements. Before you deploy Web2project for your organization, you should carefully consider your information security needs.

Once you save, you can continue. At any time, you can select Companies in the sidebar to see all companies in the system and optionally filter by Company Owner.

{% include icon-question.html %} If you believe your company has disappeared, check the Owner filter at the top of the Companies list as most likely you have changed this filter to a different user. Just change it to “All” and all Companies to which you have permissions to view will appear.

### Create Users & Permissions

<a href="/assets/docs/users/addedit.png"><img src="/assets/docs/users/thumb-addedit.png" /></a> <a href="/assets/docs/users/roles.png"><img src="/assets/docs/users/thumb-roles.png" /></a>

Now that we have a Company, we can create new Users. Creating a User is a two step process. First, you must create the User in User Admin (in the sidebar under Administration). You give them a Login Name (case insensitive), a password, and fill in basic profile information including their Company. Clicking “submit” at this point will create the User.

Next, you must activate the User by assigning a specific set of Roles on the Roles tab of the user's page. Think of a Role as a permissions template which can be supplemented with Company or Project-specific permissions. The default Roles within Web2project are sufficient for the vast majority of organizations but you can add or refine those as necessary. Project worker is the most commonly used Role in most organizations as it allows a User to have complete access to all non-administration modules.

For example, if you have a contractor working on a single project and you wish to deny access to all other projects, you can apply the Project worker Role and then add the description “Deny on All Projects” and “Allow” to the specific project. More information and detailed explanations of Roles and Permissions are found in [Permissions 201](/howto/permissions-201.html).

{% include icon-question.html %} If you create a new User and they can't log in, the most common issue is they don't have a Role. Double check their Roles and assign at least one.

### Create a Project

<a href="/assets/docs/projects/addedit.png"><img src="/assets/docs/projects/thumb-addedit.png" /></a>

Now you can create your first Project. The fastest way is to choose "New Project" from the *New Item* menu at the top of any page. Alternatively, select Projects in the sidebar and then the "New Project" button. The next screen is where you fill in basic information on your Project.

As you create Projects, it is important to choose a unique color. This color designates the Project on the Calendar, users' *My Tasks* lists, and elsewhere throughout the system so choosing a unique color is useful as you use the system. Next, select a specific Project Owner and Company. This will be increasingly important as your permission and management requirements grow over time. Once you fill in the information relevant to your Project, save it to return to the project list.

{% include icon-question.html %} If you believe your project has disappeared, check the Type, Company and Owner filters at the top of the Projects list as most likely you have changed one of them. Just change them all to “All” and all Projects to which you have permissions to view will appear.

### Create & Assign Tasks

<a href="/assets/docs/tasks/addedit_1.png"><img src="/assets/docs/tasks/thumb-addedit_1.png" /></a>

Now that you have a Project, you can start creating Tasks. Within a Project, select "New Task" and you get a basic information screen with four tabs. Give the Task a name and visit the *Dates* tab to fill in Start and End dates and a Duration, and select “Human Resources” to assign individuals. Once you select “Save”, if *Notify Assignees of Task by Email* is ticked, email notifications are sent to the assignees other than the Task Owner. To understand the full scope of the Task fields and options, visit the [Tasks Module](/modules/tasks.html) section.

### Task List

<a href="/assets/docs/tasks/todo_tasks.png"><img src="/assets/docs/tasks/thumb-todo_tasks.png" /></a> <a href="/assets/docs/events/today_events.png"><img src="/assets/docs/events/thumb-today_events.png" /></a>

The most commonly used interface in the entire system is the *My Tasks* list, available from the *My Tasks* icon in the bar at the top of every page. In a default installation, users start on the Calendar's day view after login; you can change the start page under System Admin → System Configuration → *Start Up*.

This screen lists all of the users' assigned Tasks, including information on the overarching Project, start and end dates, and quick links to all of them. One of the most subtly useful aspects here is the date columns are color-coded according to their status. The colors represent "Future Task" (white), "Started and on time" (light blue), "Should have started" (yellow), "Overdue" (red), "Done" (green) and "Inactive" (grey). This is an efficient way to assess all of your assigned open tasks and deadlines at a glance. As a System Administrator, you may also choose to view other users’ lists.

### Task Logs

<a href="/assets/docs/tasks/log.png"><img src="/assets/docs/tasks/thumb-log.png" /></a>

To work on a Task, simply click the log icon to the left of the Task name. If you are actively working on the Task now, click on the "Start" button. Web2project will start counting up the minutes. Once you are done, click "Stop", fill in a summary, change the Progress if applicable, and click "update task". You will immediately see the task with a complete list of all its Task Logs.

### Reporting

<a href="/assets/docs/reports/task_log_cost_codes.png"><img src="/assets/docs/reports/thumb-task_log_cost_codes.png" /></a> <a href="/assets/docs/reports/project_statistics.png"><img src="/assets/docs/reports/thumb-project_statistics.png" /></a>

The most commonly used Report is "Task Log with Cost Codes". It gives you a single view showing all Task Logs over a specific date range. This report is useful for creating invoices or assessing how active team members are. To view it, open a project, select the "reports" link at the top of the page, choose "Task Log with Cost Codes", and select a Project, a User, and the date range to view all activity during that time. The Reports module isn't in the sidebar by default; see the [Reports Module](/modules/reports.html) to add it.

The next most common report is "Project Statistics". This gives an overview of a the status of a project including completed, in progress, and overdue tasks. In addition, it shows a simple breakdown of everyone’s hours on the project. This is a simple way of monitoring the overall health of a project – or all projects – without having to review each one.

There are numerous other reports available within Web2project. Some of them may suit your organization’s requirements but many will not. Therefore, we recommend evaluating your reporting needs to determine which of the existing Reports work for your organization. A deeper discussion of reporting is available in the [Reporting Module](/modules/reports.html) section.