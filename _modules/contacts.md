---
layout: module
title: Contacts Module

category: core-module

module_name: Contacts
module_path: contacts
module_creator: dotProject
module_devs: web2project
module_version: 5.0
module_source: https://github.com/web2project/web2project
module_download: https://github.com/web2project/web2project/releases
---

## Module Overview

The contacts module is a place to store information about users and additional contacts. When you add a new user to the database they are automatically added to the contacts page, however not all contacts need to be registered users.

You can access the data in this module by clicking on the contacts link in the main navigation. You can also access contacts from the add/edit project, add/edit task, resources, and other places throughout the dynamic application.

### Creating a Contact (Contact Add/Edit Page)

Creating your first contact is simple. Select Contacts from the top navigation and then click “new contact”. The information available is common to most address books where you can specify their name, company, and the exact name displayed for them. Alternatively, if your contact has sent you a vCard – normally attached to an email or available from their website – you can import that directly. In this case, Web2project will attempt to automatically attach the contact to an existing Company already within the system and if it is not found, simply create a new Company to represent it. Web2project looks for an exact match, so a difference between “Inc.” and “Incorporated” can cause a duplicate company to be created. This can be corrected by simply editing the Contact and assigning the proper Company.

<a href="/assets/docs/contacts/addedit.png"><img src="/assets/docs/contacts/thumb-addedit.png" /></a>

Sometimes you may want to add a contact to the system rather than make the contact an actual user.  The add/edit contacts page allows you to enter user data without having to create a login.

From this page you can keep detailed records about a person such as:

* Their name
* Job Title
* Company
* Department
* Address
* Country
* Phone numbers
* Emails (2X)
* Web Address
* Instant Messenger(s)
* General Notes

### Attach Contacts to Projects / Tasks

Reporting and information sharing with external project stakeholders is absolutely required for successful project management. To facilitate this, Web2project offers the flexibility of giving the project manager the ability to attach Contacts to specific projects or even individual Tasks within a Project. From that time on, whenever a the Project or Task are updated, the user updating the information can choose to notify the Contacts. Alternatively, this notification can be set as a global default within the System Admin.

### View your Contact List (Contact Index Page)

<a href="/assets/docs/contacts/index.png"><img src="/assets/docs/contacts/thumb-index.png" /></a>

The contacts list view is the default page for the contacts tab.

From this page you can:

1.	Search for contacts using a search field.
1.	Download a CSV of specific or entire list.
1.	View contact name, company, phone, email and location
1.	Email the contact
1.	Edit the contact
1.	Send an instant message and more

### Confirming Email (Contacts email confirm)

<a href="/assets/docs/contacts/email_confirm.png"><img src="/assets/docs/contacts/thumb-email_confirm.png" /></a>

The Contacts Confirming Email lets you ask your contacts to complete their own contact details for you.

Imagine you only have the Name and Email of a contact and you'd like to have the rest of their information. Simply edit the contact record, tick the Waiting Update checkbox and save.

This sends an email to your contact like the one in the image, with a link for your contact.

The link leads your contact to their contact record form, where they can edit and add the missing information for you.
