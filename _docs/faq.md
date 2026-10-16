---
layout: page
title: FAQ
---

Q & A gleaned from the [community discussions](https://github.com/orgs/web2project/discussions)

Looking for articles/documentation about Web2project? Check out the [Core Modules page](/modules/core.html) which presents documentation for each module.

## Infrastructure

### Which version of PHP do I need?

Web2project v5.0 needs PHP 8.0 or later and is tested on PHP 8.3. PHP 7 and older are no longer supported. The full list of requirements is in [Server and Database Configuration](/docs/server-configuration.html).

###  The Installer/Upgrader says I don't have GD Support. How do I add it?

Install the `gd` extension for your PHP version with your package manager (for example `php8.3-gd` on Debian or Ubuntu, `php-gd` on Fedora or RHEL) and restart your web server or PHP-FPM. Then it should appear in your phpinfo() list as expected. GD is only needed for the Gantt charts.

### Is there any ongoing maintenance I should perform on Web2project?

First, you should make sure to upgrade as we release new versions. That is the best way to make sure any security issues are resolved quickly with minimal risk.

Second, if you are queuing email notifications, you must create a scheduled task to poll the system to send those emails. On Linux or Unix based systems, that can be as simple as this cronjob which will generate messages every ten minutes.

`*/10 * * * * wget -O - -q http://{web2project-install}/queuescanner.php`

See [Server and Database Configuration](/docs/server-configuration.html#scheduled-tasks-cron) for a command-line alternative.

### How do I back up Web2project safely?

To make sure you back up the entire system, you need to back up the database, the file uploads and your `includes/config.php` file.

* The simplest way to backup the database is to use MySQL's build in mysqldump command. For further information on this utility and its usage, please reference the MySQL Users’ Manual. 
* To backup the file uploads, we recommend compressing the entire `files` folder. For more fine-grained backup practices, the numbered folders within `files` correspond to Project Id's. 

<hr />

## Day to Day Usage

### Why can't my new user log in?

The Web2project permissions system assigns no privileges by default. Before a new User can log in, they must be assigned a Role in the User Administration Module.

### Help! I’ve lost my Company/Project/Task/Event and now I can’t find it on any of the lists!

The most common cause of this problem is Owner-based Filtering on the list screen. Go to the relevant list and look in the upper right-hand corner for the filters. Most modules filter by Owner but some modules allow more options. Setting all of these values to “All” and you should see the full list.

### I just created a Task and assigned myself. Why didn’t I get an email notification?

Web2project assumes the owner of the Task knows the Task was created, so by default the owner isn't included in task and event notifications. To change this for yourself, open *Preferences* from the user menu at the top right and set *Task Notification Method* to "Include task/event owner". To change it for users created from now on, use System Admin → *Default User Preferences*.

### How can I create a template project to reuse across projects?

First, create your template. Create a project normally, add the tasks to it, and make it a Template project by setting its Project Status to template.

Next, notice that your Template will only appear on the Template tab of the Projects list. This will keep it out of your way in task lists, reports, and other screens. 

Finally, when you create a new project, in the "Import tasks from:" combo box pick your template project. Once you save the project, the entire template will be cloned into this project. This does not modify or replace any existing tasks.

### How can I move a task X days later/earlier?

Within the Project Designer, choose your project, then select the relevant tasks. Find the box labeled "Date Move (Working Days)" and fill in how many working days you want to shift the tasks. You can use a negative number to move them earlier.

### How are Parent Projects different from Dynamic Tasks?

Project parent is used to package or collect a set of projects into a single view for tracking, reporting, etc. Each project will have its own due dates, assignments, and information while the parent project will roll up the lower projects and potentially add its own information. 

A Dynamic Task is defined entirely as the total of its subtasks' due dates and durations. It does not have its own information.
 
In practice, they look and behave similarly. The biggest distinction is that Projects can be owned by different Companies and have distinct permissions while Tasks do not.

### When we have a parent/child project combination, both projects display in the projects list. Why and what's the best way to view them?

Each project can have a separate status or company, potentially with separate permissions. If we only showed the top parent or root project, we could inadvertently hide all child projects.

If you view any project directly, you can see the overall project structure and Gantt charts representing their details.

### How do I get a PDF of a report or a Gantt chart?

v5.0 removed the built-in PDF output. Open the report or chart and use your browser's *Print → Save as PDF* instead.

<hr />

## Customizing the System

### How can I customize Web2project to match my organization’s theme/style?

Since v5.0, Web2project has a single Bootstrap 5.3 theme in `style/bootstrap`. The most commonly changed parts are there: the header and navigation (`header.php`), the footer (`footer.php`), the sign-in page (`login.php`) and the colours and styles (`main.css`). Every other page template lives in `style/_common`; to change one, copy it to the same path under `style/bootstrap` and edit the copy, because Web2project uses the `style/bootstrap` version first.

Upgrades replace both folders, so keep a copy of your changes and re-apply them after each upgrade.

### Where can I find add-on modules, customizations, language packs, etc?

Many add-on modules are available from our [Github project](https://github.com/web2project) and many were written by the Web2project community. All translations are available in our [locales repository](https://github.com/web2project/locales). If you don’t see the translation you need, please consider writing your own and sharing it with the community.

### My date is in a screwy format! How do I fix it?

You just need to change your system preferences. Open the user menu in the upper right-hand corner and select *Preferences*. This will allow you to choose a date format. In addition, if you want to change the defaults for future users, within the System Admin, select "Default User Preferences". This will allow you to edit the same details for all users created after this time. By design, it does not edit existing users’ preferences, this is not an error.

### I’ve just installed a Module and I don’t see it. Where is it?
 
Before a Module will appear in the navigation, you must first install it and then activate it. Occasionally, you'll also need to perform specific steps or provide additional configuration information. Most modules include a `README` file which describes this process in detail.

### What does the Public Module do?

Nothing, it exists purely for public messages like “Access Denied”. It should never appear on your navigation menu.

<hr />

## Development

### How do I get the code from Github?

You can either clone the repository from our [Github repository](https://github.com/web2project/web2project) or download a release from the [releases page](https://github.com/web2project/web2project/releases) if you prefer.

#### Can I use the latest development version in production?

Technically, yes, but we don't recommend it. When there are architecture or UI changes, there are often times when the codebase is unstable and not suitable for production use. If you choose to use it anyway, you do so at your own risk.

### OMG. I found a bug, what do I do!?

Please visit the [Web2project issue tracker](https://github.com/web2project/web2project/issues) and check to see if the issue has been reported or even resolved. If it's been fixed, the bug report should link to the fix which you may be able to apply yourself. If it has not been reported, please do so and be as descriptive as possible. Remember, if we don't get enough information to reproduce it, we can't fix it. Finally, if it's already been reported and there's not a fix, you can track and monitor any bug report. GitHub will notify you whenever there's a change.

### When I look in the Web2project issue list, it says my issue is fixed in development, but Github master is still broken!

In Github, the master branch is always considered stable and usually identical to the latest release. All development is done on a development branch. The two branches are merged just before the next release. If you *need* these fixes, you may be able to merge them into your master branch, but please be careful.

<hr />

## Ongoing Support

### Where else can I get support and help with Web2project?

There are a variety of locations available. First and foremost, there are the [Web2project Discussions](https://github.com/orgs/web2project/discussions). Questions and comments can be posted there freely and anyone in the community can answer you. Alternatively, there are many recommendations and explanations available in the [Web2project Documentation](http://docs.web2project.net/). 

### Web2project is great! How can I support the project?

There are a variety of ways to show your support:

* You can be an active part of the community by submitting bug reports, sharing patches, testing release candidates, answering questions in the discussions, convincing your boss to evaluate the tool, or generally let us know how you are using Web2project and what we can do to make things even better.
* Finally, you can tell others about the project and get them to do any or all of the above.

### Web2project is great, but it doesn’t do X. How can I get it to do X?

Before you do anything else, search in both the [Discussions](https://github.com/orgs/web2project/discussions) and in the [issue tracker](https://github.com/web2project/web2project/issues) - and see if someone else has figured it out, submitted it, discussed it, or already exists and you just missed it. Alternatively, one of the benefits of Open Source software is that you can always do it yourself. At any time, you can get the latest code and write any extensions or customizations you choose. If you create modifications and patches that are relevant to core, you can submit patches via Github Pull Requests and may see your contributions in the next release.

### Why are you writing this manual and what are you getting out of this?

Keith Casey and CaseySoftware, LLC have been deeply involved with Web2project since its inception and led the community effort throughout its lifetime. This manual is one aspect of this effort and will hopefully encourage additional organizations to use Web2project and improve the overall system and the community as a whole. Any and all proceeds from this book will be used to support the project’s infrastructure.

If you are interested in additional training, support, or custom development, please feel free to contact us at [CaseySoftware.com](https://caseysoftware.com).