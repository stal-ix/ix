{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libpanel
{% endblock %}

{% block version %}
1.10.4
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libpanel/-/archive/{{self.version().strip()}}/libpanel-{{self.version().strip()}}.tar.bz2
3c0656f987b770bef09a18a68d6612b2bb415f8ecce63eecad1662a0b3fba00f
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
bld/gnome
{% endblock %}
