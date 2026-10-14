{# iconker's renderer on lib/svg: render_icon IN.svg OUT.png draws the
   icon fitted into 192 by 192 pixels #}

{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/png
lib/svg
{% endblock %}

{% block name %}
render_icon
{% endblock %}

{% block sources %}
render.c
{% endblock %}
