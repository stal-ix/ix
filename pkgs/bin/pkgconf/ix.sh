{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-1.8.0.tar.gz
sha:d84a2a338a17e0f68e6a8d6c9caf40d6a2c9580c4ae1d475b338b8d956e483aa
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}
