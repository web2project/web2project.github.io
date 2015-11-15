---
layout: default
title: Incomplete Pages
---

{% assign items = site.docs | where:"category","incomplete" %}
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