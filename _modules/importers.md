---
layout: module
title: Project Importer Module

category: addon-module

module_name: Project Importer
module_path: importers
module_creator: CaseySoftware, LLC
module_devs: CaseySoftware, LLC
module_version: 4.2
module_source: https://github.com/web2project/modules-importers
module_download: https://github.com/web2project/modules-importers/archive/master.zip
---

## Module Overview

This module provides a way for a user to import a project plan into web2project from Microsoft Project or WBS Gant Chart Pro v4.4.

### Usage

1. Within Microsoft Project, open your project as usual.  In the File Menu, select "Save AS ...".  Under file-type, choose "xml" and save your file.
1.  Within Web2project, select "Project Import" from your module navigation.
1.  Select "Browse", select the file you saved in Step 1, and select "Import Data".
1.  Your screen should now show a summary of the imported project with all the relevant Company, Project, Task, and Assignment information.
1.  If a matching Company was found, the Importer will automatically assign it.  Alternatively, if there was no matching Company, you can choose one or allow the Importer to create a new one.
1.  Input a Project Name.  If the imported name is already in use, the module will note it here.
1.  Assign the usernames who match your resources.  Any users not mapped to current Web2project users will automatically be created in an Inactive state.
1.  Adjust the task assigments as necessary.  By default, the percent allocations from the MS Project file will be used.
1.  Select "import" below.

### Release Notes

#### Open Issues

*  The module should be scrubbed of the inline html/php nastiness.
*  Currently, the module it uses the PHP4 style of event-based parsing for the XML document and should be converted to use PHP5's SimpleXML parser.  It will cause the module to be smaller, easier to maintain, and probably more flexible over all.  This will not happen any time soon as it breaks PHP4 compatibility.

#### 4.2

*  Added numerous notes on areas to cleanup & simplify in future versions;
*  Applied proper theming to all form fields;
*  Fixed the Contact lookups to work more often;
*  Fixed the Task Assignees to allow existing users (not just newly imported users) to be assigned to Tasks;
*  Fixed the Task Assignees to respect permissions and limit the selection only to Users who can actually view Tasks;
*  Fixed the "View the project here" link;
*  Fixed the Work Breakdown Structure id for the WBS Pro file format;
*  Refactored the flow of the module to the 'proper' structure now specified in the web2project Module Building Guide;
*  Refactored the post-upload step to a clean redirect with the preview;
*  Removed the references to the raw $_FILES;
*  Updated the class structures to standardize look & feel;
*  Updated the deprecated DBQuery to the new w2p_Database_Query class;
*  Updated the project/task processing to be timezone aware;
*  Updated the status messages to use the AppUI status messages instead of echo;

#### 4.1

* Fixed a major issue where dependencies weren't being imported properly or sometimes at all.
* Added a tweak to the MS Project processor to make sure the project title is retrieved properly.
* Fixed an issue where the Project Start Date was not set properly in the MS Project import
* Tweaked the import process so that if there's no Company match, it default's to the current User's Company. This resolves the issue where a Project could accidentally get assigned to no Company and therefore disappear due to permissions.
* Changed the licensing to align with the coming web2project license shift.

#### 4.0

* Added some hr tags and lined up some input boxes to make the UI cleaner.
* Updated the module structure (paths and names) to use the core web2project autoloader and simplify the includes code.
* Refactored much of the Project/Task/Contact creation code into its proper class methods instead of raw DBQuery calls. Updated those calls to use the object validation results. Further moved this code into the base CImporter class to reduce duplication.
* Applied some major patches from Alain Picard to handle larger and larger file sizes. In most cases, this is a 20-25% improvement, but some imports can get as much as an 80% improvement in processing time.
  * ~95 Tasks process in ~4 seconds using 12MB at peak;
  * ~450 Tasks process in ~50 seconds using 15MB at peak;
  * ~1100 Tasks process in ~180 seconds using 380MB at peak;

### Development Status

* v4.1 Update Release: 2010 September
* v4.0 Major  Release: 2010 April
* v3.2 Update Release: 2009 October
* <s>v3.1 Update Release: 2009 September</s>
* v3.0 Major  Release: 2008 September
* *All versions prior to v3.0 are only compatible with dotProject - http://docs.dotproject.net/index.php?title=Project_Importer*