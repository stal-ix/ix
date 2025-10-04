{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
harfbuzz
{% endblock %}

{% block version %}
12.1.0
{% endblock %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/{{self.version().strip()}}.tar.gz
0238bf7ada6b1fb92984f69f8b9cd66518af83cf24f7db1cfe60c772c42312d3
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
