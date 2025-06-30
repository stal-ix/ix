{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdex
{% endblock %}

{% block version %}
0.10.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/{{self.version().strip()}}/libdex-{{self.version().strip()}}.tar.bz2
532a8830b336c4b0ef77f860f23d8cd9d6cbcacf42ac7ad5daf7750c498d97a1
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
