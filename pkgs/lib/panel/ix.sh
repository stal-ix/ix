{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libpanel/-/archive/1.10.0/libpanel-1.10.0.tar.bz2
sha:c2130a0f792456a5268aa6d5c964899378227c6495e29473d3b042cb9af231e2
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
