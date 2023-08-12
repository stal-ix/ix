{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-2.0.1.tar.gz
sha:430b4fbee8288b238c4e2ee845e440eabd2814ed87d5d7e8342a5f961d6995a7
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
