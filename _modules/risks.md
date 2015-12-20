---
layout: module
title: Risk Management Module

category: addon-module

module_name: Risk Management
module_path: risks
module_creator: CaseySoftware, LLC
module_devs: CaseySoftware, LLC
module_version: 2.0
module_source: https://github.com/web2project/modules-risks
module_download: https://github.com/web2project/modules-risks/archive/master.zip
---

## Module Overview

The Risk Management Module allows users to track a number of Risks and how they associate to individual Tasks or even entire Projects. It is known to work with web2project v2.2 but has not yet been tested with earlier versions. For general information on Risk Management and related concepts, please review [Risk management](http://en.wikipedia.org/wiki/Risk_management).

### Release Notes

#### Open Issues

* The CRisk->hook_preStore() method has a hardcoded Magic Number.  The RiskStatus of 2 is assumed to be "Closed" and when a Risk is updated to have this value, the Mitigation Date will be calculated and stored.  Moving out of this state will clear the Mitigation Date.  At a later point, this Magic Number should be removed.
* Additional reporting functionality would be useful.  Feedback in improving this module's reporting and more closely adhering to this process is welcome.
* Additional reporting!
* Support for the Custom Field Editor within core Web2Project.
* The module should be scrubbed of the inline html/php nastiness.

#### Updated in 2.0

* Major rewrite using core web2project v3.0 functionality
* Updated the setup class to take advantage of new w2p_Core_Setup functionality;
* Renamed the CRiskNotes class to CRisk_Notes to take advantage of our autoloader;
* Updated all classes (CRisk and CRiskNotes) to take advantage of the pre/post hooks, this allowed us to eliminate the store() and delete() methods;
* Updated all controllers (do_risk_aed.php and do_risk_note_aed.php) to use the w2p_Controllers_Base class;
* Updated the List and View views to use the HTMLHelper;
* Deleted lots of code;

#### Updated in 1.0

* Initial release for web2project.
* Added translation throughout the entire module to ensure iternationalization support.
* Major database & code cleanup.
* Eliminated numerous unnecessary queries to improve performance.
* Cleaned up module structure to match web2project standards - implemented hook_search, applied permissions throughout, updated controller to the thin-controller structure, etc.

### Known/Open Issues

* As of v2.2, this module cannot be deployed via the System Administration -> View Modules screen. A patch will be implemented in core web2project for v2.3 and is already available in web2project r1577.
* The store() method on the Risks class has a hardcoded Magic Number.  The RiskStatus of 2 is assumed to be "Closed" and when a Risk is updated to have this value, the Mitigation Date will be calculated and stored.  Moving out of this state will clear the Mitigation Date.  At a later point, this Magic Number should be removed.
* Additional reporting functionality would be useful.  Feedback in improving this module's reporting and more closely adhering to this process is welcome.
* Since this is the first official release for web2project, there isno upgrade path included in this release.  If this is an issue for you or your organization, please contact the author to discuss options.
* We should add support to add fields via the Custom Field Editor.
* The module should be scrubbed of the inline css/php nastiness.
* This doesn't work with dotProject, so don't even bother trying.

### Development Status

* v2.0 2012 December
* v1.0 2011 January - First web2project release
* <s>v3.0 2008 July - Last dotProject release - http://caseysoftware.com/blog/risk-management-module-v3</s>