{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pango/1.50/pango-1.50.13.tar.xz
sha:5cdcf6d761d26a3eb9412b6cb069b32bd1d9b07abf116321167d94c2189299fd
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
