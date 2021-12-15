{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
http://download.osgeo.org/libtiff/tiff-4.3.0.tar.gz
0a2e4744d1426a8fc8211c0cdbc3a1b3
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/jpeg/mix.sh
lib/xz/mix.sh
lib/zstd/mix.sh
lib/webp/mix.sh
lib/c/mix.sh
lib/c++/mix.sh
{% endblock %}
