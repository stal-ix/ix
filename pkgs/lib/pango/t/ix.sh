{% extends '//die/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pango/1.50/pango-1.50.8.tar.xz
sha:cf626f59dd146c023174c4034920e9667f1d25ac2c1569516d63136c311255fa
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/cairo
lib/fribidi
lib/freetype
lib/harfbuzz
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}
