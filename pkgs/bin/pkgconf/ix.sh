{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-1.9.1.tar.gz
sha:06645b034cf8f4b28f1bccca5c68b8eda6b560119445436bfff134cd567f6b75
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}
