---
layout: page
title: Turn on Debugging
---

== Debugging Web2project ==

Debugging in Web2project always seems more complicated than it is. That's because by default, we hide most of the error messages from regular users. After all, they don't know what the messages mean and phrases like "FATAL ERROR!! YOU'RE GOING TO DIE! RAR!" tend to make them nervous. That said, it's trivially easy to turn on debugging.

Within your web2project installation, open base.php and find this line (it should be in the first 10 lines):

    ini_set('display_errors', 0);

and change it to this:

    ini_set('display_errors', 1);

After that, navigate back to where you've had the problem. You should get an error message. It's not usually descriptive to non-developers but if you attach it to your bug report or forum post, it usually means something to us.

To turn off debugging, set display_errors back to zero:

    ini_set('display_errors', 0);

[[Category:Code Reviews]]
