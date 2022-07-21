{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/releases/download/v4.6.1/ccache-4.6.1.tar.xz
sha:e5d47bd3cbb504ada864124690e7c0d28ecb1f9aeac22a9976025aed9633f3d1
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/hiredis
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
