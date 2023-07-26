{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://gitlab.com/inkscape/inkscape
{% endblock %}

{% block git_branch %}
INKSCAPE_1_3
{% endblock %}

{% block git_sha %}
81182028059fba218db60d9deb6595696e771277245ade0f3c5a33651fb9535e
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

{% block patch %}
sed -e 's|PAGE_SIZE|X_PAGE_SIZE|' -i src/attributes.cpp
sed -e 's|PAGE_SIZE|X_PAGE_SIZE|' -i src/attributes.h
sed -e 's|PAGE_SIZE|X_PAGE_SIZE|' -i src/object/sp-page.cpp
{% endblock %}
