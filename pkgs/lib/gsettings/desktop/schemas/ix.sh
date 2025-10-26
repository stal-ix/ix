{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gsettings-desktop-schemas
{% endblock %}

{% block version %}
49.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gsettings-desktop-schemas/archive/refs/tags/{{self.version().strip()}}.tar.gz
c6baabe8c2c8b56825d0cfcc2ef859e5878a9de100be2894342640c094334517
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
