---
layout: page
title: File Structure

category: "module building guide"
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
/todos/companies_tab.view.todos.php     | optional | [Subview](/docs/subviews.html) | Provides an embedded tab subview on the Company View page. The pattern is `{module}_tab.{action}.{name}.php`
/todos/projects_crumb.view.todos.php    | optional |  | Adds a link to the title block of another module's page, here the Project View page. The pattern is `{module}_crumb.{action}.{name}.php`
/todos/locales/en/todos.inc             | optional | [Translations](/docs/translation-management.html) | The module's own strings, one folder per language
/todos/images/                          | optional |  | Icons used by the module

Page templates for the core modules live in `style/_common/{module}/` and are loaded with `$AppUI->getTheme()->resolveTemplate('{module}/{template}')`, which looks in `style/bootstrap/` first. An Add On module can keep its HTML in its own view files instead.
