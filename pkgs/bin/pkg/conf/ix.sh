{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-2.2.0.tar.gz
sha:2c72cbf37b2d42a9fbf7ed8f0e5432a0b0925481f67995a21ecf77962a6000bc
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
