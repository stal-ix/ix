{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
json-glib
{% endblock %}

{% block version %}
1.10.8
{% endblock %}

{% block fetch %}
https://github.com/GNOME/json-glib/archive/refs/tags/{{self.version().strip()}}.tar.gz
7a114bdac0b2611a7207e981c37fa9b1e70d9cb642470cd9e967b135428cec52
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
