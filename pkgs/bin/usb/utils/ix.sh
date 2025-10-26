{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
usbutils
{% endblock %}

{% block version %}
019
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/usb/usbutils/usbutils-{{self.version().strip()}}.tar.xz
659f40c440e31ba865c52c818a33d3ba6a97349e3353f8b1985179cb2aa71ec5
{% endblock %}

{% block bld_libs %}
lib/c
lib/usb
lib/kernel
{% endblock %}
