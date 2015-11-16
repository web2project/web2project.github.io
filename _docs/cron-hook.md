---
layout: page
title: Cron Hook

category: hooks
---

**Available Since**: v1.1 (September 2009)

The **hook_cron** method opens a module class to interact with activities which are Schedule-able.
The method has no parameters: CClass::hook_cron() (by comparison to implementations in some of the classes).

At the time of this writing, this is only used to modify update keys in the Contacts module, other modules - including Add Ons - could implement it also.  One suggested area for use is the Event Queue and email reminders which are still implemented the old ways.

To enable this (and older Event Queue) within your system, set up a "cronjob" (on Linux, Unix, or OS X) or "Scheduled Task" (in Windows) to perform the following:

    wget -O - -q http://{web2project installation}/queuescanner.php

## Example

One such example of programmatically calling each of the active hooks within the system can be found in ./queuescanner.php (the code below is based on r420):

    $AppUI = new CAppUI;
    $AppUI->setUserLocale();
    $moduleList = $AppUI->getLoadableModuleList();
    foreach ($moduleList as $module) {
        include_once ($AppUI->getModuleClass($module['mod_directory']));
        $object = new $module['mod_main_class']();
        if (method_exists($object, 'hook_cron')) {
            $object->hook_cron();
        }
    }

As of web2project v3.0, the Hook System is even easier. Here is the same example from the [queuescanner.php](https://github.com/web2project/web2project/blob/master/queuescanner.php#L24):

    $hooks = new w2p_Core_HookHandler($AppUI);
    $hooks->process('cron');

To be specific, this code gets a list of all active modules in the system and loops over them.  During the loop, this attempts to instantiate an object of that class and checks the object for the 'hook_cron' method.  If the method exists, the system calls it.  In this particular example, the results of calling the hook are not processed in any way.  For sanity's sake, a hook should return FALSE if an error occurred and TRUE or the result if the method executed successfully.

The primary benefit of this implementation is that as additional modules (Core or Add On) are added to the system and activated, there's no further registration or configuration process.  If the class implements the requested hook, it's automatically added for process.  If the class does not implement the hook, it is skipped as expected.

While there may be other drawbacks, the primary is the memory footprint required.  If the underlying classes or methods are large or complex, it's possible that PHP's memory footprint could become quite large.

----

## Step by step example of setting a Task scheduler job in WINDOWS environment:

* go to http://users.ugent.be/~bpuype/wget/ and download wget 1.11.4 from that link; you can download wget from other sources too;
* copy wget.exe inside the /WINDOWS folder;
* go to Control Panel / Scheduled Tasks
* click Add Scheduled Task
* on this interface for program selection choose Browse ....and point to /Windows/wget.exe
* On the 2nd interface let the name "wget" or choose your own; select option: Daily
* 3rd interface: Set hour - most likely in the morning (8:00 for example);
    Perform this task: Every day;
    Start date: you may leave the current date or go for a previous one;
* 4th interface: User: Administrator account of the server/PC and insert appropriate password;
* 5th interface: Open advanced properties .....and click Finish;
    Don't worry if you missed this step; you can always go to Control Panel/Scheduled Tasks select the task you named "wget" or whatever was the name, right click on it and select properties;
* On the Properties interface, first window, RUN line must be:
    C://WINDOWS/wget.exe wget -O - -q http://<web2project_installation_folder>/queuescanner.php
* Click Apply; you insert the password again for the Administrator account; click OK


After that, you should start receiving e-mails for the tasks which have the due/overdue date equal with the date you setup on step "g" - the 3rd interface of setting up a scheduled Task;

**Note:** in order for the reminders to properly work, there are also some settings to be performed;

**On System Admin / System Configuration**, settings are:

Tasks Section (last one) / Send Task Reminders: check box ON

/ Number of days warning for due tasks: must be set to at least 1

/ Maximum number of reminders to send: 100 (just an example);

**Note:** please take note as this last setting may conflict at your server with your maximum number of emails allowed to be sent daily from one account; if you have many users/notifications you may want to check this with your server administrator)

**On System Admin / Default User Preferences**, settings are:

/ Task Notification Method: Do not include task/event owner

/ Email Assignees: check box ON

**Note:** if you decide to include task/event owner on the notification you will receive the same Reminder twice, as you will be the task owner but also (by default) the assignee of the task; this option may work if you are only used to set tasks for other users without being an assignee on that tasks;

**Note:** Of course, the reminders and all messages are working if you previously set a proper e-mail account on your e-mail server; proper settings must be filled on **System Admin / System Configuration / Email Settings** section;