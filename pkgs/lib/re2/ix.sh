{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/re2/archive/refs/tags/2023-07-01.tar.gz
sha:18cf85922e27fad3ed9c96a27733037da445f35eb1a2744c306a37c6d11e95c4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/abseil/cpp
{% endblock %}

{% block cmake_flags %}
RE2_BUILD_TESTING=OFF
{% endblock %}

{% block env %}
export CMFLAGS="-Dre2_DIR=${out}/lib/cmake/re2 \${CMFLAGS}"
{% endblock %}
