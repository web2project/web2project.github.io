---
layout: page
title: Overall Code Metrics
---

**Applies to**: v5.0.0 and later

One of the things this team has always prided itself on is the overall performance of the project and how we've improved metrics like code quality, duplication, test coverage, etc over time. To make sure our metrics are consistent and meaningful from release to release, we generate them the same way each time. This guide shares how.

## Set up

The tools are Composer development dependencies, so one command installs them all. From the web2project folder:

    composer install

That gives you, in `vendor/bin`:

* [Phing](https://www.phing.info/) 3, which runs the targets in `unit_tests/build.xml`
* [phploc](https://github.com/cmgmyr/phploc) 8, for size and complexity
* [PHP Depend](https://pdepend.org/) 2, for dependency and package metrics
* [PHPStan](https://phpstan.org/) 2, for static analysis

Some of these are *very* memory intensive. You may have to raise `memory_limit` for the command line PHP.

## The release metrics

The System Metrics section of each set of [release notes](/release-notes/index.html) comes from phploc. Run it from the web2project folder, leaving out the third-party code:

    vendor/bin/phploc . --exclude vendor --exclude lib

Then copy the figures into the release notes:

phploc output | Release notes line
----- | -----
Lines of Code (LOC), Comment Lines of Code (CLOC), Non-Comment Lines of Code (NCLOC) | Lines of Code: LOC (CLOC of comments, NCLOC of code)
Average Complexity per Class, Minimum and Maximum Class Complexity | Cyclomatic Complexity, Per Class: average (min, max)
Average Complexity per Method, Minimum and Maximum Method Complexity | Per Method: average (min, max)
Average Complexity per LLOC | Per Line of Code
Interfaces, Traits, Classes (Abstract Classes, Concrete Classes) | Interfaces, Traits, Classes
Average Class Length | Lines of Code/Class
Class Constants; Methods (Static, Non-Static, Public, Protected, Private) | Class Constants, Methods
Average Method Length | Lines of Code/Method
Functions, Constants (the totals) | Functions, Constants

## Phing targets

Run the targets from the web2project folder with:

    vendor/bin/phing -f unit_tests/build.xml <target>

Reports are written to `unit_tests/reports/`.

Target | What it does
----- | -----
`lint` | Runs `php -l` over every PHP file outside `lib`, `vendor` and `unit_tests`
`phploc` | Writes `phploc.txt` and `phploc.xml`, the same figures as the command above
`depend` | Runs PHP Depend: `jdepend.xml`, `jdepend-summary.xml`, a dependency chart and an overview pyramid
`phpstan` | Runs PHPStan at level 9 over `classes`, `includes`, `install`, `modules` and `style` and writes `phpstan.txt`
`metrics` | Runs `lint`, then `phploc`, `depend`, `phpstan` and `churn-grep`
`package` | Builds the release `.tar.gz` and `.zip`; see the [Release Checklist](/release-notes/checklist.html)

The `codesniffer`, `churn-grep` and `phpdoc` targets need tools or fixes that aren't in place yet, so don't rely on them.
