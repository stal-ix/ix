{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.117.tar.xz
sha:a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
lib/pciaccess
{% if not x86_64 %}
lib/atomic/ops
{% endif %}
{% endblock %}

{% block meson_flags %}
udev=true
valgrind=disabled
{% endblock %}
