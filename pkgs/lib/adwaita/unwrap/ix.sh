{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libadwaita/-/archive/1.2.0/libadwaita-1.2.0.tar.bz2
sha:9da0df3d2f2f5c0a79becd47d09312124542545e4aa1ea151b993c5f6b939e78
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/4
lib/fribidi
{% endblock %}

{% block bld_tool %}
bin/sassc
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
vapi=false
introspection=disabled
{% endblock %}
