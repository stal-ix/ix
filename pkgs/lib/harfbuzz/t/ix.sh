{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/4.4.0.tar.gz
sha:ba3559de7c7bda51f830f0b5c65d72298bbf35a14d9bb0043b05bb6f7c8b4fd8
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
bin/ragel/6
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
{% if darwin %}
coretext=enabled
{% endif %}
glib=enabled
gobject=enabled
tests=disabled
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib/cmake
{% endblock %}
