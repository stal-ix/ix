{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnice
{% endblock %}

{% block version %}
0.1.24
{% endblock %}

{% block fetch %}
https://libnice.freedesktop.org/releases/libnice-{{self.version().strip()}}.tar.gz
cfb5e8e778534f2f5b3c6f4958a1eb057c6b95c537c0f100817a537cf5d64fcc
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gnutls
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}
