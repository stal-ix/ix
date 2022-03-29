{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/4.1.0.tar.gz
sha:0dad9332aa017d216981382cc07a9cf115740990c83b81ce3ea71ad88026d7f1
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
lib/freetype
{% if darwin %}
lib/darwin/framework/CoreText
lib/darwin/framework/ApplicationServices
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/ragel/6
bin/glib/codegen
{% endblock %}

{% block meson_flags %}
{% if darwin %}
coretext=enabled
{% endif %}
glib=enabled
gobject=enabled
tests=disabled
{% endblock %}
