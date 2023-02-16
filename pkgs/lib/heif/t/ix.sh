{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.15.0.tar.gz
sha:fbe8007ac88c287c8dbcb5c5f7986d5330d16af5a792893f2a08065198f53774
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
