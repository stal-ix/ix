{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/0.6.0/libdex-0.6.0.tar.bz2
sha:8dc06c39be1c88146fd6ccaf6a8cf12658dabb3ec24fe4a4c1501d5b6c0b6047
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
