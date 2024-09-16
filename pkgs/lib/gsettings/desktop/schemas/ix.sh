{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/gsettings-desktop-schemas/archive/refs/tags/47.0.tar.gz
sha:83ae478c74b549e8fd97ae94c92023f4ad8f9815abfa7fcfee896615b1647a6e
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
