{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
harfbuzz
{% endblock %}

{% block version %}
11.2.0
{% endblock %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:16c0204704f3ebeed057aba100fe7db18d71035505cb10e595ea33d346457fc8
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
