{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libslirp
{% endblock %}

{% block version %}
4.9.4
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v{{self.version().strip()}}/libslirp-v{{self.version().strip()}}.tar.bz2
0ecbac5eebcaa2d59b9d7cf13731f2c9fab80314e4ce31658fe4cf8d8e18102d
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
