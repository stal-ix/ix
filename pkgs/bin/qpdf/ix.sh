{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qpdf
{% endblock %}

{% block version %}
12.2.0
{% endblock %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:2d004611699a94030a594318393f08a7352ab1cf3cee337c5312d4e7eb7f8a4f
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
