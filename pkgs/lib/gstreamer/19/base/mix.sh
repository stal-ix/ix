{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.19.3.tar.xz
sha:e277f198623a26c1b0a1e19734656392e9368bebf3677cd94262a1316a960827
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
lib/gstreamer/19
lib/gstreamer/orc
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block run_data %}
misc/iso-codes
{% endblock %}

{% block bld_tool %}
lib/glib
gnu/gettext
lib/gstreamer/orc
lib/wayland/protocols
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): fixme'
{% endblock %}
