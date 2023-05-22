{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v11.4.0.tar.gz
sha:6ffda01597f441ae2387964584385fdd5e133d4091252a37607758a4f0bb874b
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
