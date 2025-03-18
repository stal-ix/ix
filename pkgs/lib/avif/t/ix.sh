{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v1.2.1.tar.gz
sha:9c859c7c12ccb0f407511bfe303e6a7247f5f6738f54852662c6df8048daddf4
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
