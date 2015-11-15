---
layout: default
title: Proposals
---

This is a list of hooks available within the web2project system.  Each of these hooks is defined as a public method on the specific class.  Therefore, it can be called by any code within the system which can instantiate the class.

### Available Hooks

Available Since: v1.1 (September 2009) - Calendar Hook, Cron Hook, Search Hook

Available Since: v3.0 (September 2013) - Pre-Store Hook, Post-Store Hook, Pre-Create Hook, Post-Create Hook, Pre-Update Hook, Post-Update Hook, Pre-Load Hook, Post-Load Hook, Pre-Delete Hook, Post-Delete Hook.

{% assign items = site.docs | where:"category","hooks" %}
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