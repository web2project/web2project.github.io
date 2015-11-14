---
layout: page
title: Project Importer

category: addon-module
---

Module Info
 |mod_name = Project Importer
 |mod_foldername = importers
 |mod_original_dev = CaseySoftware, LLC<br />(Ivan Peevski - cyberhorse)
 |mod_current_dev = CaseySoftware, LLC<br />(Keith Casey - caseydk)
 |mod_latest_version = 4.1
 |mod_depends_on = n/a

== Module Overview ==

This module provides a way for a user to import a project plan into web2project from Microsoft Project or WBS Gant Chart Pro v4.4.

This module is available for download here: https://github.com/web2project/modules-importers

== Release Notes ==

=== 4.1 ===

* Fixed a major issue where dependencies weren't being imported properly or sometimes at all.
* Added a tweak to the MS Project processor to make sure the project title is retrieved properly.
* Fixed an issue where the Project Start Date was not set properly in the MS Project import
* Tweaked the import process so that if there's no Company match, it default's to the current User's Company. This resolves the issue where a Project could accidentally get assigned to no Company and therefore disappear due to permissions.
* Changed the licensing to align with the coming web2project license shift.

=== 4.0 ===

* Added some hr tags and lined up some input boxes to make the UI cleaner.

* Updated the module structure (paths and names) to use the core web2project autoloader and simplify the includes code.

* Refactored much of the Project/Task/Contact creation code into its proper class methods instead of raw DBQuery calls. Updated those calls to use the object validation results. Further moved this code into the base CImporter class to reduce duplication.

* Applied some major patches from Alain Picard to handle larger and larger file sizes. In most cases, this is a 20-25% improvement, but some imports can get as much as an 80% improvement in processing time.
** ~95 Tasks process in ~4 seconds using 12MB at peak;
** ~450 Tasks process in ~50 seconds using 15MB at peak;
** ~1100 Tasks process in ~180 seconds using 380MB at peak;

=== <s>v3.1</s> 3.2 ===

* Simplified the permissions checking to only check for "project add" privileges;

* Removed the poorly implemented translation files to take advantage of the reworked translation handler in web2project v1.1;

* Simplified the View to use a case statement instead of nested if's.  The code isn't shorter, but it's quite a bit clearer;

* General clean up to use core web2project functionality as opposed to using custom code, it isn't complete;

=== v3.0 ===

*  The most significant change in this release is that it has been updated to support web2project. In the process, backwards compatibility with dotProject was lost.  '''This is a known situation and is not considered an issue or bug, it is a design decision and will not be reversed or reconsidered.  Please do not ask.'''
* Simplified the class structure and encapsulated more of the type-specific details away from the user and the BaseImporter class.
* Converted some of the raw SQL statements to use the DBQuery class.

== Known/Open Issues ==

<s>*  The object validation included in web2project v1.2 caused an error in this module to become a crash.  To resolve this, two changes are necessary:
#  Open projectimporter/msproject.php
#  Around line 72 which should be this - ''$project->project_owner = $projectOwner;'' - add this line - ''$project->project_creator = $AppUI->user_id;'' - immediately after;
#  Open projectimporter/wbs.php
#  Around line 51 which should be this - ''$project->project_owner = $projectOwner;'' - add this line - ''$project->project_creator = $AppUI->user_id;'' - immediately after;
#  Save both files and you're done</s> - Resolved in v4.0

*  When the Importer creates a User, no permissions/Role information is attached. If you attempt to delete this new User you will receive an error with the message Failed to remove user permission object despite the fact that the User will be deleted successfully.

*  Importing from Microsoft Project 2007 does not work directly.
#  Open file in Project 2007
#  Save file in Project 2003 format
#  Close the 2007 formatted file and open the 2003 formatted file
#  Export as XML
#  Import using the Project Importer as normal

*  Custom-defined Fields on Projects cannot be defined at import.

*  The module is currently still using the PHP4 method of handling XML (SAX-based), it should be converted to SimpleXML.

== Development Status ==

*  v4.1 Update Release: 2010 September
*  v4.0 Major  Release: 2010 April
*  v3.2 Update Release: 2009 October
*  <s>v3.1 Update Release: 2009 September</s>
*  v3.0 Major  Release: 2008 September
*  ''All versions prior to v3.0 are only compatible with dotProject - http://docs.dotproject.net/index.php?title=Project_Importer ''
*  v2.0 Major  Release: 2007 October (requires PHP5 and dotProject v2.1 rc1 or above)
*  v1.5 Update Release: 2007 July (last PHP4-compatible release)
*  v1.4 Update Release: 2007 May
*  v1.2 Update Release: 2006 October (last dotProject 2.0.x-compatible release)
*  v1.1 Update Release: 2006 September
*  v1.0 Initial Release: 2005 December

[[Category:Add On Modules]]
