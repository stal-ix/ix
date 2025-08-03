{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
jasper
{% endblock %}

{% block version %}
4.2.7
{% endblock %}

{% block fetch %}
https://github.com/jasper-software/jasper/archive/refs/tags/version-{{self.version().strip()}}.tar.gz
93d3472ae50b2cc6547d3d8ea53de7e820588a0e5be6557a7fe0b1d94eb1e5ca
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
