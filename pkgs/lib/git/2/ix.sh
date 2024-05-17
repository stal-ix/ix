{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v1.8.1.tar.gz
sha:8c1eaf0cf07cba0e9021920bfba9502140220786ed5d8a8ec6c7ad9174522f8e
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/ssh/2
lib/pcre/2
lib/openssl
{% endblock %}

{% block cmake_flags %}
USE_SSH=ON
BUILD_TESTS=OFF
REGEX_BACKEND=pcre2
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
