{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gspell/-/archive/1.13.1/gspell-1.13.1.tar.bz2
sha:0877f91abd8b315482e20a8f736012d4587deee8b4656ee0faaab1fa47451160
{% endblock %}

{% block lib_deps %}
lib/c
lib/icu
lib/glib
lib/gtk/3
lib/enchant
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
gobject_introspection=false
gspell_app=false
gtk_doc=false
tests=false
vapi=false
{% endblock %}
