{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libadwaita/-/archive/1.1.0/libadwaita-1.1.0.tar.bz2
sha:1fdd2d3ed7e738029f6f984e54b0ef21136633daa842f4caeeb60d4de56e0abe
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
