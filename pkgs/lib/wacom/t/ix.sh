{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.12.0/libwacom-2.12.0.tar.xz
sha:40462434a8568e3c0a75c18a5452aa50e041819363853090c4e7ba7e23a4a180
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
