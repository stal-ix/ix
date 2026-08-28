{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gspell
{% endblock %}

{% block version %}
1.14.4
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gspell/-/archive/{{self.version().strip()}}/gspell-{{self.version().strip()}}.tar.bz2
184c23194c65150fcc3abb2a9523fd13427d8f225dcbd3ec034ca94ab6c4d619
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
