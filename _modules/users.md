---
layout: module
title: User Administration Module

category: core-module

module_name: User Administration
module_path: users
module_creator: dotProject
module_devs: web2project
module_version: 5.0
module_source: https://github.com/web2project/web2project
module_download: https://github.com/web2project/web2project/releases
---

## Module Overview

Now that you have a Company and a Project in your system, it is time to create your a User. Remember that more than anything Web2project is a collaborative tool and the goal of it is to share information. However, it is quite common that you will need to keep certain aspects private to protect the confidential or proprietary information of your customers. Therefore, the creation of Users and setting their permissions become some of the most important aspects of its day to day usage. Unfortunately, it can also be quite difficult to understand at first glance. The basics of Permissions are covered here, but for a more rigorous discussion, please review [Permissions 201](/howto/permissions-201.html) on the System Admin page.

### Create a User

Creating your first User can be a confusing experience if you do not understand the process in the beginning. Select “User Admin” in the sidebar (under *Administration*) and then the “New user” button.

The form asks for the **Login Name**, **Password** and **Confirm Password** (with a strength meter), the User's **Name**, **Company**, **Department**, **Email** and **Email Signature**, and any custom fields set up for Users. The Company does not determine any permissions, but it does begin to build the associations. If you are allowed to, you can also choose the **User Role** here, and tick **Inform new user of account details?** to e-mail them their login.

Once you save, the User account is created along with the corresponding Contact record. If you didn't choose a Role, the User has no permissions and can therefore do nothing, not even log into Web2project.

{% include icon-question.html %} The Web2project permissions system assigns zero privileges by default.

Before a new User can log in, they must be assigned a Role in the User Administration Module.

### Assign Roles

To let the User log in for the first time, he must be assigned a Role, either on the new user form or on the Roles tab of the User's page. The four base roles at installation are Administrator, Project worker, Guest, and Anonymous and grant progressively more and more restrictive permissions.

* Administrator – An Administrator can do anything they choose within the system. This includes creating, editing or deleting any information along with assigning Tasks, changing Users’ passwords, or even creating other Administrators.
* Project worker – A Project worker can create, edit, or delete any non-administrative information throughout the system. They can create Companies or Projects, assign Tasks, and log time against any task in the system. Most users will be a variation of this role.
* Guest – A Guest can view any non-administrative information. They cannot create, edit, or delete anything and therefore this works well as a basis for a Customer Role.
* Anonymous – An Anonymous can see the navigation and nothing else. While this role may seem silly at first glance, it can serve as a reasonable basis for highly limited Users who should only view specific Tasks. By assigning this role as a start, no existing information in the system is made available whatsoever.

### Add / Deny Permissions

There are five attributes which can be connected with any Module to expand or limit these basic Roles as needed. The attributes are Access, Add, Delete, Edit, and View and can be assigned to the Module as a whole or to specific aspects of the Module. For example, a Resource Manager type user might have a Project worker role supplemented with Allow permissions to Access, Add, View in the User Admin. This would give him access to create new users as necessary without the ability to delete users. To further safeguard against abuse of this account, the System Administrator could add Deny permissions to anything done by the Resource Manager user to the System Administrator account.

Permissions are set on the Permissions tab of the User's page. For more details and examples, please read [Permissions 201](/howto/permissions-201.html).

### The User List

User Admin has four tabs: Active Users, Inactive Users, User Log and Active Sessions. At the top of the page are a search box, which matches first, last or login names, and the letters A to Z to jump to users by name.

#### Active Users

The Active Users tab lists the Users who have a Role. By default the columns are:

Field | Description
----- | -----
Icons | Edit the user, or open their permissions
Login History | Online (with hours logged in and idle), Offline, or Never Visited
Real Name | The User's name, with an e-mail link
Login Name | The User's login
Company | The User's company
Department | The User's department

#### Inactive Users

Inactive users are users who do not have a Role assigned to them. When a person signs up from the login page they start here, and the system administrator receives an e-mail asking them to assign a Role. New LDAP users also start here.

{% include icon-warn.html %} Public sign-up is on by default and has no spam protection. See [Security Notes](/docs/security-notes.html) before you leave it on.

#### User Log

The User Log tab shows the login history for all users or one user over a date range you choose with the two calendars. Each row shows the First Name, Last Name, Internet Address and the times the session started and ended (Date Time IN and Date Time OUT). A login stays open until the user logs out or the session expires.

#### Active Sessions

The Active Sessions tab lists everyone logged in now, with their Login Name, Real Name, Company, login time and Internet Address. For each one you can **end user session**, which closes that one login, or **force user logout**, which closes every session that user has open.

### Add/Edit User

To add a new user, select the “New user” button on the User Admin page, as described above. Keep in mind that, unless you turn off *Activate External User Creation*, people can register themselves from the login page.

To edit a user, select the edit icon in the list or “edit this user” on the User's page. The edit form has the same fields as the new user form, without the password and role fields.

Passwords aren't changed on this form. Instead, open the User's page and select “change password” at the top; a small window lets you set a new password. Users change their own password the same way from *My Info* in the user menu. A user who has forgotten their password can use the lost password link on the login page.

### View a User

Click the User's login name in User Admin to open their page. The links at the top lead back to the user list and let you change the password, edit the user, edit their contact record, edit their preferences or delete the user.

The page shows the User's details: Username, Real Name, User Type, Company, Department, Phone, Email, Address, Birthday, their other contact methods and their Email Signature. It also shows their **Calendar Feed**, a private link that calendar applications such as Google Calendar, Apple Calendar or Outlook can subscribe to. If the link has been shared by mistake, select “regenerate feed url” to replace it.

Below that are the tabs:

* User Log: this User's logins
* Permissions: add or remove permissions for this User
* Roles: assign or remove Roles
* Projects and Projects Gantt: the projects this User owns or works on

### Edit User Preferences

Each User's preferences override the [Default User Preferences](/modules/system-admin.html). To change them for a User, select “edit preferences” on the User's page. Users change their own under *Preferences* in the user menu.
