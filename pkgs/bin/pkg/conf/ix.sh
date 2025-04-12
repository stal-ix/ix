{% extends '//die/c/meson.sh' %}

{% block version %}
2.4.1
{% endblock %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-{{self.version().strip()}}.tar.gz
sha:ce9e8b3bb1c59bf80e09661f1f8c3f1f0460898b93f1754c677d61fb8deac2df
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
