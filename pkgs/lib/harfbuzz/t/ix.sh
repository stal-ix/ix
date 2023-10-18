{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/8.2.2.tar.gz
sha:0546aac7b2493b3681047914550860157f8799fc80bf5cb528927a9643d6ab3d
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
