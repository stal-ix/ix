{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/pango/-/archive/1.56.0/pango-1.56.0.tar.bz2
sha:d444ef9a8cec24b6ffc989a4e23bc9c60c290b7218327847a4e712e1c7a9ca70
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
