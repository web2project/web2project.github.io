---
layout: page
title: File Structure

category: "module building guide"
status: cleanup
---

Building a proper module in web2project requires a handful of key files in a particular structure.  Each of which serve a specific purpose in the operation of the system.  For a module called ``Todos`` - *available from the [web2project Modules](https://github.com/web2project)* - we would have the following file structure (filenames are case sensitive):


Filename  | Status | Description | Notes
----- |:-----:| ----- | -----
/todos/             | required | folder | Base folder of the module
  setup.php         | required | [Setup Instructions](/docs/setup.html) | Defines the details of the module along with install/uninstall directions
  todos.class.php   | required | [Primary Model](/docs/core-class.html) | Defines all the business logic and CRUD operations for the module
  index.php         | required | [List View](/docs/views.html) | Normally shows a list of any top-level items
  index.js          | optional |  | Javascript that gets included in the Index layout
  addedit.php       | optional | [Add/Edit View](/docs/views.html) | View that provides a form to add or edit the item
  addedit.js        | optional |  | Javascript that gets included in the Add/Edit layout
  view.php          | optional | [Item View](/docs/views.html) | View that provides a page to view the item
  view.js           | optional |  | Javascript that gets included in the view layout
  do_todos_aed.php  | optional | [Primary Controller](/docs/primary-controller.html) | Acts as the Controller/Dispatcher for most of the primary actions
  companies_tab.view.todolist.php | optional | [Subview](/docs/subviews.html) | Provides a embedded tab subview on the Company View page