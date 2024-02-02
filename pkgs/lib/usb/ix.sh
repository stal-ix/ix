{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libusb/libusb/releases/download/v1.0.27/libusb-1.0.27.tar.bz2
sha:ffaa41d741a8a3bee244ac8e54a72ea05bf2879663c098c82fc5757853441575
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/libusb-1.0 \${CPPFLAGS}"
{% endblock %}
