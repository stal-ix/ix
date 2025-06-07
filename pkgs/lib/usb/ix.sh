{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libusb
{% endblock %}

{% block version %}
1.0.29
{% endblock %}

{% block fetch %}
https://github.com/libusb/libusb/releases/download/v{{self.version().strip()}}/libusb-{{self.version().strip()}}.tar.bz2
sha:5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85
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
