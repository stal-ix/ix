{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.4.0
{% endblock %}

{# TODO(pg): X, gtk-doc #}

{% block fetch %}
https://github.com/lxde/libfm/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:7d7b616411992389a4b7f35796109d605f30bc2ceab84d4081d1665254ebbf82
{% endblock %}

{% block lib_deps %}
lib/c
lib/dbus
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/gtkdoc
bld/gettext
bld/intltool
{% endblock %}

{% block configure_flags %}
--disable-gtk-doc
{% endblock %}
