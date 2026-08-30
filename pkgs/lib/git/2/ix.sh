{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libgit2
{% endblock %}

{% block version %}
1.9.7
{% endblock %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1a4fbe7589e814777ae76b64734ad80f4ecad22cd33a22682a2aaea4ae5375e7
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
