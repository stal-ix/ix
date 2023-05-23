{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.16.2.tar.gz
sha:d207f2ff5c86e6af3621c237f186130b985b7a9ff657875944b58ac5d27ba71c
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
