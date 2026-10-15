{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qpdf
{% endblock %}

{% block version %}
12.4.2
{% endblock %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
88ddeb5f25c6e9156f3113fc3994d3a5e0cdfeee398cd09dd00fabc9dac9f573
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
