---
layout: page
title: Installation / Getting Started

status: cleanup
---

First of all Thank You Very Much for trying web2Project, a Free Open Source Web-Based Business-Oriented Project Management System. It's a mouthful, we know.

Below you will find how to get started with web2Project. The advantages of using a web-based system to manage your projects will become clear to you specially if you need to handle large teams of collaborators all around the world. Alternatively, even if your entire team is four people in the same room, web2project can serve as a hub to keep your information centralized. Get ready for the feeling of finally getting grip over your life and getting everything that surrounds you into order.

To be clear, web2project won't *teach* you how to manage a project. Instead it will enable you to apply the project management principles you practice to your specific projects.

## Prerequisites

First, web2project is not a desktop application, it is web-based. Therefore there is no executable file for you to run locally. This application runs on a web server and is used via a web browser. This allows for your team to share information regardless of operating system. Mac, Windows, Linux, Solaris, we don't care.

Next, you need a computer with the following software configured:

### Web Server with PHP

This is the software server that controls the web communication between the Web Host Server (Hardware Web Server) and each Web Client (user browser). All versions of web2project support *'Apache*' (*v2 or higher is recommended*) and all versions since [v1.2.2 (January 2010)](/release-notes/1.2.html) have supported IIS 7 and above.

As of web2project v3.2, you must use PHP 5.3.8 or above but PHP 5.5.x is recommended in all cases.

### Database Server

We are still attached to MySQL for the backend database server, but due to technical reasons web2Project requires at the very minimum to use MySQL v. 5.0 (or higher).

### User Browser

We took in consideration all the major browser engines around and we took an extra step in providing visual and functional compatibility with the following browsers:
**Firefox 3.5** (or higher), **Internet Explorer 7** (IE9+ is preferred), **Opera 9.2** (or higher) and **Safari 3** (or higher).

### More information / Suggestions

