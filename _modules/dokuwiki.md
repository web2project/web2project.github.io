---
layout: module
title: Dokuwiki Module

category: addon-module

module_name: Dokuwiki
module_path: dokuwiki
module_creator: Klaus Buecher (opto)
module_devs: Klaus Buecher (opto)
module_version: 1.1
module_source: https://github.com/opto/web2project-dokuwiki
module_download: https://github.com/opto/web2project-dokuwiki/archive/master.zip
---

## Module Overview

This module allows to associate dokuwiki pages to tasks, projects and contacts. These pages will be shown in a tab in project/task/contact view, so they are easily accessible without leaving web2project.

Some more info is at http://support.web2project.net/forums/229361-module-add-on-developers/suggestions/5076082-dokuwiki-module-updated-for-3-0 and in the readme.txt

This module allows to add dokuwiki pages to projects, tasks and contacts. They are displayed in a tab in the view of project or task or contact. The main dokuwiki menu item allows to browse dokuwiki without leaving the w2p context.

If some code is added additionally (see readme), the tabs will indicate whether the page has already been created (without actually opening the tab). For this xml-rpc needs to work in dokuwiki.

This module is available for download here: [https://github.com/opto/web2project-dokuwiki module source] for w2p 3.x. A version for 2.x can be found in the old forums in the dokuwiki thread.

For download, use the <download as zip> button on the right, or use git for the sourcecode.

## Release Notes


## Known/Open Issues

* Pages are saved with abbreviated names of project/task/contact. If this name is edited, the connection to the page may be lost.
* Please see readme.txt for detailed info.


## Development Status

* v1.1 Update Release: 2013 November
* v1.0 Initial Release: 2012