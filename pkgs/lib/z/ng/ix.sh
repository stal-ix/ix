{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/zlib-ng/zlib-ng/archive/refs/tags/2.1.5.tar.gz
sha:3f6576971397b379d4205ae5451ff5a68edf6c103b2f03c4188ed7075fbb5f04
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ZLIB_ENABLE_TESTS=OFF
ZLIB_COMPAT=ON
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Z_SOLO|_Z_SOLO|g' -i ${out}/include/zlib.h
sed -e 's|Version:.*|Version: 1.2.11|' -i ${out}/lib/pkgconfig/zlib.pc
{% endblock %}
