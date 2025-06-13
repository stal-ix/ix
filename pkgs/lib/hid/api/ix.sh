{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hidapi
{% endblock %}

{% block version %}
0.15.0
{% endblock %}

{% block fetch %}
https://github.com/libusb/hidapi/archive/refs/tags/hidapi-{{self.version().strip()}}.tar.gz
5d84dec684c27b97b921d2f3b73218cb773cf4ea915caee317ac8fc73cef8136
{% endblock %}

{% block lib_deps %}
lib/c
lib/usb
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
