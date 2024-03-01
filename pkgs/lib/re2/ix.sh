{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/re2/archive/refs/tags/2024-03-01.tar.gz
sha:7b2b3aa8241eac25f674e5b5b2e23d4ac4f0a8891418a2661869f736f03f57f4
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
