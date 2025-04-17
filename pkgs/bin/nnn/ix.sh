{% extends '//die/c/make.sh' %}

{% block pkg_name %}
nnn
{% endblock %}

{% block version %}
5.1
{% endblock %}

{% block fetch %}
https://github.com/jarun/nnn/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:9faaff1e3f5a2fd3ed570a83f6fb3baf0bfc6ebd6a9abac16203d057ac3fffe3
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
