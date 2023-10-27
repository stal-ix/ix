{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/snappy/archive/refs/tags/1.1.10.tar.gz
sha:49d831bffcc5f3d01482340fe5af59852ca2fe76c3e05df0e67203ebbe0f1d90
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
SNAPPY_BUILD_TESTS=OFF
SNAPPY_BUILD_BENCHMARKS=OFF
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
