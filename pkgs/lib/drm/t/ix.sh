{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdrm
{% endblock %}

{% block version %}
2.4.127
{% endblock %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-{{self.version().strip()}}.tar.xz
051aeb3e542a57621018ffc443fb088dd69b78eef0ce4808b604ce0feac9f47f
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
