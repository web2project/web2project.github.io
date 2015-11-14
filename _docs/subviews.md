---
layout: page
title: Subviews (tabs in other modules)
---

If you want tabs for your module to appear within other modules, ''do not edit those other modules''. Instead, you should use our subview loader to get the tabs to appear automagically. No further configuration is necessary.

== Naming Convention ==

In order to have your tabs/subviews appear within other modules, there is a specific naming convention to follow:

<pre>{OtherModule}_tab.[Modulaction].{BaseModule}.php</pre> where

*  OtherModule - the module where the tab should appear;
*  BaseModule - the name of your add on module;
*  Moduleaction: is the filename where the tab should appear (without .php), e.g. view for view.php, day_view for day_view.php, etc.

== In Practice ==

From our Todos Module example, there are a trio of files that give us Todos subviews within other modules.

*  '''companies_tab.view.todolist.php''' - Includes a Todo List tab within a Company's view page.
*  '''contacts_tab.view.todolist.php''' - Includes a Todo List tab within a Contact's view page.
*  '''projects_tab.view.todolist.php''' - Includes a Todo List tab within a Project's view page.

'' '''Notice:''' These tabs are cached whenever a User logs in, therefore after enabling a module that has subviews, any active users will have to log out and log back in to see the new tabs.''

[[Category:Module Building Guide]]
