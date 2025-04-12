{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libarchive
{% endblock %}

{% block version %}
3.7.9
{% endblock %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6191ea9756a7a0b116d701f3bce30ee3dc8c1f0a16b1e6221d273c85b57ce8c6
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=gcc)
{% endblock %}
