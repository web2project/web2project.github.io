---
layout: page
title: Code Review - Oct 2009

category: code-review
---

== Feedback from the CodeWorks 2009 Code Review - 03 October 2009 ==

The Code Review was performed by [http://sebastian-bergmann.de/ Sebastian Bergmann], [http://www.slideshare.net/TheSeer Arne Blankerts], and [http://priebsch.de/en/blog/ Stefan Priebsch].

=== General Feedback ===

*  Drop the security sentinel where all logic is wrapped in a class and therefore not executable by a direct http call;
*  <strike>Instead of using the explicit class loaders, an autoloader option could be useful and simplify the code</strike> - Implemented in v1.2, Dec 2009;
*  <strike>Construct a Response Object to pass error conditions and status back and forth;</strike> - Implemented in v2.4, July 2011

=== Object-Oriented Aspects ===

*  <strike>Convert constructors to php5-style;</strike> - Implemented in v1.2, Dec 2009;
*  <strike>Use the php5-style parent:: construct for instantiation;</strike> - Implemented in v1.2, Dec 2009;
*  Refactor the object properties to stop using public everything;
*  <strike>The canDelete methods should be explicit in what can/can't be deleted;</strike> - Implemented in v3.0, Dec 2012;
*  <strike>Use Dependency Injection to get DB access into the methods;</strike> - Implemented in v3.0, Dec 2012;
*  Use prepared statements instead of DBQuery class;
*  <strike>Refactor the controllers to be skinny (with fat models)</strike> - Begun under v1.2, Dec 2009, continuing to present day;- Nearly complete in v3.0, Dec 2012;
*  Separate the models from the data access layer;