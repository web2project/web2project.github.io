---
layout: page
title: Views, logical flow
---

=== Views ===

''At present, the Views are a mess. There is way too much business logic embedded in them via PHP and Javascript. In principle, the Views should have no database access (including DBQuery calls), UI components only in Javascript, and semantically clean XTHML and CSS 2.0. We're still working towards these goals and ideas/effort to support this would be appreciated.''

Under no circumstances should you add the header, footer, or menu to this pages. The core system generates and includes them automatically.

==== index.php ====

This is the basic view of the module. It is usually accessed by <pre>./index.php?m={ModuleName}</pre> where the todos module would be <pre>./index.php?m=todos</pre>

----

==== addedit.php ====

This is the page which provides an HTML form to create or edit items. It is usually accessed by <pre>./index.php?m={ModuleName}&a=addedit</pre> where the Projects module would be <pre>./index.php?m=projects&a=addedit</pre> OR <pre>./index.php?m=projects&a=addedit&project_id={n}</pre>

----

==== do_{BaseModule}_aed.php ====

This is the controller which handles processing the data submitted from the addedit.php form. It is rare that you'd see it directly, but is in the forms themselves:

    <form name="uploadFrm" action="?m=links" method="post" accept-charset="utf-8">
        <input type="hidden" name="dosql" value="do_link_aed" />
        <input type="hidden" name="del" value="0" />
        <input type="hidden" name="link_id" value="<?php echo $link_id; ?>" />
        <input type="hidden" name="link_owner" value="<?php echo $AppUI->user_id; ?>" />

==== view.php ====

This is the page which provides a page to items. It is usually accessed by <pre>./index.php?m={ModuleName}&a=view&{ModuleName}_id={n}</pre> where the Companies module would be <pre>./index.php?m=companies&a=view&company_id={n}</pre>

[[Category:Module Building Guide]]