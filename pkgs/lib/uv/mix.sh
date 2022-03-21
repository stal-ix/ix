{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/libuv/libuv/archive/refs/tags/v1.43.0.tar.gz
da212b6d2b627f99492168d5d3ce6da6
{% endblock %}

{% block std_box %}
bld/bootbox
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
