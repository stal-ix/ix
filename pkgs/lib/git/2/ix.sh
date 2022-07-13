{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v1.4.4.tar.gz
sha:e9923e9916a32f54c661d55d79c28fa304cb23617639e68bff9f94d3e18f2d4b
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
PCRE2_INCLUDE_DIR=${lib_pcre_2}/include
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
