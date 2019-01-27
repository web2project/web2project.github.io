---
layout: page
title: Getting Started with Web2project
---

{% include icon-warn.html %} After you install, you must  log in as admin and change the default password. You system is not secure until you change the default admin password.

### The Admin Account

To change the password, log in and select User Admin from the navigation menu to see all active users in your system. Simply click the username and then click the "change password" button in the upper right corner. This will show a small popup screen allowing you to set a new password.

### Create a Company

Now create your first company. The fastest way is to click Company from the top navigation menu and then click the “New Company” button on the far right. Alternatively, on any screen within Web2project, the *New Item* dropdown will allow you to immediately create a new Company. The next screen is where you fill in basic information on your organization. Nearly everything in the system – Projects, Users, Contacts, Files, Forums, and even Permissions – is attached to a Company.

Within CaseySoftware, much of the work is for other organizations. Creating a Company entry for each organization is a simple way of organizing Projects and limiting Permissions to respect privacy and confidentiality requirements. Before you deploy Web2project for your organization, you should carefully consider your information security needs.

Once you save, you can continue. At any time, you can click back on the Company link and see all companies in the system and optionally filter by Company Owner.

{% include icon-question.html %} If you believe your company has disappeared, check the Owner Filter in upper right-hand corner as most likely you have changed this filter to a different user. Just change it to “All” and all Companies to which you have permissions to view will appear.

### Create Users & Permissions

Now that we have a Company, we can create new Users. Creating a User is a two step process. First, you must create the User within the User Admin. You give them a Login Name (case insensitive), a password, and fill in basic profile information including their Company. Clicking “submit” at this point will create the User.

Next, you must activate the User by assigning a specific set of Roles. Think of a Role as a permissions template which can be supplemented with Company or Project-specific permissions. The default Roles within Web2project are sufficient for the vast majority of organizations but you can add or refine those as necessary. Project Worker is the most commonly used Role in most organizations as it allows a User to have complete access to all non-administration modules.

For example, if you have a contractor working on a single project and you wish to deny access to all other projects, you can apply the Project Worker Role and then add the description “Deny on All Projects” and “Allow” to the specific project. More information and detailed explanations of Roles and Permissions are found in [Permissions 201](/howto/permissions-201.html).

{% include icon-question.html %} If you create a new User and they can't log in, the most common issue is they don't have a Role. Double check their Roles and assign at least one.

### Create a Project

Now you can create your first Project. The fastest way is to click Project from the navigation menu and then click the “New Project” button on the far right. Alternatively, on any screen within Web2project, the *New Item* dropdown will allow you to immediately create a new Project. The next screen is where you fill in basic information on your Project.

As you create Projects, it is important to choose a unique color. This color designates the Project on the Calendar, Users’ Todo lists, and elsewhere throughout the system so choosing a unique color is useful as you use the system. Next, select a specific Project Owner and Company. This will be increasingly important as your permission and management requirements grow over time. Once you fill in the information relevant to your Project, click “submit” to return to the project list.

{% include icon-question.html %} If you believe your project has disappeared, check the Owner or Company filters in upper right-hand corner as most likely you have changed one of them. Just change both to “All” and all Projects to which you have permissions to view will appear.

### Create & Assign Tasks

Now that you have a Project, you can start creating Tasks. Within a Project, select "New Task" and you get a basic information screen with four tabs. Give the Taska  name and visit the *Dates* tab to fill in Start and End dates and a Duration, and select “Human Resources” to assign individuals. Once you select “Save”, email notifications will be generated to everyone except the Task Creator. To understand the full scope of the Task fields and options, visit the [Tasks Module](/modules/tasks.html) section.

### Task List

The most commonly used interface in the entire system is "My Tasks To Do" screen available via the *My Tasks* link in the upper right window. In a default installation, this will be all users' first screen after Login.

This screen lists all of the users' assigned Tasks, including information on the overarching Project, start and end dates, and quick links to all of them. One of the most subtly useful aspects here is the date columns are color-coded according to their status. The four colors represent "Future Tasks" (white), "Started and on time" (green), "Should have started" (peach), and "Overdue" (red). This is an efficient way to assess all of your assigned open tasks and deadlines at a glance. As a System Administrator, you may also choose to view other users’ lists.

### Task Logs

To work on a Task, simply click "log" to the left of the Task name. If you are actively working on the Task now, click on the "Start" button. Web2project will start counting up the minutes. Once you are done, click "Stop", fill in a comment, change the Progress if applicable, and click "Update Task". You will immediately see the Task Overview screen with a complete list of all Task Logs.

### Reporting

The most commonly used Report is the "Task Log Report". It gives you single view showing all Task Logs over a specific date range. This report is useful for creating invoices or assessing how active team members are. To view it, click "Reports", "existing", "Task Log", and select a Project, a User, and the date range to view all activity during that time.

The next most common report is the "Project Statistics Report". This gives an overview of a the status of a project including completed, in progress, and overdue tasks. In addition, it shows a simple breakdown of everyone’s hours on the project. This is a simple way of monitoring the overall health of a project – or all projects – without having to review each one.

There are numerous other reports available within Web2project. Some of them may suit your organization’s requirements but many will not. Therefore, we recommend evaluating your reporting needs to determine which of the existing Reports work for your organization. A deeper discussion of reporting is available in the [Reporting Module](/modules/reports.html) section.