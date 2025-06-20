{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
poppler
{% endblock %}

{% block version %}
25.06.0
{% endblock %}

{% block fetch %}
https://poppler.freedesktop.org/poppler-{{self.version().strip()}}.tar.xz
8199532d38984fab46dbd0020ec9c40f20e928e33e9b4cc6043572603a821d83
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
