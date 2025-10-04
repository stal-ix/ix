{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdrm
{% endblock %}

{% block version %}
2.4.126
{% endblock %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-{{self.version().strip()}}.tar.xz
6cab16d4d259b6abc9f485233863454114a3c307eca806679aad3edbe967bf42
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
