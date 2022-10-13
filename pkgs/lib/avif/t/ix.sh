{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v0.10.1.tar.gz
sha:66e82854ceb84a3e542bc140a343bc90e56c68f3ecb4fff63e636c136ed9a05e
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/aom
lib/png
lib/yuv
lib/jpeg
lib/dav1d
lib/svt/av1
{% endblock %}

{% block cmake_flags %}
AVIF_CODEC_SVT=ON
AVIF_CODEC_AOM=ON
AVIF_CODEC_DAV1D=ON
AVIF_ENABLE_WERROR=OFF
{% endblock %}
