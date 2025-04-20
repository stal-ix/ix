{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
zstd
{% endblock %}

{% block fetch %}
https://github.com/facebook/zstd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
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
