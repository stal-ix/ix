{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/pango/1.50/pango-1.50.14.tar.xz
sha:1d67f205bfc318c27a29cfdfb6828568df566795df0cb51d2189cde7f2d581e8
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

{% block build_flags %}
{% if darwin %}
# too much -Werrors
shut_up
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}
