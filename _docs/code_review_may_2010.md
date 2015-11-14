---
layout: page
title: Code Review - May 2010
---

== Feedback from the tekX Code Review - 18 May 2010 ==

The Code Review was performed by [http://sebastian-bergmann.de/ Sebastian Bergmann] and [http://www.slideshare.net/TheSeer Arne Blankerts].

=== General Feedback ===

*  If we can clean up the Unit Tests to run without database access/configuration, we can make it easier for others - like Sebastian - to test, tests will also run faster;

=== includes/sendpass.php ===

*  Using the db_escape function instead of the standard escaping is going to throw things off;
*  Using the db_escape function to escape for email doesn't make sense;
*  Using lowercase() in the query modifies the data which nullifies the index;
*  Salt is used in the original password generation but not in the hashing;

=== includes/main_functions.php ===

*  <s>Converting the __autoload function to spl_autoload_register would allow more autoloads from sub-modules/libraries;</s> - Updated for v2.0
*  Use phpab to generate a static autoload lookup function for speed;

=== includes/backcompat_functions ===

*  Implementing the missing functions this way is a bad idea.. it creates a case where we have functions that look identical to the core functions but might not perform identically. It may be better to just require the library directly;

[[Category:Code Reviews]]
[[Category:Proposals]]
