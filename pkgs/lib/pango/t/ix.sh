{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pango/1.50/pango-1.50.8.tar.xz
sha:cf626f59dd146c023174c4034920e9667f1d25ac2c1569516d63136c311255fa
#https://gitlab.gnome.org/GNOME/pango/-/archive/1.90/pango-1.90.tar.bz2
#sha:7fc63f09565765d0e0fe76c536f4cea828deea1149d3410c8e814e6782a596a6
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/cairo
lib/fribidi
lib/freetype
lib/harfbuzz
lib/execinfo
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}
