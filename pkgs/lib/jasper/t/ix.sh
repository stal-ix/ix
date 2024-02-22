{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/jasper-software/jasper/archive/refs/tags/version-4.2.1.tar.gz
sha:970002b774b91edd9d2dedf76d0b8d5a88af28e0c6d603cc51988311a99a869f
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
