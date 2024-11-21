{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/c6111ec06cc0b0126cd67bdab78f8091e4cfaa10.tar.gz
sha:fddbd9a4ad953dbfe9c42ef906cc0a4bc73fbd1f2cb3511fff05ddde4a7d90df
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
