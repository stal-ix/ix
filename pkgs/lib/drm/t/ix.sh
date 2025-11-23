{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdrm
{% endblock %}

{% block version %}
2.4.129
{% endblock %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-{{self.version().strip()}}.tar.xz
5978183f978d697e26a50ba066174964efb0ab97caa1ecaa1b861fbe5ddf77dc
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
