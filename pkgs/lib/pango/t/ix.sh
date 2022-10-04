{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pango/1.50/pango-1.50.11.tar.xz
sha:8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae
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
