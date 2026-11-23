---
layout: page
title: Unit Tests
---

**Applies to**: v5.0.0 and later

**Warning:** *DO NOT run these tests on a web2project installation that has important data. The unit tests for web2project are destructive and will write and remove data in your database. They should never be run on Production.*

The tests run against their own database, which a script builds as a fresh install. They refuse to run against the database in `includes/config.php`.

## What you need

* A working development copy of web2project, from a clone of the [GitHub repository](https://github.com/web2project/web2project)
* PHP 8.3 or later on the command line, as for web2project itself
* [Composer](https://getcomposer.org/)
* MySQL or MariaDB, with a database user that can create and drop the test database (or an administrator who creates it once)

PHPUnit, Phing and the code metrics tools are Composer development dependencies, so you don't need to install them separately.

## Set up

1. From the web2project folder, install the development dependencies:

        composer install

1. Make sure `includes/config.php` exists, for example from installing web2project in that copy. The tests read the database host and login from it.
1. Build the test database:

        php unit_tests/build-test-db.php

    It drops and creates `<dbname>_test` (for example `w2p_test`), then runs every migration through the installer's upgrade manager, so it matches a fresh install. The `admin` login's password is `passwd`, the system time zone is UTC and the admin's time zone is America/Chicago; the tests are written against these. If the database user isn't allowed to create databases, the script prints the `CREATE DATABASE` and `GRANT` statements for an administrator to run, and you run it again afterwards.

To use another database, host or login, set `W2P_TEST_DBNAME`, `W2P_TEST_DBHOST`, `W2P_TEST_DBUSER` and `W2P_TEST_DBPASS` before running the script and the tests. Both refuse to use the application's own database. Rebuild the test database whenever you want a clean start, and after pulling new migrations.

The test runs for this release used MariaDB 10.11 with its default strict `sql_mode`.

## How to run the tests

From the `unit_tests` folder, run PHPUnit with the bundled configuration:

```
cd unit_tests
../vendor/bin/phpunit -c phpunit.xml
```

To run one file or folder, add its path:

```
../vendor/bin/phpunit -c phpunit.xml classes/w2p/Utilities
```

This takes a little while and gives you the results on your system. The names of the tests should be pretty self-explanatory, and any errors that come up give you details on where to look.

At the v5.0.0 release the suite runs 597 tests (1796 assertions) with no errors or failures; 120 are skipped or marked incomplete. A change shouldn't add an error or failure. See the [release notes](/release-notes/5.0.0.html).

## Test Structure

If you would like to dig deeper into the unit tests and possibly contribute, below is the directory and file structure. Each test class extends `CommonSetup`, which loads web2project, logs in as `admin` and extends PHPUnit's `TestCase`.

```
unit_tests/CommonSetup.php
unit_tests/phpunit.xml
unit_tests/test-db.php
unit_tests/build-test-db.php
```

The bootstrap, the PHPUnit configuration and the test database helpers. `phpunit.xml` runs every test below the `unit_tests` folder. `CommonSetup.php` switches to the test database (see `test-db.php`) before it loads web2project.

```
unit_tests/classes/w2p/
```

Tests for the core classes in `classes/w2p`, in folders that match the class names (for example `Utilities` for `w2p_Utilities_*`). `Mocks` holds the mock objects the tests share.

```
unit_tests/modules/
```

Tests for the module classes, one folder per module (`companies`, `projects`, `tasks` and so on).

```
unit_tests/includes/
```

Tests for `includes/main_functions.php` and `includes/cleanup_functions.php`.

```
unit_tests/src/
```

Tests for the e-mail classes (`w2p_Output_EmailManager` and the e-mail templates).

```
unit_tests/build.xml
```

The Phing build file for code metrics and release packaging. See [Overall Code Metrics](/docs/code-metrics.html) and the [Release Checklist](/release-notes/checklist.html).
