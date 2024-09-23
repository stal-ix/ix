{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.7.6.tar.gz
sha:2a27a429dde8a6920973a609f13e0d1f94b45a2c40c9f49fc66f7fd915e15b79
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=gcc)
{% endblock %}
