{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtimageformats/archive/refs/tags/v6.6.2.tar.gz
sha:fc5cb674ebc62b01a030649e2fb1f0d3852ad0a7ce7a5dfb5f01407b902e9b52
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/webp
lib/tiff
lib/jasper
lib/qt/6/base
{% endblock %}
