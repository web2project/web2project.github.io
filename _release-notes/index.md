---
layout: page
title: Release Notes
---

{% assign items = site.release-notes %}

<header class="post-header">
    <h1 class="post-title">{{ page.title }} ({{ items | size }})</h1>
</header>

<ul>
    {% for item in items %}
    <li><a href="{{ item.url }}">{{ item.title }}</a></li>
    {% endfor %}
</ul>