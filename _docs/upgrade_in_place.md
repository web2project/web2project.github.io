---
layout: page
title: Upgrade in Place

category: [proposal, incomplete]
---

This specification is written with WordPress's "[upgrade in place](http://codex.wordpress.org/Updating_WordPress)" system in mind. Conceptually it will be similar but we should not reuse its code due to its GPL licensing.

## Considerations

*  The system MUST determine that a new version is available.
*  The system SHOULD only download the updated/new files and not the entire package.
*  The system SHOULD work if the local files are writable by the webserver user.
*  The system SHOULD apply core updates with no additional configuration.
*  The system SHOULD apply updates to its modules with no additional configuration.
*  The system SHOULD apply updates to its Add On modules with no additional configuration.
*  The system MUST always set reasonable (non-breaking) defaults for any new/modified configuration settings.
*  The system MUST remove deleted files.

## WordPress's Flow

* Check requirements
* Take a backup
* Disable plugins
* Ready to Update
* Automatic Update
* Manual Update - ''aka what we do now''
  * Replace WordPress files
  * Remove .maintenance file
  * Update your installation
  * Do something nice for yourself
* Final Steps
* Troubleshooting

## Web2project's proposed Flow

* Check central repository for core system updates
* <s>Check requirements</s>
  * <s>Check PHP Version</s>
  * <s>Check libraries</s>
  * <s>Check database version</s>
  * <s>Check file ownership</s>
* Put into offline state
* Make database backup
* Disable non-core modules
* Move old files
* <s>Download updated files</s>
* <s>Place updated files in proper locations</s>
* <s>Apply core updates</s>
* Check repository for add on module updates - [http://developer.github.com/v3/repos/#list-tags Tag Information]
* <s>Apply module updates</s>
  * <s>List modules</s>
  * <s>Determine required updates</s>
  * <s>Check requirements</s>
  * <s>Apply updates</s>
* If failure
  * Roll back updates?
  * Restore original files?
* Delete dead files
* Put into online state