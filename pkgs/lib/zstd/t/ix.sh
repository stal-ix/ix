{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
zstd
{% endblock %}

{% block version %}
1.5.7
{% endblock %}

{% block fetch %}
https://github.com/facebook/zstd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:37d7284556b20954e56e1ca85b80226768902e2edabd3b649e9e72c0c9012ee3
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
