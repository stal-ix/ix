{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/json-glib/archive/refs/tags/1.8.0.tar.gz
sha:97bc058fad49ebf5195ec539240370454ef6589d2b97bf626d7a9e2353d25e3f
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
