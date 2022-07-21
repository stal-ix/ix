{% extends '//die/c/cmake.sh' %}

{% block fetch %}
http://download.osgeo.org/libtiff/tiff-4.4.0.tar.gz
sha:917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed
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
