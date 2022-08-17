{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-1.9.3.tar.gz
sha:e8b637c0dd8ae1decbcc95b24b64795cba81a8e3064fddb4424cacef411e59f9
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}
