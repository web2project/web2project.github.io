---
layout: default
title: Add On Modules
---

This is a list of the most common Add On Modules for web2project.  Although this list is kept relatively up to date, it should not be considered complete or definitive as new modules and customizations become available regularly.  If you find modules of interest, please inform us and/or add the relevant information to this wiki.

Anything that is available for '''Release''' can be downloaded from [Github](https://github.com/web2project).

### Installing Add On Modules

To install add-on modules you need to place the source code under the /modules folder and then go to System Admin -> Modules and install them, activate and show.

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