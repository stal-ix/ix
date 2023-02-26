{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v1.6.1.tar.gz
sha:25f7d3e2e7f398477a6e18271c5a68510853d0fe826a6287811cebccf92e773f
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
