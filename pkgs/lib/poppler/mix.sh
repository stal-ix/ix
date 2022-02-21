{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://poppler.freedesktop.org/poppler-22.02.0.tar.xz
sha:e390c8b806f6c9f0e35c8462033e0a738bb2460ebd660bdb8b6dca01556193e1
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
lib/freetype
lib/jpeg/open
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bin/gperf
bin/glib/codegen
{% endblock %}

{% block cmake_flags %}
BUILD_GTK_TESTS=OFF
BUILD_QT5_TESTS=OFF
BUILD_QT6_TESTS=OFF
BUILD_CPP_TESTS=OFF
BUILD_MANUAL_TESTS=OFF
ENABLE_BOOST=OFF
ENABLE_UTILS=OFF
ENABLE_CPP=OFF
ENABLE_GLIB=ON
ENABLE_GOBJECT_INTROSPECTION=OFF
ENABLE_GTK_DOC=OFF
ENABLE_QT5=OFF
ENABLE_QT6=OFF
ENABLE_LIBCURL=OFF
ENABLE_LIBOPENJPEG=none
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup %}
export CPPFLAGS="-Wno-register ${CPPFLAGS}"
{% endblock %}
