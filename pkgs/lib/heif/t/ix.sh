{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.16.1.tar.gz
sha:005e337d60436759af80deaf25c7dcf3a98d976b1c8c30117c830aae3452afe5
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
