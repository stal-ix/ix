{% extends '//die/c/cmake.sh' %}

{% block version %}
1.2.2
{% endblock %}

{% block fetch %}
https://github.com/google/snappy/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:90f74bc1fbf78a6c56b3c4a082a05103b3a56bb17bca1a27e052ea11723292dc
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
