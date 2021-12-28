{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://cairographics.org/snapshots/cairo-1.17.4.tar.xz
bf9d0d324ecbd350d0e9308125fa4ce0
{% endblock %}

{% block lib_deps %}
lib/c
{% if target.os == 'darwin' %}
lib/darwin/framework/ApplicationServices
lib/darwin/framework/CoreGraphics
{% endif %}
lib/png
lib/lzo
lib/glib
lib/pixman
lib/opengl
lib/freetype
lib/fontconfig
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block configure_flags %}
--enable-ft=yes
--enable-fc=yes
--enable-trace=no
--enable-egl=auto
--enable-glesv2=auto
--enable-gobject=yes
{% endblock %}

{% block c_rename_symbol %}
getopt getopt_long getopt_long_only
optarg opterr optind optopt
{% endblock %}

{% block setup %}
export ax_cv_c_float_words_bigendian=no
{% endblock %}
