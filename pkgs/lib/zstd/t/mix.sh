{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz
a6eb7fb1f2c21fa80030a47993853e92
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
