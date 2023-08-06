{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-2.0.0.tar.gz
sha:9e72c8b0e5a03a13e004f904f3cbb5da5c3aa92a8237c4c7ef31c2bc810a1635
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
