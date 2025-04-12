{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gspell
{% endblock %}

{% block version %}
1.14.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gspell/-/archive/{{self.version().strip()}}/gspell-{{self.version().strip()}}.tar.bz2
sha:0b400f2057092c947f270325a0107c1ee8e781914e8e28488b04385c15cea8fe
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
