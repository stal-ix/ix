{% extends '//die/c/cmake.sh' %}

{% block version %}
4.7.0
{% endblock %}

{% block fetch %}
https://gitlab.com/libtiff/libtiff/-/archive/v{{self.version().strip()}}/libtiff-v{{self.version().strip()}}.tar.bz2
sha:2b8b5c4e79cb2a4651796602e45d6179b7f18bc283feab417b8e881ef7e81862
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/c++
lib/jpeg
lib/zstd
lib/webp
lib/deflate
{% endblock %}

{% block cmake_flags %}
tiff-contrib=OFF
tiff-docs=OFF
tiff-tests=OFF
{% endblock %}
