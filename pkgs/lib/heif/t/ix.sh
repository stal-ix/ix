{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.15.2.tar.gz
sha:30a2736ae0247389aaa43ec70357221500c49a68db39fda94da8d5bdc786fe3b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/aom
lib/x265
lib/de265
lib/dav1d
lib/svt/av1
{% endblock %}

{% block cmake_flags %}
ENABLE_PLUGIN_LOADING=OFF
WITH_RAV1E_PLUGIN=OFF
WITH_SvtEnc_PLUGIN=OFF
{% endblock %}
