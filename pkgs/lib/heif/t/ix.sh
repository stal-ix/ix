{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libheif
{% endblock %}

{% block version %}
1.20.2
{% endblock %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b70340395d84184bb8dfc833dd51c95ae049435f7ff9abc7b505a08b5ee2bd2a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/aom
lib/webp
lib/x265
lib/de265
lib/dav1d
lib/svt/av1
{% endblock %}

{% block cmake_flags %}
WITH_DAV1D=ON
WITH_SvtEnc=ON
ENABLE_PLUGIN_LOADING=OFF
WITH_RAV1E_PLUGIN=OFF
WITH_SvtEnc_PLUGIN=OFF
WITH_OpenJPEG_DECODER_PLUGIN=OFF
WITH_OpenJPEG_ENCODER_PLUGIN=OFF
{% endblock %}
