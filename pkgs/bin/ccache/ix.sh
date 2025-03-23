{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/archive/refs/tags/v4.11.2.tar.gz
sha:6e9342ab2906a501561ee46d98b1e48e2edd39ef7f43b6abf4b8025ccfe7d060
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
