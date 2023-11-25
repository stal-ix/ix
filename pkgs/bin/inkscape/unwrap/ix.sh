{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://gitlab.com/inkscape/inkscape
{% endblock %}

{% block git_branch %}
INKSCAPE_1_3_1
{% endblock %}

{% block git_sha %}
c5cabd4e86effe51616c2885d8e62b8a8268dbb0994b4e12c3bd1e9d73bb7bc8
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
bin/gzip
bld/perl
bld/glib
bld/python
bld/gettext
bin/ragel/6
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

{% block patch %}
sed -e 's|PAGE_SIZE|X_PAGE_SIZE|' -i src/attributes.cpp
sed -e 's|PAGE_SIZE|X_PAGE_SIZE|' -i src/attributes.h
sed -e 's|PAGE_SIZE|X_PAGE_SIZE|' -i src/object/sp-page.cpp
{% endblock %}
