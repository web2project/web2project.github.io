---
layout: page
title: Workflow Hooks

category: hooks
---

**Available Since**: v3.0 (September 2013)

## Explanation

Immediately before or after performing an action, you may want to accomplish something else. This can be as simple as logging that an object was changed or sending an email notification or applying complex business validations or modifications.

**Note:** *When you implement one of these in your module, it *must* call the parent method of the same name.*

**Note:** *The permissions check for viewing or modifying an object are not performed until after the corresponding hook_pre method is complete. Therefore, you should never modify the database, send notifications, or display potentially sensitive information in those methods.*


Hook Name  | Common Uses | Description
----- |:-----:| -----
hook_preDelete  | capture id's for post delete cleanup           | Executed before the ``delete()`` method is called.
hook_postDelete | remove child relationships                     | Executed if the ``delete()`` method executed successfully.
hook_preLoad    | ??                                             | Executed before the ``load()`` method is called.
hook_postLoad   | load child objects                             | Executed if the ``load()`` method executed successfully.
hook_preStore   | set ownership, filter data                     | Executed before the ``store()`` method is called.
hook_postStore  | send email notifications, update child objects | Executed if the ``store()`` method executed successfully.
hook_preCreate  | set date created & updated fields              | Executed before the ``store()`` method is called.
hook_postCreate | set or modify additional fields                | Executed if the ``store()`` method executed successfully and a new object was created. This occurs immediately before the ``hook_postStore``.
hook_preUpdate  | set date updated                               | Executed before the ``store()`` method is called.
hook_postUpdate | set or modify additional fields                | Executed if the ``store()`` method executed successfully and an existing object was modified. This occurs immediately before the ``hook_postStore``.



{% include section-hooks.md %}