{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/5.3.0.tar.gz
sha:94712b8cdae68f0b585ec8e3cd8c5160fdc241218119572236497a62dae770de
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
