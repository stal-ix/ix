{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.5.0/libwacom-2.5.0.tar.xz
sha:40b69a4c38bbcbc80b1231bc115551107ebbc0ba14d2ad1c3e54355dcd876816
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
