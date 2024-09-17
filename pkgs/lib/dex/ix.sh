{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/0.8.0/libdex-0.8.0.tar.bz2
sha:1bb5c8eb0db69bfa009072fc7c647f5caa8e9c75de5833f2a44f6447ec356683
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_flags %}
examples=false
vapi=false
introspection=disabled
tests=false
{% endblock %}
