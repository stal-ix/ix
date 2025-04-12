{% extends '//die/c/meson.sh' %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/libshumate/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:8a348e753f9a6cef90e56c948a8604134bb23aa6935386f1728fb749c8a938d3
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
