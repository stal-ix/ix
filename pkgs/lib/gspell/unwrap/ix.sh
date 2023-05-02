{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gspell/-/archive/1.12.1/gspell-1.12.1.tar.bz2
sha:09269aa0a40d220f35e7dd0f674aefcaad59c3d67deb25bc661a9107fdffdd64
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block lib_deps %}
lib/c
lib/icu
lib/glib
lib/gtk/3
lib/enchant
{% endblock %}

{% block bld_tool %}
bld/vala
bld/glib
bld/gtkdoc
bin/xmllint
bld/gettext
bld/intltool
bld/auto/archive
bld/gobject/introspection
{% endblock %}

{% block configure_flags %}
--disable-gtk-doc
--enable-introspection=no
--enable-vala=no
{% endblock %}

{% block make_flags %}
GLIB_COMPILE_RESOURCES=glib-compile-resources
GLIB_MKENUMS=glib-mkenums
{% endblock %}
