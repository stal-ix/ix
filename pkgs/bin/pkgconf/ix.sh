{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-1.9.4.tar.gz
sha:5abd875132f6145f6addbb48aa40883cfca89a95b90dc310ea53df54b7cd6baa
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
