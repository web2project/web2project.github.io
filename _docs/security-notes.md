---
layout: page
title: Security Notes and Known Limitations
---

**Applies to**: v5.0.0

This page lists the security settings worth checking after you install web2project, and the known limitations that haven't been fixed yet, with ways to reduce the risk until they are. Report new problems in the [issue tracker](https://github.com/web2project/web2project/issues).

## After installing

* **Change the admin password.** The installer sets it; change it before anyone else can reach the site. See [Getting Started](/docs/getting-started.html).
* **Use HTTPS.** Passwords and session cookies are sent with every login and request.
* **Block direct access to `files/`.** See below.
* **Decide whether to allow public sign-up.** It is on by default. See below.
* **Run updates.** After every upgrade, go to System Admin → *Apply System Updates*. Several v5.0 fixes (permissions, LDAP users, login tracking, Resources) only take effect once their database migrations have run.

## Known limitations

### Uploaded files are stored inside the web root

Uploaded files are saved in `files/` under the web2project folder. The only thing that stops a browser from downloading them directly, without logging in or any permission check, is `files/.htaccess`. It uses Apache 2.2 syntax, so it does nothing on Apache 2.4 without `mod_access_compat`, and nginx ignores it entirely.

**What to do:** add `Require all denied` for `files/` on Apache 2.4, or `location ^~ /files/ { deny all; }` on nginx. Then check that `http://{web2project-install}/files/` returns 403 Forbidden. Logged-in users still get their files through `fileviewer.php`, which checks permissions. Details are in [Server and Database Configuration](/docs/server-configuration.html#files-and-folders).

A configurable storage location outside the web root is planned ([#394](https://github.com/web2project/web2project/issues/394), [#395](https://github.com/web2project/web2project/issues/395)).

### Public sign-up is on by default

When *Activate External User Creation* is on (System Admin → System Configuration), which is the default, anyone can create an account from the login page. The form has its own bot protection: the browser has to solve a small proof-of-work puzzle, a hidden field catches form-filling bots, and a form sent less than 3 seconds or more than an hour after it was shown is refused. It is not a captcha, so a determined script can still get through.

New accounts have no role, so they can't log in until an administrator assigns one, but each one appears in the Inactive Users list and sends the administrator an e-mail. Sign-up login names may only contain letters and digits. The confirmation e-mail doesn't include the password.

**What to do:** turn *Activate External User Creation* off unless you need self-service sign-up, and create accounts from User Admin instead.

## Fixed in v5.0

For the record, v5.0 fixed these security problems. See the [release notes](/release-notes/5.0.0.html) for the full list.

* Script injection (XSS) through the selector pop-up and drop-down labels.
* SQL injection through the e-mail address on the public sign-up form.
* Translation files run as PHP code with `eval()` ([#313](https://github.com/web2project/web2project/issues/313)); the translation editor could also write outside `locales/`.
* Password checks that never matched and passwords re-hashed on save ([#386](https://github.com/web2project/web2project/issues/386)).
* A refused delete that still removed related data (for example a user's login and preferences).
* The Active Sessions tab passing the session id into SQL unchecked.
* Names (companies, projects, tasks, contacts, users and others) printed without HTML escaping in lists, view pages, calendars and tooltips ([#546](https://github.com/web2project/web2project/issues/546)), and forum messages printed without escaping ([#533](https://github.com/web2project/web2project/issues/533)).
* SQL injection through search boxes ([GHSA-98hj-h8rw-w56m](https://github.com/web2project/web2project/security/advisories/GHSA-98hj-h8rw-w56m), [GHSA-mj5m-6227-52vv](https://github.com/web2project/web2project/security/advisories/GHSA-mj5m-6227-52vv)), preferences, the Users list and sort parameters.
* Role changes that didn't check the account or the role, so a user could make themselves an Administrator ([GHSA-qqx6-f7cc-3wf2](https://github.com/web2project/web2project/security/advisories/GHSA-qqx6-f7cc-3wf2)), and profile saves that accepted fields the form doesn't show ([GHSA-65x8-6jcq-fc5r](https://github.com/web2project/web2project/security/advisories/GHSA-65x8-6jcq-fc5r)).
* Task log edits and deletes checked against the posted creator instead of the stored log ([GHSA-xcpx-p68j-gm7w](https://github.com/web2project/web2project/security/advisories/GHSA-xcpx-p68j-gm7w)).
* Bulk task actions that didn't check each task and its project ([GHSA-48ww-5h48-vwx9](https://github.com/web2project/web2project/security/advisories/GHSA-48ww-5h48-vwx9)).
* Forum watches, topic links and replies that reached forums the user can't see ([GHSA-qp43-fcwc-p3j3](https://github.com/web2project/web2project/security/advisories/GHSA-qp43-fcwc-p3j3)), and forum messages that anyone with Forums edit or delete rights could change or delete. Only the author or an administrator can now.
* Pages of inactive modules, or of modules the user can't access, opening by URL ([#547](https://github.com/web2project/web2project/issues/547)).
* Logout and ending another user's session as plain links without the session's security token.
* Public sign-up without bot protection, and a confirmation e-mail that contained the password.
