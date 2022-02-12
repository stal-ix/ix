{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/AOMediaCodec/libavif/archive/refs/tags/v0.9.0.tar.gz
sha:ea1603fc18e7dd20cf01f0b405156576886ecb5df84db8c0e87187cd2f8a00f4
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/aom
lib/png
lib/yuv
lib/jpeg
{% endblock %}

{% block cmake_flags %}
AVIF_CODEC_AOM=ON
AVIF_BUILD_APPS=ON
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): proper check'
{% endblock %}
