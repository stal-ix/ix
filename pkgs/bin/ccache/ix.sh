{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ccache
{% endblock %}

{% block version %}
4.12
{% endblock %}

{% block fetch %}
https://github.com/ccache/ccache/archive/refs/tags/v{{self.version().strip()}}.tar.gz
07f97141e9ced495f524f69e4e824f185c8698b60a3fc2ed7ee010da4500d45b
{% endblock %}

{% block bld_libs %}
lib/c
lib/fmt
lib/zstd
lib/xxhash
lib/hiredis
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCUMENTATION=OFF
ENABLE_TESTING=OFF
{% endblock %}
