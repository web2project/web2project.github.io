---
layout: page
title: Updating Add On Modules for v5.0

category: "module building guide"
---

**Applies to**: v5.0.0 and later

web2project v5.0 removes code that has been deprecated since the v2.x and v3.x releases. Most of it has logged "has been deprecated" notices for years. An Add On module that still uses any of it will stop with an error such as `Call to undefined function db_exec()` or `Class "CAppUI" not found`.

This page lists what was removed and what to use instead, plus the other v5.0 changes that affect modules.

## Find what your module uses

From your module's folder, these searches find the most common problems:

    grep -rnE "\b(db_[a-z_]+|w2Psession[A-Za-z]+|showtask(_pd|_pr)?|findchild(_pd|_pr)?|w2PgetUsername(FromID)?|getProjects|canTaskAccess)\s*\(" .
    grep -rnE "\b(CAppUI|CDate|DBQuery|CTitleBlock|CTabBox_core|CInfoTabBox|CConfig|CPreferences|CustomFields|CW2pObject|Mail|w2Pacl|CTaskLog|CForumMessage|CFileFolder|CRole|CSysKey|CSysVal|CCalendar|CAdmin_User)\b" .
    grep -rn "w2p_Core_\(Config\|Dispatcher\|Event\|EventQueue\|HookHandler\|Module\|Preferences\|Setup\|UpgradeManager\)\|w2p_API_iCalendar" .

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

    $connection = new w2p_Database_Connection($GLOBALS['db']);
    $connection->exec($sql);
    $id = $connection->insert_id();

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

## Other changes that affect modules

### One theme: Bootstrap 5.3

The w2p-snowball and wps-redmond themes, the per-user "User Interface Style" preference and the system `host_style` setting are gone. The interface style is always `bootstrap` (the `W2P_UISTYLE` constant in `base.php`).

- Templates still resolve in two steps: `style/bootstrap/<template>.php` first, then `style/_common/<template>.php`. Put your module's HTML in templates and include them with `$AppUI->getTheme()->resolveTemplate('yourmodule/view')`.
- The core pages no longer use tables for layout. `w2p_Theme_TitleBlock` and `w2p_Theme_TabBox` render Bootstrap markup, and the theme maps the existing class names (`std`, `tbl`, `list`, `button`, `addedit` and others) onto Bootstrap styles. Use Bootstrap's own classes (`d-flex`, `btn btn-primary btn-sm`, `form-control`) for new markup.
- jQuery 1.7 and tipTip are still loaded on every page.

### PDF output is gone

The reports, Gantt charts and forums no longer produce PDFs; their old entry points show a message and redirect. Don't build on `w2p_Output_PDFRenderer` or the ezpdf library: both are scheduled for removal. Users can print to PDF from the browser.

### Translation files must be plain arrays

`locales/*/*.inc` and `modules/<module>/locales/*.inc` files are no longer run with `eval()`. A small parser reads them, and it accepts only quoted strings, `=>`, commas, whitespace and comments. An entry that contains anything else (a variable, a function call, concatenation) is skipped, not run, so that string falls back to English.

    "Todo List"=>"Todo List",
    "Add a Todo"=>"Add a Todo",

### Delete hooks only run when the delete is allowed

`w2p_Core_BaseObject::delete()` now calls `canDelete()` before it publishes `preDeleteEvent`. Your `hook_preDelete()` no longer runs, and can no longer remove related rows, when the delete is refused. Always call `parent::hook_preDelete()` and `parent::hook_postDelete()` from your overrides: the first records the id of the object being deleted, and the second uses it to remove the object's custom field values and write the history entry.

### Copies run their own hooks

`w2p_Core_BaseObject::duplicate()` returns a clone with its own query object and event dispatcher. Storing the copy now runs the copy's `hook_preCreate()`, `hook_postStore()` and the other hooks. Before, they ran on the original object.

### Database

- web2project removes `ONLY_FULL_GROUP_BY` from the session `sql_mode` when it connects, so queries written for MySQL 5 keep working on MySQL 8. New queries should still group correctly.
- The upgrader now reports SQL errors from the core migrations instead of hiding them. Test your module's `setup.php` install and upgrade on a strict-mode server.

### Custom fields

The Custom Field Editor offers Companies, Projects, Tasks, Calendar (events), Contacts and Users. Custom fields are looked up by module directory (`events`, not `Calendar`). Add On modules can't add their own custom fields through the editor yet.

### Task trees

`CTask::getTaskTree($project_id, $task_id = 0, $task_status = 0)` takes a status. Pass `null` for tasks of every status.
