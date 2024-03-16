{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libshumate/archive/refs/tags/1.2.0.tar.gz
sha:2459040f159df8b87f7bd607232d6571547d7736603338303598caa0b91c059f
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/4
lib/cairo
lib/soup/3
lib/sqlite/3
lib/json/glib
lib/protobuf/c
{% endblock %}

{% block meson_flags %}
gir=false
vapi=false
gtk_doc=false
{% endblock %}

{% block bld_tool %}
bld/glib
bin/gperf
bld/gettext
{% endblock %}
