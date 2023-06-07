{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v6.5.1.tar.gz
sha:a7ca1fcc7e9c0ae42b7881680214674abb7c80bf66d318e2f6302d641854240c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/jasper
lib/qt/6/base
{% endblock %}
