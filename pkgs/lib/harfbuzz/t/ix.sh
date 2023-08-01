{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/8.1.0.tar.gz
sha:8d544f1b74797b7b4d88f586e3b9202528b3e8c17968d28b7cdde02041bff5a0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% if darwin %}
lib/darwin/framework/CoreText
lib/darwin/framework/ApplicationServices
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/glib
bin/ragel/6
{% endblock %}

{% block meson_flags %}
{% if darwin %}
coretext=enabled
{% endif %}
glib=enabled
gobject=enabled
tests=disabled
docs=disabled
{% endblock %}
