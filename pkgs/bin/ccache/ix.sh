{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ccache
{% endblock %}

{% block version %}
4.12.1
{% endblock %}

{% block fetch %}
https://github.com/ccache/ccache/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7250b1d6b9f598049d0a3802b3195c580d7c0b1e9a708d8a9bfbfaf12cbc5fcd
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
