{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://poppler.freedesktop.org/poppler-22.03.0.tar.xz
sha:728c78ba94d75a55f6b6355d4fbdaa6f49934d9616be58e5e679a9cfd0980e1e
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/glib
lib/jpeg
lib/tiff
lib/gtk/3
lib/lcms2
lib/cairo
lib/boost
lib/freetype
lib/jpeg/open
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/gperf
bld/glib/codegen
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
