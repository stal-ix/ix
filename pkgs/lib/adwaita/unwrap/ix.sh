{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libadwaita/-/archive/1.1.2/libadwaita-1.1.2.tar.bz2
sha:902d674a5b504aeb2a1ecc29f2b6880704611293725642417112ab4b7ab654d8
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/4
lib/fribidi
{% endblock %}

{% block bld_tool %}
bin/sassc
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
vapi=false
introspection=disabled
{% endblock %}
