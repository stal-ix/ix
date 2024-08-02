{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libshumate/archive/refs/tags/1.2.3.tar.gz
sha:11f19de434d5410bd82962bd3ac64962b6ca2aa0be9e9b103bedbbc1b08864b8
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
