{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-2.1.1.tar.gz
sha:6a181e0bf1195e95b7cd535a1854827aedb383b26b1fc24ca13586cb5e8e55af
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
