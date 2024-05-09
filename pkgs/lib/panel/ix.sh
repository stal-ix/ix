{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libpanel/-/archive/1.6.0/libpanel-1.6.0.tar.bz2
sha:ef7a7ae95dca68792404d4e7451948aff428af5ec298380dae6ae5c98f0a4ecb
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/adwaita
{% endblock %}

{% block meson_flags %}
docs=disabled
introspection=disabled
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gnome
bld/gettext
{% endblock %}
