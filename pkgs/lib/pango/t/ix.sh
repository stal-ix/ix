{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/pango/-/archive/1.51.1/pango-1.51.1.tar.bz2
sha:4530d79350a4663b1dee3401ad64c0d41aee08833452b318220d1f355cf31f42
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
