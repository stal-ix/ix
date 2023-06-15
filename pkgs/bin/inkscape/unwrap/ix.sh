{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://inkscape.org/gallery/item/37360/inkscape-1.2.2.tar.xz
sha:a0c7fd0d03c0a21535e648ef301dcf80dd7cfc1f3545e51065fbf1ba3ee8a5c4
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/cdr
lib/dbus
lib/intl
lib/jpeg
lib/xslt
lib/wp/g
lib/2geom
lib/pango
lib/cairo
lib/boost
lib/visio
lib/lcms/2
lib/gspell
lib/soup/2
lib/poppler
lib/boehmgc
lib/potrace
lib/gtk/3/mm
lib/readline
lib/harfbuzz
lib/freetype
lib/dbus/glib
lib/fontconfig
lib/image/magick
lib/gdk/pixbuf/svg
lib/double/conversion
{% endblock %}

{% block bld_tool %}
bld/glib
bld/python
bld/gettext
{% endblock %}

{% block cmake_flags %}
WITH_X11=OFF
{% endblock %}

{% block cpp_defines %}
_LIBCPP_ENABLE_CXX17_REMOVED_FEATURES=1
{% endblock %}

{% block setup %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}
