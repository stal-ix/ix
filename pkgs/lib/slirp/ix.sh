{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libslirp
{% endblock %}

{% block version %}
4.9.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v{{self.version().strip()}}/libslirp-v{{self.version().strip()}}.tar.bz2
sha:0329092d1dbaf18a7ef640c4d9db54bba71af9e850437b5ff3b31f463951c8ab
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
