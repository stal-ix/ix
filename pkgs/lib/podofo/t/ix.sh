{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/podofo/podofo/archive/refs/tags/0.10.3.tar.gz
sha:4be2232643f9e9dd7fbb02894d5a0394c3ca2826aab179654c2cc751074825ec
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/idn
lib/c++
lib/png
lib/tiff
lib/jpeg
lib/xml/2
lib/openssl
lib/freetype
lib/unistring
lib/fontconfig
{% endblock %}

{% block cmake_flags %}
PODOFO_BUILD_TEST=OFF
PODOFO_BUILD_EXAMPLES=OFF
PODOFO_BUILD_STATIC=ON
{% endblock %}
