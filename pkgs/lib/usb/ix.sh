{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libusb
{% endblock %}

{% block version %}
1.0.28
{% endblock %}

{% block fetch %}
https://github.com/libusb/libusb/releases/download/v{{self.version().strip()}}/libusb-{{self.version().strip()}}.tar.bz2
sha:966bb0d231f94a474eaae2e67da5ec844d3527a1f386456394ff432580634b29
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
