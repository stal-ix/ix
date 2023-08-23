{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.116.tar.xz
sha:46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a
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
