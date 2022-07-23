{% extends '//die/c/meson.sh' %}

{% block fetch %}
#https://github.com/harfbuzz/harfbuzz/archive/refs/tags/4.4.1.tar.gz
#sha:1a95b091a40546a211b6f38a65ccd0950fa5be38d95c77b5c4fa245130b418e1
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/5.0.0.tar.gz
sha:ae8efd0be526ab375645c6a2e2134bcf3356d038cd9cfb7ca637b13b0f635e9c
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