A fully configured Apache-Mysql-PHP installation is called an "AMP stack". Further, if it's on Linux, Windows, or Mac OSX, this is called [LAMP](http://en.wikipedia.org/wiki/LAMP_%28software_bundle%29), [WAMP](http://en.wikipedia.org/wiki/WAMP), or [MAMP](http://en.wikipedia.org/wiki/MAMP) respectively. If you're not familiar with setting these up, there are packages that will handle most of the work for you. In the past, PHP configuration on IIS was the most difficult, but Microsoft has released a package called the [Web Platform Installer](http://www.iis.net/webpi) which makes it almost effortless. If you're using IIS, check it out.

If you're looking for a hosting account to do all of this for you, [Dreamhost](http://www.dreamhost.com/r.cgi?231075) is a good option.

*While we try to help new web2project users as much as possible, we rarely offer debugging help LAMP/WAMP installations.*

## Creating a New Install

* Download the latest [web2project release](https://github.com/web2project/web2project/archive/master.zip)
* Decompress it into the directory of your choice - we'll call it "web2project" in this case - and place it within your webserver's web directory. If you're using Apache on Linux, this will normally be */var/www/html* or - on a hosting account - *public_html* within the user's home folder. With IIS on Windows, it is normally something like *C:\inetpub\wwwroot*. If you're not sure, ask your system administrator. It's their job to know.
* Next, create a database, a database user, and give the user access to the database. Remember this information for later. While the command line will work, most people find phpMyAdmin easier.
* Go to http://{domain}/web2project/ and the system will walk you through the process.
* On the database connection step, you'll need the database information from above.
* If there are instructions on the screen, please follow them. We write them to make everyone's life easier.
* You'll need to set up a [http://en.wikipedia.org/wiki/Cron cron job (documentation)] or [http://www.iopus.com/guides/winscheduler.htm Scheduled Task on Windows (documentation)] some potential help to interact with the queuescanner script regularly. Every five minutes is a good interval. If you use wget, ``*/5 * * * * wget -O - -q http://{domain}/web2project/queuescanner.php;`` may work for you or if you prefer the command line ``*/5 * * * * cd ~/public_html/web2project/ ; php queuescanner.php`` may work. Remember to customize the paths according to your needs.
  * If your timezone is not identical to the default, you need to change: system timezone in systemadmin, user default timezone (system admin - default user preferences) and user timezone (in user - preferences) (of all users already created - at least for your admin account)
* Enjoy.

## Upgrading an Existing Install

* Switch your current installation back to the basic web2project theme.
* Backup your database. No, I don't care if you made a backup yesterday. Make another. You can never have too many.
* Download the latest [web2project release](https://github.com/web2project/web2project/archive/master.zip)
* Rename your existing web2project directory. Normally adding an underscore at the beginning of the directory name is sufficient.
* Decompress it into the directory of your choice - we'll call it "web2project" in this case - and place it within your webserver's web directory.
* Copy the existing ``files`` directory and ``/includes/config.php`` file from your old web2project install into the same places in your new web2project directory.
* Copy any [Add On Modules](/modules/add-on.html) from your old ``/modules`` directory to the new one.
* **Warning:** If you converted from dotProject before the web2project v2.3 release, you will likely have to run this database update before proceeding:  ALTER TABLE `projects` ADD `project_actual_end_date` datetime default NULL;
* Go to http://{domain}/web2project/install/ and the system will walk you through the process. If there are instructions on the screen, please follow them. We write them to make everyone's life easier.
* Log out and log back in. Some portions of the configuration are cached for performance reasons. That cache is reset when you log out.
* If your system whitescreens or shows lots of garbage on the page, visit [http://forums.web2project.net/ our Forums] for support. This is rare but occasionally happens.
* After the upgrade is complete, test your theme by changing it for one user before setting it as the System Default.
* Enjoy.

*  **Note:** *Some steps can take a significant amount of time. Once it starts, get a cup of coffee or read a news story.*
*  **Note:** *Before upgrading, you may briefly see errors or warnings. Take a deep breath. Nothing is necessarily wrong.*
*  **Under no circumstances should you copy your new web2project files over your existing web2project directory. This will leave numerous irrelevant or supposed-to-be-deleted files and make everyone's life more complicated.**

## Converting from dotproject

* Switch your current installation back to the basic dotproject theme.
* Backup your database. No, I don't care if you made a backup yesterday. Make another. You can never have too many.
* Download the latest [web2project release](https://github.com/web2project/web2project/archive/master.zip)
* Decompress it into the directory of your choice - we'll call it "web2project" in this case - and place it within your webserver's web directory.
* Copy the existing ``files`` directory and ``/includes/config.php`` file from your old dotproject install into the same places in your new web2project directory.
* Go to http://{domain}/web2project/install/ and the system will walk you through the process. If there are instructions on the screen, please follow them. We write them to make everyone's life easier.
* If your system whitescreens or shows lots of garbage on the page, visit [http://forums.web2project.net/ our Forums] for support. This is rare but occasionally happens.
* After the upgrade is complete, test your theme by changing it for one user before setting it as the System Default.
* Enjoy.

*  **Note:** *We currently support converting all versions of dotProject from v2.0 (April 2005) through the latest 2.1.5 release.*
*  **Note:** *Some steps can take a significant amount of time. Once it starts, get a cup of coffee or read a news story.*
*  **Note:** *Before upgrading, you may briefly see errors or warnings. Take a deep breath. Nothing is necessarily wrong.*
*  **Under no circumstances should you copy your new web2project files over your existing dotproject directory. This will leave numerous irrelevant or supposed-to-be-deleted files and make puppies cry.**

Source: Pedro, [original Support Forums](http://web2project.net/forums/viewtopic.php?t=1011) - probably also earlier versions of w2p - some problems occurred in 1.2

## Obtaining the very latest code from code development

Beware - this code is not for production use and only for use by developers who are willing to look at an error and offer fixes, suggestions, or cash. We prefer small denominations or unmarked bills, but let's be honest.. we're not picky.

If you are interested in the latest developments, try the [Latest Development](/docs/latest-development.html)

## User Guide

Movies are too fast? Then you will find a comprehensive User Guide here: [web2Project User Guide](https://leanpub.com/web2project-user-manual)

Thank you very much to Stephen Pierce for producing this work, and Bruce Bodger for taking the pictures in style.