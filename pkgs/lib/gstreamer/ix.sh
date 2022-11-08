{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/1.20.4/gstreamer-1.20.4.tar.gz
sha:708da129ea27602410262a5a6a6dd91d1d333e68bcc5f10265209c4f11dbc697
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/orc
lib/drm
lib/glib
lib/udev/g
lib/opengl
lib/wayland
lib/graphene
lib/json/glib
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block use_data %}
aux/iso-codes
{% endblock %}

{% block bld_tool %}
bin/orc
bld/flex
bld/bison
bld/gettext
bld/glib/codegen
bld/wayland
{% endblock %}

{% block patch %}
sed -e 's|.get_shared_lib()||' -i meson.build
{% endblock %}

{% block meson_flags %}
bad=disabled
ges=disabled
base=enabled
good=enabled
gst-plugins-good:soup=disabled
ugly=disabled
devtools=disabled
rtsp_server=disabled
{% endblock %}

{% block install %}
{{super()}}
cp -R ${out}/lib/gstreamer*/* ${out}/lib/
cp -R ${out}/lib/include/* ${out}/include/gstreamer*/
rm -rf ${out}/lib/gstreamer* ${out}/lib/include
mv ${out}/include/g*/* ${out}/include/
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): fixme'
{% endblock %}
