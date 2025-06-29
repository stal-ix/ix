{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pkgconf
{% endblock %}

{% block version %}
2.5.1
{% endblock %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-{{self.version().strip()}}.tar.gz
79721badcad1987dead9c3609eb4877ab9b58821c06bdacb824f2c8897c11f2a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
