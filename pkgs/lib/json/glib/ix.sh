{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
json-glib
{% endblock %}

{% block version %}
1.10.6
{% endblock %}

{% block fetch %}
https://github.com/GNOME/json-glib/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:d23cbd4094a32cc05cf22cd87a83da1f799e182e286133b49fde3c9241a32006
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block c_rename_symbol %}
# conflicts with jcon-c
json_object_get_type
json_object_equal
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}
