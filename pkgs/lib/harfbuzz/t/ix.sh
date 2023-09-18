{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/8.2.1.tar.gz
sha:f4f4e4173578fd91ca9ef107ca74640a2b7b9420fd11cebe764a86438561134a
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

{% block install %}
{{super()}}
rm -rf ${out}/lib/cmake
{#
ninja: error: '.../libharfbuzz.so.0.60810.0', needed by 'lib/libQt6UiTools.a', missing and no known rule to make it
CalledProcessError: Command '['sh', '-s']' returned non-zero exit status 1.
#}
{% endblock %}
