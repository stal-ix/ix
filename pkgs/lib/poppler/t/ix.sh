{% extends '//die/c/cmake.sh' %}


{% block fetch %}
https://poppler.freedesktop.org/poppler-24.02.0.tar.xz
sha:19187a3fdd05f33e7d604c4799c183de5ca0118640c88b370ddcf3136343222e
{#
/home/pg/ix_root/build/V358i8DzE3ImX5oC/src/src/extension/internal/pdfinput/svg-builder.cpp:1161:9: error: cannot initialize a variable of type 'int' with an rvalue of type 'Type'
 1161 |     int type = func->getType();
      |         ^      ~~~~~~~~~~~~~~~
/home/pg/ix_root/build/V358i8DzE3ImX5oC/src/src/extension/internal/pdfinput/svg-builder.cpp:1186:54: error: invalid operands to binary expression ('Type' and 'int')
 1186 |             if (stitchingFunc->getFunc(i)->getType() == 2) {    // process exponential fxn
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~
2 errors generated.
https://poppler.freedesktop.org/poppler-24.03.0.tar.xz
sha:bafbf0db5713dec25b5d16eb2cd87e4a62351cdc40f050c3937cd8dd6882d446
#}
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

{% block setup_target_flags %}
export CPPFLAGS="-Wno-register ${CPPFLAGS}"
{% endblock %}
