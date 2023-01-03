{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.14.1.tar.gz
sha:243e90d50fe596d413a0c522f045e463c2cac21a8a732c5cc0f9632ec6aee694
{% endblock %}

{% block lib_deps %}
lib/c
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
