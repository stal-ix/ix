{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v11.8.0.tar.gz
sha:28911f31a836606236c1d6d6763b25c874b53d4a830c8147e4abb2d10918343e
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/jpeg
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block cmake_flags %}
WERROR=OFF
{% endblock %}
