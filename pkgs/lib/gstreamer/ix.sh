{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/1.22.9/gstreamer-1.22.9.tar.gz
sha:68782dc3e0c1ab5963a53e7199084c982bb0bd1d297164c4c660117fa1b27f64
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/orc
lib/drm
lib/glib
lib/opengl
lib/udev/g
lib/wayland
lib/graphene
lib/json/glib
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block use_data %}
aux/iso/codes
{% endblock %}

{% block bld_tool %}
bin/orc
bld/flex
bld/bison
bld/gettext
bld/glib
bld/wayland
{% endblock %}

{% block setup %}
{#
clang-16:
/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object.c
../src/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object.c:544:23:
    error: incompatible function pointer types assigning to
    'gint (*)(gint, ioctl_req_t, ...)'
    (aka 'int (*)(int, unsigned long, ...)')
    from 'int (int, int, ...)'
    [-Wincompatible-function-pointer-types]
    v4l2object->ioctl = ioctl;
#}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
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
for x in ${out}/lib/pkgconfig/*.pc; do
    sed -e 's|toolsdir=.*||' -i ${x}
done
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/lib/include \${CPPFLAGS}"
export CPPFLAGS="-I${out}/lib/gstreamer-1.0/include \${CPPFLAGS}"
export CPPFLAGS="-I${out}/include/gstreamer-1.0 \${CPPFLAGS}"
{% endblock %}
