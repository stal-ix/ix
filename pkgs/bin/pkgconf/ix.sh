{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-1.9.0.tar.gz
sha:2090b69bec431da431dcfedb03a03a41c3f2ac2ddb4168c882dfcb966d238b9d
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}
