{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/jasper-software/jasper/archive/refs/tags/version-4.2.3.tar.gz
sha:1263d70c663f1b5a4ed2a428371486091d282af96b7270e8b1cbfcbf44ad95ff
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
