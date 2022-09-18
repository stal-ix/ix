{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/archive/43.0/gsettings-desktop-schemas-43.0.tar.bz2
sha:321ac4209394acd8293e980b5a0b921285621bbbbee1fcfff9402bff19d66c13
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}

{% block postinstall %}
: skip it
{% endblock %}
