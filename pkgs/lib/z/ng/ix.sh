{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/zlib-ng/zlib-ng/archive/refs/tags/2.1.3.tar.gz
sha:d20e55f89d71991c59f1c5ad1ef944815e5850526c0d9cd8e504eaed5b24491a
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
