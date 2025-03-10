{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v12.0.0.tar.gz
sha:1974d12d1fe4229d50f83a08d578989012077cfed22e1c78a5c974dd8c7ee1ed
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/jpeg
lib/gnutls
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block cmake_flags %}
WERROR=OFF
{% endblock %}
