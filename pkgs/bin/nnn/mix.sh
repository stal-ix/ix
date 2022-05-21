{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/jarun/nnn/archive/refs/tags/v4.5.tar.gz
sha:fadc15bd6d4400c06e5ccc47845b42e60774f368570e475bd882767ee18749aa
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
