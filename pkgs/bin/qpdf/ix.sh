{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v11.7.0.tar.gz
sha:9f50f438d096327fef1aec6f743e8f7383d9244a0b289bd811879f4006eed42a
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
