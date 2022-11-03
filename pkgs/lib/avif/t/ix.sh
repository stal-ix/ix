{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v0.11.0.tar.gz
sha:0c34937f5a1f2e105734dba2fc6dc4d9b12636e17964df705d3d96c5aa52667c
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/aom
lib/png
lib/yuv
lib/webp
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
