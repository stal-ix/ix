{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.15.0/libwacom-2.15.0.tar.xz
sha:20cd65b1693129c3a6c003db0fe7fff7eccaf19fb04e89aaad9c20eb2151515a
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
