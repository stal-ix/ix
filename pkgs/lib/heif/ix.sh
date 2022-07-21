{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.12.0.tar.gz
md5:2501e9226858a917691c4181e6f784b3
{% endblock %}

{% block lib_deps %}
lib/c
lib/aom
lib/x265
lib/de265
lib/dav1d
{% endblock %}
