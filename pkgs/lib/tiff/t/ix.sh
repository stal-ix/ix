{% extends '//die/c/cmake.sh' %}

# check lib/qt/6/imageformats

{% block pkg_name %}
libtiff
{% endblock %}

{% block version %}
4.7.1
{% endblock %}

{% block fetch %}
https://gitlab.com/libtiff/libtiff/-/archive/v{{self.version().strip()}}/libtiff-v{{self.version().strip()}}.tar.bz2
7bbeb6ece519e302dc68bb820ae17b9cf071baf30f70a4a6b98e9f72e6d8c1eb
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
