---
layout: default
title: Add On Modules
---

This is a list of the most common Add On Modules for web2project.  Although this list is kept relatively up to date, it should not be considered complete or definitive as new modules and customizations become available regularly.  If you find modules of interest, please inform us and/or add the relevant information to this wiki.

As a general rule, anything "available from SVN" should be considered '''experimental''' or '''beta''' at best.

Also, anything that is available for '''Release''' can be downloaded from [http://sourceforge.net/projects/web2project-mod/files/ SourceForge Files] section.

''SVN (or Subversion, same thing) is our primary Version Control System and keeps track of who made what changes when and why. If you're not a developer, we recommend that you stay with formal Releases.''

== Installing Add On Modules ==

To install add-on modules you need to place the source code under the /modules folder and then go to System Admin., Modules and install them, activate and show.


{% assign items = site.modules | where:"category","addon-module" %}
{% assign spliton = items | size | divided_by:2 %}

<div style="float: right; width: 47%;">
    <ul>
        {% for item in items offset: spliton %}
        <li><a href="{{ item.url }}">{{ item.title }}</a></li>
        {% endfor %}
    </ul>
</div>

<div style="float: left; width: 47%;">
    <ul>
        {% for item in items limit: spliton %}
        <li><a href="{{ item.url }}">{{ item.title }}</a></li>
        {% endfor %}
    </ul>
</div>