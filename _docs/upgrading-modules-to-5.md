---
layout: page
title: Updating Add On Modules for v5.0

category: "module building guide"
---

**Applies to**: v5.0.0 and later

Web2project v5.0 removes code that has been deprecated since the v2.x and v3.x releases. Most of it has logged "has been deprecated" notices for years. An Add On module that still uses any of it will stop with an error such as `Call to undefined function db_exec()` or `Class "CAppUI" not found`.

This page lists what was removed and what to use instead, plus the other v5.0 changes that affect modules.

## Find what your module uses

From your module's folder, these searches find the most common problems:

```
grep -rnE "\b(db_[a-z_]+|w2Psession[A-Za-z]+|showtask(_pd|_pr)?|findchild(_pd|_pr)?|w2PgetUsername(FromID)?|getProjects|canTaskAccess)\s*\(" .
grep -rnE "\b(CAppUI|CDate|DBQuery|CTitleBlock|CTabBox_core|CInfoTabBox|CConfig|CPreferences|CustomFields|CW2pObject|Mail|w2Pacl|CTaskLog|CForumMessage|CFileFolder|CRole|CSysKey|CSysVal|CCalendar|CAdmin_User)\b" .
grep -rn "w2p_Core_\(Config\|Dispatcher\|Event\|EventQueue\|HookHandler\|Module\|Preferences\|Setup\|UpgradeManager\)\|w2p_API_iCalendar" .
grep -rn '\$.ajax\|\$.post\|fetch(' .
```

Then replace each match using the tables below.

## Removed class names

The file `classes/deprecated.class.php` held 37 aliases that extended the current classes. Use the class on the right.

Removed | Use instead
----- | -----
CAppUI | w2p_Core_CAppUI
CDate | w2p_Utilities_Date
DBQuery | w2p_Database_Query
CTitleBlock, CTitleBlock_core | w2p_Theme_TitleBlock
CTabBox_core | w2p_Theme_TabBox
CInfoTabBox | w2p_Theme_InfoTabBox
CMonthCalendar | w2p_Output_MonthCalendar
CConfig, w2p_Core_Config | w2p_System_Config
CPreferences, w2p_Core_Preferences | w2p_System_Preferences
CustomFields | w2p_Core_CustomFields
CW2pObject | w2p_Core_BaseObject
Mail | w2p_Utilities_Mail
w2Pacl | w2p_Extensions_Permissions
w2PajaxResponse | w2p_Extensions_AjaxResponse
w2p_Core_Dispatcher | w2p_System_Dispatcher
w2p_Core_Event | w2p_System_Event
w2p_Core_EventQueue | w2p_System_EventQueue
w2p_Core_HookHandler | w2p_System_HookHandler
w2p_Core_Module | w2p_System_Module
w2p_Core_Setup | w2p_System_Setup
w2p_Core_UpgradeManager | w2p_System_UpgradeManager
w2p_API_iCalendar | w2p_Output_iCalendar
CAdmin_User | CUser
CCalendar | CEvent
CFileFolder | CFile_Folder
CForumMessage | CForum_Message
CTaskLog | CTask_Log
CProjectDesignerOptions | CProjectDesigner
CRole | CSystem_Role
CSysKey | CSystem_SysKey
CSysVal | CSystem_SysVal
bcode | CSystem_Bcode
budgets | CSystem_Budget
smartsearch | CSmartSearch

If your `setup.php` names a removed class in `$config['mod_main_class']` or `$config['mod_setup_class']`, update it there too.

## Removed functions

The file `includes/deprecated_functions.php` held 66 functions. Use the replacement on the right; where there is none, the feature is gone from the core system.

### Database

`w2p_Database_Connection` replaces the `db_*` helpers. Create one from the global ADODB connection:

```
$connection = new w2p_Database_Connection($GLOBALS['db']);
$connection->exec($sql);
$id = $connection->insert_id();
```

