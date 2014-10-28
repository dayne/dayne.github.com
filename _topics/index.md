---
title: Focused Topics (index)
layout: default
---

### Various scraps

<ul class="well lead list-unstyled">
{% for post in site.topics %}
  <li>
    <a href="{{ post.url }}">{{ post.title}}</a>
  </li>
{% endfor %}
</ul>
