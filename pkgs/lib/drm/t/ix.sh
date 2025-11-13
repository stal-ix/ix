{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdrm
{% endblock %}

{% block version %}
2.4.128
{% endblock %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-{{self.version().strip()}}.tar.xz
3bb35db8700c2a0b569f2c6729a53f5495786856b310854c8de57782a22bddac
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
