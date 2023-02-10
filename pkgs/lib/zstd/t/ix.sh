{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/facebook/zstd/archive/refs/tags/v1.5.4.tar.gz
sha:35ad983197f8f8eb0c963877bf8be50490a0b3df54b4edeb8399ba8a8b2f60a4
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
