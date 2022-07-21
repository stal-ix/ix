{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v6.3.1.tar.gz
sha:e5232d5e409389d58a0f9a10ec95fe3efbf17bd786adb94fc262a1392282b271
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/qt/6/base
{% endblock %}
