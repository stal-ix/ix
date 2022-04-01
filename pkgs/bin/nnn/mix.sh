{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/jarun/nnn/archive/refs/tags/v4.3.tar.gz
8263efb03dc28e02f32ddaa0e07ddaf1
{% endblock %}

{% block bld_libs %}
lib/c
{% if linux %}
lib/fts
{% endif %}
lib/curses
lib/readline
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
