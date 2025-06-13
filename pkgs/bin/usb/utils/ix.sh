{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
usbutils
{% endblock %}

{% block version %}
018
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/usb/usbutils/usbutils-{{self.version().strip()}}.tar.xz
83f68b59b58547589c00266e82671864627593ab4362d8c807f50eea923cad93
{% endblock %}

{% block bld_libs %}
lib/c
lib/usb
lib/kernel
{% endblock %}
