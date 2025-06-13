{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnice
{% endblock %}

{% block version %}
0.1.22
{% endblock %}

{% block fetch %}
https://libnice.freedesktop.org/releases/libnice-{{self.version().strip()}}.tar.gz
a5f724cf09eae50c41a7517141d89da4a61ec9eaca32da4a0073faed5417ad7e
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gnutls
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}
