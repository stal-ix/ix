{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/zlib-ng/zlib-ng/archive/refs/tags/2.1.2.tar.gz
sha:383560d6b00697c04e8878e26c0187b480971a8bce90ffd26a5a7b0f7ecf1a33
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
