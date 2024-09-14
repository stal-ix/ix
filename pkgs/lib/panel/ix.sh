{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libpanel/-/archive/1.8.0/libpanel-1.8.0.tar.bz2
sha:0db6c7904fe212afdf0a4a26c697606576e46c0e400e7fe577077e51fc726ca3
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
