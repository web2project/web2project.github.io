---
layout: page
title: File Structure

category: "module building guide"
status: cleanup
---

Building a module in web2project requires a handful of key files in a specific structure. Each of which serve a key purpose in the operation of the system. For a module called "Todos" - available from the web2project Modules - we would have the following file structure (filenames are case sensitive):

Filename  | Status | Description | Notes
----- |:-----:| ----- | -----
/todos/                                 | required | folder | Base folder of the module
/todos/README.md                        | required | [Module Details](/docs/readme-reqs.html) | Information about the module, its release history, etc
/todos/setup.php                        | required | [Setup Instructions](/docs/setup.html) | Contains and executes the install/uninstall logic
/todos/todos.class.php                  | required | [Primary Model](/docs/core-class.html) | Defines all the business logic and CRUD operations for the module
/todos/index.php                        | required | [List View](/docs/views.html) | Normally shows a list of any top-level items
/todos/index.js                         | optional |  | Javascript that gets included in the Index layout
/todos/addedit.php                      | optional | [Add/Edit View](/docs/views.html) | View that provides a form to add or edit the item
/todos/addedit.js                       | optional |  | Javascript that gets included in the Add/Edit layout
/todos/view.php                         | optional | [Item View](/docs/views.html) | View that provides a page to view the item
/todos/view.js                          | optional |  | Javascript that gets included in the view layout
/todos/do_todos_aed.php                 | optional | [Primary Controller](/docs/primary-controller.html) | Acts as the Controller/Dispatcher for most of the primary actions
/todos/companies_tab.view.todolist.php  | optional | [Subview](/docs/subviews.html) | Provides a embedded tab subview on the Company View page