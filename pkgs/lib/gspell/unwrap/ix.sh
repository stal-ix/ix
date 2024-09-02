{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gspell/-/archive/1.13.2/gspell-1.13.2.tar.bz2
sha:2b40c01eb350fb47a5055086574e0f9e84cd237d1955985d1ee1295c07935679
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
