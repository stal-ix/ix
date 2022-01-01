{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://cairographics.org/snapshots/cairo-1.17.4.tar.xz
bf9d0d324ecbd350d0e9308125fa4ce0
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
lib/lzo
lib/glib
lib/pixman
lib/opengl
lib/freetype
lib/fontconfig

{% if target.os == 'darwin' %}
lib/darwin/framework/ApplicationServices
lib/darwin/framework/CoreGraphics
{% endif %}
{% endblock %}

{% block meson_flags %}
fontconfig=enabled
freetype=enabled
glesv2=enabled
glesv3=enabled
gl-backend=auto
{% endblock %}

{% block c_rename_symbol %}
optarg
opterr
optind
optopt
getopt
getopt_long
getopt_long_only
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block patch %}
cat meson.build \
    | grep -v 'conf.*set.*CAIRO_HAS_TRACE' \
    > _ && mv _ meson.build
{% endblock %}
