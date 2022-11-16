{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/libusb/libusb/releases/download/v1.0.26/libusb-1.0.26.tar.bz2
sha:12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/libusb-1.0 \${CPPFLAGS}"
{% endblock %}
