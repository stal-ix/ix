{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libfm
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{# TODO(pg): X, gtk-doc #}

{% block fetch %}
https://github.com/lxde/libfm/archive/refs/tags/{{self.version().strip()}}.tar.gz
1dff59162eb1ca5d1a6b945de4d0bdf2256a5264f54c9225b8599adce45dcb05
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
