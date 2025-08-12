{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
jasper
{% endblock %}

{% block version %}
4.2.8
{% endblock %}

{% block fetch %}
https://github.com/jasper-software/jasper/archive/refs/tags/version-{{self.version().strip()}}.tar.gz
987e8c8b4afcff87553833b6f0fa255b5556a0ecc617b45ee1882e10c1b5ec14
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
