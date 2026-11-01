{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
usbutils
{% endblock %}

{% block version %}
020
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/usb/usbutils/usbutils-{{self.version().strip()}}.tar.xz
20287d68fcd9ebb50a05ba0645a4af7583bd8dfc7307215ba121e4bc6d057aa1
{% endblock %}

{% block bld_libs %}
lib/c
lib/usb
lib/kernel
{% endblock %}
