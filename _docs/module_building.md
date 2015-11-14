---
layout: page
title: Module Building Guide, Before 3.0
---

= Disclaimer =

''This document should be considered pretty stable. Everything included here is our "current best approach" for versions of Web2project prior to 3.0''

= Background =

The goal of this page is to document a clear, repeatable way for developers to create modules to supplement and enhance the operation of the web2project system. There are numerous code samples included because sometimes showing is just as important as explaining.

As this guide becomes standardized, functionality will be added in the core system to ensure and eventually enforce that all modules adhere to these standards. Failure to do so can lead to non-functioning modules, security vulnerabilities, and even bad hair days. None are pleasant.

= Expectations =

*  All input should be filtered before it is used in '''any''' capacity. This will help prevent security vulnerabilities like [http://en.wikipedia.org/wiki/SQL_injection SQL injection] and [http://en.wikipedia.org/wiki/Cross-site_scripting Cross Site Scripting] attacks.
*  Under no circumstances should there be references to the w2p_Database_Query class/object outside of the module's core class.  This will keep the module's business logic centralized and help reduce duplication.
*  Under no circumstances should there be raw SQL statements anywhere in the module.  Doing otherwise is sloppy and prevents compatibility with other database engines.
*  It is preferred that you use a core web2project function/method/API call over copy/pasting it into your own module. This will make your module smaller, easier to maintain, and ensure that all permissions and processes are properly respected.
*  All module development should adhere to the [http://pear.php.net/manual/en/standards.php PEAR Coding Standard]. Although not all of core web2project currently adheres to it, we are steadily working towards that goal. To evaluate your own code, please use [http://pear.php.net/package/PHP_CodeSniffer/ Code Sniffer].

= File Structure =

Building a proper module in web2project requires a handful of key files in a particular structure.  Each of which serve a specific purpose in the operation of the system.  For a module called "Todos" - ''available from the [http://sourceforge.net/projects/web2project-mod/ web2project Modules]'' - we would have the following file structure (filenames are case sensitive):

{|
! Filename
! align="center"|Status
! Description
! Notes
|-
| /todos/ || required || Module Folder || Base folder of the module
|-
| &nbsp;&nbsp;&nbsp;/setup.php || required || Installation file || Defines the details of the module along with install/uninstall directions
|-
| &nbsp;&nbsp;&nbsp;/todos.class.php || required || Primary Model ||  This handles all the CRUD operations and is the only place where business logic or queries belong
|-
| &nbsp;&nbsp;&nbsp;/index.php || required || Index View || Normally shows a list of any top-level items
|-
| &nbsp;&nbsp;&nbsp;/index.js || optional ||  || Javascript that gets included in the Index layout
|-
| &nbsp;&nbsp;&nbsp;/addedit.php || optional || Add/Edit View || View that provides a form to add or edit the item
|-
| &nbsp;&nbsp;&nbsp;/addedit.js || optional ||  || Javascript that gets included in the Add/Edit layout
|-
| &nbsp;&nbsp;&nbsp;/view.php || optional || Primary View || View that provides a page to view the item
|-
| &nbsp;&nbsp;&nbsp;/view.js || optional ||  || Javascript that gets included in the view layout
|-
| &nbsp;&nbsp;&nbsp;/do_todos_aed.php || optional || Primary Controller || Acts as the Controller/Dispatcher for most of the primary actions
|-
| &nbsp;&nbsp;&nbsp;/companies_tab.view.todolist.php || optional || Subview tab || Provides a embedded tab subview on the Company View page<br /> This {modulename}_tab.view.filename.php convention will work on any module that supports Tabbed Subviews
|}

=== Installation - setup.php ===

This file handles the '''installation''', '''upgrade''', and '''removal''' of the module. Failure to perform the proper actions in the right order will result in a non-functioning module or worse, a module which functions perfectly but no one can see/use due to permissions oddities. Everyone wants to use and appreciate your work, so please follow these standards. Every setup.php file should have two primary pieces:

==== $config array ====

This describes the basic information on the module. After installation, this becomes a row in the modules table.

    $config = array();
    $config['mod_name']        = 'TodoList';          // name of the module
    $config['mod_version']     = '1.1.0';             // the version number
    $config['mod_directory']   = 'todos';             // tells web2project where to find this module
    $config['mod_setup_class'] = 'CSetupTodoList';    // the name of the PHP setup class
    $config['mod_type']        = 'user';              // 'core' for modules included in w2p itself, 'user' for other modules
    $config['mod_ui_name']	   = $config['mod_name']; // the name that is shown in the main menu of the User Interface
    $config['mod_ui_icon']     = '';                  // name of a related icon
    $config['mod_description'] = 'Todo List';         // some description of the module
    $config['mod_config']      = false;               // show 'configure' link in viewmods
    $config['mod_main_class']  = 'CTodo';             // the module class that actually does the work
    $config['permissions_item_table'] = 'todos';      // this is the table the system should check for permissions
    $config['permissions_item_field'] = 'todo_id';    // this is the field used for permissions check, almost always the primary key
    $config['permissions_item_label'] = 'todo_title'; // this is the field used to name the item, the projects table would use project_name

==== Setup Class ====

This class - normally called ''CSetup{ModuleName}'' - is the core of the the installation process. It consists of four public methods and any number of private or protected methods.

===== public method: install() =====

This method should create any and all database tables necessary. If there are System Lookup Values or changes to other tables, those actions should be performed here too. In most modules, this method will end with lines similar to this:

    $perms = $AppUI->acl();
    return $perms->registerModule('Todolist', 'todos');

The two parameters are the name and the path of the module respectively. These lines make sure the module is "permissionable" in the System/User Admin.

===== public method: upgrade() =====

The bulk of this method is a simple switch statement that should accept the current version of the module and apply any and all updates - including database changes, System Lookup Values, etc - that must be applied.

The system itself will handle making this method available. When an Administrator visits ''System Admin -> View Modules'', the system scans the directories within and compares the version specified in the '''$config''' array with the version number for that module currently in the modules table.

    public function upgrade($old_version) {
        switch ($old_version) {
            case '0.5':
            case '0.5.0':
            case '1.0.0':
            case '1.0.1':
                //todo add categories
                $this->addCategories();
            default:
                //do nothing
        }
        return true;
    }

===== public method: remove() =====

This method performs cleanup for the module. If there are tables created, it should drop them. If there are columns added, it should remove them. If there are System Lookup Values inserted, it should delete them. As a last step, it should delete the previously created permissions with lines similar to this:

<pre class="brush:php">
$perms = $AppUI->acl();
return $perms->unregisterModule('todos');
</pre>

where the only parameter is the module directory.

=== Primary Controller ===

The primary controller of a module is actually relatively "dumb" in the sense that we work to practice the ''Fat Model, Skinny Controller'' ([http://gluei.com/blog/view/cakephp-best-practices-fat-models-and-skinny-controllers 1][http://www.mikebernat.com/blog/MVC_-_Fat_Models_and_Skinny_Controllers_ 2][http://weblog.jamisbuck.org/2006/10/18/skinny-controller-fat-model 3]) principle where the Model encapsulates as much of the business logic as possible and the Controller is nearly empty. It allows you to reuse the business logic more easily with less duplication.

==== v2.3 and later ====

As of v2.3 (March 2011), well over half of the Controllers in the core system use a much simpler structure.  At present, this cleanup covers the Companies, Departments, FileFolders (within Files), Forums, and Links Modules. Unfortunately, not all Controllers fall into this model but we'll deal with the more complex cases as we find them. To be clear, there are no Permissions/ACL checks within any of the Controllers. All of those checks should happen within the Model's methods itself. This ensures that as other interfaces for the system are made available, all appropriate permissions are respected without additional effort.

While this may appear to just save some lines of code, the more important aspect is that the Controllers become testable and more flexible. In terms of the Constructor itself, the five parameters are: the '''base object''', the '''delete''', the '''module name''', the '''success path''', and the '''error path'''. The w2p_Controller_Base handles the $_POST processing, calls actual operation (save or delete), and then sets the proper return path. The key concept applied here is called [http://en.wikipedia.org/wiki/Dependency_injection Dependency Injection].

    <?php /* $Id$ $URL$ */
    if (!defined('W2P_BASE_DIR')) {
        die('You should not access this file directly.');
    }

    $delete = (int) w2PgetParam($_POST, 'del', 0);

    $controller = new w2p_Controllers_Base(
                        new CLink(), $delete, 'Links', 'm=links', 'm=links&a=addedit'
                      );

    $AppUI = $controller->process($AppUI, $_POST);
    $AppUI->redirect($controller->resultPath);

'''Warning:''' ''The above documents a feature only available as of v2.3 (March 2011). If you plan to support older web2project versions, do not use this.''

=== Model - Core Module Class ===

This is the code that does the bulk of the work within the module. The naming convention for the file and class is simple and following it gives some simple benefits. For example, for the Todos module, the main class name is CTodo while the filename is todos.class.php. By using this naming convention, the class will automatically be added via the autoloader as necessary without any explicit include/require calls.

Further, most Models will extend the core w2p_Core_BaseObject* class. While this may initially look like a [http://en.wikipedia.org/wiki/God_object God Object], it only consolidates the data access and validation of objects, not all kinds of unrelated aspects. The core class of some Modules don't need this data access directly so they won't extend this object.

*Please Note: As of 2.0, w2p_Core_BaseObject replaces CW2pObject. CW2pObject will be removed in the 4.0 release. All new modules should extend w2p_Core_BaseObject.

One example is the [[Project Importer|Project Importer]] which instead calls the appropriate classes on its own. In that sort of case, the rest of this information on the Model does not apply.

==== public method: __construct() ====

We do not support the PHP4-style method of object constructor where the class name can be used as the constructor. In most cases, a module's constructor will be as simple as this:

    public function __construct()
    {
        parent::__construct('todos', 'todo_id');
    }

The two parameters are the primary table of the module and that table's primary key. Nothing further will be needed normally.

==== public method: check() ====

This public method performs object validation and returns an array listing the errors. Under no circumstances should it change the underlying data. Some modules - like Todos - perform no validation at all while others - like Projects, Links, or Tasks - perform extensive validations. At the time of this writing (July 2010), the Tasks' check() method is a bad example as it does modify the underlying data. Here is a good example from the Links module:

    public function check() {
        // ensure the integrity of some variables
        $errorArray = array();
        $baseErrorMsg = get_class($this) . '::store-check failed - ';

        if ('' == trim($this->link_name)) {
            $errorArray['link_name'] = $baseErrorMsg . 'link name is not set';
        }
        if (7 >= strlen(trim($this->link_url))) {
            $errorArray['link_url'] = $baseErrorMsg . 'link url is not set';
        }
        if (0 == (int) $this->link_owner) {
            $errorArray['link_owner'] = $baseErrorMsg . 'link owner is not set';
        }

        return $errorArray;
    }

==== public method: isValid() ====

This method is not available prior to the v3.0 release.

==== public method: store() ====

This public method calls the check() method to determine the object is valid for saving (create or update) and then checks ACLs for the action requested and attempts to perform it. A portion of this method looks like the below. In the vast majority of cases, no SQL statements will be required in this method, all database interaction is performed by the parent class (w2p_Core_BaseObject).

This is the simplest implementation. It is based on the assumption that storing this item isn't dependent on permissions from another module. This will work for the vast majority of modules.

''While this specific snippet is from the Todos Module, you'll find identical snippets in the Companies, Contacts, Links, and a few other modules.''

    // This snippet should be considered deprecated as of web2project v3.0. The more correct sample is below.
    public function store()
    {
        // other code before this snipped for simplicity
        if ($this->{$this->_tbl_key} && $perms->checkModuleItem($this->_tbl_module, 'edit', $this->{$this->_tbl_key})) {
            if (($msg = parent::store())) {
                $this->_error['store'] = $msg;
            } else {
                $stored = true;
            }
        }
        if (0 == $this->{$this->_tbl_key} && $perms->checkModuleItem($this->_tbl_module, 'add')) {
            if (($msg = parent::store())) {
                $this->_error['store'] = $msg;
            } else {
                $stored = true;
            }
        }

        if ($stored) {
            // if there is any logic based on the success of your store() call, put it here.
        }
        return $stored;
    }

Alternatively, if the store permission is based on the permissions of another module or object, we need a slightly different structure. In this example, permissions to store the FileFolder object are dependent on the Files module.

    // This snippet should be considered deprecated as of web2project v3.0. The more correct sample is below.
    public function store()
    {
        // other code before this snipped for simplicity

        if ($this->{$this->_tbl_key} && $perms->checkModuleItem('files', 'edit', $this->{$this->_tbl_key})) {
            if (($msg = parent::store())) {
                $this->_error['store'] = $msg;
            } else {
                $stored = true;
            }
        }
        if (0 == $this->{$this->_tbl_key} && $perms->checkModuleItem('files', 'add')) {
            if (($msg = parent::store())) {
                $this->_error['store'] = $msg;
            } else {
                $stored = true;
            }
        }

        // other code after this snipped for simplicity
    }

==== public method: delete() ====

The delete method tries to delete stuff. Amazed, right? So am I. Like most of the methods on the class, it performs an ACL check before attempting its action.

This is the simplest implementation. It is based on the assumption that deleting an item within this module isn't dependent on permissions from another module. This will work for the vast majority of modules.

''While this specific snippet is from the Todos Module, you'll find identical snippets in the Companies, Contacts, Links, and a few other modules.''

    // This snippet should be considered deprecated as of web2project v3.0. The more correct sample is below.
    public function delete()
    {
        $perms = $AppUI->acl();

        if ($perms->checkModuleItem($this->_tbl_module, 'delete', $this->{$this->_tbl_key})) {
            if ($msg = parent::delete()) {
                return $msg;
            }
            return true;
        }
        return false;
    }

Alternatively, if the delete permission is based on the permissions of another module or object, we need a slightly different structure. In this example, permissions to delete the FileFolder object are dependent on the Files module.

    // This snippet should be considered deprecated as of web2project v3.0. The more correct sample is below.
    public function delete()
    {
        $perms = $AppUI->acl();

        if ($perms->checkModuleItem('files', 'delete', $this->{$this->_tbl_key})) {
            if ($msg = parent::delete()) {
                return $msg;
            }
            return true;
        }
        return false;
    }

==== public method: load() ====

This public method simply returns the object with only the fields from the corresponding database row populated. It doesn't perform any joins or additional lookups and basically provides a [http://en.wikipedia.org/wiki/Lazy_loading Lazy Loading pattern]. Most of the time a module will simply inherit this method and not override it so this is optional.

==== public method: loadFull() ====

This method fully loads the specific object with all of the fields provided by joins, lookups, etc. Due to the joins and lookups, it will be slower than the simple load() method and should be used sparingly if possible. It is also optional.

==== Other methods ====

There can be any number of additional methods included of any visibility level desired on the core class. Other than the ones specified above, absolutely no others are necessary. Though, we have quite a few pieces of built-in functionality that you can use by implementing some of the [[:Category:Hook System|Hook System]]. For example:

*  If your module needs to be searchable, use the [[Search_Hook]].
*  If your module generates time-based events - like an email reminder - you can use [[Cron_Hook]].
*  If your module should add date-based information to the iCalendar feed, you can use the [[Calendar_Hook]].
*  If your module should perform actions before the system attempts to store an object regardless of whether it's a Create or Update, you can use the [[preStore_Hook]].
*  If your module should perform actions before the object is stored but only on object creation, you can use the [[preCreate_Hook]].
*  If your module should perform actions before the object is stored but only on object update, you can use the [[preUpdate_Hook]].
*  If your module should perform actions after the object is successfully stored regardless of whether it's a Create or Update, you can use the [[postStore_Hook]].
*  If your module should perform actions after the object is successfully stored but only on object creation, you can use the [[postCreate_Hook]].
*  If your module should perform actions after the object is successfully stored but only on object update, you can use the [[postUpdate_Hook]].
*  If your module should perform actions before the system attempts to delete an object, you can use the [[preDelete_Hook]].
*  If your module should perform actions after the object is successfully deleted, you can use the [[postDelete_Hook]].
*  If your module should perform actions before the system attempts to load an object, you can use the [[preLoad_Hook]].
*  If your module should perform actions after the object is successfully loaded, you can use the [[postLoad_Hook]].

=== Views ===

''At present, the Views are a mess. There is way too much business logic embedded in them via PHP and Javascript. In principle, the Views should have no database access (including DBQuery calls), UI components only in Javascript, and semantically clean XTHML and CSS 2.0. We're still working towards these goals and ideas/effort to support this would be appreciated.''

==== index.php ====

This is the basic view of the module and is usually accessed by <pre>./index.php?m={ModuleName}</pre> where the todos module would be <pre>./index.php?m=todos</pre>

Under no circumstances should you add the header, footer, or menu to this pages. The core system generates and includes them automatically.

==== addedit.php ====

==== do_{BaseModule}_aed.php ====

==== view.php ====

==== Intra-Module Subviews (Tabs) ====

From our Todos example above, there are a trio of files - ''companies_tab.view.todolist.php, contacts_tab.view.todolist.php, and projects_tab.view.todolist.php'' - that give us Todos subviews within other modules. The naming convention is the most important part:

<pre>{OtherModule}_tab.view.{BaseModule}.php</pre> where

*  OtherModule - This is the module where the tab should appear. In the above example, this would be companies, contacts, and projects respectively.
*  BaseModule - This is the module itself which should be called from within the other modules.

Assuming these files are named properly, the core web2project engine will automatically add these tabs wherever apply. No further configuration is necessary.

'' '''Notice:''' These tabs are cached whenever a User logs in, therefore after enabling a module that has subviews, any active users will have to log out and log back in to see the new tabs.''

= Testing Strategy =

''We haven't figured out a good testing strategy for Add On modules, if you find one, please let us know.''

= Optional Components =

== Calendar Hook ==

This hook is called by the ''calendar.php'' script to create the [http://en.wikipedia.org/wiki/ICalendar iCalendar] feed for the system. In the Todos module, here are the methods of interest:

    public function hook_calendar($userId) {
        return $this->getOpenTodoItems($userId);
    }
    public function getOpenTodoItems($userId, $days = 30) {
        $q = new DBQuery();
        $q->addQuery('todo_id as id');
        $q->addQuery('todo_title as name');
            $q->addQuery('todo_title as description');
            $q->addQuery('todo_project_id as project_id');
        $q->addQuery("DATE_FORMAT(todo_due, '%Y/%m/%d') as startDate");
        $q->addQuery("DATE_FORMAT(".$q->dbfnDateAdd('todo_due', 1, 'DAY').", '%Y/%m/%d') as endDate");
        $q->addQuery("DATE_FORMAT(todo_updated, '%Y/%m/%d') as updatedDate");
        $q->addTable('todos');
        $q->addWhere("todo_due > now()");
        $q->addWhere("todo_due < DATE_ADD(CURDATE(), INTERVAL $days DAY)");
        $q->addWhere("todo_user_id = $userId");
        $q->addWhere("todo_status = 1");
        $q->addOrder('todo_due');
        return $q->loadList();
    }

This method - and more importantly the hook_calendar method - returns a list of items specifying the following fields:

*  ''id'' - This is a unique id for this type of calendar item and is usually just the primary key from the module's core table. It does not have to be globally unique.
*  ''name'' - This is the name of the calendar item. This is mapped to the iCalendar SUMMARY field.
*  ''description'' - This is a way of describing the calendar item. If there is no equivalent field within the module, it is the easiest to duplicate the ''name'' entry here. This is mapped to the iCalendar DESCRIPTION field.
*  ''project_id'' - If this item maps to a specific Project within web2project, this value can be included. Inclusion of this field will append a link to the Project in the iCalendar DESCRIPTION field and add an ATTACH field with the same link.
*  ''task_id'' - If this item maps to a specific Task within web2project, this value can be included. Inclusion of this field will append a link to the Task in the iCalendar DESCRIPTION field and add an ATTACH field with the same link.
*  ''startDate'' - This becomes the DTSTART within the iCalendar entry.
*  ''endDate'' - This becomes the DTEND within the iCalendar entry.
*  ''updatedDate'' - This becomes the DTSTAMP within the iCalendar entry.

The calendar.php script will automatically call each active module's hook_calendar method without any additional actions from the user.

== Search Hook ==

It is possible to make any portion of any module searchable automatically within web2project. The key to this process is to understand the [[Search Hook]]. By defining a public method called "hook_search" in your module's primary class, you tell the [[SmartSearch|Smart Search]] module how it should search your module. While this can be a complicated search involving numerous joins of supporting data - see the Projects module for an example - it can be quite simple also. To continue our example of a "Todos" module from above, the code could look like:

    public function hook_search() {
        $search['table'] = 'todos';
        $search['table_alias'] = 't';
        $search['table_module'] = 'todos';
        $search['table_key'] = $search['table_alias'].'.todo_id'; // primary key in searched table
        $search['table_link'] = 'index.php?m=todos&todo_id='; // first part of link
        $search['table_title'] = 'Todos';
        $search['table_orderby'] = 'todo_title';
        $search['search_fields'] = array('todo_title');
        $search['display_fields'] = array('todo_title');
        return $search;
    }

While many modules will have a search as simple as above, more complex search patterns are possible. The hook_search for the Contacts Module searches a variety of fields within the contacts table in addition to a field within a joined table.

    public function hook_search() {
        $search['table'] = 'contacts';
        $search['table_alias'] = 'c';
        $search['table_module'] = 'contacts';
        $search['table_key'] = 'c.contact_id';
        $search['table_link'] = 'index.php?m=contacts&a=view&contact_id='; // first part of link
        $search['table_title'] = 'Contacts';
        $search['table_orderby'] = 'contact_last_name,contact_first_name';
        $search['table_groupby'] = 'c.contact_id';
        $search['search_fields'] = array('contact_first_name', 'contact_last_name', 'contact_title', 'contact_company', 'contact_type', 'contact_address1', 'contact_address2', 'contact_city', 'contact_state', 'contact_zip', 'contact_country', 'contact_notes', 'cm.method_value');
        $search['display_fields'] = $search['search_fields'];             // If the search and display fields are identical, you can do this. Otherwise, build out a separate array.
        $search['table_joins'] = array(array('table' => 'contacts_methods', 'alias' => 'cm', 'join' => 'c.contact_id = cm.contact_id'));

        return $search;
    }

Assuming this method exists and includes the proper values, the [[SmartSearch|Smart Search]] module will automatically call this function. No further configuration is necessary.

[[Category:Incomplete]]
[[Category:Module Building Guide]]
[[Category:Proposals]]
