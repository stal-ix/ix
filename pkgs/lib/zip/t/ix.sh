{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libzip
{% endblock %}

{% block version %}
1.12
{% endblock %}

{% block fetch %}
https://libzip.org/download/libzip-{{self.version().strip()}}.tar.xz
376908d0f0fda13180a19fdc4f7062a1abfb59e09ca07a392d361253b8e60c2b
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
