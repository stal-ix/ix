{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://libzip.org/download/libzip-1.11.2.tar.xz
sha:5d471308cef4c4752bbcf973d9cd37ba4cb53739116c30349d4764ba1410dfc1
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
