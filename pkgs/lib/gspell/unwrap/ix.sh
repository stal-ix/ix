{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gspell
{% endblock %}

{% block version %}
1.14.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gspell/-/archive/{{self.version().strip()}}/gspell-{{self.version().strip()}}.tar.bz2
31c1ee70e730a45964ad12da0b1f49426878e8a670edd22b03f5cdc54a186237
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
