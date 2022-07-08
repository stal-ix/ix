{% extends '//die/meson.sh' %}

{% block fetch %}
#https://github.com/flatpak/libportal/archive/refs/tags/0.6.tar.gz
#sha:8ad326c4f53b7433645dc86d994fef0292bee8adda0fe67db9288ace19250a9c
https://github.com/flatpak/libportal/releases/download/0.6/libportal-0.6.tar.xz
sha:88a12c3ba71bc31acff7238c280de697d609cebc50830c3766776ec35abc6566
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
bld/scripts/gnome
{% endblock %}

{% block meson_flags %}
vapi=false
docs=false
tests=false
introspection=false
backends=gtk{{gtk_ver or '3'}}
{% endblock %}
