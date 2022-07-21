{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/usb/usbutils/usbutils-014.tar.xz
sha:3a079cfad60560227b67192482d7813bf96326fcbb66c04254839715f276fc69
{% endblock %}

{% block bld_libs %}
lib/c
lib/usb
lib/linux
{% endblock %}
