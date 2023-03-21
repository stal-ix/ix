{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/archive/44.0/gsettings-desktop-schemas-44.0.tar.bz2
sha:b1bff22c6131c0bf638505811f2c72a77a6577aee8a4a851e16f79c317dbc50d
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}

{% block postinstall %}
: skip it
{% endblock %}
