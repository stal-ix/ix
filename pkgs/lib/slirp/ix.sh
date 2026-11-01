{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libslirp
{% endblock %}

{% block version %}
4.9.7
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v{{self.version().strip()}}/libslirp-v{{self.version().strip()}}.tar.bz2
363dfacf2821758c52388303b691093030b43ce8fd63142a55e878cbeb9a889c
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
