{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v6.4.0.tar.gz
sha:91c79fe8f86cdd25ae6b6b394bb39940499e7e993a4d251176bb216890e1781d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/qt/6/base
{% endblock %}
