---
layout: page
title: Security Nonce
---

A Nonce is used in web forms to prevent "[http://en.wikipedia.org/wiki/Replay_attack replay attacks]" or "[http://en.wikipedia.org/wiki/Cross-site_request_forgery Cross Site Request Forgery]" where an attacker can submit the same form information repeatedly. To prevent this, we generate a one-time use token that gets embedded into the form and validated upon submission. In our case, you can add this to your forms with minimal effort such as this:

    $form = new w2p_Output_HTML_FormHelper($AppUI);
    ?>
    <form name="editFrm" action="?m=<?php echo $m; ?>" method="post" accept-charset="utf-8" class="addedit links">
         <?php echo $form->addNonce(); ?>
         <!-- insert the rest of the form -->
    </form>

This inserts a hidden input with a token generated from a timestamp and the user's system preferences.

The validation itself is handled via the w2p_Controllers_Base class. As long as you follow our common pattern for the do_module_aed processing, you shouldn't have to do anything else.
