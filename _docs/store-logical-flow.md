---
layout: page
title: Store, logical flow

category: "module building guide"
---

As of v3.0, as long as you've followed our conventions in your module configuration, you probably don't need to write your own store() method. Calling store() on any object that extends ``w2p_Core_BaseObject`` will automatically trigger this flow;

*  When an object is ready to be stored, it simply has the store() method called.
*  If the object doesn't have its own store(), it defaults to the w2p_Core_BaseObject method:
  * First, all previous errors are cleared via clearErrors().
  * Next, a ``preStoreEvent`` notification is published which triggers any hook_preStore() methods for that object are called. This is where you can set default values, apply business rules, or send other notifications. Any return values from hook_preStore() are ignored.
  * Next, the isValid() method is called. This is where you can perform data validation specific to the object. For example, it will make sure all Projects have Owners, that Link Urls actually have value, and new Users have unique Usernames.
    * Under no circumstances should isValid() modify data in or outside the object.
    * If isValid() returns true, processing continues.
    * If isValid() returns false, the store() immediately returns false. To inspect the reason(s) for failure, calling getError() on the object returns an array listing each error.
  * Next, a ``preCreateEvent`` or ``preUpdateEvent`` notification is published depending on whether the object is being created or updated in the database. These events trigger hook_preCreate() or hook_preUpdate() respectively. These are allowed to modify the object to set fields such as date created, date updated, etc.
  * Next, the processing checks if the object already has an id - like link_id on a CLink object - and the user has canEdit permission on that object. The default canEdit() method (on w2p_Core_BaseObject) will perform the standard permissions check. If necessary, you can create a custom canEdit() method in your module. This allows circumstances such as allowing a User to always edit themselves even if they don't have permission to manage users.
    * If the object has both an id and the canEdit() method returns true, the system attempts to update the object.
  * Next, the processing checks if the id is 0 and the user has canCreate permission for that module. The default canCreate() method (on w2p_Core_BaseObject) will perform the standard permissions check. If necessary, you can create a custom canCreate method in your module.
  * Next, if the update or create was successful, a ``postCreateEvent`` or ``postUpdateEvent`` notification is published depending on which occurred. These events trigger hook_postCreate() or hook_postUpdate() respectively. This is where you should trigger email notifications, cache updates, or eventually workflow rules. Then a ``postStoreEvent`` notification is published regardless of which one occurred.
    * If you have the History module enabled for audit logging each of these post hooks will generate a log entry.
  * Finally a true is returned if an update or create was successful or a false if neither.

**Note:** *If there are any errors anywhere in this process, store() returns a boolean FALSE and you can inspect the errors by calling getError() on the object.*

While this seems incredibly complicated, it is all handled behind the scenes for you automagically by simply calling store() on your object.

*  In the vast majority of cases, you will only have to write an isValid() method for your module.
*  In some cases, you will need your own hooks into preStore, preCreate, preUpdate, postCreate, postUpdate, or postStore.
*  In rare circumstances when you have module-specific permission requirements, you may also need custom canCreate(), canEdit() methods.
*  Only in *very* exceptional cases will you still have to write your own store() method. Within core web2project, this is required in exactly one place in the CSystem_SysVal class (./modules/system/sysvals.class.php).