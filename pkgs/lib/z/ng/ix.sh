{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/zlib-ng/zlib-ng/archive/refs/tags/2.1.7.tar.gz
sha:59e68f67cbb16999842daeb517cdd86fc25b177b4affd335cd72b76ddc2a46d8
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
