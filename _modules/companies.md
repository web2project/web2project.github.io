---
layout: module
title: Companies Module

category: core-module

module_name: Companies
module_path: companies
module_creator: dotProject
module_devs: web2project
module_version: 3.3
module_source: https://github.com/web2project/web2project
module_download: http://github.com/web2project/web2project/archive/master.zip
---

## Module Overview

The companies module lets you provide information regarding the organization who owns the [Projects](/modules/projects.html).

Creating companies is one of the most important but often misinterpreted aspects within the system. In most Web2project installations, you will have a single company and manage all of their projects from there. This is by far the simplest set up and a reasonable way to get started for many organizations where information security requirements are relatively simple and straightforward.

For organizations who have stricter information security requirements such as those who perform services for other companies, you'll need a more complex model quickly. In that scenario, it is usually better to create a distinct Company for each customer. These Companies then serve as the foundation for permissions and information protection throughout the system.

Companies may have a tree of [Departments](/modules/departments.html) associated with it, as well as a multitude of [Contacts](/modules/contacts.html) and [Users](/modules/users.html) (people that can log in the system and be assigned to tasks). The default company module in Web2Project not only allows you to add or edit companies, but you can also classify them according to company type. You can also see what users belong to that company, current active projects, archived projects, departments, users, contacts, events and [Files](/modules/files.html).

### Create a Company

<a href="/assets/docs/companies/addedit.png"><img src="/assets/docs/companies/thumb-addedit.png" /></a>

To create a Company, you can either select the Company module from the navigation and click the “new company” button or you can select “Company” from the “New Item” dropdown.

Most of the fields are self-explanatory and allow you to fill in basic contact information on the Company. The more important fields are 'Company Owner' and 'Type' which both drive the 'Company List' screen. The 'Company Owner' does grant any permissions, it is used only for filtering. The 'Type' is used to categorize each company into a selected tab and is also used for filtering.

### View Company Detail

<a href="/assets/docs/companies/view.png"><img src="/assets/docs/companies/thumb-view.png" /></a>

This page shows the user the data related to each company, such as its active projects, the related contacts and users, and depending on any extra add-on modules it can also provide extra information. The most common action here is to create a new Project but the tabs below give you access to other modules. 

By default, the tabs include:

1. View Active Projects
1. View Archived projects
1. View [Departments](/modules/departments.html)
1. View [Users](/modules/users.html)
1. View [Contacts](/modules/contacts.html)
1. View [Events](/modules/calendar.html)
1. View [Files](/modules/files.html)

<strong>Active Projects</strong>

The Active Projects tab displays a list of projects which are active regardless of the particular Project Type, Status, or percent complete. By default, the list includes the project's Name, Owner, Start Date, Status, and Budget. 

<strong>Archived Projects</strong>

The Archived Projects tab displays a list of inactive projects. By default, the list includes the project's Name, Owner, Start Date, Status, and Budget.

<strong>Departments</strong>

The Departments tab displays the departments within the company and the user count for each. You can also click on the "New Department" button to add a new department to that company. Click on any department name to view its detail.

<strong>Users</strong>

The Users tab displays all the users assigned to the company along with their Username and Contact Name.

<strong>Contacts</strong>

The Contacts tab displays all the contacts assigned to the company including their Name, Email, and Phone Number.

<strong>Events</strong>

The Events tab displays all the events assigned to the company including their Name, Start Time, and End Time.

<strong>Files</strong>

The Files tab displays all the files assigned to any project or task within the company. These files also appear under their assigned projects or tasks.view the folder structure, files and file type. Click on any file to download it.

### List Companies

<a href="/assets/docs/companies/index.png"><img src="/assets/docs/companies/thumb-index.png" /></a>

This page is a simple list of Companies filtered according to the user's permissions. This list is divided into Company Types which are defined in the System Administration module. The overall company list can be filtered by Company Owner or the user can type a search string to fine tune his search. 

{% include icon-question.html %} Whenever you can't find a company, check the Owner filter and change the dropdown to 'All'. If the company does not appear, the only alternatives are that you don’t have permission to view it or it is not in the system.