Removed | Use instead
----- | -----
db_connect() | `$connection->connect()`
db_error(), db_errno() | `$connection->error()`, `$connection->errno()`
db_exec() | `$connection->exec()`
db_insert_id() | `$connection->insert_id()`
db_free_result(), db_num_rows() | `$connection->free_result()`, `$connection->num_rows()`
db_fetch_row(), db_fetch_assoc(), db_fetch_array(), db_fetch_object() | `$connection->fetch_row()`, `->fetch_assoc()`, `->fetch_array()`, `->fetch_object()`
db_escape() | `$connection->escape()`
db_version() | `$connection->version()`
db_unix2dateTime(), db_dateTime2unix() | `$connection->unix2dateTime()`, `->dateTime2unix()`

Better still, build queries with `w2p_Database_Query` inside your module's class, as the [Module Building Guide](/docs/module-building-guide.html) recommends.

### Sessions

Removed | Use instead
----- | -----
w2PsessionStart(), w2PsessionRead(), w2PsessionWrite(), w2PsessionDestroy(), w2PsessionGC(), w2PsessionConvertTime() | the matching method on `w2p_System_Session` (`start()`, `read()`, `write()`, `destroy()`, `gc()`, `convertTime()`)
w2PsessionOpen(), w2PsessionClose() | none needed

### Projects, tasks and users

Removed | Use instead
----- | -----
showtask(), showtask_pd(), showtask_pr() | showtask_new()
findchild(), findchild_pd(), findchild_pr() | findchild_new()
constructTaskTree(), constructTaskTree_pd() | buildTaskTree()
getStructuredProjects() | `CProject->getStructuredProjects()`
getProjects() | `CProject->getProjects()`
canTaskAccess() | `CTask->canAccess()`
get_dependencies_pd() | `CTask->getDependencyList()`
taskstyle_pd() | w2pFindTaskComplete()
w2PgetUsername() | `CContact::getContactByUsername()`
w2PgetUsernameFromID() | `CContact::getContactByUserid()`
makePass() | `w2p_Authenticators_SQL->createNewPassword()`

### Display and helpers

Removed | Use instead
----- | -----
buildHeaderNavigation() | `$AppUI->getTheme()->buildHeaderNavigation()`
styleRenderBoxTop(), styleRenderBoxBottom() | `$AppUI->getTheme()->styleRenderBoxTop()`, `->styleRenderBoxBottom()`
w2PgetCleanParam() | w2PgetParam()
smart_slice() | dumb_slice()
getSpaces() | str_repeat()
remove_invalid() | array_filter()
atoi() | an `(int)` cast
w2PcheckCharset() | none; the system is always UTF-8
strJpGraph() | none

### Removed with no replacement

w2p_check_url(), findchilddept_comp(), showchilddept_comp(), show_st_project(), find_proj_child(), contextHelp(), w2PcontextHelp(), cleanText(), showFVar(), resource_presave(), resource_postsave(), the clash_* functions (clash_process(), clash_mail(), clash_accept(), clear_clash(), clash_cancel()) and __extract_from_tasks6().

The contact self-update request is gone: `updatecontact.php`, `do_updatecontact.php`, `CContact::getUpdateKey()`, `clearUpdateKey()`, `notify()`, `updateNotify()`, `getContactByUpdatekey()` and `clearOldUpdatekeys()`, `w2p_Output_EmailManager::getContactUpdateNotify()` and `__extract_from_contact_controller()`. Migration 074 drops `contacts.contact_updatekey` and `contacts.contact_updateasked`; `contacts.contact_lastupdate` stays.

## Other changes that affect modules

### Form tokens (CSRF)

Every `dosql` POST and every `a=do_*` / `a=domodsql` request must carry the session's form token as `__nonce`. Without it, the request is redirected with "Your form has expired or did not come from this site". The failure is silent for scripts: an AJAX call gets the whole redirect page back.

* **POST forms:** nothing to do. `w2p_add_form_tokens()` adds the token to every `<form method="post">`.
* **AJAX posts** (`$.ajax`, `$.post`, `fetch`) to a `dosql` handler, and forms built in JavaScript: send the token yourself, for example `__nonce: '<?php echo $AppUI->getFormToken(); ?>'`, as `modules/system/customfields/addedit.php` does.
* **GET links that change data:** append `&__nonce=` plus the token, or better, make them POST forms.
* **Handlers that change data outside `dosql`/`do_*`**, for example a configure page that saves on POST, must call `$AppUI->checkFormToken()` themselves.

