{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/zlib-ng/zlib-ng/archive/refs/tags/2.0.6.tar.gz
sha:8258b75a72303b661a238047cb348203d88d9dddf85d480ed885f375916fcab6
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

{% block std_box %}
bld/bootbox
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Z_SOLO|_Z_SOLO|g' -i ${out}/include/zlib.h
{% endblock %}
