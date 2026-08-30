{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libheif
{% endblock %}

{% block version %}
1.23.2
{% endblock %}

{% block fetch %}
https://github.com/strukturag/libheif/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1405ed070421459b569ff49deab109b7f1a30a447e72a9b20a4154f774634a44
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/aom
lib/webp
lib/x265
lib/de265
lib/dav1d
lib/svt/av1
{% endblock %}

{% block cmake_flags %}
WITH_DAV1D=ON
WITH_SvtEnc=ON
ENABLE_PLUGIN_LOADING=OFF
WITH_RAV1E_PLUGIN=OFF
WITH_SvtEnc_PLUGIN=OFF
WITH_OpenJPEG_DECODER_PLUGIN=OFF
WITH_OpenJPEG_ENCODER_PLUGIN=OFF
{% endblock %}
