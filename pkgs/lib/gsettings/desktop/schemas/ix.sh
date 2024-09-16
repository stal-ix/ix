{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/gsettings-desktop-schemas/archive/refs/tags/47.1.tar.gz
sha:77cbca64af31e243c1bb387f939175f47b6776001fb2f6232f4d2bb1f71bbb71
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
