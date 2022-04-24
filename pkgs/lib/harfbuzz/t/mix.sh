{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/4.2.1.tar.gz
sha:99fcd30e2f4c66d05af3d61ad4cdba2abc2a51ecabb7eb6dc222520a892b50b0
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
