{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/1.20.3/gstreamer-1.20.3.tar.gz
sha:a601988c4739388590efd8a0884988aa3ca358d6434bf129707204193754d729
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

{% block run_data %}
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
