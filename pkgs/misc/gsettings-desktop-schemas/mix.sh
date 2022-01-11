{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/archive/41.0/gsettings-desktop-schemas-41.0.tar.bz2
sha:4553d5a62e45f40e3b9f7e261b07b731e8f8883185d6f7162887e6c46d029fce
{% endblock %}

{% block bld_tool %}
lib/glib
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}

{% block strip_pc %}
: skip it
{% endblock %}
