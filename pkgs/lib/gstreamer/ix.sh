{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/1.20.5/gstreamer-1.20.5.tar.gz
sha:6214d7c6a7acfac03f202d9e0af8b0083cc27c025b71e187f0e3d84f49f8aed6
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
lib/kernel
{% endblock %}

{% block use_data %}
aux/iso-codes
{% endblock %}

{% block bld_tool %}
bin/orc
bld/flex
bld/bison
bld/gettext
bld/glib
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
for x in ${out}/lib/pkgconfig/*.pc; do
    sed -e 's|toolsdir=.*||' -i ${x}
done
{% endblock %}
