{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/json-glib/-/archive/1.6.6/json-glib-1.6.6.tar.bz2
cd56648d96dd79197c6d6af153d0e8ae
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_tool %}
lib/glib
{% endblock %}

{% block c_rename_symbol %}
# conflicts with jcon-c
json_object_get_type
json_object_equal
{% endblock %}

{% block meson_flags %}
-Dtests=false
{% endblock %}
