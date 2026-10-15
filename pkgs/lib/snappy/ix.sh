{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
snappy
{% endblock %}

{% block version %}
1.3.1
{% endblock %}

{% block fetch %}
https://github.com/google/snappy/archive/refs/tags/{{self.version().strip()}}.tar.gz
893f708a0bf4b5529d555ffcee390e940e932fcf90261f682604475a76cd0247
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
