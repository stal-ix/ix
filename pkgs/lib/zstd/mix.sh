{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/facebook/zstd/releases/download/v1.5.0/zstd-1.5.0.tar.gz
a6eb7fb1f2c21fa80030a47993853e92
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/xz/mix.sh
lib/lz4/mix.sh
{% endblock %}

{% block unpack %}
{{super()}}
cd build/cmake
{% endblock %}

{% if kind == 'lib' %}
{% block std_box %}
box/boot/mix.sh
{% endblock %}
{% endif %}

{% block cmake_flags %}
ZSTD_BUILD_SHARED=OFF
ZSTD_BUILD_STATIC=ON
ZSTD_BUILD_TESTS=OFF
{% endblock %}

{% block env %}
export COFLAGS="--with-zstd=${out} \${COFLAGS}"
{% endblock %}
