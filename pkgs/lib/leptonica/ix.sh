{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/DanBloomberg/leptonica/archive/refs/tags/1.83.1.tar.gz
sha:4289d0a4224b614010072253531c0455a33a4d7c7a0017fe7825ed382290c0da
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
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/lept.pc
{% endblock %}
