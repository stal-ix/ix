{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libshumate/archive/refs/tags/1.2.1.tar.gz
sha:dc52f1b0a0cd66ef780f5fa2ab3219f5635ea5f5c79d3255a0062bf7a4f82081
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
