---
layout: page
title: FAQ
---

Q & A gleaned from the [Forums](http://forums.web2project.net/)

Looking for articles/documentation about Web2project? Check out the [Core Modules page](/modules/core.html) which presents documentation for each module.

## Infrastructure

### Why doesn't Web2project work with PHP 5.x?

The core PHP group itself ended all PHP 5.x support - including security fixes - as of January 2019. Web2project will follow suit by mid-2019. Please upgrade your PHP version to 7.2+

###  The Installer/Upgrader says I don't have GD Support. How do I add it?

Install the php7-gd module via apt-get or your favorite package manager and restart Apache. Then it should appear in your phpinfo() list as expected.

## Day to Day Usage

### Why can't my new user log in?

The Web2project permissions system assigns no privileges by default. Before a new User can log in, they must be assigned a Role in the User Administration Module. If you are looking for an advanced explanation of Permissions, please read "Permissions 201". TODO

### Help! I’ve lost my Company/Project/Task/Event and now I can’t find it on any of the lists!

The most common cause of this problem is Owner-based Filtering on the list screen. Go to the relevant list and look in the upper right-hand corner for the filters. Most modules filter by Owner but some modules allow more options. Setting all of these values to “All” and you should see the full list.

### I just created a Task and assigned myself. Why didn’t I get an email notification?

Web2project assumes the creator of the Task knows the Task was created. In the System Configuration, you can change this to automatically notify the creator.

### How can I create a template project to reuse across projects?

First, create your template. Create a project normally, add the tasks to it, and make it a Template project by setting its Project Status to template.

Next, notice that your Template will only appear on the Templates tab on the Project List. This will keep it out of your way in task lists, reports, and other screens. 

Finally, when you create a new project, in the "Import tasks from:" combo box pick your template project. Once you save the project, the entire template will be cloned into this project. This does not modify or replace any existing tasks.

### How can I move a task X days later/earlier?

Within the Project Designer, choose your project, then select the relevant tasks. Find the box labeled "Date Move (Days)" and fill in how many days you want to shift the tasks. You can use a negative number to move them earlier.

### How are Parent Projects different from Dynamic Tasks?

Project parent is used to package or collect a set of projects into a single view for tracking, reporting, etc. Each project will have its own due dates, assignments, and information while the parent project will roll up the lower projects and potentially add its own information. 

A Dynamic Task is defined entirely as the total of its subtasks' due dates and durations. It does not have its own information.
 
In practice, they look and behave similarly. The biggest distinction is that Projects can be owned by different Companies and have distinct permissions while Tasks do not.

### When we have a parent/child project combination, both projects display in the projects list. Why and what's the best way to view them?

Each project can have a separate status or company, potentially with separate permissions. If we only showed the top parent or root project, we could inadvertently hide all child projects.

If you view any project directly, you can see the overall project structure and Gantt charts representing their details.





### In the Reports Module, I checked "Make PDF" and hit submit but it's still a web page. Where's my PDF?

At the bottom of the generated list you'll see the link "View PDF File". Click there and the PDF will then be generated.

## Customizing the System

### How can I customize Web2project to match my organization’s theme/style?

Although many of the aspects are properly defined in the CSS, the current Web2project release is still rather difficult to theme. Regardless, the most commonly changed aspects (header, footer, and login page) are available within the `/style/_common` within your installation. You can learn more about theming in Chapter TODO

### Where can I find add-on modules, customizations, language packs, etc?

Many add-on modules are available from our [Github project](https://github.com/web2project) and many were written by the Web2project community. All translations are available in our [locales repository](https://github.com/web2project/locales). If you don’t see the translation you need, please consider writing your own and sharing it with the community.

### My date is in a screwy format! How do I fix it?

You just need to change your system preferences. Select "My Info" in the upper right-hand corner and then "edit preferences" just above your profile. This will allow you to choose a date format. In addition, if you want to change the defaults for future users, within the System Admin, select "Default User Preferences". This will allow you to edit the same details for all users created after this time. By design, it does not edit existing users’ preferences, this is not an error.

### I’ve just installed a Module and I don’t see it. Where is it?
 
Before a Module will appear in the navigation, you must first install it and then activate it. Occasionally, you'll also need to perform specific steps or provide additional configuration information. Most module include a `README` file which describes this process in detail.

### What does the Public Module do?

Nothing, it exists purely for public messages like “Access Denied”. It should never appear on your navigation menu.

## Development

### How do I get the code from Github?

You can either clone the repository from our [Github repository](https://github.com/web2project/web2project) or download the code in [zip format](https://github.com/web2project/web2project/archive/master.zip) if you prefer.

#### Can I use the latest development version in production?

Technically, yes, but we don't recommend it. When there are architecture or UI changes, there are often times when the codebase is unstable and not suitable for production use. If you choose to use it anyway, you do so at your own risk.

### OMG. I found a bug, what do I do!?

Please visit the [Web2project bug tracker](http://bugs.web2project.net/) and check to see if the issue has been reported or even resolved. If it's been fixed, the bug report should link to the fix which you may be able to apply yourself. If it has not been reported, please do so and be as descriptive as possible. Remember, if we don't get enough information to reproduce it, we can't fix it. Finally, if it's already been reported and there's not a fix, you can track and monitor any bug report. That will email you whenever there's a change.

### When I look in the Web2project bug list, it says my issue is fixed in development, but Github master is still broken!

In Github, the master branch is always considered stable and usually identical to the latest release. All development is done on a development branch. The two branches are merged just before the next release. If you *need* these fixes, you may be able to merge them into your master branch, but please be careful.

### Where else can I get support and help with Web2project?

There are a variety of locations available. First and foremost, there are the [Web2project Support Forums](http://support.web2project.net). Questions and comments can be posted there freely and anyone in the community can answer you. Alternatively, there are many recommendations and explanations available on the [Web2project Wiki](http://wiki.web2project.net/). 

### Web2project is great! How can I support the project?

There are a variety of ways to show your support:

* First of all, you or your organization can donate to the project using the information from our [Support Web2project page](http://support.web2project.net/page/support-web2project.html).
* You can be an active part of the community by submitting bug reports, sharing patches, testing release candidates, answering questions in the forums, convincing your boss to evaluate the tool, or generally let us know how you are using Web2project and what we can do to make things even better.
* Finally, you can tell others about the project and get them to do any or all of the above.

### Web2project is great, but it doesn’t do X. How can I get it to do X?

Before you do anything else, search in both the [Support Forums](http://support.web2project.net) and in the [issue tracking system](http://bugs.web2project.net) - and see if someone else has figured it out, submitted it, discussed it, or already exists and you just missed it. Alternatively, one of the benefits of Open Source software is that you can always do it yourself. At any time, you can get the latest code and write any extensions or customizations you choose. If you create modifications and patches that are relevant to core, you can submit patches via Github Pull Requests and may see your contributions in the next release.

### Why are you writing this manual and what are you getting out of this?

Keith Casey and CaseySoftware, LLC have been deeply involved with Web2project since its inception and led the community effort throughout its lifetime. This manual is one aspect of this effort and will hopefully encourage additional organizations to use Web2project and improve the overall system and the community as a whole. Any and all proceeds from this book will be used to support the project’s infrastructure.

If you are interested in additional training, support, or custom development, please feel free to contact us at [CaseySoftware.com](CaseySoftware.com).