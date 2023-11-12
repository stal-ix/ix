{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v1.47.0.tar.gz
sha:d50af7e6d72526db137e66fad812421c8a1cae09d146b0ec2bb9a22c5f23ba93
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBUV_BUILD_TESTS=OFF
LIBUV_BUILD_BENCH=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|libuv.so.1.0.0|libuv.a|' \
    -e 's|libuv.1.0.0.dylib|libuv.a|' \
    -i ${out}/lib/cmake/libuv/libuvConfig-release.cmake
{% endblock %}
