{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libarchive
{% endblock %}

{% block version %}
3.8.5
{% endblock %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3877c692621d8fbe9512592cf824c98c4b393525ab96735616ff628086158777
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=gcc)
{% endblock %}
