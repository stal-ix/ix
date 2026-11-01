{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libzip
{% endblock %}

{% block version %}
1.12.1
{% endblock %}

{% block fetch %}
https://libzip.org/download/libzip-{{self.version().strip()}}.tar.xz
c40062022a1963c80573d48f6070792297cecd7c6bffe3aefcac0d8b9bee8913
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
