{% extends '//die/c/meson.sh' %}

{% block version %}
48.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gsettings-desktop-schemas/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:0819caff9e179d3e144acc38fa694e468fec1742be8be28c88126aa3a69aef2d
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}

{% block postinstall %}
: skip it
{% endblock %}
