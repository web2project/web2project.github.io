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

### Public sign-up has no spam protection

When *Activate External User Creation* is on (System Admin → System Configuration), which is the default, anyone can create an account from the login page. There is no captcha, hidden-field trap or rate limit, so the form can be scripted. New accounts have no role, so they can't log in until an administrator assigns one, but they still fill up the Inactive Users list and send the administrator an email each. The confirmation email sent to the new user also contains their password in plain text.

**What to do:** turn *Activate External User Creation* off unless you need self-service sign-up, and create accounts from User Admin instead. Tracked in [#363](https://github.com/web2project/web2project/issues/363).

### Some names are shown without HTML escaping

Company, project, task and similar names are escaped in drop-down lists and the selector pop-up, but not yet everywhere: the Companies, Projects and Tasks lists, calendar views, and some page titles print them as entered. A user who can create or rename those items could put HTML or script in a name, and it would run in other users' browsers.

**What to do:** only give *add* and *edit* rights on Companies, Projects, Tasks and Events to trusted users until this is fixed.

### Logout links are plain links

Logging out, and an administrator ending another user's session from the Active Sessions tab, are ordinary links (GET requests) without a security token. Another website could log a user out by making their browser load the link. This can't be used to read or change data.

## Fixed in v5.0

For the record, v5.0 fixed these security problems. See the [release notes](/release-notes/5.0.0-rc1.html) for the full list.

* Script injection (XSS) through the selector pop-up and drop-down labels.
* SQL injection through the e-mail address on the public sign-up form.
* Translation files run as PHP code with `eval()` ([#313](https://github.com/web2project/web2project/issues/313)); the translation editor could also write outside `locales/`.
* Password checks that never matched and passwords re-hashed on save ([#386](https://github.com/web2project/web2project/issues/386)).
* A refused delete that still removed related data (for example a user's login and preferences).
* The Active Sessions tab passing the session id into SQL unchecked.
