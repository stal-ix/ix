{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v1.43.0.tar.gz
sha:9e27825a55279de69a7c43e42d509fd1337c9bece2547c761e91a1592e91cc4d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
LIBUV_BUILD_TESTS=OFF
LIBUV_BUILD_BENCH=OFF
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/pkgconfig/libuv-static.pc ${out}/lib/libuv_a.a
{% endblock %}
