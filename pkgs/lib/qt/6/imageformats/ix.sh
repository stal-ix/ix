{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v6.4.3.tar.gz
sha:d3bc0c6173f64d48f11f3602f8c0f0db1397a7b40ac321a8e8bd8c639629dcbc
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/jasper
lib/qt/6/base
{% endblock %}
