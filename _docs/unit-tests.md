---
layout: page
title: Unit Tests
---

**Applies to**: v5.0.0 and later

**Warning:** *DO NOT run these tests on a web2project installation that has important data. The unit tests for web2project are destructive and will write and remove data in your database. They should never be run on Production.*

Run the tests against a separate, freshly installed test database. A few tests may fail if you have set your time zone in web2project or php.ini.

## What you need

* A working development copy of web2project, from a clone of the [GitHub repository](https://github.com/web2project/web2project)
* PHP 8.2 or later on the command line (PHPUnit 11 needs it, even though web2project itself runs on PHP 8.0)
* [Composer](https://getcomposer.org/)
* MySQL or MariaDB, and command line access to the server

PHPUnit, Phing and the code metrics tools are Composer development dependencies, so you don't need to install them separately.

## Set up

1. From the web2project folder, install the development dependencies:

        composer install

1. Create a separate database for testing and install web2project into it with the installer, keeping the default `admin` / `passwd` login. The tests log in with it.
1. Point `includes/config.php` at the test database (the `dbname` setting). The tests use the same configuration file as the application, so switch it back before you use the system again, or keep a separate copy of web2project for testing.

The test runs in this release used an empty server `sql_mode`. Test under your server's default (strict) mode before relying on the results there.

## How to run the tests

From the `unit_tests` folder, run PHPUnit with the bundled configuration:

    cd unit_tests
    ../vendor/bin/phpunit -c phpunit.xml

To run one file or folder, add its path:

    ../vendor/bin/phpunit -c phpunit.xml classes/w2p/Utilities

This takes a little while and gives you the results on your system. The names of the tests should be pretty self-explanatory, and any errors that come up give you details on where to look.

At the v5.0 release the suite runs 509 tests with 7 errors and 15 failures; those are known and listed in the [release notes](/release-notes/5.0.0-rc1.html). A change shouldn't add to them.

## Test Structure

If you would like to dig deeper into the unit tests and possibly contribute, below is the directory and file structure. Each test class extends `CommonSetup`, which loads web2project, logs in as `admin` and extends PHPUnit's `TestCase`.

    unit_tests/CommonSetup.php
    unit_tests/phpunit.xml

The bootstrap and the PHPUnit configuration. `phpunit.xml` runs every test below the `unit_tests` folder.

    unit_tests/classes/w2p/

Tests for the core classes in `classes/w2p`, in folders that match the class names (for example `Utilities` for `w2p_Utilities_*`). `Mocks` holds the mock objects the tests share.

    unit_tests/modules/

Tests for the module classes, one folder per module (`companies`, `projects`, `tasks` and so on).

    unit_tests/includes/

Tests for `includes/main_functions.php` and `includes/cleanup_functions.php`.

    unit_tests/src/

Tests for the e-mail classes (`w2p_Output_EmailManager` and the e-mail templates).

    unit_tests/build.xml

The Phing build file for code metrics and release packaging. See [Overall Code Metrics](/docs/code-metrics.html) and the [Release Checklist](/release-notes/checklist.html).
