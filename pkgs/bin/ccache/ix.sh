{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/archive/refs/tags/v4.10.2.tar.gz
sha:d22a4e59b58cdb3af5dd2a5a8fa3c40179bf35c985d17bc9bdeed2cffa3265be
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
