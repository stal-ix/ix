{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/capstone-engine/capstone/archive/refs/tags/4.0.2.tar.gz
sha:7c81d798022f81e7507f1a60d6817f63aa76e489aa4e7055255f21a22f5e526a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CAPSTONE_BUILD_TESTS=OFF
CAPSTONE_BUILD_SHARED=OFF
{% endblock %}
