{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libavif
{% endblock %}

{% block version %}
1.4.2
{% endblock %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2b645287340ba5a631d268b551dc2d72bd73ac33335962dd36dcdb6d8366921d
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
