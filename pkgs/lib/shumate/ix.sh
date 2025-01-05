{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libshumate/archive/refs/tags/1.3.1.tar.gz
sha:c7a5478d763ddbdd0ad64bab3fa78adf8be9dcf9e77e982c798e26225d809099
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
