{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libadwaita/-/archive/1.1.1/libadwaita-1.1.1.tar.bz2
sha:d726c6473eb62e4c72818fea6a6754687f8b8699d12f9ab8b540af68d8c902d9
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
