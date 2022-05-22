{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdazzle/-/archive/3.44.0/libdazzle-3.44.0.tar.bz2
sha:845b068013fce8975b83571172b3718c3e61fd1c53b01e74abc66c52a62ed53a
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
with_introspection=false
enable_tests=false
with_vapi=false
{% endblock %}
