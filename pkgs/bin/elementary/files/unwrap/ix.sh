{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
files
{% endblock %}

{% block version %}
7.1.3
{% endblock %}

{% block fetch %}
https://github.com/elementary/files/archive/refs/tags/{{self.version().strip()}}.tar.gz
628c514f7918aa554c3fb7c7e7310b1cef94f69ddad891f5de53cfb3df179820
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
bld/glib
bld/gnome
bld/gettext
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

{% block setup_target_flags %}
export CFLAGS="-Wno-implicit-function-declaration ${CFLAGS}"
{% endblock %}

{% block postinstall %}
:
{% endblock %}
