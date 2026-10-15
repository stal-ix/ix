{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libslirp
{% endblock %}

{% block version %}
4.9.5
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v{{self.version().strip()}}/libslirp-v{{self.version().strip()}}.tar.bz2
4f59df896cb345ea76d7f68b1e820872feaa9d8255a6761f6bf8a0f2d5144bcd
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
