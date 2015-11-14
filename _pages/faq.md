---
layout: page
title: FAQ
---

Q & A gleaned from the Forums: http://forums.web2project.net/

Looking for articles/documentation about Web2Project? Check out the [[Core Modules page]] which presents documentation for each module.

== Infrastructure ==

===  The Installer/Upgrader says I don't have GD Support. How do I add it? ===
*  This is usually because either a) PHP was not compiled with GD support or b) GD support was enabled but Apache was not restarted.
**  The second case is easier, simply restart Apache and check to see that it's now in the phpinfo() list.
**  In the first case, you may have to uninstall (purge if you're using apt-get) php5-gd, install the module cleanly from scratch, and then restart Apache. [http://serverfault.com/questions/238948/how-to-install-php5-gd-on-ubuntu 1] [http://php.net/manual/en/image.installation.php 2]

== Projects ==

===How can I create a template project and then copy it and update it for each new project?===

All you need to do is create a project normally, add the tasks to it and make it a Template project by setting its Project Status to template.
Notice there is a Template tab on the Projects List for you to see all the templates you created so far.
You should do this to make sure that the Template project will not appear on Incomplete tasks lists and reports, though you can use any project to import tasks from.

Now, if you create a new project you can go to the "Import tasks from:" combo and pick your template project from there and when you submit the project it will copy the whole task structure of your Template project into the project you are creating.

===Parent Projects vs Dynamic Tasks===

Project parent is used to set parenthoods of projects.
That way you can build projects with multiple levels, and have a way to group/organize projects in a tree.

Example:
You have a project that will be built by several different companies that will be responsible for doing specific parts of the overall (parent) project.

Well you can say you can achieve the same thing by doing dynamic tasks or parent tasks. Not really.
You can do that but then you would have permission problems if you'd like users of a certain company not to see tasks from another companies users.

So multi-project structures will aid you to build projects where you can use permissions to limit the visibility of parts of the project to certain users instead of others.

===When you add a new sub project to an existing one, both display in the project table. What's the best way to view them?===

Projects can be in different statuses so if you had to show only the parent projects you'd loose the information about the child projects and their situation across the statuses.

You can see an overall gantt for a projects tree, just view one of the projects of the tree of projects and they you will see on the project information box an option that says something like "+ This Project is Part of the Following Multi-Project Structure:", now if you click the plus icon you will see the list of projects of the tree and the gantt chart for the multi-project structure.

== Tasks ==

===How can I move a task in time?===

Select them on the tasks list through the checkboxes, and move them in time a certain number of days.

So... select a task (by either clicking a checkbox or any portion of its line), then type 7 on the "Date Move (Days)" and hit "update", it should move that task to the next week.
Therefore it moves already existing project tasks in day units.
If you use a negative figure it should send the tasks back in time (so -7 means a week earlier).

===I entered some dynamic tasks but now I am editing the task to add a web url and I get an error telling me that I need to enter a start date.===

You don't need to set a start or end date to dynamic tasks....dynamic tasks start and end date are automatically set by its children. Dynamic tasks, normally know as Umbrella tasks have that behavior so when you change its children they will get the start date of the first child task in time, and the end date of the last child task in time. You can see what I mean through a Gantt chart.

R - I understand that I don't need to set start or end date for dynamic tasks but the system is requiring that I enter one anyway.

A - That's the doing of a System Config. option. See on the Task section of it, and uncheck the option that is forcing you to enter tasks start and end dates.

== Companies ==

===Companies vs company owner vs Contacts===

In creating company owners, that person must have an account.. but …I don't want to create a new account for my clients. Which is better - create their accounts and simply not tell them they have one...or assign a contact as a company owner.

Yes, that would do as they would be inactive users and therefore they wouldn't be able to log in

== Calendar ==

===To see project tasks in the calender do I enter the task details again under EVENTS?===

The tasks are filtered on a company basis, so you can use the Company filter on the Calendar to see the tasks relating to each Company. And no, you do not need to add the tasks as events as far as calendar is concerned.

== Reports ==
===I clicked "Make PDF" and Submit. I get the report on screen but it's not in PDF format===
At the bottom of the generated list you'll see the link "View PDF File". Click there and the PDF will then be generated.


== Email ==

Certain changes (e.g. task updates) allow automatic sending of emails to task assignees, if their email addresses have been registered in user admin. The email configuration varies from server to server and from mail server to mail server, but to use Google's SMTP, it's as simple as:

'''SMTP Host:''' smtp.gmail.com

'''SMTP Username:''' mygmailusername

'''SMTP Password:''' mygmailpassword

'''SMTP Port:''' 25

'''SMTP Secure:''' TLS

'''SMTP Server Timeout:''' 30

'''Email Transport:''' SMTP
