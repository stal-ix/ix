{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnice
{% endblock %}

{% block version %}
0.1.23
{% endblock %}

{% block fetch %}
https://libnice.freedesktop.org/releases/libnice-{{self.version().strip()}}.tar.gz
618fc4e8de393b719b1641c1d8eec01826d4d39d15ade92679d221c7f5e4e70d
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gnutls
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}
