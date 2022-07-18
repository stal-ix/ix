{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v0.10.0.tar.gz
sha:d289e5029cb3853630ca85716b25b5fb9cdec51f8bd537b05f43b3325b480ab0
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
AVIF_CODEC_AOM=ON
AVIF_BUILD_APPS=ON
AVIF_ENABLE_WERROR=OFF
{% endblock %}
