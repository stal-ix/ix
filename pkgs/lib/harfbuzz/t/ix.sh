{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
harfbuzz
{% endblock %}

{% block version %}
12.3.2
{% endblock %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/{{self.version().strip()}}.tar.gz
3ca6621821e19266710ec1a0cb6146fdc832a75828f7c55fea5502c2a810c3c8
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
