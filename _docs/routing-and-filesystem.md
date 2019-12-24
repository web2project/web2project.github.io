---
layout: page
title: Routing & Filesystem

category: "module building guide"
status: draft
status: cleanup
---

### Module Url Structure -> File Structure

The general pattern is ```web2project/index.php?m={modulename}&a={action}&id={id}``` where **{modulename}** is the directory, **{action}** is the file, and **{id}** is the specific item you're editing.

In this section, we'll use the relatively simple Company to walk through the mechanics. This is a list of all the files within the module directory:

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


Url  | Maps to | Description
----- | ----- | -----
?m=companies | companies/index.php | Usually the default list screen of the module
?m=companies&a=addedit | companies/addedit.php | Screen to create a new CCompany resource
?m=companies&a=addedit&company_id={n} | companies/addedit.php | View to edit a CCompany resource, identified by the id
?m=companies&dosql=do_company_aed | companies/do_company_aed.php | The controller which receives the POST from the ?m=companies&a=addedit form
?m=companies&a=view&company_id={n} | companies/view.php | Screen to view a CCompany resource, identified by the id;
*not directly addressable* | vw_companies.php | included by other files
*not directly addressable* | vw_contacts.php | included by other files
*not directly addressable* | vw_depts.php | included by other files
*not directly addressable* | vw_projects.php | included by other files
*not directly addressable* | vw_users.php | included by other files

### Class Structure

#### Autoloader

web2project implements [PSR-0](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-0.md) from the PHP Framework Interoperability Group therefore all classes are structured as w2p_Namespace_Class with the '.class.php' suffix. For example, the class **w2p_Core_BaseObject** will be found in *classes/w2p/Core/BaseObject.class.php* while **w2p_Database_Query** will be found in *classes/w2p/Database/Query.class.php*.

It is unlikely that you will need to add core classes to Web2project but if you follow our naming convention, they will automatically be loaded without any additional effort or configuration.

#### Modules

Web2project module classes are a little different because they can be added or removed as needed. In general, the class file will map directly from the module name. The pattern is:

`modules/{plural modulename}/{plural modulename}.class.php`

and the contained class will be `C{modulename}`. In the case of the Company module, this makes the file `modules/companies/companies.class.php` with the corresponding `CCompany` class. A subclass within the module will be follow this pattern:

`modules/{plural modulename}/{plural subclass}.class.php`

and the contained class will be `C{plural modulename}_{singular subclass}` using an underscore as a separator between the classes.

Beyond that, the [Naming Conventions](/docs/naming-conventions.html) section fills in the rest of the detail.