{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/flatpak/libportal/archive/refs/tags/0.9.0.tar.gz
sha:0fdf42ca371eeb1213ed25ab0c5681cd51750eb9a3e04adcd6a8dc2af4f4d440
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/{{gtk_ver}}
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gnome
{% endblock %}

{% block meson_flags %}
docs=false
tests=false
backend-gtk{{gtk_ver}}=enabled
{% endblock %}
