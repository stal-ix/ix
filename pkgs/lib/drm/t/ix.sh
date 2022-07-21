{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.112.tar.xz
sha:00b07710bd09b35cd8d80eaf4f4497fe27f4becf467a9830f1f5e8324f8420ff
{% endblock %}

{% block lib_deps %}
lib/c
lib/linux
lib/atomicops
lib/pciaccess
{% endblock %}

{% block meson_flags %}
valgrind=false
udev=true
{% endblock %}
