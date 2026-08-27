{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gsettings-desktop-schemas
{% endblock %}

{% block version %}
50.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gsettings-desktop-schemas/archive/refs/tags/{{self.version().strip()}}.tar.gz
ac9328c00ca18e5ac921bb2c13048b1ce5b43302b0c8d89d7fec22b05e22ec7a
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
