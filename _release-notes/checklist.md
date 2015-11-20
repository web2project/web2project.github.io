---
layout: release-notes
title: Release Checklist
status: cleanup
---

This checklist outlines the steps required to complete an official release.  *This process does **not** get applied to the Nightly Snapshots.*

This process assumes that our release criteria have been met, specifically this means the release date has been reached **and** the issue queue has been reduced to "reasonable" issues.

## Code/Package Related Steps

* Download the latest revision.
* Run all Unit Tests.  If there's a failure, fix it, run again to confirm the fix, and start again at the beginning.
* Run **phing package** using trunk as the selected tag.  (*Phing installation instructions are covered in [Unit Tests](/docs/unit_tests.html)*)  This will checkout from SVN, run phplint over all files, create the Changelog, and create the .tar.gz and zip files for Sourceforge.  Use these files for all further testing.
* Run a fresh installation test.  If there's a failure, fix it, run again to confirm the fix, and start again at the beginning.
* Run a conversion from dotProject test.  If there's a failure, fix it, run again to confirm the fix, and start again at the beginning.
* Update the version string in **includes/version.php**
* Tag the latest revision into the /tags folder in the format of **versionM.m** where **M** is the Major version and **m** is the minor version.
* Run **phing package** using the above created tag upon request.  (*Phing installation instructions are covered in [Unit Tests](/docs/unit_tests.html)*)  This will checkout from SVN, run phplint over all files, create the Changelog, and create the .tar.gz and zip files for Sourceforge.
* Open and decompress each file to confirm that it expands without problem to its own directory.
* Upload the package to Sourceforge and identify it as a release.

*At this point, the release is officially made.  There are no further steps required to allow users to download the latest package and install/use it as necessary.  All further steps are for communication/promotional purposes only.*

## Post Release

* Generate the Release Notes and add the [Release Notes](/release-notes/index.html).
* Update the wiki sidebar menu to link to the new Release Notes.
* On [http://web2project.net](http://web2project.net) update links for "Current Release" and "Current Release Notes".
* Create sourceforge news item
* Create freshmeat news item
* Create story for the main [http://web2project.net](http://web2project.net) site
* Create announcements (as required) in personal blogs
* Contact phpdeveloper.org, Zend's DevZone, phparchitect, etc for coverage as appropriate
* Update demonstration site with the latest release