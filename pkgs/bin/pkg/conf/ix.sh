{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pkgconf
{% endblock %}

{% block version %}
3.0.6
{% endblock %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-{{self.version().strip()}}.tar.gz
a32d9dd8fc3d1179d0755df471a561842a0f2475013da9c5cf86e38215a61380
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
