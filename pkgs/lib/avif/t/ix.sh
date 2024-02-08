{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v1.0.4.tar.gz
sha:dc56708c83a4b934a8af2b78f67f866ba2fb568605c7cf94312acf51ee57d146
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
