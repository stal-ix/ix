{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/1.24.6/gstreamer-1.24.6.tar.gz
sha:dde1acbb57bc61d095048985e24bb7eb6cfe614a28a19df5986a0232d2d84f54
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/orc
lib/drm
lib/glib
lib/ffmpeg
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
bld/glib
bld/bison
bld/gettext
bld/wayland
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_flags %}
libav=enabled
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
for x in ${out}/lib/pkgconfig/*.pc; do
    sed -e 's|toolsdir=.*||' -i ${x}
done
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/lib/include \${CPPFLAGS}"
export CPPFLAGS="-I${out}/lib/gstreamer-1.0/include \${CPPFLAGS}"
export CPPFLAGS="-I${out}/include/gstreamer-1.0 \${CPPFLAGS}"
{% endblock %}
