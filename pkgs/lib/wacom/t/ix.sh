{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.4.0/libwacom-2.4.0.tar.xz
sha:d0d022761e3f9ab23e329583b7d2bd470b0450dfb077caeb22c5a0d66c2bd414
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
