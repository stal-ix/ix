{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
podofo
{% endblock %}

{% block version %}
0.10.4
{% endblock %}

{% block fetch %}
https://github.com/podofo/podofo/archive/refs/tags/{{self.version().strip()}}.tar.gz
8800e16b8bd77cdb8881efca9d516976ec839cf736d27940977cc7f72d6d09d3
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
