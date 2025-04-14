{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libgit2
{% endblock %}

{% block version %}
1.9.0
{% endblock %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:75b27d4d6df44bd34e2f70663cfd998f5ec41e680e1e593238bbe517a84c7ed2
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
