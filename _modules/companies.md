---
layout: module
title: Companies Module

category: core-module

module_name: Companies
module_path: companies
module_creator: dotProject
module_devs: web2project
module_version: 5.0
module_source: https://github.com/web2project/web2project
module_download: https://github.com/web2project/web2project/releases
---

## Module Overview

The companies module lets you provide information regarding the organization who owns the [Projects](/modules/projects.html).

Creating companies is one of the most important but often misinterpreted aspects within the system. In most Web2project installations, you will have a single company and manage all of their projects from there. This is by far the simplest set up and a reasonable way to get started for many organizations where information security requirements are relatively simple and straightforward.

For organizations who have stricter information security requirements such as those who perform services for other companies, you'll need a more complex model quickly. In that scenario, it is usually better to create a distinct Company for each customer. These Companies then serve as the foundation for permissions and information protection throughout the system.

Companies may have a tree of [Departments](/modules/departments.html) associated with it, as well as a multitude of [Contacts](/modules/contacts.html) and [Users](/modules/users.html) (people that can log in the system and be assigned to tasks). You can classify each company by type, and see its active and archived projects, departments, users, contacts, events and [Files](/modules/files.html) in one place.

### Create a Company

<a href="/assets/docs/companies/addedit.png"><img src="/assets/docs/companies/thumb-addedit.png" /></a>

To create a Company, choose "New Company" from the "New Item" menu at the top of any page, or select Companies in the sidebar and then the "New company" button.

The form has the company's **Name**, **Email**, **Phone1**, **Phone2** and **Fax**, its address (**Address1**, **Address2**, **City**, **State**, **Zip** and **Country**), a **URL**, the **Owner**, the **Type** and a **Description**, plus any custom fields set up for Companies. The **Owner** does not grant any permissions; it is used only for filtering. The **Type** puts the company on one of the tabs of the Companies list and is also used for filtering.

### View a Company

<a href="/assets/docs/companies/view.png"><img src="/assets/docs/companies/thumb-view.png" /></a>

Clicking a company's name opens its page. The top of the page shows the company's details: name, owner, email, phones, fax, address, URL, type, description and custom fields.

The buttons at the top add a new contact, project or, when the Departments module is active, department to this company. The links lead back to the list, to editing the company and to deleting it. A company can only be deleted while it has no projects, departments, users or contacts.

Below the details are the tabs. The tabs that appear depend on which modules are active and on your permissions:

Tab | Shows
----- | -----
Active Projects | The company's active projects: priority (P), Name, Owner, Started, End and Status
Archived Projects | The company's inactive projects, with the same columns
Departments | The company's departments and the number of users in each, when the Departments module is active
Users | The users who belong to the company: Username, Name and Type
Contacts | The company's contacts: Name, Job Title, Email, Phone and Department
Events | Events attached to the company: Starting Time, Ending Time, Type and Name
Files | The files of the company's projects and tasks, with the same columns and links as the [Files](/modules/files.html) list

### List Companies

<a href="/assets/docs/companies/index.png"><img src="/assets/docs/companies/thumb-index.png" /></a>

The Companies list shows the companies you are allowed to see. It has an "All Companies" tab and one tab per company type. The types are the *CompanyType* lookup values in System Admin; a new installation has Not Applicable, Client, Vendor, Supplier, Consultant, Government and Internal.

At the top of the page are a search box, the **Owner** filter and the "New company" button. The columns are **Company Name**, the number of **Active Projects** and **Archived Projects** you can see, and **Type**.

{% include icon-question.html %} Whenever you can't find a company, check the Owner filter and change the dropdown to 'All', and clear the search box. If the company does not appear, the only alternatives are that you don’t have permission to view it or it is not in the system.
