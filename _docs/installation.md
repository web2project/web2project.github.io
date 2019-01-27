---
layout: page
title: Installing and Upgrading Web2project
---

Installing Web2project is the same as installing any other PHP project and has minimal requirements. The definitive version of this [Installation Guide](https://docs.web2project.net/docs/installation.html) is available online but this section should be the same.

**Requirements:**

These requirements have been tested and validated. Web2project may work with other versions or systems but they are not formally supported. These requirements apply regardless of whether you're installing, upgrading, or converting.

* PHP 7.x+
* Apache 2.x+ or IIS 7.x+
* Mysql 5.x+

## Install Instructions

1. Uncompress your web2project archive (often named `web2project.tar.gz` or `web2project.zip`) 
2. Upload the resulting folder to a web-accessible directory on your web server. Note the resulting URL as this will be your new web2project installation.
3. Create a mysql database and a user with full access to the database. Save these database name and credentials as you will need them later.
4. Point your browser to the URL noted above.
5. The Installer should detect that you are creating a fresh installation.
6. Confirm that your web server meets the minimum requirements. If it does not, resolve those issues. If it does, continue.
7. Use the database name and credentials from above to configure the database connection.
8. Select "Install Db & Write Cfg." The system should create all database tables and configure the base system.
9. If the Installer could not create the `config.php` file, copy and paste it to create your own.
10. Log into your system with the provided username and password.
11. Change your username and password.
12. Proceed to [Getting Started](/docs/getting-started.html) or the [Frequently Asked Questions](/docs/faq.html) as you need.
13. Add a cron job to run system maintenance tasks such as sending email notices, etc. The easiest approach is to request the URL below via a cron job: 

> `wget -O - -q http://{web2project-install}/queuescanner.php`

{% include icon-warn.html %} If you run into any problems, we recommend that you resolve the issue and then delete `config.php` and drop the database tables to try again.


## Upgrade Instructions

1. Back up your database and `files` folder. You can never have too many backups.
2. Uncompress your web2project archive (often named `web2project.tar.gz` or `web2project.zip`)
3. Upload the resulting folder to your web server.
4. Copy your `files` folder from your previous folder to the new one.
5. Copy your `includes/config.php` file from your previous  folder to the new one.
6. Rename the old folder.
7. Rename the new folder to the old folder's previous name.
8. Point your web browser to your Web2project folder.
9. Log in with an Administrator account.
10. Select the System Admin module and choose "Apply System Updates"
11. The Installer will handle applying all updates.
12. Use your system as normal.

## Convert from dotProject

1. Back up your database, the `files` folder, and `includes/config.php`. You can never have too many backups.
2. Uncompress your web2project archive (often named `web2project.tar.gz` or `web2project.zip`)
3. Upload the resulting folder to your web server. Note the resulting URL as this will be your new web2project installation.
4. Copy your `files` folder from your dotProject folder to your Web2project folder.
5. Copy your `includes/config.php` file from your dotProject folder to your Web2project folder.
6. Point your browser to your web2project folder.
7. The Installer will detect the dotProject configuration and apply database updates, data transformations, and update the `config.php`. *This may take a while depending on how big your database is.*
8. Log into your system with your existing username and password.
9. Add a cron job to run system maintenance tasks such as sending email notices, etc. The easiest approach is to request the URL below via a cron job: 

> `wget -O - -q http://{web2project-install}/queuescanner.php`

{% include icon-warn.html %} If you run into any problems, we recommend that you overwrite your new `config.php` with the dotProject version and restore the dotProject database the issue and then delete `config.php` to try again.