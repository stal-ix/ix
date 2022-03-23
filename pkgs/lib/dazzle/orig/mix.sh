{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdazzle/-/archive/3.44.0/libdazzle-3.44.0.tar.bz2
sha:
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bin/glib/codegen
{% endblock %}

{% block meson_flags %}
with_introspection=false
enable_tests=false
with_vapi=false
{% endblock %}
