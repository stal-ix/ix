{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libshumate/archive/refs/tags/1.1.2.tar.gz
sha:882b23ff4370192bed53a8efdf06900ac780edaf4c19dbd4358f39320802fc26
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/4
lib/cairo
lib/soup/3
lib/sqlite/3
{% endblock %}

{% block meson_flags %}
gir=false
vapi=false
gtk_doc=false
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}
