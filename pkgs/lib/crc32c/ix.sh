{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/google/crc32c/archive/refs/tags/1.1.2.tar.gz
sha:ac07840513072b7fcebda6e821068aa04889018f24e10e46181068fb214d7e56
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
CRC32C_BUILD_TESTS=OFF
CRC32C_BUILD_BENCHMARKS=OFF
CRC32C_USE_GLOG=OFF
{% endblock %}
