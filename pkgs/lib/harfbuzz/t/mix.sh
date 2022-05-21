{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/4.3.0.tar.gz
sha:32184860ddc0b264ff95010e1c64e596bd746fe4c2e34014a1185340cdddeba6
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
