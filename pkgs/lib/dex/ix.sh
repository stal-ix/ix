{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/0.9.0/libdex-0.9.0.tar.bz2
sha:cf7f923f3fc48d7e9efadc72cb22219b189776ffc896ac86fa0b60dc6e0b459a
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
