{% extends '//die/c/cmake.sh' %}

{% block fetch %}
http://download.osgeo.org/libtiff/tiff-4.5.1.tar.gz
sha:d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b
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

{% block cmake_flags %}
tiff-contrib=OFF
tiff-docs=OFF
tiff-tests=OFF
{% endblock %}
