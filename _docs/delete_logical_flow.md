---
layout: page
title: Delete, logical flow
---

==== public method: delete() ====

As of v3.0, as long as you've followed our conventions in your module configuration, you probably don't need to write your own delete() method. Calling delete() on any object that extends w2p_Core_BaseObject will automatically trigger this flow;

#  When an object is ready to be deleted, you simply call the delete() method.
#  If the object doesn't have its own delete(), it defaults to the w2p_Core_BaseObject method:
##  First, all previous errors are cleared via clearErrors().
##  Next, a ''preDeleteEvent'' notification is published which triggers any hook_preDelete() methods for that object are called. Any return values from hook_preDelete() are ignored.
##  Next, the canDelete() method is called. This is where you can perform data integrity '''and''' permissions checks specific to the object. For example, if there are any Projects attached to a Company, you will not be allowed to delete that Company. If necessary, you can create a custom canDelete() method in your module. This allows circumstances such as only deleting Projects when they're in a certain status.
###  If canDelete() returns true, processing continues.
###  If canDelete() returns false, the delete() immediately returns false. To inspect the reason(s) for failure, calling getErrors() on the object returns an array listing each error.
##  Next, it attempts to delete the object specified.
##  Next, if the delete was successful, the system publishes a ''postDeleteEvent'' notification. This is where you could trigger email notifications, cache updates, or eventually workflow rules.
###  If you have the History module enabled for audit logging, this will generate a log entry.
##  Finally a true is returned if the delete was successful or a false otherwise.

''If there are any errors anywhere in this process, delete() returns a boolean FALSE and you can inspect the errors by calling getError() on the object.''

While this seems incredibly complicated, it is all handled behind the scenes for you automagically by simply calling delete() on your object.

*  In the vast majority of cases, you will not need to write your own delete() method at all.
*  In some cases, you will need your own hooks into preDelete or postDelete.
*  In rare circumstances when you have module-specific permission requirements, you may also need a custom canDelete() method.
*  Only in '''very''' exceptional cases will you still have to write your own delete() method. Within core web2project, this is required in a few places such as in the CSystem_SysVal class (./modules/system/sysvals.class.php).

[[Category:Module Building Guide]]
