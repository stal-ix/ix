{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pango/1.49/pango-1.49.4.tar.xz
190bd00327ba5cff928ca06f13756d4f
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
lib/glib
{% endblock %}
