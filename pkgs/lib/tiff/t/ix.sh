{% extends '//die/c/cmake.sh' %}

# check lib/qt/6/imageformats

{% block pkg_name %}
libtiff
{% endblock %}

{% block version %}
4.7.2
{% endblock %}

{% block fetch %}
https://gitlab.com/libtiff/libtiff/-/archive/v{{self.version().strip()}}/libtiff-v{{self.version().strip()}}.tar.bz2
c5086d8f7c5ba51ca98241f24a8bd1cb66218c399077aeccbf6a236cf3152acc
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
