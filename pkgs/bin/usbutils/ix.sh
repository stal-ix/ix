{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/usb/usbutils/usbutils-016.tar.xz
sha:75050b3a113a3d07b9e822fb367b8c7ef3524027d33aea7c9febfab038511e43
{% endblock %}

{% block bld_libs %}
lib/c
lib/usb
lib/kernel
{% endblock %}
