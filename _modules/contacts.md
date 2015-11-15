---
layout: page
title: Contacts Module

category: core-module
---

Module Info
 |mod_name = Contacts
 |mod_foldername = contacts
 |mod_original_dev = dotProject
 |mod_current_dev = web2Project
 |mod_latest_version = ?
 |mod_depends_on = n/a

== Module Overview ==
The contacts module is a place to store information about users and additional contacts. When you add a new user to the database they are automatically added to the contacts page, however not all contacts need to be registered users.

You can access the data in this module by clicking on the contacts link in the main navigation. You can also access contacts from the add/edit project, add/edit task, resources, and other places throughout the dynamic application.

== Contacts List View (Contacts Index) ==
[[Image:Contacts index.png|thumb|right|A pic of the Contacts module '''index''' page.]]
The contacts list view is the default page for the contacts tab.

From this page you can:

1.	Search for contacts using a search field.
2.	Download a CSV of specific or entire list.
3.	View contact name, company, phone, email and location
4.	Email the contact
5.	Edit the contact
6.	Send an instant message and more

== Contacts Add/Edit (Contacts addedit) ==
[[Image:Contacts addedit.png|thumb|right|A pic of the Contacts module '''addedit''' page.]]
Sometimes you may want to add a contact to the system rather than make the contact an actual user.  The add/edit contacts page allows you to enter user data without having to create a login.

From this page you can keep detailed records about a person such as:

•	Their name
•	Job Title
•	Company
•	Department
•	Address
•	Country
•	Phone numbers
•	Emails (2X)
•	Web Address
•	Instant Messenger(s)
•	General Notes


=== Contacts Confirming Email (Contacts email confirm) ===
Starting on web2Project the Contacts Confirming Email lets you notify you contacts to complete their contacts for you. <br />
Imagine you only have the Name and Email of a contact and you'd like to have the rest of his information, then simply edit the contact record and set the Waiting Update checkbox on the top right and submit.<br />
This will issue an email to your contact like the one seen on the image, with an URL for your contact.<br />
This URL will lead your contact to his contact record form and he will be able to edit and add the missing information for you.
[[Image:Contacts_confirm_email.png|thumb|right|A pic of the Contacts module '''confirm email''' page.]]


=== Import Contacts from LDAP Active Directory ===

Create a service Account, the account only needs to be a member of the domain users group in active directory in order to search ldap.

Go to Import Contacts from LDAP Directory
These are my setting, you would replace them to match your environment.

Server: 10.10.10.10
Protocol: Version 3
Bind Name: CN=project,CN=Users,DC=peanutbutter,DC=com
Bind Password: (password for the user account used in Bind Name above)
Base DN: OU=111,OU=Cary,OU=WRUsers,DC=peanutbutter,DC=com
Filter: (objectclass=Person)

Bind Name: must contain the full path to the user account you will be using to search ldap
For the "Base DN" be sure to use OU for an organizational unit and CN for a Container, CN would be used if your users were in the default "User" folder created when you install Active Directory. As an example if I wanted to import from that directory you would use this.
Base DN: CN=Users,DC=wrinternal01,DC=com
If I want to import the contacts from and organizational unit you created you would use this as an example.
Base DN: OU=MYUsers,DC=wrinternal01,DC=com
If you have multiple OU's which contain users you will need to modify the Base DN and import each one separately, if you know of a better way please tack it on to this post.


== Videos ==

[[Category:LDAP]]
