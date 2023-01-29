{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/cares-1_19_0.tar.gz
sha:948016368481b6c5063b849b6dec2a7fd659eee2174b7f3db22ff1b22055ed2a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CARES_STATIC=ON
CARES_SHARED=OFF
{% endblock %}
