{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://inkscape.org/gallery/item/29255/inkscape-1.1.1.tar.xz
sha:aeca0b9d33b5b1cfa9aa70433bdee6a8c3d020ffafc2e6f0c9a60eed7a7978af
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gsl
lib/dbus
lib/intl
lib/jpeg
lib/xslt
lib/iconv
lib/lcms2
lib/pango
lib/cairo
lib/boost
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
lib/double-conversion
{% endblock %}

{% block bld_tool %}
bld/python
bld/gettext
bin/ragel/6
bld/glib/codegen
{% endblock %}

{% block cmake_flags %}
WITH_OPENMP=OFF
BUILD_TESTING=OFF
WITH_IMAGE_MAGICK=OFF
WITH_GRAPHICS_MAGICK=OFF
WITH_LIBCDR=OFF
WITH_LIBVISIO=OFF
WITH_LIBWPG=OFF
WITH_GSPELL=OFF
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}

{% block setup %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|getTag()->getCString|getTag().c_str|' \
    -i src/extension/internal/pdfinput/pdf-parser.cpp

sed -e 's|(filename_goo, nullptr, nullptr|(std::unique_ptr<GooString>(filename_goo), std::nullopt, std::nullopt|' \
    -i src/extension/internal/pdfinput/pdf-input.cpp

sed -e 's|ifdef __APPLE__|if 1|' -i src/object/object-set.cpp
sed -e 's|.*g_warning_once.*||' -i src/style.cpp

cat << EOF > poppler-config.h
#define POPPLER_VERSION "unknown"
EOF
{% endblock %}
