{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libusb
{% endblock %}

{% block version %}
1.0.30
{% endblock %}

{% block fetch %}
https://github.com/libusb/libusb/releases/download/v{{self.version().strip()}}/libusb-{{self.version().strip()}}.tar.bz2
fea36f34f9156400209595e300840767ab1a385ede1dc7ee893015aea9c6dbaf
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
