---
layout: page
title: Setup.php

category: "module building guide"
status: cleanup
---

''Everything included here applies to web2project v3.0 and above.''

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

This class - normally called ''CSetup{ModuleName}''* - is the core of the the installation process. It usually has up to four public methods and any number of private or protected methods.

''* You can name this class anything you want assuming: a) it is a unique name within web2project and b) you specify the name in the config array specified above.''

===== public method: install() =====

This method should create any and all database tables necessary. If there are System Lookup Values or changes to other tables, those actions should be performed here too. Your last step should always be to call the parent method with this line:

    return parent::install();

If you don't need an install method, don't write one. The system will automatically run the parent method on its own.

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
    }

''If you don't need an upgrade method, don't write one.''

===== public method: remove() =====

This method performs cleanup for the module. If there are tables created, it should drop them. If there are columns added, it should remove them. If there are System Lookup Values inserted, it should delete them. Your last step should always be to call the parent method with this line:

    return parent::remove();

If you don't need a remove method, don't write one. The system will automatically run the parent method on its own.