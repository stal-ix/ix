{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hidapi
{% endblock %}

{% block version %}
0.16.0
{% endblock %}

{% block fetch %}
https://github.com/libusb/hidapi/archive/refs/tags/hidapi-{{self.version().strip()}}.tar.gz
bc599d295792fe515778f19ce86a49760b0ea5fc114e5258245d470609632bbf
{% endblock %}

{% block lib_deps %}
lib/c
lib/usb
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
