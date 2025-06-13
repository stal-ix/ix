{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libgit2
{% endblock %}

{% block version %}
1.9.1
{% endblock %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
14cab3014b2b7ad75970ff4548e83615f74d719afe00aa479b4a889c1e13fc00
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
