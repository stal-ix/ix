{% extends '//die/cmake.sh' %}

{% block fetch %}
http://download.osgeo.org/libtiff/tiff-4.3.0.tar.gz
0a2e4744d1426a8fc8211c0cdbc3a1b3
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/c++
lib/jpeg
lib/zstd
# TODO(pg): check it
lib/webp
{% endblock %}
