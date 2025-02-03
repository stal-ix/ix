{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libshumate/archive/refs/tags/1.3.2.tar.gz
sha:b13f9855800dea591fa9310f1e0ca95fa08dd5f77626d5e1c2bcd4b2306b8e0c
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
