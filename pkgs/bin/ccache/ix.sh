{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/archive/refs/tags/v4.11.tar.gz
sha:6e14d2f7f4fee556d232c51ff81843fa164f557a0c7136764ec5412be561a90a
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
