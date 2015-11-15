---
layout: default
title: Code Reviews
---

These are the notes from various Code Reviews performed by various members of the PHP community. Although all feedback is collected and considered, not all become tasks on our todo list. More obviously, not all tasks are of equal priority. Regardless, all feedback is appreciated and considered on its own merits.

{% assign items = site.docs | where:"category","code-review" %}
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