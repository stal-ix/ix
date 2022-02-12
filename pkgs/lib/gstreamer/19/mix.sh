{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/1.19.3/gstreamer-1.19.3.tar.bz2
sha:d37b1afb5a2fb123e3c235b12aca0abc48dba6c62af6f62445cbf5b5795df403
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/drm
lib/glib
lib/udev/g
lib/opengl
lib/wayland
lib/graphene
lib/json/glib
lib/gstreamer/orc
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block run_data %}
aux/iso-codes
{% endblock %}

{% block bld_tool %}
lib/glib
bin/flex
bin/gettext
bin/bison/3/8
lib/gstreamer/orc
lib/wayland/protocols
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
