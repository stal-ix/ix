{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v6.5.2.tar.gz
sha:c82f4b04ed3e56820d8b60d4d762f7597bc0aedba37894dff7d0706a778d00b2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/jasper
lib/qt/6/base
{% endblock %}
