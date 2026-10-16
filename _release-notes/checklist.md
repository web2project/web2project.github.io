---
layout: release-notes
title: Release Checklist
---

This checklist outlines the steps required to complete an official release.

This process assumes that our release criteria have been met, specifically this means the release date has been reached **and** the [issue queue](https://github.com/web2project/web2project/issues) has been reduced to "reasonable" issues.

## Code/Package Related Steps

* Merge the development branch (for example `dev-5.0.0`) into `master` and pull the latest `master`.
* Run `composer install` to get the development tools.
* Run all [Unit Tests](/docs/unit-tests.html) against a test database. Compare the result with the previous release's known errors and failures; if there's a new failure, fix it, run again to confirm the fix, and start again at the beginning.
* Run `vendor/bin/phing -f unit_tests/build.xml lint` to check every file for syntax errors.
* Update the version in **includes/version.php**: set the major, minor and patch numbers, and set `$w2p_version_prepatch` to `null` for a final release (or to `'rc1'` and so on for a release candidate). Update `"version"` in **composer.json** to match.
* Check that any new database migrations in `install/sql/` are numbered in order and run cleanly.
* Run a fresh installation test from the package (see below), including `composer install --no-dev`. If there's a failure, fix it, run again to confirm the fix, and start again at the beginning.
* Run an upgrade test from the previous release with *Apply System Updates*, and confirm it reports no errors.
* Run a conversion from dotProject test.
* Tag the release in git in the format **versionM.m.p**, for example `version5.0.0`, and push the tag.
* Run `vendor/bin/phing -f unit_tests/build.xml package` and enter the tag when asked which version to package. This clones the tag from GitHub, minifies the JavaScript and CSS, removes `unit_tests`, runs phplint over all files, and creates the `.tar.gz` and `.zip` files in `unit_tests/`. The packages don't include `vendor/`; users run `composer install --no-dev` as described in the [Installation Guide](/docs/installation.html).
* Open and decompress each file to confirm that it expands without problem to its own directory.
* Create the release on [GitHub](https://github.com/web2project/web2project/releases) from the tag, attach the `.tar.gz` and `.zip` files, and paste in a summary of the release notes. Mark release candidates as pre-releases.

*At this point, the release is officially made. There are no further steps required to allow users to download the latest package and install/use it as necessary. All further steps are for communication/promotional purposes only.*

## Post Release

* Generate the Release Notes from the [template](/release-notes/template.html), including the [code metrics](/docs/code-metrics.html), and add them to the [Release Notes](/release-notes/index.html).
* Update the docs site for anything the release changed: the [Installation Guide](/docs/installation.html), the module pages and the [FAQ](/docs/faq.html).
* Close or relabel the GitHub issues fixed in the release, with a link to the release.
* Post an announcement in [GitHub Discussions](https://github.com/orgs/web2project/discussions).
* Create announcements (as required) in personal blogs and other channels.
* Update the demonstration site with the latest release, if there is one.
