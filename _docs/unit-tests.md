---
layout: page
title: Unit Tests
---

== Warning! ==

The unit tests for web2project are destructive and will remove some data from your database. '''DO NOT run these tests on a web2project installation that has important data.'''

We suggest running these tests against a fresh install of web2project* to test functionality and compatibility with your modules using a backup of your data... ''they should never be run on Production''.

 * A few tests may fail if you have set your timezone in web2project or php.ini

== What you need ==
*  Fully Functional installation of web2project - http://www.web2project.net
*  PHP 5.2+ due to dependencies in the PHPUnit database extenstions
*  Phing - Install Instructions: http://phing.info/trac/wiki/Users/Download
**  pear channel-discover pear.phing.info
**  pear install phing/phing (2.4.6 is the latest version confirmed as compatible)
*** Make sure PHING_HOME is set in your environment: http://www.phing.info/docs/guide/stable/chapters/Setup.html#Unix
*** Running the following command on a GNU/Linux worked fine: export PHING_HOME=$(pear config-get data_dir)'/phing'
*  PHPUnit - Install Instructions: http://www.phpunit.de/manual/current/en/installation.html
**  Prior to web2project v3.0, you must use PHPUnit 3.5 (3.5.15 is the latest version confirmed as compatible)
**  To use PHPUnit 3.6.x, I had to upgrade phpunit/PHP_CodeCoverage (to v1.1.1), phing/phing (to v2.4.9), phpunit/PHPUnit (to v3.6.7), phpunit/DBUnit (to v1.1.1), and apply the patch described here: https://github.com/sebastianbergmann/dbunit/pull/51/files
**  If you are upgrading from a previous version of PHPUnit, quite often you will have to follow these instructions - http://sebastian-bergmann.de/archives/899-PHPUnit-3.5-Upgrading-Woes.html
*  VersionControl_SVN - Install Instructions: http://pear.php.net/package/VersionControl_SVN/download/0.3.1/
*  Command line access to the server running web2project

== How to run the tests ==
If you want to get down and dirty and get the tests running, simply make your way to the unit_tests directory under the directory where you installed web2project and run the following command.


'''phing run-tests'''


This will take a little bit of time, hopefully only a few seconds and give you the results on your system. The names of the tests should be pretty self-explanatory and any errors that come up will give you details on where to look and figure out the problems if any do show up.

'' '''Warning:''' The unit tests for web2project are destructive and will write and remove data from your database. Please DO NOT run these tests on a web2project installation that has data that you do not want to lose. They should never be run on Production.''

== Test Structure ==
If you would like to dig deeper into the unit tests and possibly contribute below is the directory and file structure. All of the tests are written using the PEAR coding standard which can be found here -  http://pear.php.net/manual/en/standards.php.


'''unit_tests/classes/'''

Contains all the tests for the classes in web2project named [class].test.php. Each file in the directory contains a single class named [class]_Test and extends the PHPUnit_Framework_TestCase if not database testing is to be done or PHPUnit_Extensions_Database_TestCase if database testing is necessary.


'''unit_tests/db_files/'''

Contains all the database files for seeding tests and for comparison when tests have been completed. They are all in the XML Dataset format for the PHPUnit database extensions described here (http://www.phpunit.de/manual/current/en/database.html#database.datasets.xml) and are named either as [class,module,include]Seed.xml or as the name of the test that uses it for comparison.


'''unit_tests/includes/'''

Contains all the tests for the includes in web2project named [include].test.php. Each file in the directory contains a single class named [include]_Test and extends the PHPUnit_Framework_TestCase if not database testing is to be done or PHPUnit_Extensions_Database_TestCase if database testing is
necessary.


'''unit_tests/modules/'''

Contains all the tests for the modules in web2project named [module].test.php. Each file in the directory contains a single class named [module]_Test and extends the PHPUnit_Framework_TestCase if not database testing is to be done or PHPUnit_Extensions_Database_TestCase if database testing is
necessary.


'''unit_tests/reports/'''

Contains the html reports of the unit tests results after the tests have been run. Can be viewed from a browser as an easier to understand version of the results that you will see when running the tests from the command line.

[[Category:Getting Started]]