---
layout: page
title: Core Class
---

=== Model - Core Module Class ===

This is the code that does the bulk of the work within the module. The naming convention for the file and class is simple and following it gives some simple benefits. For example, for the Todos module, the main class name is CTodo while the filename is todos.class.php. By using this naming convention, the class will automatically be added via the autoloader as necessary without any explicit include/require calls.

Further, most Models will extend the core '''w2p_Core_BaseObject''' class. While this may initially look like a [http://en.wikipedia.org/wiki/God_object God Object], it only consolidates the data access and validation of objects, not all kinds of unrelated aspects. The core class of some Modules don't need this data access directly so they won't extend this object.

One example is the [[Project Importer|Project Importer]] which instead calls the appropriate classes on its own. In that sort of case, the rest of this information on the Model does not apply.

==== public method: __construct() ====

Return Type: Null

We do not support the PHP4-style method of object constructor where the class name can be used as the constructor. In most cases, a module's constructor will be as simple as this:

    public function __construct()
    {
        parent::__construct('todos', 'todo_id');
    }

The two parameters are the primary table of the module and that table's primary key. Nothing further will be needed normally.

==== public method: check() ====

Return Type: Array

As of v3.0, this method is deprecated in favor of using isValid() instead. Fundamentally they do much the same thing but isValid() is called automatically by the w2p_Core_BaseObject and will return a boolean. If the value is true, then the object is valid and can be saved. If the value is false (aka invalid), you can use getErrors() to inspect the cause(s).

==== public method: isValid() ====

Return Type: Boolean

This public method performs object validation and returns a boolean denoting if the object is valid (true) or not (false). It is called automatically by the w2p_Core_BaseObject's store() method, so you never have to explicitly call it yourself. Below is an example from the CLinks class (found in [https://github.com/caseysoftware/web2project/blob/master/modules/links/links.class.php#L87 ./modules/links/links.class.php]):

''Note: The w2p_Core_BaseObject provides a default isValid() method which always return true. If you don't need specific validations, you don't need to add your own.''

    public function isValid()
    {
        $baseErrorMsg = get_class($this) . '::store-check failed - ';

        if ('' == trim($this->link_name)) {
            $this->_error['link_name'] = $baseErrorMsg . 'link name is not set';
        }
        if (7 >= strlen(trim($this->link_url))) {
            $this->_error['link_url'] = $baseErrorMsg . 'link url is not set';
        }
        if (0 == (int) $this->link_owner) {
            $this->_error['link_owner'] = $baseErrorMsg . 'link owner is not set';
        }

        return (count($this->_error)) ? false : true;
    }

If you need the resulting validation errors, you can get the error array with the following code:

    $errorArray = $item->getError();

==== public method: load() ====

Return Type: Boolean

''Note: Before the item is actually loaded, the system does a canView() check to make sure the user can view the item. If the check fails, this method returns false without attempting to load the item.''

This public method simply returns the object with only the fields from the corresponding database row populated. It doesn't perform any joins or additional lookups and basically provides a [http://en.wikipedia.org/wiki/Lazy_loading Lazy Loading pattern]. Most of the time a module will simply inherit this method and not override it so this is optional.

==== public method: loadFull() - deprecated ====

<s>This method fully loads the specific object with all of the fields provided by joins, lookups, etc. Due to the joins and lookups, it will be slower than the simple load() method and should be used sparingly if possible. It is also optional.</s> - deprecated


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

[[Category:Module Building Guide]]
