{% extends '//mix/cmake.sh' %}

{% block fetch %}
#https://gitlab.com/inkscape/inkscape/-/archive/INKSCAPE_1_2/inkscape-INKSCAPE_1_2.tar.bz2
#sha:c2f44b0bb744e122d865d15a34e05c80f3c9947e46d933063e5ae9c19a3a85c4
https://inkscape.org/gallery/item/33289/inkscape-1.2-rc_2022-05-08_6364d40632.tar.xz
sha:e47b9c19a3473eec846735d161cbe52a3f37f0b623cae3b4860be83a6862af36
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
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

{% block install %}
{{super()}}
{{hooks.wrap_xdg_binary('inkscape')}}
{% endblock %}
