{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/DanBloomberg/leptonica/archive/refs/tags/1.84.1.tar.gz
sha:ecd7a868403b3963c4e33623595d77f2c87667e2cfdd9b370f87729192061bef
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/png
lib/tiff
lib/jpeg
lib/webp
lib/giflib
lib/jpeg/open
{% endblock %}

{% block cmake_flags %}
BUILD_PROG=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/lept_Release.pc
cp ${out}/lib/pkgconfig/lept_Release.pc ${out}/lib/pkgconfig/lept.pc
{% endblock %}
