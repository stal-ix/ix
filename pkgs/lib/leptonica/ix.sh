{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/DanBloomberg/leptonica/archive/refs/tags/1.85.0.tar.gz
sha:c01376bce0379d4ea4bc2ec5d5cbddaa49e2f06f88242619ab8c059e21adf233
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/png
lib/gif
lib/tiff
lib/jpeg
lib/webp
lib/jpeg/open
{% endblock %}

{% block cmake_flags %}
BUILD_PROG=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|if ()|if (TRUE)|' -i ${out}/lib/cmake/leptonica/LeptonicaConfig.cmake
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/lept_Release.pc
cp ${out}/lib/pkgconfig/lept_Release.pc ${out}/lib/pkgconfig/lept.pc
{% endblock %}
