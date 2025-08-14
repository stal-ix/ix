{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdex
{% endblock %}

{% block version %}
0.11.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/{{self.version().strip()}}/libdex-{{self.version().strip()}}.tar.bz2
2194831c4b4ed428a1c00d01641d77cc31860c377a6f6b5cf03b36bf71725f82
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/uring
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=atomic)
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
