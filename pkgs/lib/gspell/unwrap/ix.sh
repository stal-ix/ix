{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gspell/-/archive/1.11.1/gspell-1.11.1.tar.bz2
sha:0adfce2fac0ca20f3781fea90afeffabf047833d420f25b6e222e6610787b98f
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
bin/xmllint
bld/gettext
bin/gtk/doc
bld/intltool
bld/auto/archive
bld/glib/codegen
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
