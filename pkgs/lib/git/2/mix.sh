{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v1.4.3.tar.gz
sha:f48b961e463a9e4e7e7e58b21a0fb5a9b2a1d24d9ba4d15870a0c9b8ad965163
{% endblock %}

{% block lib_deps %}
lib/c
lib/openssl
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
{% endblock %}
