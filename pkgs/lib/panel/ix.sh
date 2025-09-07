{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libpanel
{% endblock %}

{% block version %}
1.10.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libpanel/-/archive/{{self.version().strip()}}/libpanel-{{self.version().strip()}}.tar.bz2
edeef046efc8643a29305f5dac6daec37d6a5091351bec4a2a2903ce70ed4d73
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
