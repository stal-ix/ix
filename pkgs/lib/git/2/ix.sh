{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v1.5.1.tar.gz
sha:7074f1e2697992b82402501182db254fe62d64877b12f6e4c64656516f4cde88
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
PCRE2_INCLUDE_DIR=${PCRE2_HEADERS}
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
