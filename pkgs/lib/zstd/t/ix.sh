{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/facebook/zstd/archive/refs/tags/v1.5.5.tar.gz
sha:98e9c3d949d1b924e28e01eccb7deed865eefebf25c2f21c702e5cd5b63b85e1
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
