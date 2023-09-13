{% extends '//die/c/cmake.sh' %}

{% block fetch %}
http://download.osgeo.org/libtiff/tiff-4.6.0.tar.gz
sha:88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a
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
