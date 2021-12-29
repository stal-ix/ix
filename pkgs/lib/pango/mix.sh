{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pango/1.50/pango-1.50.3.tar.xz
4a3a10fff421abcf3af4af66991dd622
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
