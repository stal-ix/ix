{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
harfbuzz
{% endblock %}

{% block version %}
11.3.3
{% endblock %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/{{self.version().strip()}}.tar.gz
5563e1eeea7399c37dc7f0f92a89bbc79d8741bbdd134d22d2885ddb95944314
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib
bld/python
bin/ragel/6
{% endblock %}

{% block meson_flags %}
glib=enabled
gobject=enabled
tests=disabled
docs=disabled
{% endblock %}
