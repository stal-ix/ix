{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/harfbuzz/harfbuzz/archive/refs/tags/8.2.0.tar.gz
sha:ca9d6c49b0eb100d343a984abeb3aa332443df48aa2ae0f2c78cf2e72c01ef78
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
