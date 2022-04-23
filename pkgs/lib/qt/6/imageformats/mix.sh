{% extends '//mix/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v6.3.0.tar.gz
sha:f00b491206c8468da6fc0ac7470cc15a0a18791a37496ada3e33ab0f7d3c2c89
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/qt/6/base
{% endblock %}
