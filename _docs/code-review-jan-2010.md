---
layout: page
title: Code Review - Jan 2010

category: code-review
---

### General Feedback

The Code Review was performed by [Matthew Turland](http://matthewturland.com/). Attachments referenced will be made available at a later time.

#### General Code Analysis

For a bit more in-depth analysis on this versus just a line count, I gave using Sebastian's phploc utility a shot. Installing it is just a matter of using pear channel-discover on components.ez.no and pear.phpunit.de and then doing pear install phpunit/phploc. See the attached file phploc.log for the output I get. The results look fairly promising:

* It looks like the project is at least for the most part retaining PHP 4 compatibility, if you want to consider that a good thing. Namespaces, interfaces, abstract classes, and anonymous functions don't appear anywhere. A few class constants appear to be the only 5-specific feature judging strictly by these results.

* Cyclomatic complexity is fairly low.

* Classes are fairly small, which suggests they have fairly specialized purposes as they should.

* Non-public methods are fairly minimal, which they should be - I tend to restrict use of these to methods supporting public methods that don't need to be called directly outside the class.

* There are approximately 2 comment lines for every 5 lines of code, which suggests relatively good documentation to me.

* Though the number of non-static methods dwarfs the number of static methods percentage-wise, I'd still suggest attempting to make the latter even more minimal.

* I'm not sure if you're in the process of moving more things to use OOP, but the mix of 184 methods versus 316 functions seems an odd ratio between the two paradigms.

#### Coding Standards

See the attached file phpcs.log. I just ran all PHP files through PHP_CodeSniffer using the PEAR standard with the following command run from the root trunk directory:

    for file in `find . -name "*.php" -not -wholename "*/lib/*"`; do phpcs --standard=PEAR $file >> phpcs.log; done

Using grep to do some analysis on the log file, I found there were 60,883 errors and 5,570 warnings across the 318 files analyzed. 26,552 of these are related to tabs being used instead of spaces for indentation, so that's some potentially low-hanging fruit. Another 2,245 refer to comments or docblock tags. Some, like class and method names, will obviously be a bit trickier to implement without breaking things. The command below can be used to give you a rough idea of what the other common issues are.

    grep '| ERROR ' phpcs.log | sed 's/^\s*[0-9]\+\s\+| \(ERROR\|WARNING\)\s\+|\s\+//g' | sort -u


#### Embedded CSS

See the attached file css.log. There are just over 400 lines where CSS styles are being embedded in markup rather than kept in stylesheets. In instances where style attribute valeues are dynamically injected using PHP, it's worth consideration to establish a convention for CSS class names and include those statically instead.

#### Dependency Injection

Providing an extremely accurate report on this is a difficult problem partly due to the dynamic nature of PHP. The easiest way to get a rough idea is to simply comb the codebase for class files and note the instances of the "new" keyword within them using the tokenizer. See the attached script di.php, which I used to do exactly that. di.log is its corresponding console output when I run it on trunk. The results merely don't necessarily indicate areas lacking dependency injection, merely areas that might, of which there are currently 478 lines.

#### Database Schema

I created the database using the command below, which appears to be equivalent to how install/manager.class.php handles it. A few errors occurred because the base install SQL file appears to already contain definitions for columns that subsequent files are also attempting to add. Modifying these by changing ADD to CHANGE may be advisable.

    $ for file in `find ./install/sql/mysql -name "0*.sql" | sort`; do mysql -u root --password=*** web2project < $file; done

    ERROR 1060 (42S21) at line 9: Duplicate column name 'task_log_created'

    ERROR 1060 (42S21) at line 6: Duplicate column name 'task_created'

    ERROR 1060 (42S21) at line 16: Duplicate column name 'project_created'

All database tables are currently using MyISAM. The only reason I could see for doing this would be that some parts of the application are using fulltext search, but they aren't that I can tell from the schema. As such, I'd recommend looking at moving to using InnoDB instead and adding foreign key constraints where applicable.

A number of columns have a default value of NULL. I'd be very careful with these as NULL can sometimes cause unexpected behavior. See http://ishouldbecoding.com/2008/01/20/nullification [dead] for more details on that.

A number of integer fields in the database do not currently have the unsigned keyword when they should, as it would double their storage capacity. This command performed on a full schema dump can give you a list of those:

    grep int web2project.sql | grep -v unsigned

#### Unit Tests

See the attached files run-tests.log and logfile.xml. I'm currently getting 6 failures and 1 error on the Tasks suite and 1 error on the Projects suite. Everything else appears to pass. I'm not sure if it's due to size or complexity, but these two suites also take the longest to execute: ~100s and ~46s respectively.

I don't know if you're in the school of thought that rejects code coverage reports - I know they have the potential to be misleading in terms of how well unit tests cover a codebase - but I noticed build.xml is currently configured not to include them and modified it to enable them. See the attached files build.xml.diff for the build.xml changes and the cc directory for the generated report, which claims that the tests coverage 100% of the codebase.