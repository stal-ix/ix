{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/releases/download/v4.9.1/ccache-4.9.1.tar.xz
sha:4c03bc840699127d16c3f0e6112e3f40ce6a230d5873daa78c60a59c7ef59d25
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/hiredis
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCUMENTATION=OFF
ENABLE_TESTING=OFF
{% endblock %}
