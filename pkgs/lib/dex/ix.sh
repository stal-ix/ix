{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdex
{% endblock %}

{% block version %}
1.0.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/{{self.version().strip()}}/libdex-{{self.version().strip()}}.tar.bz2
5cdef6ae0a19040f82d1d9c21c1b5a9cfe1cc0e5d58bfdd2ce71dcad31a2e965
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
