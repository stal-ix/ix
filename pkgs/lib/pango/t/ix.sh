{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pango/1.50/pango-1.50.12.tar.xz
sha:caef96d27bbe792a6be92727c73468d832b13da57c8071ef79b9df69ee058fe3
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
bld/glib
{% endblock %}
