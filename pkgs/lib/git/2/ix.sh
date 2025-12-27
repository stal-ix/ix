{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libgit2
{% endblock %}

{% block version %}
1.9.2
{% endblock %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6f097c82fc06ece4f40539fb17e9d41baf1a5a2fc26b1b8562d21b89bc355fe6
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
