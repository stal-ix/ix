{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.19.2.tar.gz
sha:c5caaed602e68799e2f4cebc243730505912d45a14ee8d650fccc7258507524a
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
