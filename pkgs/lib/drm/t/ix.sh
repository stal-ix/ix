{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdrm
{% endblock %}

{% block version %}
2.4.124
{% endblock %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-{{self.version().strip()}}.tar.xz
sha:ac36293f61ca4aafaf4b16a2a7afff312aa4f5c37c9fbd797de9e3c0863ca379
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
