{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/usb/usbutils/usbutils-017.tar.xz
sha:a6a25ffdcf9103e38d7a44732aca17073f4e602b92e4ae55625231a82702e05b
{% endblock %}

{% block bld_libs %}
lib/c
lib/usb
lib/kernel
{% endblock %}
