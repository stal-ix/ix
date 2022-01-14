{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.19.3.tar.xz
sha:906d7d4bf92f941586c0cbce717d9cad6aac36994e16fa6f2f153e07e3221bca
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_tool %}
lib/glib
dev/lang/flex
dev/lang/bison/3/8
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): fixme'
{% endblock %}
