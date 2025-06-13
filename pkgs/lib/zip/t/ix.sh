{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libzip
{% endblock %}

{% block version %}
1.11.4
{% endblock %}

{% block fetch %}
https://libzip.org/download/libzip-{{self.version().strip()}}.tar.xz
8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608d893180ed7097b
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/zstd
lib/bzip/2
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block cmake_flags %}
BUILD_DOC=OFF
{% endblock %}
