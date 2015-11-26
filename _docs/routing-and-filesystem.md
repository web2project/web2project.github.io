---
layout: page
title: Routing & Filesystem

category: "module building guide"
status: draft
status: cleanup
---

The goal of this page is to document how particular web2project URLs map to specific files on the filesystem.

### Module Url Structure -> File Structure

The general pattern is *web2project/index.php?m=**{modulename}**&a=**{action}**&id=**{id}** * where **{modulename}** is the directory, **{action}** is the file, and **{id}** is the specific item you're editing.

From here forward, the Company module will serve as our example due to its simplicity. This is a list of all the files within the module directory:

    /companies/
       addedit.php
       companies.class.php
       do_company_aed.php
       index.html
       index.php
       view.php
       vw_companies.php
       vw_contacts.php
       vw_depts.php
       vw_projects.php
       vw_users.php

**Note:** *Under no circumstances can you navigate to these files directly. All files are accessed through the central index.php which performs permissions check, logging, data validation, and a variety of other functions.*

**Note:** *For all intents and purposes, web2project/index.php?m=companies and web2project/?m=companies are the same Url most of the time. When a specific file is not specified (as in the second Url), the webserver itself will insert what it understands to be the default file which is *index.php* the vast majority of the time. Therefore index.php is excluded from all of the Urls below.*

{|
! Url
! maps to
! Description
|-
| ?m=companies || companies/index.php || usually the default list screen of the module
|-
| ?m=companies&a=addedit || companies/addedit.php || the url to create a new CCompany resource
|-
| ?m=companies&a=addedit&company_id={n} &nbsp;&nbsp;&nbsp;|| companies/addedit.php || the url to edit an existing CCompany resource identified by the id
|-
| ?m=companies&dosql=do_company_aed || companies/do_company_aed.php || the controller code which receives the POST from the form submission from ?m=companies&a=addedit
|-
| ?m=companies&a=view&company_id={n} || companies/view.php || the url to view the CCompany resource identified by the id;
|-
| *not directly addressable* || vw_companies.php || included by other files
|-
| *not directly addressable* || vw_contacts.php || included by other files
|-
| *not directly addressable* || vw_depts.php || included by other files
|-
| *not directly addressable* || vw_projects.php || included by other files
|-
| *not directly addressable* || vw_users.php || included by other files
|}

### Class Structure

#### Autoloader

web2project implements [PSR-0](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-0.md) from the PHP Framework Interoperability Group therefore all classes are structured as w2p_Namespace_Class with the '.class.php' suffix. For example, the class **w2p_Core_BaseObject** will be found in *classes/w2p/Core/BaseObject.class.php* while **w2p_Database_Query** will be found in *classes/w2p/Database/Query.class.php*.

If you follow our naming convention, any classes you add will automatically be loaded without any additional effort or configuration.

#### Modules

web2project module classes are a little different because they can be added or removed as needed. In this case, the class file modules/{plural modulename}/{plural modulename}.class.php will contain the C{singular modulename} class. A subclass within the module will be have an underscore (_) as a separator which turns C{plural modulename}_{singular subclass}.php into modules/{plural modulename}/{plural subclass}.class.php

For example, the **CProject** class will be found in *modules/projects/project.class.php* while **CCompany** will be found in *modules/companies/companies.class.php*. Alternatively, the **CFiles_Folder** class *modules/files/folders.class.php*.

The [Naming Conventions](/docs/naming-conventions.html) page covers this is greater detail.