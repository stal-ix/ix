{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v1.2.0.tar.gz
sha:2182f4900d1a9617cee89746922a58dd825f2a3547f23907b8d78dc3685f7d8c
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
