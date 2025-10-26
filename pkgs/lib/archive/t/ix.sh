{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libarchive
{% endblock %}

{% block version %}
3.8.2
{% endblock %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v{{self.version().strip()}}.tar.gz
97548897f06ed7f5cd847fc62a67420809dbbd9b45ec13a25d3290fafba046c8
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=gcc)
{% endblock %}
