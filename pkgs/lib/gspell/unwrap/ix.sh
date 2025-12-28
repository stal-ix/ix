{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gspell
{% endblock %}

{% block version %}
1.14.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gspell/-/archive/{{self.version().strip()}}/gspell-{{self.version().strip()}}.tar.bz2
421f7c2cf7181e7e9c2fc9b143048642605f843f25eb31e67ab794d965ac3998
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
