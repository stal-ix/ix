{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v1.0.0.tar.gz
sha:410f85cf0d13f403b41197c0774da469f5d73b89aa06d40fc726165377f215a0
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
