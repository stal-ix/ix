{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://libzip.org/download/libzip-1.10.1.tar.xz
sha:dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318
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
