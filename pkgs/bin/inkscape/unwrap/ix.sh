{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://inkscape.org/gallery/item/34673/inkscape-1.2.1.tar.xz
sha:46ce7da0eba7ca4badc1db70e9cbb67e0adf9bb342687dc6e08b5ca21b8d4c1b
https://gitlab.com/inkscape/inkscape/-/archive/INKSCAPE_1_2_2/inkscape-INKSCAPE_1_2_2.tar.bz2
sha:fe3c7c38b0d239a8aaa89b402cb255d12e91dedda6d6a77d90a8b00d54652c78
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 0 ${src}/*xz
mv ink* old
extract 0 ${src}/*bz2
mv ink* new
rm -r new/share/extensions
mv old/share/extensions new/share/
cd new
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/cdr
lib/dbus
lib/intl
lib/jpeg
lib/xslt
lib/2geom
lib/pango
lib/cairo
lib/boost
lib/visio
lib/lcms/2
lib/gspell
lib/soup/2
#lib/poppler
lib/boehmgc
lib/potrace
lib/gtk/3/mm
lib/readline
lib/harfbuzz
lib/freetype
lib/dbus/glib
lib/googletest
lib/fontconfig
lib/image/magick
lib/gdk/pixbuf/svg
lib/double/conversion
{% endblock %}

{% block bld_tool %}
bld/python
bld/gettext
bin/ragel/6
bld/glib
{% endblock %}

{% block cmake_flags %}
WITH_X11=OFF
WITH_LIBWPG=OFF
ENABLE_POPPLER=OFF
{% endblock %}

{% block setup %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}
