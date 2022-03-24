{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pango/1.50/pango-1.50.6.tar.xz
sha:a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a
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
bin/glib/codegen
{% endblock %}
