{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/releases/download/v4.7.3/ccache-4.7.3.tar.xz
sha:65c53e8fd85956238670278854c02574094e61aecb09c4bf8a0d42657f8f0a6d
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
