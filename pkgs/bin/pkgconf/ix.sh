{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-1.9.5.tar.gz
sha:3fd0ace7d4398d75f0c566759f9beb4f8b3984fee7ed9804d41c52b193d9745a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
