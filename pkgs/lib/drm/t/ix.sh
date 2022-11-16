{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.114.tar.xz
sha:3049cf843a47d12e5eeefbc3be3496d782fa09f42346bf0b7defe3d1e598d026
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
lib/atomicops
lib/pciaccess
{% endblock %}

{% block meson_flags %}
valgrind=disabled
udev=true
{% endblock %}