### Module access is checked before your handler runs

`index.php` now refuses a request unless the module is active and the user can access it (`$AppUI->isActiveModule($m) && canAccess($m)`). This applies to `dosql` POSTs, `a=do_*` requests and ordinary page loads, and a refused request is redirected to the access-denied page. A user who can't open your module can no longer reach its handlers or its pages, and an add-on that never called `canAccess()` itself is no longer open to everyone. Only the public pages, the `m=admin` and `m=calendar` stubs and a few self-service handlers (a user changing their own details or preferences) are exempt.

This is a gate and not a replacement for your own checks. Keep calling `canEdit()`, `canCreate()` and `canDelete()` on the object in every handler, and check that your module's permissions are set up in `setup.php`, because a role without access to the module now stops at the door.

### One theme: Bootstrap 5.3

The w2p-snowball and wps-redmond themes, the per-user "User Interface Style" preference and the system `host_style` setting are gone. The interface style is always `bootstrap` (the `W2P_UISTYLE` constant in `base.php`).

- Templates still resolve in two steps: `style/bootstrap/<template>.php` first, then `style/_common/<template>.php`. Put your module's HTML in templates and include them with `$AppUI->getTheme()->resolveTemplate('yourmodule/view')`.
- The core pages no longer use tables for layout. `w2p_Theme_TitleBlock` and `w2p_Theme_TabBox` render Bootstrap markup, and the theme maps the existing class names (`std`, `tbl`, `list`, `button`, `addedit` and others) onto Bootstrap styles. Use Bootstrap's own classes (`d-flex`, `btn btn-primary btn-sm`, `form-control`) for new markup.
- jQuery 1.7 and tipTip are still loaded on every page.

### PDF output is gone

The reports, Gantt charts and forums no longer produce PDFs; their old entry points show a message and redirect. Don't build on `w2p_Output_PDFRenderer` or the ezpdf library: both are scheduled for removal. Users can print to PDF from the browser.

### Translation files must be plain arrays

`locales/*/*.inc` and `modules/<module>/locales/*.inc` files are no longer run with `eval()`. A small parser reads them, and it accepts only quoted strings, `=>`, commas, whitespace and comments. An entry that contains anything else (a variable, a function call, concatenation) is skipped, not run, so that string falls back to English.

```
"Todo List"=>"Todo List",
"Add a Todo"=>"Add a Todo",
```

### Delete hooks only run when the delete is allowed

`w2p_Core_BaseObject::delete()` now calls `canDelete()` before it publishes `preDeleteEvent`. Your `hook_preDelete()` no longer runs, and can no longer remove related rows, when the delete is refused. Always call `parent::hook_preDelete()` and `parent::hook_postDelete()` from your overrides: the first records the id of the object being deleted, and the second uses it to remove the object's custom field values and write the history entry.

### Copies run their own hooks

`w2p_Core_BaseObject::duplicate()` returns a clone with its own query object and event dispatcher. Storing the copy now runs the copy's `hook_preCreate()`, `hook_postStore()` and the other hooks. Before, they ran on the original object.

### Database

- web2project removes `ONLY_FULL_GROUP_BY` from the session `sql_mode` when it connects, so queries written for MySQL 5 keep working on MySQL 8. New queries should still group correctly.
- The upgrader now reports SQL errors from the core migrations instead of hiding them. Test your module's `setup.php` install and upgrade on a strict-mode server.

### Custom fields

The Custom Field Editor offers Companies, Projects, Tasks, Calendar (events), Contacts and Users. Custom fields are looked up by module directory (`events`, not `Calendar`). Add On modules can't add their own custom fields through the editor yet.

`store()` only saves custom fields that were given a value. The add/edit form passes its posted values as before, but a `store()` from anywhere else (a bulk update, cron job, import or API call) now leaves the existing values alone, where it used to reset them to 0. If you store an object outside its form and want to set custom fields, call `setCustomFields(array('field_name' => $value))` before `store()`. Fields you leave out keep their values.

