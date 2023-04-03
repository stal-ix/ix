{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v6.5.0.tar.gz
sha:c5df332ed3460deec6ad2380feba332f557aa860b829a8130941ffcf2bf3944e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/jasper
lib/qt/6/base
{% endblock %}
