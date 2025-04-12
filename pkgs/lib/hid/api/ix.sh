{% extends '//die/c/cmake.sh' %}

{% block version %}
0.14.0
{% endblock %}

{% block fetch %}
https://github.com/libusb/hidapi/archive/refs/tags/hidapi-{{self.version().strip()}}.tar.gz
sha:a5714234abe6e1f53647dd8cba7d69f65f71c558b7896ed218864ffcf405bcbd
{% endblock %}

{% block lib_deps %}
lib/c
lib/usb
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
