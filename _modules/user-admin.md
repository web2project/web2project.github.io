---
layout: module
title: User Administration Module

category: core-module

module_name: User Administration
module_path: users
module_creator: dotProject
module_devs: web2project
module_version: 3.3
module_source: https://github.com/web2project/web2project
module_download: http://github.com/web2project/web2project/archive/master.zip
---

## Module Overview

The User Administration gives the administrator access to perform a number of important actions related to system users.

From the user admin module you can:

* Add, Edit, Delete users
* View important information about the user
* Change permissions to the user
* Activate or deactivate a user account
* Search for users
* View a users access logs

It is recommended by default that you disallow access to this module to basic users in the permissions or roles administration.

### Active Users

[[Image:UserAdmin_Active.png|thumb|right|A pic of the User Admin module '''Active Users''' page.]]
The active users page displays a number of filters you can use to search or display information

* Enter users first, last, or user name in the search field.
* Click on a letter in the alphabet to search for a user’s name

The table in the center of the stage contains a number of columns.

{| border="3"
|+ '''User Information'''
! Icons !! Login History !! Login Name !! Real Name !! Type !! Company !! Department
|-

|Edit-Permissions-Delete || Displays the history || User Name || Actual Name with email icon || Type specified in add page || Company for user || User department

|
|}

### Inactive Users

[[Image:UserAdmin_inactive.png|thumb|right|A pic of the User Admin module '''Inactive Users''' page.]]
Inactive users are usually users who do not have a user role or permissions assigned to them

By default, when a user first registers in the system they are set to an inactive state. An email is sent to the system administrator and they must assign a role to the user before the user can be active.

See Permissions for more information

### Add/Edit User Preferences

[[Image:UserAdmin_addedit_user_prefs.png|thumb|right|A pic of the User Admin module '''addedit user prefs''' page.]]
You can change the user preferences just as you can change the default user preferences for unregistered users.

Changing the user specific preferences will override the default user’s preferences.

To change the preferences for the user click on the yellow lock icon in the far left column. By default this will take you to the permission page. At the top of the window is a button to edit the user preferences.

For more information see Default User Preferences in the System Administration Module.

### Add/Edit User

[[Image:UserAdmin_addedit_user.png|thumb|right|A pic of the User Admin module '''addedit users''' page.]]

<b>To Add a New User</b>

To add a new user from within the user administration click on the “new user” button.

The Add user page contains a short form for creating a new user. After filling our the form fields you can mark the “Inform new user of their account details” to notify that user they are registered.

Keep in mind that users can register themselves by clicking on the “I want to register for a new account” link on the main login page.

After you create the user, you must remember to give that user a role or they will not be able to login.

<b>To Edit an Existing User</b>

To edit a user click on the notepad icon in the table on the stage.

You will notice this page has less form fields than the add user page.

Here you can change:

* The user type
* Name
* Company
* Department
* Email
* Email Signature

Do to security issues you can not change the password. If the user can’t remember his or her password it is best to have them click on the “help I have forgotten my password” link in the main login.

### View User

[[Image:UserAdmin_view_user.png|thumb|right|A pic of the User Admin module '''view user''' page.]]
Click the users login name from the user administration to access the View User page.

The view user page contains a table showing the users details. From this page you can:

* Go back to the user list
* Edit this user
* Edit this users preferences
* View the user’s log
* View the user’s permissions
* View the users Role
* View the users Projects & Gantt

### User Log

[[Image:UserAdmin_userlog.png|thumb|right|A pic of the User Admin module view '''user log''' page.]]
The user log by default contains two calendars you can set to view the users login history. After setting the dates a table will display highlighting that users activity.

{| border="1" cellpadding="2"
|-
|width="100pt"|First Name
|width="200pt"|Last Name
|width="300pt"|IP Adress
|width="300pt"|Date & Time IN
|width="300pt"|Date & Time OUT
|}

### Sessions

[[Image:UserAdmin_sessions.png|thumb|right|A pic of the User Admin module view '''sessions''' page.]]
Active Sessions is the last tab located in the user list page. Here you can end a user session or force the user to logout.

This helps when you have multiple users logged in at once and need to free system resources, or for security issues.