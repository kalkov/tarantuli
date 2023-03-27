---
layout: single
title:  "Налични тарантули"
date:   2023-03-07 14:49:06 +0200
categories: jekyll update
---

<table>
  {% for row in site.data.Available_tarantulas %}
    {% if forloop.first %}
    <tr>
      {% for pair in row %}
        <th>{{ pair[0] }}</th>
      {% endfor %}
      <th>информация</th>
    </tr>
    {% endif %}

    <tr>
      <td> {{ row['вид'] }} </td>
      <td> {{ row['размер'] }} </td>
      <td> {{ row['статус'] }} </td>
      <td> {{ row['цена лв/бр'] }} </td>
      <td><a href="https://www.google.com/search?q={{ row['вид'] }}" target="_blank">Google</a></td>
    </tr>
  {% endfor %}
</table>