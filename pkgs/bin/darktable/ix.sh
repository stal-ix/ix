{% extends '//die/cmake.sh' %}

{# TODO(pg): implement plugins support #}

{% block fetch %}
https://github.com/darktable-org/darktable/releases/download/release-4.0.0/darktable-4.0.0.tar.xz
sha:1416f8f59717e65a6220541aaa12eacca93888ce5176f2c9ab6c17b9cc53cc2d
{% endblock %}

{% block bld_libs %}
lib/c
lib/icu
lib/lua
lib/png
lib/tiff
lib/glib
lib/avif
lib/heif
lib/webp
lib/rsvg
lib/xml2
lib/curl
lib/jpeg
lib/lcms2
lib/gtk/3
lib/exiv2
lib/secret
lib/sqlite3
lib/openexr
lib/pugixml
lib/json/glib
lib/jpeg/open
lib/image/magick
{% endblock %}

{% block bld_tool %}
bld/perl
bld/bash
bin/xmllint
bld/gettext
bld/intltool
bin/xsltproc
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup %}
export CFLAGS="-Wno-register ${CFLAGS}"
{% endblock %}

{% block cpp_defines %}
NATIVE_ARCH=1
{% endblock %}

{% block cmake_flags %}
USE_LUA=OFF
USE_XCF=OFF
USE_GMIC=OFF
USE_GAME=OFF
USE_COLORD=OFF
USE_OPENMP=OFF
USE_OPENCL=OFF
USE_LENSFUN=OFF
ENABLE_JASPER=OFF
BUILD_CMSTEST=OFF
USE_IMAGEMAGICK=ON
USE_GRAPHICSMAGICK=OFF
BINARY_PACKAGE_BUILD=ON
{% endblock %}

{% block postinstall %}
:
{% endblock %}
