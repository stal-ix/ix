{% extends '//die/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pango/1.50/pango-1.50.7.tar.xz
sha:0477f369a3d4c695df7299a6989dc004756a7f4de27eecac405c6790b7e3ad33
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/cairo
lib/fribidi
lib/freetype
lib/harfbuzz
lib/json/glib
lib/fontconfig
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/pango-1.0 \${CPPFLAGS}"
{% endblock %}
