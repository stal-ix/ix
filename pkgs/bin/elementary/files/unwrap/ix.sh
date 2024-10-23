{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/elementary/files/archive/refs/tags/7.1.0.tar.gz
sha:d26ca8e95a61052ab3d5ac65abd355209458dba4b94b09108718ce1bbc58d701
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
lib/handy/gir
lib/cloud/providers/gir
lib/portal/gir(gtk_ver={{gtk_ver}})
lib/granite/{{gtk_ver}}/gir
lib/canberra/gir
lib/gi/repository/gir
lib/gi/files
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-implicit-function-declaration ${CFLAGS}"
{% endblock %}

{% block postinstall %}
:
{% endblock %}
