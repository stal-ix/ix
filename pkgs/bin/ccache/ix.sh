{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ccache
{% endblock %}

{% block version %}
4.12.3
{% endblock %}

{% block fetch %}
https://github.com/ccache/ccache/archive/refs/tags/v{{self.version().strip()}}.tar.gz
681c79e361a26a0bc449507100fa44d9c6831d4c91041634e9310f5538df2a35
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
