{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libressl
{% endblock %}

{% block version %}
4.4.1
{% endblock %}

{% block fetch %}
https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-{{self.version().strip()}}.tar.gz
290cdf1b53c086255dc302f118b98602a444e9ae6d11e9bfdd8c9b1b60aa3a22
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBRESSL_APPS=OFF
LIBRESSL_TESTS=OFF
{% endblock %}
