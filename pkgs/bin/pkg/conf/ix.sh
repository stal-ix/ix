{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-2.3.0.tar.gz
sha:0ee103cd390c3ee0e77a7a1c71dcb79a50a426fa2a648f6d07f2678c23adc5e3
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
