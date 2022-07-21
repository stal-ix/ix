{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/facebook/zstd/archive/refs/tags/v1.5.2.tar.gz
sha:f7de13462f7a82c29ab865820149e778cbfe01087b3a55b5332707abf9db4a6e
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
{% endblock %}
