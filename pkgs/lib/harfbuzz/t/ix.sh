{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/10.0.1.tar.gz
sha:e7358ea86fe10fb9261931af6f010d4358dac64f7074420ca9bc94aae2bdd542
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
