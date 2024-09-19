{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://libzip.org/download/libzip-1.11.tar.xz
sha:428c0be525df5486c9a73308fbaeb474d7306264e21b78662925182592de7ff5
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/zstd
lib/bzip/2
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block cmake_flags %}
BUILD_DOC=OFF
{% endblock %}
