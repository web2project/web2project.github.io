---
layout: module
title: Departments Module

category: core-module

module_name: Departments
module_path: departments
module_creator: dotProject
module_devs: web2project
module_version: 5.0
module_source: https://github.com/web2project/web2project
module_download: https://github.com/web2project/web2project/releases
---

## Module Overview

Departments are simply groupings within a Company. There can be an unlimited number of departments for any company and departments can have sub-departments. Since a department is so similar to a Company, it has many of the same fields and is treated in an almost identical manner. Since a Department has no meaning without a parent Company, the Department module should only be accessed through the listing on a Company’s View page.

Note that the module is disabled by default, and must first be enabled. To enable the departments module:

* Go to system admin
* Click 'View Modules'
* Change Departments from “disabled” to “active”. Departments are reached from each company's page, so it doesn't need to be “visible” in the sidebar.

You can assign multiple departments to a company, and multiple contacts to a department.  Using departments is another added benefit in helping you manage your contacts and projects.

When you click on the department tab in the view company page you will see a list of available departments. From this tab you can:

* Add a department
* Edit a department
* View how many users are assigned to each department.

### Create a Department

To add a new department to a company you must first be in the View Company Page and click on the department tab, then click the “New Department” button.

When adding a new department you must enter a department name. The rest of the fields are optional, but as a best practice it's always a good idea to be as descriptive as possible.

From this page you can enter:

* The department **Name**
* Its **Parent** department, to make it a sub-department
* Its **Owner**, the user who leads the department
* Its **Type**
* **Phone**, **Fax** and **Email**
* **Address1**, **Address2**, **City**, **State**, **Zip** and **Country**
* A **URL**
* A **Description**

The company is shown at the top of the form (**Company Name**), since a department always belongs to the company you started from.
