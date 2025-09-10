{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
poppler
{% endblock %}

{% block version %}
25.09.1
{% endblock %}

{% block fetch %}
https://poppler.freedesktop.org/poppler-{{self.version().strip()}}.tar.xz
0c1091d01d3dd1664a13816861e812d02b29201e96665454b81b52d261fad658
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/glib
lib/jpeg
lib/tiff
lib/cairo
lib/boost
lib/lcms/2
lib/freetype
lib/jpeg/open
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bld/glib
bin/gperf
bld/fake(tool_name=clang-format)
{% endblock %}

{% block cmake_flags %}
ENABLE_NSS3=OFF
ENABLE_GPGME=OFF

ENABLE_GLIB=ON
ENABLE_UNSTABLE_API_ABI_HEADERS=ON

BUILD_GTK_TESTS=OFF
BUILD_QT5_TESTS=OFF
BUILD_QT6_TESTS=OFF
BUILD_CPP_TESTS=OFF
BUILD_MANUAL_TESTS=OFF

ENABLE_CPP=OFF
ENABLE_QT5=OFF
ENABLE_QT6=OFF
ENABLE_LIBCURL=OFF
ENABLE_GTK_DOC=OFF
ENABLE_GOBJECT_INTROSPECTION=OFF
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|.*static_assert.*Z_NULL.*||' -i poppler/FlateEncoder.cc
{% endblock %}
