{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/podofo/podofo/archive/refs/tags/0.10.2.tar.gz
sha:565168132e8fbfcdbad4ea4c5567bcc57ebbffb4528f6273baf3f490a3cf7563
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
