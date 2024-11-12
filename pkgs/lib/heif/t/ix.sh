{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v1.19.3.tar.gz
sha:3f3b482a5e88b27ba5a10e8bca3309ad9d76ceb9f2f4eef22d390c6ddbd5a2e0
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
