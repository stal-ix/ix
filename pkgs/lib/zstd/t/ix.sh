{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/facebook/zstd/archive/refs/tags/v1.5.6.tar.gz
sha:30f35f71c1203369dc979ecde0400ffea93c27391bfd2ac5a9715d2173d92ff7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd build/cmake
{% endblock %}

{% block cmake_flags %}
ZSTD_BUILD_SHARED=OFF
ZSTD_BUILD_STATIC=ON
ZSTD_BUILD_TESTS=OFF
{% if wasi %}
ZSTD_MULTITHREAD_SUPPORT=OFF
{% endif %}
{% endblock %}
