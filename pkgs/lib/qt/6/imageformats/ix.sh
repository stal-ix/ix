{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v6.6.3.tar.gz
sha:33ceede38f69217b4a7955d54d20dfb1e3d9ac982540b4cd827db77220572dd4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/jasper
lib/qt/6/base
{% endblock %}
