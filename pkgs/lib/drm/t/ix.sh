{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.113.tar.xz
sha:7fd7eb2967f63beb4606f22d50e277d993480d05ef75dd88a9bd8e677323e5e1
{% endblock %}

{% block lib_deps %}
lib/c
lib/linux
lib/atomicops
lib/pciaccess
{% endblock %}

{% block meson_flags %}
valgrind=disabled
udev=true
{% endblock %}
