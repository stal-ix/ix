{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.7.4.tar.gz
sha:cf7fc85b9f663c06dc2b7036b7ee54d02712167e04b07bdcc4c27553abf2d6ff
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=gcc)
{% endblock %}
