{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v1.0.3.tar.gz
sha:35e3cb3cd7158209dcc31d3bf222036de5b9597e368a90e18449ecc89bb86a19
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/aom
lib/yuv
lib/webp
lib/dav1d
lib/svt/av1
{% endblock %}

{% block cmake_flags %}
AVIF_CODEC_SVT=ON
AVIF_CODEC_AOM=ON
AVIF_CODEC_DAV1D=ON
AVIF_ENABLE_WERROR=OFF
{% endblock %}
