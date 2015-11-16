---
layout: page
title: Primary Controller
---

*Everything included here applies to web2project v2.3 and above.*

The primary controller of a module is actually relatively "dumb" in the sense that we work to practice the *Fat Model, Skinny Controller* [1](http://gluei.com/blog/view/cakephp-best-practices-fat-models-and-skinny-controllers),[2](http://www.mikebernat.com/blog/MVC_-_Fat_Models_and_Skinny_Controllers_),[3](http://weblog.jamisbuck.org/2006/10/18/skinny-controller-fat-model) principle where the Model encapsulates as much of the business logic as possible and the Controller is nearly empty. It allows you to reuse the business logic more easily with less duplication.

Most of the Controllers in the core system use a very simple structure. At present, this cleanup covers the Companies, Departments, FileFolders (within Files), Forums, and Links Modules. Unfortunately, not all Controllers fall into this model but we'll deal with the more complex cases as we find them. To be clear, there are no Permissions/ACL checks within any of the Controllers. All of those checks should happen within the Model's methods itself. This ensures that as other interfaces for the system are made available, all appropriate permissions are automatically respected without further effort on your part.

While this may appear to just save some lines of code, the more important aspect is that the Controllers become testable and more flexible. In terms of the Constructor itself, the five parameters are: the **base object**, the **delete**, the **module name**, the **success path**, and the **error path**. The w2p_Controller_Base handles the $_POST processing, calls actual operation (save or delete), and then sets the proper return path. The key concept applied here is called [Dependency Injection](http://en.wikipedia.org/wiki/Dependency_injection).

<pre class="brush:php">

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

</pre>

**Warning:** *The above documents a feature only available as of v2.3 (March 2011). If you plan to support older web2project versions, do not use this.*