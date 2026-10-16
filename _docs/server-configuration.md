---
layout: page
title: Server and Database Configuration
---

**Applies to**: v5.0.0 and later

This page collects the server-side settings web2project depends on. For the step-by-step install, see the [Installation Guide](/docs/installation.html).

## PHP

* **Version:** PHP 8.0 or later. v5.0 is tested on PHP 8.3.
* **Required extensions:** `mysqli` and `mbstring`.
* **Recommended extensions:** `gd` (Gantt charts), `zlib` (some Add On modules) and `ldap` (only if you use LDAP logins).
* **Composer:** run `composer install --no-dev` in the web2project folder after unpacking or updating it. It installs the libraries in `vendor/`.
* **Errors:** web2project hides PHP errors from the browser by default. See [Turn on Debugging](/docs/turn-on-debugging.html) to show them.

The installer checks the PHP version and the `mysqli`, `gd`, `zlib` and `ldap` extensions before it creates anything. It doesn't check `mbstring`, so confirm that one yourself (`php -m`).

## Database

* **Server:** MySQL 8.x or MariaDB 10.x. v5.0 is tested on MariaDB 10.11 and MySQL 8's default settings.
* **Database and user:** create an empty database and a user with full rights on it. The installer creates the tables and writes the credentials to `includes/config.php`.
* **Character set:** the connection uses the `dbchar` setting in `config.php` (`utf8` by default).
* **sql_mode:** strict mode is fine. MySQL 8 turns on `ONLY_FULL_GROUP_BY` by default, which broke several pages in older releases; web2project now removes it for its own connection, so you don't need to change the server's setting.
* **Upgrades:** System Admin → *Apply System Updates* runs any new migrations and lists every SQL error it hits. A clean upgrade or fresh install reports none. If you see errors, keep the message: it names the migration file.

## Files and folders

Folder | Needs to be writable by the web server | Why
----- | ----- | -----
`includes/` | during installation only | the installer writes `includes/config.php`
`files/` | always | uploaded files, one folder per project
`files/temp/` | always | temporary files
`locales/` | only while translating | the Translation Management editor saves here

After installing, you can make `includes/` read-only again.

{% include icon-warn.html %} Uploaded files are stored in `files/` inside the web root. They are protected only by `files/.htaccess` (`deny from all`), which uses Apache 2.2 syntax. Make sure your web server really blocks direct access:

* **Apache 2.4:** the old syntax only works with `mod_access_compat`. Otherwise put this in `files/.htaccess` or your site configuration:

        Require all denied

* **nginx** ignores `.htaccess`; add a rule to your server block:

        location ^~ /files/ { deny all; }

Then check that `http://{web2project-install}/files/` returns 403 Forbidden. Logged-in users still download files through `fileviewer.php`, which checks permissions. See [Security Notes](/docs/security-notes.html).

## Scheduled tasks (cron)

Task reminders, queued email notifications and the modules' maintenance hooks run from `queuescanner.php`. Run it every few minutes, either through the web server:

    */10 * * * * wget -O - -q http://{web2project-install}/queuescanner.php

or from the command line, which works even if the web server blocks the URL:

    */10 * * * * cd /path/to/web2project && php queuescanner.php

## Sessions

Sessions are stored in the database by default (System Admin → System Configuration → *Session Handler*: "web2Project Extended Sessions"). Two settings control how long they last:

* **Session Idle Time** (default `2d`): logs a user out after this long without a request.
* **Session Maximum Lifetime** (default `1m`): logs a user out this long after logging in, active or not.

Values are in seconds unless followed by one letter: `h` (hours), `d` (days), `m` (months) or `y` (years). `28h` is valid; `2d4h` is not.

Each login is recorded in the access log, which feeds the user list's Online/Offline status and the Active Sessions tab in User Admin. A login stays open until the user logs out or the session expires.

## Time zones

* The **server time zone** is set during installation (System Admin → System Configuration → *Server Timezone*).
* Each user sets their own time zone under *Preferences* in the user menu at the top right.
* Dates and times are stored in UTC and shown in the user's time zone. Make sure the PHP and database servers keep the correct time.
