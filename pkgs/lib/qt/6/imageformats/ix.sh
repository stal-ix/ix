{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v6.4.2.tar.gz
sha:5b6fe6016373d35904d6708f3aea4c7311b5fa6a3fe1f773640df2f176fb2b34
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/jasper
lib/qt/6/base
{% endblock %}
