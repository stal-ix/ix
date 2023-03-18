{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/zlib-ng/zlib-ng/archive/refs/tags/2.0.7.tar.gz
sha:6c0853bb27738b811f2b4d4af095323c3d5ce36ceed6b50e5f773204fb8f7200
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ZLIB_ENABLE_TESTS=OFF
ZLIB_COMPAT=ON
{% endblock %}

{% block cmake_install_dirs %}
-DCMAKE_INSTALL_PREFIX="${out}"
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Z_SOLO|_Z_SOLO|g' -i ${out}/include/zlib.h
sed -e 's|Version:.*|Version: 1.2.11|' -i ${out}/lib/pkgconfig/zlib.pc
{% endblock %}
