---
layout: default
---

<nav id='sidebar'>
	{% include nav.html %}
</nav>

<section id='content'>
    {% for post in site.posts %}
      <article class='{{ post.type }}'>
        <a name='{{ post.url }}' href='#{{ post.url }}'><h2>{% if post.type %}<code><b>{{ post.type }}</b> {{ post.path }}</code> {% endif %}{{ post.title }}</h2></a>
        <section class='body'>
          {{ post.content }}
        </section>
      </article>
    {% endfor %}

    {% assign items = site.pages %}
    {% assign spliton = items | size | divided_by:2 %}

    <article class="post-content" style="float: right; width: 47%;">
        <ul>
            {% for item in items offset: spliton %}
            <li><a href="{{ item.url }}">{{ item.title }}</a></li>
            {% endfor %}
        </ul>
    </article>

    <article class="post-content"  style="float: left; width: 47%;">
        <ul>
            {% for item in items limit: spliton %}
            <li><a href="{{ item.url }}">{{ item.title }}</a></li>
            {% endfor %}
        </ul>
    </article>
</section>
