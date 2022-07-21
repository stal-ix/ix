{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://inkscape.org/gallery/item/34673/inkscape-1.2.1.tar.xz
sha:46ce7da0eba7ca4badc1db70e9cbb67e0adf9bb342687dc6e08b5ca21b8d4c1b
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
lib/gspell
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
{% endblock %}

{% block setup %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('inkscape')}}
{% endblock %}
