{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/flatpak/libportal/releases/download/0.6/libportal-0.6.tar.xz
sha:88a12c3ba71bc31acff7238c280de697d609cebc50830c3766776ec35abc6566
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
vapi=false
docs=false
tests=false
introspection=false
backends=gtk{{gtk_ver}}
{% endblock %}
