{% extends '//die/c/cmake.sh' %}

{% block fetch %}
http://download.osgeo.org/libtiff/tiff-4.5.0.tar.gz
sha:c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/c++
lib/jpeg
lib/zstd
lib/webp
{% endblock %}