### Task trees

`CTask::getTaskTree($project_id, $task_id = 0, $task_status = 0)` takes a status. Pass `null` for tasks of every status.

### Escape what you print

`bind()` still runs `htmlentities()` on posted values, but the value is decoded again before it is saved, so the database holds the text as typed. Since v5.0 `bind()` and `w2PHTMLDecode()` use the same flags, so apostrophes are no longer saved as `&#039;`; migration 075 cleans up rows saved that way. Escape every name, title or other user text when you print it:

```
echo htmlspecialchars($todo->todo_title, ENT_QUOTES, 'UTF-8');
```

The core list and view helpers (`w2p_Output_HTMLHelper`, `w2p_Output_ListTable` and the view helper) now escape object names, owner names and project colours themselves. If your module put markup into a value that one of them prints, it now shows as text.

`w2PtoolTip($header, $tip)` builds a native `title=""` tooltip, which browsers show as plain text. Markup in the tip is turned into lines of text (a line per `<br>`, `<div>`, `<p>` or `<li>`, and "Label: value" for `<dt>`/`<dd>`), and the header is used as plain text.

### Search terms and sort orders

Don't put a request value into SQL by joining strings:

- For a search, use `w2p_Database_Query::quoteLike()`. It quotes the term and escapes `%` and `_`, so they match themselves: `$q->addWhere('todo_title LIKE ' . $q->quoteLike($search));`. Pass `'starts'` as the second argument for a starts-with match.
- For a sort column taken from the request, use `w2PsafeOrderBy($value, $default)`. It returns the value only when it is a column name (optionally `table.column`) with an optional `ASC` or `DESC`, and `$default` otherwise: `$q->addOrder(w2PsafeOrderBy(w2PgetParam($_GET, 'orderby', ''), 'todo_title'));`.
- Use `$q->quote()` for any other string, and cast ids with `(int)`.

### Restoring a failed save

When a save fails, the controller keeps the object in the session and the next edit page shows it again. Pass your page's own object to `$AppUI->restoreObject()`. It returns the held object only when it is the same class and id, so a failed save of one record is never shown, or saved again, on another record's form:

```
$obj = $AppUI->restoreObject($object);
if ($obj) {
    $object = $obj;
    $object_id = $object->getId();
} else {
    $object->load($object_id);
}
```

Called with no argument, it returns whatever is held, as before.

### Signature and behaviour changes

- `w2p_Core_BaseObject::loadFull($notUsed, $object_id)`: both parameters are required, which ends the PHP 8 deprecation logged on every request. An override must accept two parameters; it may give them defaults, as `CUser::loadFull($userId, $notUsed = null)` does. An older override with one parameter, such as `loadFull($riskId)`, is a fatal error on PHP 8, and because SmartSearch loads every active module's main class it breaks the header search for everyone. Rename such a method (for example to `loadWithDetails()`) and update its callers.
- `arraySelect()` and `arraySelectTree()` take the list by value, so you can pass an expression such as `arrayMerge(array(-1 => 'All'), $list)`. The selected option is matched as a string.
- `w2p_Database_Query::insertObject()` and `insertArray()` now write `0`, `false` (as 0) and `''` (for text columns). Only `null` is left out so the column default applies. Before, all of them were dropped, so an insert could differ from an update of the same object.
- `w2p_Core_BaseObject::$_event` is protected rather than private.
- `w2p_Output_ListTable::addDividers('<prefix>_project')` prints a project heading for any key ending in `_project`, using the row's `project_name` and `project_color_identifier`, and "Not attached to a project" for 0. Before, only `file_project` worked.
- A `contacts_tab.view.<name>.php` file in your module now adds a tab to the contact page, as the other `*_tab.view.*` files do for their pages. Before, the contact page never showed them.
- Login names are unique (migration 077). `CUser::store()` reports a duplicate as "this user already exists" instead of a database error.
- `CForum_Message::canEdit()` and `canDelete()` allow only the message's author or a user with edit rights on System. On save, a new message always gets the current user as its author, and an edited one keeps its stored author.
