---
layout: page
title: File Structure

category: "module building guide"
status: cleanup
---

Building a proper module in web2project requires a handful of key files in a particular structure.  Each of which serve a specific purpose in the operation of the system.  For a module called "Todos" - *available from the [web2project Modules](https://github.com/web2project)* - we would have the following file structure (filenames are case sensitive):

{|
! Filename
! align="center"|Status
! Description
! Notes
|-
| /todos/ || required || Module Folder || Base folder of the module
|-
| &nbsp;&nbsp;&nbsp;/setup.php || required || [Setup.php](/docs/setup.html) || Defines the details of the module along with install/uninstall directions
|-
| &nbsp;&nbsp;&nbsp;/todos.class.php || required || Primary Model ||  This handles all the CRUD operations and is the only place where business logic or queries belong
|-
| &nbsp;&nbsp;&nbsp;/index.php || required || Index View || Normally shows a list of any top-level items
|-
| &nbsp;&nbsp;&nbsp;/index.js || optional ||  || Javascript that gets included in the Index layout
|-
| &nbsp;&nbsp;&nbsp;/addedit.php || optional || Add/Edit View || View that provides a form to add or edit the item
|-
| &nbsp;&nbsp;&nbsp;/addedit.js || optional ||  || Javascript that gets included in the Add/Edit layout
|-
| &nbsp;&nbsp;&nbsp;/view.php || optional || Primary View || View that provides a page to view the item
|-
| &nbsp;&nbsp;&nbsp;/view.js || optional ||  || Javascript that gets included in the view layout
|-
| &nbsp;&nbsp;&nbsp;/do_todos_aed.php || optional || Primary Controller || Acts as the Controller/Dispatcher for most of the primary actions
|-
| &nbsp;&nbsp;&nbsp;/companies_tab.view.todolist.php || optional || Subview tab || Provides a embedded tab subview on the Company View page<br /> This {modulename}_tab.view.filename.php convention will work on any module that supports Tabbed Subviews
|}