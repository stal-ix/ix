{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.17.4.tar.gz
sha:08e7de307549ce61ec15a0a584e195181943d4ce0a6146f7aaaf6659e626fdc5
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
