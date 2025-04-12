{% extends '//die/c/meson.sh' %}

{% block version %}
1.24.12
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/{{self.version().strip()}}/gstreamer-{{self.version().strip()}}.tar.gz
sha:e9394dc14d981891bd92d72a1d03c5c0ca5d04febcbb83b01fb62c67b21bc449
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/orc
lib/drm
lib/glib
lib/openal
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
bad=enabled
ges=disabled
base=enabled
good=enabled
gst-plugins-good:soup=disabled
gst-plugins-bad:openal=enabled
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

{% block patch %}
sed -e "s|'auto'|'disabled'|g" \
    -i subprojects/gst-plugins-bad/meson_options.txt
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/lib/include \${CPPFLAGS}"
export CPPFLAGS="-I${out}/lib/gstreamer-1.0/include \${CPPFLAGS}"
export CPPFLAGS="-I${out}/include/gstreamer-1.0 \${CPPFLAGS}"
{% endblock %}
