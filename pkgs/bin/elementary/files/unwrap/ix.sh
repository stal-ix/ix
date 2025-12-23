{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
files
{% endblock %}

{% block version %}
7.1.6
{% endblock %}

{% block fetch %}
https://github.com/elementary/files/archive/refs/tags/{{self.version().strip()}}.tar.gz
0cb719289da8d171e427dea4220c53c3d848b224d6ebbb0f77582af319730bab
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/gee
lib/glib
lib/handy
lib/pango
lib/portal
lib/granite
lib/canberra
lib/shim/gdk
lib/shim/x11
lib/gtk/deps
lib/sqlite/3
lib/dbus/glib
lib/git/2/glib
lib/cloud/providers
lib/shim/fake/pkg(pkg_name=gdk-x11-3.0,pkg_ver=100500)
{% endblock %}

{% block bld_tool %}
bld/gir
bin/vala
bld/gnome
{% endblock %}

{% block meson_flags %}
systemduserunitdir=no
{% endblock %}

{% block bld_data %}
lib/gee/gir
lib/glib/gir
lib/handy/gir
lib/canberra/gir
lib/gi/repository/gir
lib/cloud/providers/gir
lib/granite/{{gtk_ver}}/gir
lib/portal/gir(gtk_ver={{gtk_ver}})
{% endblock %}

{% block c_flags %}
-Wno-implicit-function-declaration
{% endblock %}

{% block postinstall %}
:
{% endblock %}
