{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libarchive
{% endblock %}

{% block version %}
3.8.4
{% endblock %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e67100e84e95019907f8c616e3382a92f37e3389e4a8e447a1d50ea5b8e30868
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=gcc)
{% endblock %}
