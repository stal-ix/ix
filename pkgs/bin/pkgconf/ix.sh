{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-2.0.3.tar.gz
sha:d139baa5ea65e8bd9267f416c3bb88a91cf66f6bc84b1be0408cabfe886a4b3b
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
