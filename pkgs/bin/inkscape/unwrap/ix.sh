{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
inkscape
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{% block git_repo %}
https://gitlab.com/inkscape/inkscape
{% endblock %}

{% block git_branch %}
INKSCAPE_{{self.version().strip().replace('.', '_')}}
{% endblock %}

{% block git_sha %}
f75f592ae5eb1d8ef662950fc679f5e935f7e38eff077e7b8bd6346cfa271b04
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
lib/xml/2
lib/lcms/2
lib/gspell
lib/soup/2
lib/boehmgc
lib/potrace
lib/gtk/3/mm
lib/readline
lib/harfbuzz
lib/freetype
lib/dbus/glib
lib/fontconfig
lib/poppler/old
lib/image/magick
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

{% block cpp_missing %}
libxml/xmlmemory.h
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-Wno-register -std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|PAGE_SIZE|X_PAGE_SIZE|' -i src/attributes.cpp
sed -e 's|PAGE_SIZE|X_PAGE_SIZE|' -i src/attributes.h
sed -e 's|PAGE_SIZE|X_PAGE_SIZE|' -i src/object/sp-page.cpp
sed -e 's|other.p|other._p|' -i src/util/gobjectptr.h
{% endblock %}
