{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://poppler.freedesktop.org/poppler-23.04.0.tar.xz
sha:b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1
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
{% endblock %}

{% block cmake_flags %}
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

{% block setup %}
export CPPFLAGS="-Wno-register ${CPPFLAGS}"
{% endblock %}
