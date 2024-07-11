{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.18.0.tar.gz
sha:847d4e2bb7153ae00965c9e6a0f184420c90879d84632424e478c411224c9817
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
