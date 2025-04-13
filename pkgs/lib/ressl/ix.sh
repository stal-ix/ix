{% extends '//die/c/cmake.sh' %}

{% block version %}
4.0.0
{% endblock %}

{% block fetch %}
https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-{{self.version().strip()}}.tar.gz
sha:4d841955f0acc3dfc71d0e3dd35f283af461222350e26843fea9731c0246a1e4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBRESSL_APPS=OFF
LIBRESSL_TESTS=OFF
{% endblock %}
