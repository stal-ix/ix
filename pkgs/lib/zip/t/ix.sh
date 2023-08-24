{% extends '//die/c/cmake.sh' %}

{% block http_url %}
https://libzip.org/download/libzip-1.10.1.tar.xz
{% endblock %}

{% block http_sha %}
dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318
{% endblock %}

{% block bld_data %}
aux/http(http_url={{self.http_url().strip()}},fname={{self.http_url().strip() | basename}},sha={{self.http_sha().strip()}})
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
