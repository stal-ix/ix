{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libwacom
{% endblock %}

{% block version %}
2.16.0
{% endblock %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-{{self.version().strip()}}/libwacom-{{self.version().strip()}}.tar.xz
6c3eb173828174f39fb9af07c1fad80bf920358adbaf6236e4ae8490f7abe01f
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
