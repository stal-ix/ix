{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
qpdf
{% endblock %}

{% block version %}
12.1.0
{% endblock %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:f1c2d3a26e67ce1b84b2a5165aeb2a1de79e51eeb782b46fcddff87069d7ea1e
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
