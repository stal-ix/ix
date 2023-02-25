{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v1.5.2.tar.gz
sha:57638ac0e319078f56a7e17570be754515e5b1276d3750904b4214c92e8fa196
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
