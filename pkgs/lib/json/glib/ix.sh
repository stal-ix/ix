{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/json-glib/-/archive/1.8.0/json-glib-1.8.0.tar.bz2
sha:01122bf2429461273add059d683341bf447857c7794439b2ee08ce37e0e6af9a
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
