{% extends '//die/c/meson.sh' %}

{% block version %}
2.15.0
{% endblock %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-{{self.version().strip()}}/libwacom-{{self.version().strip()}}.tar.xz
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
