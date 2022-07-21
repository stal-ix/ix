{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/snappy/archive/refs/tags/1.1.9.tar.gz
sha:75c1fbb3d618dd3a0483bff0e26d0a92b495bbe5059c8b4f1c962b478b6e06e7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
SNAPPY_BUILD_TESTS=OFF
SNAPPY_BUILD_BENCHMARKS=OFF
{% endblock %}
