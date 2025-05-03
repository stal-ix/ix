{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ccache
{% endblock %}

{% block version %}
4.11.3
{% endblock %}

{% block fetch %}
https://github.com/ccache/ccache/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6502d63fbb236ed6bbc5c3405fddef57458cb74acd2141577250a8faa56c7d90
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
