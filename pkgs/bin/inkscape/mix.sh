{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://gitlab.com/inkscape/inkscape/-/archive/INKSCAPE_1_1_1/inkscape-INKSCAPE_1_1_1.tar.bz2
sha:da87d20ccee81a918330bda25f21521f512397d137a776a68fbdb5891fcbb2d3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gsl
lib/dbus
lib/intl
lib/jpeg
lib/lcms2
lib/pango
lib/cairo
lib/soup/2
lib/boehmgc
lib/potrace
lib/gtk/3/mm
lib/readline
lib/harfbuzz
lib/freetype
lib/dbus/glib
lib/fontconfig
lib/double-conversion
{% endblock %}

{% block bld_tool %}
lib/potrace
{% endblock %}

{% block cmake_flags %}
WITH_OPENMP=OFF
BUILD_SHARED_LIBS=OFF
ENABLE_POPPLER=OFF
ENABLE_POPPLER_CAIRO=OFF
WITH_IMAGE_MAGICK=OFF
WITH_GRAPHICS_MAGICK=OFF
WITH_LIBCDR=OFF
WITH_LIBVISIO=OFF
WITH_LIBWPG=OFF
WITH_GSPELL=OFF
{% endblock %}
