{% extends '//die/c/cmake.sh' %}

{% block version %}
4.2.5
{% endblock %}

{% block fetch %}
https://github.com/jasper-software/jasper/archive/refs/tags/version-{{self.version().strip()}}.tar.gz
sha:3f4b1df7cab7a3cc67b9f6e28c730372f030b54b0faa8548a9ee04ae83fffd44
{% endblock %}

{% block lib_deps %}
lib/c
lib/heif
lib/jpeg
{% endblock %}

{% block cmake_flags %}
JAS_CROSSCOMPILING=ON
JAS_STDC_VERSION=201112L
{% endblock %}
