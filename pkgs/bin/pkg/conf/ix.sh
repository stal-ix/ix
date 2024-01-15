{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-2.1.0.tar.gz
sha:aaf6ed6288c1560b7038fa4c37297161e1a69b4a751bc6fb541ca30ecba19aa6
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
