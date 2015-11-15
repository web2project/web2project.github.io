---
layout: page
title: Google Summer of Code

category: proposal
---

This is the idea page for web2project. We have a variety of things here ranging from things core and vital to the future growth of the project to curiosities and oddball things that we'd like to explore.

In addition to the ideas here, we have our issue tracker - http://bugs.web2project.net/view_all_bug_page.php - which documents all bugs and feature requests out there. If you want to get creative, please feel free.

== 2011 Ideas ==

Mentor: Keith Casey, Project Lead - Austin, TX - https://github.com/caseysoftware

Assistant Mentor: Trevor Morse, Test King - Halifax, Nova Scotia - https://github.com/trevormorse

=== General Ideas ===

*  <s>Pluggable Storage Backend for the Files module - I (Keith) built a pluggable backend for dotProject (circa 2.0.4)[http://dotproject.svn.sourceforge.net/viewvc/dotproject/trunk/dotproject/modules/files/storage/], but we'd like to see support for file storage on S3, Dropbox, Azure, and other support[http://bugs.web2project.net/view.php?id=64].</s> - Implemented in v3.1

*  Mobile apps.. using and expanding the current API specification and implementation[https://github.com/trevormorse/web2project-api] to build apps for Android, iOS, Windows Phone 7, and simple WAP[http://bugs.web2project.net/view.php?id=568]. We are open to a cross platform solution such as AIR/Flex or Titanium.

*  Bidirectional iCalendar support - Allow someone to edit events locally (Outlook, Thunderbird, Google Calendar) and have updates pushed back to web2project automatically.

*  Our current authentication system supports a simple database table backend, LDAP, and PostNuke (legacy). We want authentication modules to interact with systems such as Drupal, WordPress, OpenID, SugarCRM, and Joomla. Further, it should support a configurable order for failover. ''Since web2project usually lives behind the corporate firewall and holds sensitive information, Facebook and Twitter are not relevant to this idea.''

*  ''Operational Ideas:'' We need to figure out the best way to refactor our unit tests to remove the database dependency. Further, we'd like build out a Continuous Integration server to improve system stability.

=== Core Ideas ===

We consider these ideas to be significantly more complex due to the concepts introduced and/or the detailed knowledge of the system required. While we're open to receiving proposals on these, they will require significantly more time, effort, and understanding for success. You'll have to convince us that you're qualified to tackle these.

*  Implement Critical Path Management[http://bugs.web2project.net/view.php?id=422].

*  Implement cross database support - I'd like to see SQL Server or Oracle to appeal to the more formal corporate/business users but Postgres would be interested too[http://bugs.web2project.net/view.php?id=191]/

*  Implement Gantt Charts in Flash/Flex or jQuery[http://www.thegrubbsian.com/2010/06/11/jquery-ganttview-a-lightweight-gantt-chart-for-jquery] - These should be interactive and update the database post edit respecting the validation processes.