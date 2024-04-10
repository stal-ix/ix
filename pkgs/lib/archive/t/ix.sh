{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v3.7.3.tar.gz
sha:7c03c1102e081408778d0ca4dbd9083ba4f82fe7ac6b29e9fe3cc9a62f329f2a
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=gcc)
{% endblock %}
