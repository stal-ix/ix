{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qpdf
{% endblock %}

{% block version %}
12.4.1
{% endblock %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ebab3840fa8f370a1d4a1b4b7b08fad5baebeb5b5fa3cbbda88cd81e4fccecc9
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
