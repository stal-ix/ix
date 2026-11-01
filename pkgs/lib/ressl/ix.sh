{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libressl
{% endblock %}

{% block version %}
4.4.0
{% endblock %}

{% block fetch %}
https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-{{self.version().strip()}}.tar.gz
7d02522ad5070b9adb32eb253ecabce181184a3750cf65abac0675ee908687c1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBRESSL_APPS=OFF
LIBRESSL_TESTS=OFF
{% endblock %}
