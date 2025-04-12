{% extends '//die/c/meson.sh' %}

{% block version %}
1.9.2
{% endblock %}

{% block fetch %}
https://github.com/GNOME/json-glib/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:277c3b7fc98712e30115ee3a60c3eac8acc34570cb98d3ff78de85ed804e0c80
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
