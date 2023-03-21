{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v1.6.3.tar.gz
sha:a8e2a09835eabb24ace2fd597a78af182e1e199a894e99a90e4c87c849fcd9c4
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
