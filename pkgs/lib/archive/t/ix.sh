{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libarchive
{% endblock %}

{% block version %}
3.8.3
{% endblock %}

{% block fetch %}
https://github.com/libarchive/libarchive/archive/refs/tags/v{{self.version().strip()}}.tar.gz
38498928044ae14996b00193ec0e47ab893cc7c1963939d15c73016ad665b8c2
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=OFF
ENABLE_LIBXML2=OFF
ENABLE_TEST=OFF
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=gcc)
{% endblock %}
