{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdex
{% endblock %}

{% block version %}
0.11.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/{{self.version().strip()}}/libdex-{{self.version().strip()}}.tar.bz2
a75a094b67c0c9c9ba1aeb43ab31c496b413a256bc029d308529cced91fd67d3
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
