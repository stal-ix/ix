{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gsettings-desktop-schemas
{% endblock %}

{% block version %}
49.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gsettings-desktop-schemas/archive/refs/tags/{{self.version().strip()}}.tar.gz
eba76a4965f3be005b7c413b71bc8933e04c5a81dd37c936416281dd44bcff30
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
