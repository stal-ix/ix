{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.123.tar.xz
sha:a2b98567a149a74b0f50e91e825f9c0315d86e7be9b74394dae8b298caadb79e
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
lib/pci/access
{% if not x86_64 %}
lib/atomic/ops
{% endif %}
{% endblock %}

{% block meson_flags %}
udev=true
valgrind=disabled
{% endblock %}
