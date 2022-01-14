{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.19.3.tar.xz
sha:50193a23b13713ccb32ee5d1852faeeaed29b91f8398285acdfd522fa3e16835
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gstreamer/19
lib/gstreamer/19/base
{% endblock %}

{% block bld_tool %}
lib/glib
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): fixme'
{% endblock %}
