{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pkgconf
{% endblock %}

{% block version %}
3.0.11
{% endblock %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-{{self.version().strip()}}.tar.gz
d2c8a0965d5b80dcc454cc999ad5edb8bfbc4d8e65cde7a6f19a5cb7ecaf3377
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
