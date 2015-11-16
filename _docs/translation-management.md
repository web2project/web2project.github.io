---
layout: page
title: Translation Management
---

So you want to create your own Translation. The good news is that it's easy. Just follow these instructions to get started:

* Go to your web2project installation and locate the **locales** folder.
* Copy the **/path/to/web2project/locales/en** folder and it's contents to, e.g. **/path/to/web2project/locales/sr**
  * In this example, we're translating from English - en, to Serbian - sr, so where ever you see **sr** you should change that to the short code of the language you're translating to.
  * Specific dialects of a language should be noted. For example, Portuguese is **pt** while Brazilian Portuguese is **pt_br**.
* Change recursively the permissions starting from the **locales** folder.
  * If you're doing this on a Unix like system this can come in handy:
    * The first one sets the permissions correctly on folders:

        <code>user@machine$ find /path/to/web2project/locales -type d -exec chmod 777 {} \;</code>

    * And the second one on files:

        <code>user@machine$ find /path/to/web2project/locales -type f -exec chmod 666 {} \;</code>

  * If you're on a Windows system, you have to make the directories/files writable to the web user.
* Open up in your favourite editor the **/path/to/web2project/locales/sr/lang.php** file and edit it according to the instructions in that file. When you're done, save and close.
* Login to your web2project installation, go to *System Admin* and then to *Translation Management*
* On the right side you should see 2 select boxes, the first for the part of the system you're translating, the second for the language.
* Choose the part of the system you want to translate and the new language you are translating to.
* Translate, hit submit. That's about it.
* We'd appreciate if you'd contribute your translation to web2project. If you want to do so, create a .zip or a .tar.gz package of the **/path/to/web2project/locales/sr** folder, head over to http://bugs.web2project.net/ create a feature request and attach the package. Thank you! :)

If you have questions/comments check out [our forums](http://support.web2project.net/).