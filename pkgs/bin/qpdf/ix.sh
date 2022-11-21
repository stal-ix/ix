{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v11.2.0.tar.gz
sha:d5fde4881948db41300f5806ea54f07f9fc37bc414a6a78efa2649d212b56707
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
