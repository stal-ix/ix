{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
harfbuzz
{% endblock %}

{% block version %}
11.5.0
{% endblock %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/{{self.version().strip()}}.tar.gz
119778e3a692806e45104b2cdfda807a8df2ccf5421c50a016aa4b7b82260205
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
