{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gspell/-/archive/1.12.2/gspell-1.12.2.tar.bz2
sha:e703bc41c5f3832d746cef7314cb5765f70d49c16250c65a669ded69eb0c8824
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
