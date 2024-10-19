{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/0.8.1/libdex-0.8.1.tar.bz2
sha:5d7c145f77a6bc65b3eeabf2de15b9d099903afe42e082bf8b85f9337b9fd137
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
