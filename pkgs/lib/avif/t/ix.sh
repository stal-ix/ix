{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libavif
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0a545e953cc049bf5bcf4ee467306a2f113a75110edf59e61248873101cd26c1
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
