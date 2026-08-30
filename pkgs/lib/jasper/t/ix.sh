{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
jasper
{% endblock %}

{% block version %}
4.2.9
{% endblock %}

{% block fetch %}
https://github.com/jasper-software/jasper/archive/refs/tags/version-{{self.version().strip()}}.tar.gz
b0e5af6b54c274b9670c7e32ddbf6c802d88c896062d760267695dd0aa7014ff
{% endblock %}

{% block lib_deps %}
lib/c
lib/heif
lib/jpeg
{% endblock %}

{% block cmake_flags %}
JAS_CROSSCOMPILING=ON
JAS_STDC_VERSION=201112L
{% endblock %}
