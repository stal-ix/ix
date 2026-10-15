{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gspell
{% endblock %}

{% block version %}
1.14.5
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gspell/-/archive/{{self.version().strip()}}/gspell-{{self.version().strip()}}.tar.bz2
55ad10a9966da63e25f20be32f7c65d8ddad1bbc256dbe7fe91a2c1eeedb57a6
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
