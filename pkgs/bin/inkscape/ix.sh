{% extends '//die/cmake.sh' %}

{% block fetch %}
https://inkscape.org/id/gallery/item/33449/inkscape-1.2.tar.xz
sha:8d9b31142554945664edfefe2d6b55910a5099765f7176a71107c34f1dcde6ad
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/cdr
# check it
lib/gsl/gnu
lib/dbus
lib/intl
lib/jpeg
lib/xslt
lib/lcms2
lib/pango
lib/cairo
lib/boost
lib/visio
lib/soup/2
lib/poppler
lib/boehmgc
lib/potrace
lib/rsvg/dl
lib/gtk/3/mm
lib/readline
lib/harfbuzz
lib/freetype
lib/dbus/glib
lib/googletest
lib/fontconfig
lib/image/magick
lib/double/conversion
{% endblock %}

{% block bld_tool %}
bld/python
bld/gettext
bin/ragel/6
bld/glib/codegen
{% endblock %}

{% block cmake_flags %}
WITH_X11=OFF
BUILD_TESTING=OFF
WITH_LIBWPG=OFF
WITH_GSPELL=OFF
{% endblock %}

{% block setup %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('inkscape')}}
{% endblock %}
